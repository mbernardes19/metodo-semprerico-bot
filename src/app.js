require('sexy-require');

const path = require('path')
const app = require('express')()
const { Telegraf } = require('telegraf')
require('dotenv').config({path: path.join(__dirname, "../", '.env')})
const session = require('telegraf/session')
const Stage = require('telegraf/stage')
const WizardScene = require('telegraf/scenes/wizard')
const Extra = require('telegraf/extra')
const Markup = require('telegraf/markup')
const Composer = require('telegraf/composer')
const db = require('./db');
const mensagem = require('./mensagem')
const dao = require('./dao')
const StatusAssinatura = require('./model/status_assinatura')
const Usuario = require('./model/usuario')
const UsuarioGratuito = require('./model/usuario_gratuito')
const {confirmado, negado, cartao, boleto, planoGratuito, validar} = require('./validacao');
const { verificarCompraDeUsuarioNaMonetizze } = require('./monetizze')
const cronjobs = require('./cronjobs')
const { log } = require('./logger')
const { cache } = require('./cache')
const { enviarEmailDeRelatorioDeErro } = require('./email')
const { SINAL } = require('./regex')
const axios = require('axios').default;
const bodyParser = require('body-parser')
const cors = require('cors')
const differenceInMilliseconds = require('date-fns/differenceInMilliseconds')
const { parseISO } = require('date-fns')
const { comecarValidacaoDeLinks, pegarLinkDeChat } = require('./chatLink')

const conexao = db.conexao
conexao.connect((err) => {
    if (err) return log(err)
})

const pedirFormaDePagamento = new Composer()
pedirFormaDePagamento.action('cartao_de_credito', async (ctx) => {
    await ctx.answerCbQuery()
    await ctx.reply('Certo!')
    ctx.wizard.state.novoUsuario.formaDePagamento = 'cartao_de_credito'
    await ctx.reply(mensagem.pedir_nome_completo)
    return ctx.wizard.selectStep(4)
  })
pedirFormaDePagamento.action('boleto', async (ctx) => {
    await ctx.answerCbQuery()
    await ctx.reply('Certo!')
    ctx.wizard.state.novoUsuario.formaDePagamento = 'boleto'
  await ctx.reply(mensagem.pedir_nome_completo)
  return ctx.wizard.selectStep(4)
})
pedirFormaDePagamento.action('plano_gratuito', async (ctx) => {
    await ctx.answerCbQuery()
    await ctx.reply('Certo!')
    ctx.wizard.state.novoUsuario.formaDePagamento = 'plano_gratuito'
    await ctx.reply('Vou precisar de alguns dados para liberar seu período gratuito de 1 mês nos nossos canais VIPs do Método Sempre Rico!')
    await ctx.reply('Qual é o seu CPF?')
    return ctx.wizard.next()
})
pedirFormaDePagamento.use(async (ctx) => {
    if (cartao(ctx)) {
        if (!ctx.message) {
            await ctx.answerCbQuery()
        }
        await ctx.reply('Certo!')
        ctx.wizard.state.novoUsuario.formaDePagamento = 'cartao_de_credito'
        await ctx.reply(mensagem.pedir_nome_completo)
        log('Forma de pagamento definida')
        return ctx.wizard.selectStep(3)
    }
    if (boleto(ctx)) {
        if (!ctx.message) {
            await ctx.answerCbQuery()
        }
        await ctx.reply('Certo!')
        ctx.wizard.state.novoUsuario.formaDePagamento = 'boleto'
        await ctx.reply(mensagem.pedir_nome_completo)
        log('Forma de pagamento definida')
        return ctx.wizard.selectStep(3)
    }
    if (planoGratuito(ctx)) {
        if (!ctx.message) {
            await ctx.answerCbQuery()
        }
        await ctx.reply('Certo!')
        ctx.wizard.state.novoUsuario.formaDePagamento = 'plano_gratuito'
        await ctx.reply('Vou precisar confirmar seu CPF para liberar seu período gratuito de 1 mês nos nossos canais VIPs do Método Sempre Rico!')
        await ctx.reply('Qual é o seu CPF?')
        log('Plano gratuito definido')
        return ctx.wizard.next()
    }
    await ctx.reply('Por favor, escolha uma das opções.')
})

const confirmar = new Composer()
confirmar.action('sim', async (ctx) => {
    confirmacaoPositiva(ctx)
})
confirmar.action('nao', async (ctx) => {
    confirmacaoNegativa(ctx)
})
confirmar.use(async (ctx) => {
    log(`Sim/Não`)
    if (confirmado(ctx)) {
        return confirmacaoPositiva(ctx)
    }
    if (negado(ctx)) {
        return confirmacaoNegativa(ctx)
    }
    await ctx.reply('Por favor, escolha uma das opções.')
})
const tokenBot = process.env.NODE_ENV === 'production' ? process.env.BOT_TOKEN : process.env.BOT_TOKEN_TESTE
const bot = new Telegraf(tokenBot)
cache.set('bot', bot.telegram)

const wizard = new WizardScene(
    'start',
    async ctx => darBoasVindas(ctx),
    pedirFormaDePagamento,
    async ctx => pegar('cpf', "Confirmando, seu CPF é...", {
        positivo: "Ok!",
        negativo: "Por favor, insira seu CPF novamente",
        erro: "Não entendi"
    }, mensagem.pedir_nome_completo_gratuito, ctx),
    confirmar,
    async ctx => pegar('nomeCompleto', mensagem.nome_completo, mensagem.confirmacao_nome_completo, mensagem.pedir_telefone, ctx),
    confirmar,
    async ctx => pegar('telefone', mensagem.telefone, mensagem.confirmacao_telefone, mensagem.pedir_email, ctx),
    confirmar,
    async ctx => pegar('email', mensagem.email, mensagem.confirmacao_email, mensagem.verificar_monetizze, ctx),
    confirmar
)

wizard.command('stop', async ctx => ctx.scene.leave())

const darBoasVindas = async (ctx) => {
    try {
        await ctx.reply(mensagem.boas_vindas)
    } catch (err) {
        await ctx.reply('Preciso primeiramente confirmar no servidor da Monetizze se o seu pagamento já foi aprovado.\n\nPor isso, gostaria de saber algumas informações de você...')
        log('ERRO AO ENVIAR PRIMEIRA MENSAGEM', err)
    }
    ctx.wizard.state.novoUsuario = {}
    const pagamento = Markup.inlineKeyboard([
        [Markup.callbackButton('💳 Cartão de Crédito', 'cartao_de_credito')],
        [Markup.callbackButton('📄 Boleto', 'boleto')],
        [Markup.callbackButton('🆓 Plano Gratuito', 'plano_gratuito')]
    ])
    await ctx.reply(mensagem.pedir_forma_pagamento, Extra.markup(pagamento))
    return ctx.wizard.next()
}

const pegar = async (informacao, messagem, mensagemConfirmacao, mensagemProximaInformacao, ctx) => {
    let mensagem
    let textoDaMensagem
    try {
        console.log('MESSAGE', ctx.message)
        console.log('UPDATE', ctx.update)
        mensagem = ctx.message ? ctx.message : ctx.update.message
        textoDaMensagem = ctx.message ? ctx.message.text : ctx.update.message.text
        if (informacao === 'telefone') {
            textoDaMensagem = textoDaMensagem.replace(/ /g, "")
        }
        if (informacao === 'cpf') {
            textoDaMensagem = textoDaMensagem.replace(/[^0-9]/g, '')
        }
        ctx.wizard.state.novoUsuario[informacao] = textoDaMensagem
        ctx.wizard.state.informacao = informacao
        ctx.wizard.state.mensagemConfirmacao = mensagemConfirmacao
        ctx.wizard.state.mensagemProximaInformacao = ctx.wizard.state.novoUsuario.cpf && informacao === 'telefone' ? 'Qual é o seu email?' : mensagemProximaInformacao
        ctx.wizard.state.mensagem = ctx.wizard.state.novoUsuario.cpf && informacao === 'email' 
        ? 'Última confirmação... Esse é o seu email:' : mensagem
        const messagemGratuito = ctx.wizard.state.novoUsuario.cpf && informacao === 'email' 
        ? 'Última confirmação... Esse é o seu email:' : messagem;
        const confirmacao = Markup.inlineKeyboard([Markup.callbackButton('👍 Sim', 'sim'), Markup.callbackButton('👎 Não', 'nao')])
        await ctx.reply(`${messagemGratuito} ${textoDaMensagem}, certo?`, Extra.inReplyTo(ctx.message.message_id).markup(confirmacao))
        log(`${informacao} definido`)
        return ctx.wizard.next()
    } catch (err) {
        log(err)
        await enviarEmailDeRelatorioDeErro(err, ctx.chat.id)
        await ctx.reply('Ocorreu um erro agora para conseguir atualizações do Telegram. Por favor, inicie uma conversa comigo novamente mais tarde digitando o comando /start .')
        return ctx.scene.leave()
    }
}

const confirmacaoPositiva = async (ctx) => {
    if (!ctx.message) {
        await ctx.answerCbQuery()
    }
    const { informacao, mensagemConfirmacao, mensagemProximaInformacao, mensagem } = ctx.wizard.state
    const validacaoDeInformacao = validar(informacao, ctx.wizard.state.novoUsuario[informacao])
    if (!validacaoDeInformacao.temErro) {
        if (informacao === 'cpf') {
            const jaExiste = await verificarSeJaExisteUsuarioComCpf(ctx.wizard.state.novoUsuario.cpf)
            if(jaExiste) {
                await ctx.reply(`Você já fez um cadastro comigo com esse CPF!`)
                await ctx.reply(`Infelizmente não tenho como te oferecer mais tempo de teste gratuito. Caso queira continuar em nossos canais VIP, faça aqui sua compra:\n\nAcesso somente as Salas Vips (sinais que VOCÊ NÃO PRECISA ENTENDER, basta seguir) + Gerenciamento sempre Rico:\n✅ https://app.monetizze.com.br/checkout/DXD93081\n\nAcesso às Salas Vips + Curso Completo (aprenda de uma vez por todas) + Gerenciamento Sempre Rico:\n✅https://app.monetizze.com.br/checkout/DYX93082`)
                return ctx.scene.leave()
            }
        }
        await ctx.reply(`${mensagemConfirmacao.positivo}`, Extra.inReplyTo(mensagem.id))
        await ctx.reply(`${mensagemProximaInformacao}`)
        if (informacao === 'email' && !ctx.wizard.state.novoUsuario.cpf) {
            try {
                const emailsBloqueados = await dao.pegarTodosEmailsBloqueados(conexao)
                const emailBloqueado = emailsBloqueados.filter(emailBloqueado => emailBloqueado.email === ctx.wizard.state.novoUsuario.email)
                if (emailBloqueado.length > 0) {
                    await ctx.reply(`Seu email está registrado como bloqueado. Caso tenha ocorrido um engano, envie um email explicando sua situação para ${process.env.EMAIL_PARA}`)
                    return ctx.scene.leave()
                }
            } catch (err) {
                log(`ERRO AO VERIFICAR SE EMAIL JÁ ESTÁ BLOQUEADO, ${ctx.wizard.state.novoUsuario.email}, ${JSON.stringify(err)}`)
                await enviarEmailDeRelatorioDeErro(err, ctx.chat.id)
                enviarEmailDeRelatorioDeErro(err)
            }
            await ctx.reply(`Estou verificando no servidor da Monetizze a sua compra, só um momento...`)
            try {
                return await verificarCompraDeUsuarioNaMonetizze(ctx) ?
                    await enviarCanaisTelegram(ctx) : await adicionarEmailAosEmailsBloqueados(ctx)
            } catch (err) {
                await ctx.reply(`Erro ao acessar Monetizze para verificação de dados. Tente iniciar uma conversa comigo novamente mais tarde usando o comando /start. Caso este erro persista, envie um email para ${process.env.EMAIL_PARA} com o print desta conversa`)
                log(`ERRO AO VERIFICAR COMPRA DE USUÁRIO NA MONETIZZE, ${err}`)
                await enviarEmailDeRelatorioDeErro(err, ctx.chat.id)
                return ctx.scene.leave()
            }
        }

        if (informacao === 'email' && ctx.wizard.state.novoUsuario.cpf) {
            await enviarCanaisTelegramGratuito(ctx)
        }
        return ctx.wizard.next()
    }
    await ctx.reply(`${validacaoDeInformacao.mensagemDeErro}`)
    await ctx.reply(`${mensagemConfirmacao.negativo}`)
    return ctx.wizard.back()
}

const confirmacaoNegativa = async (ctx) => {
    if (!ctx.message) {
        await ctx.answerCbQuery()
    }
    const { mensagemConfirmacao } = ctx.wizard.state
    await ctx.reply(`${mensagemConfirmacao.negativo}`)
    return ctx.wizard.back()
}

const confirmarEmail = async (informacao, mensagemConfirmacao, mensagemProximaInformacao, ctx) => {
    if (confirmado(ctx)) {
        const validacaoDeInformacao = validar(informacao, ctx.wizard.state.novoUsuario[informacao])
        if (!validacaoDeInformacao.temErro) {
            await ctx.reply(`${mensagemConfirmacao.positivo}`, Extra.inReplyTo(ctx.message.message_id))
            await ctx.reply(`${mensagemProximaInformacao}`)
            return await verificarCompraDeUsuarioNaMonetizze(ctx) ? await enviarCanaisTelegram(ctx) : await adicionarEmailAosEmailsBloqueados(ctx)
        }
        await ctx.reply(`${validacaoDeInformacao.mensagemDeErro}`)
        await ctx.reply(`${mensagemConfirmacao.negativo}`)
    }
    if (negado(ctx)) {
        await ctx.reply(`${mensagemConfirmacao.negativo}`)
        return ctx.wizard.back()
    }
    return ctx.wizard.back()
}

const enviarCanaisTelegram = async (ctx) => {
    log(`Sua assinatura Monetizze foi ativada! 🎉`)
    const {email} = ctx.wizard.state.novoUsuario
    try {
        atribuirIdTelegramAoNovoUsuario(ctx)
        await adicionarUsuarioAoBancoDeDados(ctx);
    } catch (err) {
        if (err.errno === 1062) {
            log(`ERRO: Usuário já existe no banco de dados`)
            await ctx.reply(`Você já ativou sua assinatura Monettize comigo antes. Seu email registrado é: ${email}.`)
            await ctx.reply(`Vou te enviar novamente nossos canais caso não tenha conseguido acessar antes:`)
            log(process.env.ID_CANAL_SINAIS_RICOS)
            log(process.env.ID_CANAL_RICO_VIDENTE)
            const linkCanal1 = pegarLinkDeChat(process.env.ID_CANAL_SINAIS_RICOS)
            const linkCanal2 = pegarLinkDeChat(process.env.ID_CANAL_RICO_VIDENTE)
            const teclado = Markup.inlineKeyboard([
                Markup.urlButton('Canal Sinais Ricos', linkCanal1),
                Markup.urlButton('Canal Rico Vidente', linkCanal2)
            ])
            await ctx.reply('Aqui:', Extra.markup(teclado))
            return ctx.scene.leave()
        } else {
            log(`ERRO: Genérico`)
            await enviarEmailDeRelatorioDeErro(err, ctx.chat.id)
            await ctx.reply(`Sua compra na Monetizze foi confirmada, porém ocorreu um erro ao ativar sua assinatura na Monetizze. O número do erro é ${err.errno}. Por favor, envie um email para ${process.env.EMAIL_PARA} com o print desta tela.`)
            return ctx.scene.leave()
        }
    }
    log(`Usuário adicionado ao BD`)
    await ctx.reply('Sua assinatura Monetizze foi ativada! 🎉')
    await ctx.reply('Seja bem-vindo!')
    const linkCanal1 = pegarLinkDeChat(process.env.ID_CANAL_SINAIS_RICOS)
    const linkCanal2 = pegarLinkDeChat(process.env.ID_CANAL_RICO_VIDENTE)
    const teclado = Markup.inlineKeyboard([
        Markup.urlButton('Canal Sinais Ricos', linkCanal1),
        Markup.urlButton('Canal Rico Vidente', linkCanal2)
    ])
    await ctx.reply('Acesse nossos canais aqui:', Extra.markup(teclado))
    log(`Canais de Telegram enviados`)
    return ctx.scene.leave()
}

const enviarCanaisTelegramGratuito = async (ctx) => {
    log(`Seu período de 1 mês de acesso grauito aos canais VIP do Método Sempre Rico foi ativado! 🎉`)
    const {email} = ctx.wizard.state.novoUsuario
    try {
        atribuirIdTelegramAoNovoUsuario(ctx)
        await adicionarUsuarioGratuitoAoBancoDeDados(ctx);
    } catch (err) {
        if (err.errno === 1062) {
            log(`ERRO: Usuário já existe no banco de dados`)
            await ctx.reply(`Você já ativou sua assinatura Monettize comigo antes. Seu email registrado é: ${email}.`)
            await ctx.reply(`Vou te enviar novamente nossos canais caso não tenha conseguido acessar antes:`)
            const linkCanal1 = pegarLinkDeChat(process.env.ID_CANAL_SINAIS_RICOS)
            const linkCanal2 = pegarLinkDeChat(process.env.ID_CANAL_RICO_VIDENTE)
            const teclado = Markup.inlineKeyboard([
                Markup.urlButton('Canal Sinais Ricos', linkCanal1),
                Markup.urlButton('Canal Rico Vidente', linkCanal2)
            ])
            await ctx.reply('Aqui:', Extra.markup(teclado))
            return ctx.scene.leave()
        } else {
            log(`ERRO: Genérico`)
            await enviarEmailDeRelatorioDeErro(err, ctx.chat.id)
            await ctx.reply(`Sua compra na Monetizze foi confirmada, porém ocorreu um erro ao ativar sua assinatura na Monetizze. O número do erro é ${err.errno}. Por favor, envie um email para ${process.env.EMAIL_PARA} com o print desta tela.`)
            return ctx.scene.leave()
        }
    }
    log(`Usuário adicionado ao BD`)
    await ctx.reply('Seu período de 1 mês de acesso grauito aos canais VIP do Método Sempre Rico foi ativado! 🎉')
    await ctx.reply('Seja bem-vindo!')
    let teclado
    try {
        const linkCanal1 = pegarLinkDeChat(process.env.ID_CANAL_SINAIS_RICOS)
        const linkCanal2 = pegarLinkDeChat(process.env.ID_CANAL_RICO_VIDENTE)
        teclado = Markup.inlineKeyboard([
            Markup.urlButton('Canal Sinais Ricos', linkCanal1),
            Markup.urlButton('Canal Rico Vidente', linkCanal2)
        ])
    } catch (err) {
        const linkCanal1 = pegarLinkDeChat(process.env.ID_CANAL_TESTE)
        teclado = Markup.inlineKeyboard([
            Markup.urlButton('Canal Teste', linkCanal1),
        ])
    }
    await ctx.reply('Acesse nossos canais aqui:', Extra.markup(teclado))
    log(`Canais de Telegram enviados`)
    await ctx.reply('Caso ocorra algum erro ao acessá-los, digite o comando /canais para recebê-los novamente')
    return ctx.scene.leave()
}

const atribuirIdTelegramAoNovoUsuario = (ctx) => {
    log(`ID Telegram atribuido`)
    ctx.wizard.state.novoUsuario.idTelegram = ctx.chat.id;
}

const adicionarUsuarioAoBancoDeDados = async (ctx) => {
    const {idTelegram, nomeCompleto, formaDePagamento, email, telefone} = ctx.wizard.state.novoUsuario
    const novoUsuario = new Usuario(idTelegram, nomeCompleto, formaDePagamento, email, telefone, StatusAssinatura.ATIVA)
    try {
        await dao.adicionarUsuarioAoBancoDeDados(novoUsuario, conexao)
    } catch (err) {
        throw err
    }
}

const adicionarUsuarioGratuitoAoBancoDeDados = async (ctx) => {
    const data = new Date()
    const ano = data.getFullYear()
    const mes = data.getMonth() + 1 < 10 ? `0${data.getMonth() + 1}` : `${data.getMonth() + 1}`
    const dia = data.getDate() + 1 < 10 ? `0${data.getDate()}` : `${data.getDate()}`
    const hoje = `${ano}-${mes}-${dia}`
    const {idTelegram, nomeCompleto, cpf, email, telefone} = ctx.wizard.state.novoUsuario
    const novoUsuario = new UsuarioGratuito(idTelegram, nomeCompleto, cpf, email, telefone, hoje, 30)
    try {
        await dao.adicionarUsuarioGratuitoAoBancoDeDados(novoUsuario, conexao)
    } catch (err) {
        throw err
    }
}

const adicionarEmailAosEmailsBloqueados = async (ctx) => {
    const { email } = ctx.wizard.state.novoUsuario
    log(`Email ${email} adicionado como bloqueado`)
    try {
        await dao.adicionarEmEmailsBloqueados(email, conexao)
    } catch (err) {
        await enviarEmailDeRelatorioDeErro(err, ctx.chat.id)
        log(`Ocorreu um erro ao inserir o email ${email} como email bloqueado: ${JSON.stringify(err)}`)
    } finally {
        await ctx.reply(`O usuário do email ${email} foi bloqueado pois não consta nenhuma compra finalizada por ele na Monetizze.`)
        await ctx.reply(`Caso houve algum engano, verifique se o status da sua compra na Monetizze está como finalizada e inicie novamente sua conversa comigo usando o comando /start, ou envie um email para ${process.env.EMAIL_PARA} para pedir a liberação do seu acesso.`)
        return ctx.scene.leave()
    }
}

const verificarSeJaExisteUsuarioComCpf = async (cpf) => {
    const usuarioComMesmoCpf = await dao.verificarSeJaExisteUsuarioComCpf(cpf, conexao)
    return usuarioComMesmoCpf.length > 0 ? true : false
}

const extrairSinalDeMensagemDeCanal = (mensagemDeCanal) => {
    try {
        const mensagem = mensagemDeCanal.match(SINAL)
        console.log('MENSAGEM PARSEADA', mensagem)
        const par = mensagem[0]
        const ordem = mensagem[1]
        const horario = mensagem[2]
        const expiracao = 5
        return {par, ordem, horario, expiracao}
    } catch (err) {
        throw new Error(`Mensagem não tem padrão de sinal: ${mensagemDeCanal}`)
    }
}

const criarSinalGale = (mensagemDeCanal) => {
    const agora = new Date()
    let horarioAtual;
    if (agora.getHours() < 10) {
        horarioAtual = `0${agora.getHours()}:`
    } else {
        horarioAtual = `${agora.getHours()}:`
    }
    if (agora.getMinutes() < 10) {
        horarioAtual += `0${agora.getMinutes()}:10`
    } else {
        horarioAtual += `${agora.getMinutes()}:10`
    }
    const sinalAnterior = extrairSinalDeMensagemDeCanal(mensagemDeCanal)
    log('MENSAGEM GALE')
    log(JSON.stringify({...sinalAnterior, horario: horarioAtual}))
    return {...sinalAnterior, horario: horarioAtual}
}

const SERVIDOR_IQ = process.env.NODE_ENV === 'production'
    ? process.env.SERVIDOR_IQ : process.env.SERVIDOR_IQ_TEST

const enviarSinalParaCompra = async (sinal, ctx) => {
    try {
        return await axios.post(`${SERVIDOR_IQ}/buy`, sinal)
    } catch (err) {
        log(`Moeda indisponível para binária`)
        log(err)
        // await ctx.reply('Moeda não disponível pra M5 na Iq agora, galera', Extra.inReplyTo(ctx.channelPost.message_id))
        return
    }
}

const checarResultadoCompra = async (responseCompra, ctx) => {
    try {
        log(`ID ${responseCompra}`)
        return await axios.post(`${SERVIDOR_IQ}/check_win`, { idCompra: responseCompra.idCompra, isDigital: responseCompra.isDigital })
    } catch (err) {
        log(`Moeda indisponível para binária`)
        log(err)
        // await ctx.reply('Moeda não disponível pra M5 na Iq agora, galera', Extra.inReplyTo(ctx.channelPost.message_id))
        return
    }
}

const stage = new Stage([wizard], { ttl: 1500 });

bot.use(session())
bot.use(stage.middleware())

bot.command('canais', async (ctx) => {
    const usuarioExiste = await dao.usuarioGratuitoExiste(ctx.chat.id, conexao);
    if (usuarioExiste) {
        const usuarioValido = await dao.usuarioGratuitoExisteEValido(ctx.chat.id, conexao);
        if (usuarioValido) {
            const linkCanal1 = pegarLinkDeChat(process.env.ID_CANAL_SINAIS_RICOS)
            const linkCanal2 = pegarLinkDeChat(process.env.ID_CANAL_RICO_VIDENTE)
            console.log('LINK CANAL', linkCanal1)
            console.log('LINK CANAL', linkCanal2)
            const teclado = Markup.inlineKeyboard([
                Markup.urlButton('Canal Sinais Ricos', linkCanal1),
                Markup.urlButton('Canal Rico Vidente', linkCanal2)
            ])
            try {
                await ctx.reply('É pra já!', Extra.markup(teclado))
            } catch (err) {
                if (err.response && err.response.error_code === 403) {
                    return;
                }
                await ctx.reply('Ocorreu um erro ao gerar os links dos canais para você. Tente digitar o comando /canais novamentem, por favor.')
            }
        } else {
            await ctx.reply('Seu período gratuito de acesso aos canais do Método Sempre Rico expirou!\n\nCaso queira continuar em nossos canais VIP, faça aqui sua compra:\n\nAcesso somente as Salas Vips (sinais que VOCÊ NÃO PRECISA ENTENDER, basta seguir) + Gerenciamento sempre Rico:\n✅ https://app.monetizze.com.br/checkout/DXD93081\n\nAcesso às Salas Vips + Curso Completo (aprenda de uma vez por todas) + Gerenciamento Sempre Rico:\n✅https://app.monetizze.com.br/checkout/DYX93082.')
        }
    } else {
        await ctx.reply('Você ainda não ativou sua assinatura Monettize comigo. Digite o comando /start para começar!')
    }
});

bot.command('n0t1f1c4c40', async (ctx) => {
    const idsUsuariosGratuitos = await dao.pegarIdDeTodosUsuariosGratuitos(conexao);
    const mensagem = 'Ainda está tendo problemas para acessar os canais do Método Sempre Rico? 😯\n\nFique tranquilo! Meu desenvolvedor acabou de criar um comando que permite que você tenha acesso garantido ao canal sempre que precisar! Basta digitar /canais para mim que vou te mandar os botões de acesso aos canais na hora! 😁😁'
    const mensagensAEnviar = []
    idsUsuariosGratuitos.map(usuario => {
        mensagensAEnviar.push(bot.telegram.sendMessage(usuario.id, mensagem))
    })

    try {
        await Promise.allSettled(mensagensAEnviar)
        .then(res => res.forEach((result) => log(`Mensagem de emergência enviada a todos os usuários com sucesso! ${result.status}`)))
        .catch(err => res.forEach((result) => log(`Erro ao enviar mensagem de emergência pra todos usuários ${result.status}`)))
    } catch (err) {
        await enviarEmailDeRelatorioDeErro(err, ctx.chat.id)
        log(err)
        log('Erro ao enviar notificação pra todos usuários')
    }
})

bot.command('3m3rg3nc14', async (ctx) => {
    const linkCanal1 = pegarLinkDeChat(process.env.ID_CANAL_SINAIS_RICOS)
    const linkCanal2 = pegarLinkDeChat(process.env.ID_CANAL_RICO_VIDENTE)
    const teclado = Markup.inlineKeyboard([
    Markup.urlButton('Canal Sinais Ricos', linkCanal1),
    Markup.urlButton('Canal Rico Vidente', linkCanal2)
    ])
    const idsUsuariosGratuitos = await dao.pegarIdDeTodosUsuariosGratuitos(conexao);
    const mensagensAEnviar = []
    const desbanirDoSinaisRicos = []
    const desbanirDoRicoVidente = []
    const mensagem = "Fizemos uma atualização no meu banco de dados hoje que pode ter tido alguns efeitos não esperados... 😵 Caso os canais do Método Sempre Rico não estejam aparecendo mais pra você, estou te enviando de novo os links de acesso a eles!"
    idsUsuariosGratuitos.map(usuario => {
        mensagensAEnviar.push(bot.telegram.sendMessage(usuario.id, mensagem, Extra.markup(teclado)))
        desbanirDoRicoVidente.push(bot.telegram.unbanChatMember(process.env.ID_CANAL_RICO_VIDENTE, usuario.id))
        desbanirDoSinaisRicos.push(bot.telegram.unbanChatMember(process.env.ID_CANAL_SINAIS_RICOS, usuario.id))
    })

    try {
        await Promise.allSettled(mensagensAEnviar)
        .then(res => res.forEach((result) => log(`Mensagem de emergência enviada a todos os usuários com sucesso! ${result.status}`)))
        .catch(err => res.forEach((result) => log(`Erro ao enviar mensagem de emergência pra todos usuários ${result.status}`)))

        await Promise.allSettled(desbanirDoRicoVidente)
        .then(res => res.forEach((result) => log(`Usuário desbanido do RICO VIDENTE! ${result.status}`)))
        .catch(err => res.forEach((result) => log(`Erro desbanir usário do RICO VIDENTE ${result.status}`)))

        await Promise.allSettled(desbanirDoSinaisRicos)
        .then(res => res.forEach((result) => log(`Usuário desbanido do SINAIS RICOS! ${result.status}`)))
        .catch(err => res.forEach((result) => log(`Erro desbanir usário do SINAIS RICOS ${result.status}`)))

    } catch (err) {
        await enviarEmailDeRelatorioDeErro(err, ctx.chat.id)
        log(err)
        log('Erro ao enviar mensagem de emergência pra todos usuários')
    }
})

bot.command('start', async (ctx) => {
    try {
        await bot.telegram.sendMessage(ctx.chat.id,'🦁')
        ctx.scene.enter('start');
    } catch (err) {
        await enviarEmailDeRelatorioDeErro(err, ctx.chat.id)
        if (err.response && err.response.error_code === 403) {
            log(`Usuário bloqueado ${ctx.chat.id}`)
        }
        log(err);
    }
});

bot.on('channel_post', async (ctx) => {
    log(ctx.channelPost.chat.id)
    if(ctx.channelPost.chat.id == process.env.ID_CANAL_RICO_VIDENTE) {
        log('CANAL RICO VIDENTE')
    }
    if(ctx.channelPost.chat.id == process.env.ID_CANAL_SINAIS_RICOS) {
        log('CANAL SINAIS RICOS')
    }
    log(`CTX MESSAGE, ${ctx.channelPost.text}`)
        if (ctx.channelPost.chat.id == process.env.ID_CANAL_RICO_VIDENTE || ctx.channelPost.chat.id == process.env.ID_CANAL_TESTE && ctx.channelPost.text && ctx.channelPost.text.includes('Par - ')) {
            try {
                let sinal = extrairSinalDeMensagemDeCanal(ctx.channelPost.text)
                let horaSinal = parseInt(sinal.horario.substring(0, 2))
                let minutoSinal = parseInt(sinal.horario.substring(3, 5))
                process.env.TZ = 'America/Sao_Paulo'
                const agora = new Date()
                const agoraStr = new Date().toISOString()
                console.log(horaSinal)
                console.log(minutoSinal)
                const sinalAgora = new Date(agora.getFullYear(), agora.getMonth(), agora.getDate(), horaSinal, minutoSinal, 0)
                const sinalAgoraStr = sinalAgora.toISOString()

                console.log('AGORA', agoraStr)
                console.log('SINALAGORA', sinalAgoraStr)
                const diff = Math.abs(differenceInMilliseconds(parseISO(agoraStr), parseISO(sinalAgoraStr)))

                console.log('DIFF', diff)
        
                const [MENSAGEM_WIN] = await dao.pegarMensagem('win', conexao)
                const [STICKER_WIN] = await dao.pegarSticker('win', conexao)
                const [MENSAGEM_LOSS] = await dao.pegarMensagem('loss', conexao)
                const [STICKER_LOSS] = await dao.pegarSticker('loss', conexao)
                const [MENSAGEM_DOJI] = await dao.pegarMensagem('doji', conexao)
        
                let response;
        
                setTimeout(async () => {
                    response = await enviarSinalParaCompra(sinal, ctx)
                    log(`RESPONSE DA COMPRA, ${response.data}`)
                    if (!response.data.idCompra) {
                        log(`Moeda indisponível para binária`)
                        // await ctx.reply('Moeda não disponível pra M5 na Iq agora, galera', Extra.inReplyTo(ctx.channelPost.message_id))
                        return
                    }
                    let resultado;
                    setTimeout(async () => {
                        resultado = await checarResultadoCompra(response.data, ctx)
                        log(`WIN OU LOSS? ${resultado.data}`)
                        if (resultado.data > 0) {
                            log('WIN')
                            log(resultado.data)
                            await ctx.reply(MENSAGEM_WIN.texto, Extra.inReplyTo(ctx.channelPost.message_id))
                            await ctx.replyWithSticker(STICKER_WIN.texto, Extra.inReplyTo(ctx.channelPost.message_id))
                        } else {
                            const resp = await enviarSinalParaCompra(criarSinalGale(ctx.channelPost.text), ctx)
                            setTimeout(async () => {
                                res = await checarResultadoCompra(resp.data, ctx)
                                if (res.data > 0) {
                                    log('WIN')
                                    log(res.data)
                                    await ctx.reply(MENSAGEM_WIN.texto, Extra.inReplyTo(ctx.channelPost.message_id))
                                    await ctx.replyWithSticker(STICKER_WIN.texto, Extra.inReplyTo(ctx.channelPost.message_id))
                                }
                                if (res.data === 0) {
                                    log('DOJI LOSS')
                                    log(res.data)
                                    await ctx.reply(MENSAGEM_LOSS.texto, Extra.inReplyTo(ctx.channelPost.message_id))
                                    await ctx.replyWithSticker(STICKER_LOSS.texto, Extra.inReplyTo(ctx.channelPost.message_id))
                                    await ctx.reply(MENSAGEM_DOJI.texto, Extra.inReplyTo(ctx.channelPost.message_id))
                                }
                                if (res.data < 0) {
                                    log('LOSS')
                                    log(res.data)
                                    await ctx.reply(MENSAGEM_LOSS.texto, Extra.inReplyTo(ctx.channelPost.message_id))
                                    await ctx.replyWithSticker(STICKER_LOSS.texto, Extra.inReplyTo(ctx.channelPost.message_id))
                                }
                            }, 294000)
                        }
                    }, 294000)
                }, diff)
            } catch (err) {
                await enviarEmailDeRelatorioDeErro(ctx.channelPost.text, ctx.chat.id)
                log(err)
            }
        }
})

// bot.on('message', async (ctx) => {
//     log(ctx.message.chat.id)
//     log(process.env.CHECAGEM_DE_SINAL)
//     log(`CTX MESSAGE, ${ctx.message.text}`)
//         if (ctx.message.text && ctx.message.text.includes('Par - ')) {
//             try {
//                 let sinal = extrairSinalDeMensagemDeCanal(ctx.message.text)
//                 let horaSinal = parseInt(sinal.horario.substring(0, 2))
//                 let minutoSinal = parseInt(sinal.horario.substring(3, 5))
//                 process.env.TZ = 'America/Sao_Paulo'
//                 const agora = new Date()
//                 const agoraStr = new Date().toISOString()
//                 console.log(horaSinal)
//                 console.log(minutoSinal)
//                 const sinalAgora = new Date(agora.getFullYear(), agora.getMonth(), agora.getDate(), horaSinal, minutoSinal, 0)
//                 const sinalAgoraStr = sinalAgora.toISOString()

//                 console.log('AGORA', agoraStr)
//                 console.log('SINALAGORA', sinalAgoraStr)
//                 const diff = Math.abs(differenceInMilliseconds(parseISO(agoraStr), parseISO(sinalAgoraStr)))
                
//                 let horaAgora = agora.getHours()
//                 let minutoAgora = agora.getMinutes()

//                 console.log('DIFF', diff)
        
//                 let diffHora = horaSinal - horaAgora
//                 let diffMinuto = minutoSinal - minutoAgora
        
//                 let milissegundos
        
//                 if (diffHora >= 0) {
//                     milissegundos += diffHora * 36 * 10000
//                 } else {
//                     milissegundos += 0
//                 }
//                 if (diffMinuto >= 0) {
//                     milissegundos += diffHora * 6 * 10000
//                 } else {
//                     milissegundos += 0
//                 }

//                 console.log('MILISSEGUNDOS', milissegundos)
        
//                 const [MENSAGEM_WIN] = await dao.pegarMensagem('win', conexao)
//                 const [STICKER_WIN] = await dao.pegarSticker('win', conexao)
//                 const [MENSAGEM_LOSS] = await dao.pegarMensagem('loss', conexao)
//                 const [STICKER_LOSS] = await dao.pegarSticker('loss', conexao)
//                 const [MENSAGEM_DOJI] = await dao.pegarMensagem('doji', conexao)
        
//                 let response;
        
//                 setTimeout(async () => {
//                     response = await enviarSinalParaCompra(sinal, ctx)
//                     log(`RESPONSE DA COMPRA, ${response.data}`)
//                     if (!response.data) {
//                         await ctx.reply('Moeda não disponível pra M5 na Iq agora, galera', Extra.inReplyTo(ctx.message.message_id))
//                         return
//                     }
//                     let resultado;
//                     setTimeout(async () => {
//                         resultado = await checarResultadoCompra(response.data, ctx)
//                         log(`WIN OU LOSS? ${resultado.data}`)
//                         if (resultado.data > 0) {
//                             log('WIN')
//                             log(resultado.data)
//                             await ctx.reply(MENSAGEM_WIN.texto, Extra.inReplyTo(ctx.message.message_id))
//                             await ctx.replyWithSticker(STICKER_WIN.texto, Extra.inReplyTo(ctx.message.message_id))
//                         } else {
//                             const resp = await enviarSinalParaCompra(criarSinalGale(ctx.message.text), ctx)
//                             setTimeout(async () => {
//                                 res = await checarResultadoCompra(resp.data, ctx)
//                                 if (res.data > 0) {
//                                     log('WIN')
//                                     log(res.data)
//                                     await ctx.reply(MENSAGEM_WIN.texto, Extra.inReplyTo(ctx.message.message_id))
//                                     await ctx.replyWithSticker(STICKER_WIN.texto, Extra.inReplyTo(ctx.message.message_id))
//                                 }
//                                 if (res.data === 0) {
//                                     log('DOJI LOSS')
//                                     log(res.data)
//                                     await ctx.reply(MENSAGEM_LOSS.texto, Extra.inReplyTo(ctx.message.message_id))
//                                     await ctx.replyWithSticker(STICKER_LOSS.texto, Extra.inReplyTo(ctx.message.message_id))
//                                     await ctx.reply(MENSAGEM_DOJI.texto, Extra.inReplyTo(ctx.message.message_id))
//                                 }
//                                 if (res.data < 0) {
//                                     log('LOSS')
//                                     log(res.data)
//                                     await ctx.reply(MENSAGEM_LOSS.texto, Extra.inReplyTo(ctx.message.message_id))
//                                     await ctx.replyWithSticker(STICKER_LOSS.texto, Extra.inReplyTo(ctx.message.message_id))
//                                 }
//                             }, 60000)
//                         }
//                     }, 60000)
//                 }, diff)
//             } catch (err) {
//                 await enviarEmailDeRelatorioDeErro(ctx.message.text)
//                 log(err)
//             }
//         }
// })

bot.on('message', async ctx => {
    try {
        await ctx.reply('Olá, sou o Bot do Método Sempre Rico 🤖💵! Segue abaixo meus comandos:\n\n/start - Começar nossa conversa\n/stop - Parar nossa conversa\n/canais - Receber acesso aos canais VIP do Método Sempre Rico')
    } catch (err) {
        return;
    }
})
bot.launch()
cronjobs.start()
comecarValidacaoDeLinks()

app.use(cors())
app.use(bodyParser.json())

app.post('/mensagem-win', async (req, res) => {
    log(req.body)
    const { mensagemWin } = req.body
    try {
        await dao.atualizarMensagem('win', mensagemWin, conexao)
        res.set('Access-Control-Allow-Origin', '*')
        res.sendStatus(200)
    } catch (err) {
        await enviarEmailDeRelatorioDeErro(err)
        log(err)
        res.sendStatus(500)
    }
})

app.post('/sticker-win', async (req, res) => {
    const { stickerWin } = req.body
    try {
        await dao.atualizarSticker('win', stickerWin, conexao)
        res.set('Access-Control-Allow-Origin', '*')
        res.sendStatus(200)
    } catch (err) {
        await enviarEmailDeRelatorioDeErro(err)
        log(err)
        res.sendStatus(500)
    }
})

app.post('/mensagem-loss', async (req, res) => {
    const { mensagemLoss } = req.body
    try {
        await dao.atualizarMensagem('loss', mensagemLoss, conexao)
        res.set('Access-Control-Allow-Origin', '*')
        res.sendStatus(200)
    } catch (err) {
        await enviarEmailDeRelatorioDeErro(err)
        log(err)
        res.sendStatus(500)
    }
})

app.post('/sticker-loss', async (req, res) => {
    const { stickerLoss } = req.body
    try {
        await dao.atualizarSticker('loss', stickerLoss, conexao)
        res.set('Access-Control-Allow-Origin', '*')
        res.sendStatus(200)
    } catch (err) {
        await enviarEmailDeRelatorioDeErro(err)
        res.sendStatus(500)
    }
})

app.post('/mensagem-doji', async (req, res) => {
    const { mensagemDoji } = req.body
    try {
        await dao.atualizarMensagem('doji', mensagemDoji, conexao)
        res.set('Access-Control-Allow-Origin', '*')
        res.sendStatus(200)
    } catch (err) {
        await enviarEmailDeRelatorioDeErro(err)
        res.sendStatus(500)
    }
})

app.get('/mensagem-win', async (req, res) => {
    try {
        const [mensagemWin] = await dao.pegarMensagem('win', conexao)
        res.set('Access-Control-Allow-Origin', '*')
        res.status(200).json({ id: mensagemWin.id, texto: mensagemWin.texto })
    } catch (err) {
        await enviarEmailDeRelatorioDeErro(err)
        log(err)
        res.sendStatus(500)
    }
})

app.get('/sticker-win', async (req, res) => {
    try {
        const [stickerWin] = await dao.pegarSticker('win', conexao)
        res.set('Access-Control-Allow-Origin', '*')
        res.status(200).json({id: stickerWin.id, texto: stickerWin.texto})
    } catch (err) {
        await enviarEmailDeRelatorioDeErro(err)
        log(err)
        res.sendStatus(500)
    }
})

app.get('/mensagem-loss', async (req, res) => {
    try {
        const [mensagemLoss] = await dao.pegarMensagem('loss', conexao)
        res.set('Access-Control-Allow-Origin', '*')
        res.status(200).json({id: mensagemLoss.id, texto: mensagemLoss.texto})
    } catch (err) {
        await enviarEmailDeRelatorioDeErro(err)
        log(err)
        res.sendStatus(500)
    }
})

app.get('/sticker-loss', async (req, res) => {
    try {
        const [stickerLoss] = await dao.pegarSticker('loss', conexao)
        res.set('Access-Control-Allow-Origin', '*')
        res.status(200).json({id: stickerLoss.id, texto: stickerLoss.texto})
    } catch (err) {
        await enviarEmailDeRelatorioDeErro(err)
        res.sendStatus(500)
    }
})

app.get('/mensagem-doji', async (req, res) => {
    try {
        const [mensagemDoji] = await dao.pegarMensagem('doji', conexao)
        res.set('Access-Control-Allow-Origin', '*')
        res.status(200).json({id: mensagemDoji.id, texto: mensagemDoji.texto})
    } catch (err) {
        await enviarEmailDeRelatorioDeErro(err)
        res.sendStatus(500)
    }
})


const PORT = process.env.PORT_METODO_SEMPRERICO_BOT_APP || process.env.PORT_APP || 3000
app.listen(PORT, () => log(`Servidor rodando na porta ${PORT}`));

module.exports = { confirmarEmail, adicionarUsuarioAoBancoDeDados }