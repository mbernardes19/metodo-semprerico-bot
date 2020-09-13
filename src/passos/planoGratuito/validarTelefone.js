const { enviarSms } = require('../../servicos/request')
const Extra = require('telegraf/extra')
const Markup = require('telegraf/markup')
const { adicionarEmNumerosBloqueados, usuarioGratuitoExisteEValido, adicionarEmEmailsBloqueados } = require('../../dao')
const { conexao } = require('../../db')
const { log, logError } = require('../../servicos/logger')

const gerarNumeroValidacaoSms = () => {
    let numero = ''
    for (let i = 0; i < 5; i++) {
        numero += Math.trunc(Math.random() * 10)
    }
    return numero;
}

const enviarSmsDeValidacao = async (ctx, telefone) => {
    const numeroValidacao = gerarNumeroValidacaoSms()
    ctx.wizard.state.numeroValidacao = numeroValidacao
    const mensagem = `Número de verificação: ${numeroValidacao}`
    try {
        await enviarSms(telefone, mensagem)
    } catch (err) {
        log(`ERRO AO ENVIAR SMS DE VALIDAÇÃO ${JSON.stringify(err)}`)
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

const atribuirIdTelegramAoNovoUsuario = (ctx) => {
    log(`ID Telegram atribuido`)
    log(ctx.chat.id)
    ctx.wizard.state.novoUsuario.idTelegram = ctx.chat.id;
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
            const usuarioValidoEExiste = await usuarioGratuitoExisteEValido(ctx.chat.id, conexao)
            if (usuarioValidoEExiste) {
                await ctx.reply(`Vou te enviar novamente nossos canais caso não tenha conseguido acessar antes:`)
                let linkCanal1
                let linkCanal2
                if (process.env.NODE_ENV === 'development') {
                    linkCanal1 = pegarLinkDeChat(process.env.ID_CANAL_TESTE)
                    linkCanal2 = pegarLinkDeChat(process.env.ID_CANAL_TESTE)
                } else {
                    linkCanal1 = pegarLinkDeChat(process.env.ID_CANAL_SINAIS_RICOS)
                    linkCanal2 = pegarLinkDeChat(process.env.ID_CANAL_RICO_VIDENTE)
                }
                const teclado = Markup.inlineKeyboard([
                    Markup.urlButton('Canal Sinais Ricos', linkCanal1),
                    Markup.urlButton('Canal Rico Vidente', linkCanal2)
                ])
                await ctx.reply('Aqui:', Extra.markup(teclado))
            }
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
        let linkCanal1;
        let linkCanal2;
        if (process.env.NODE_ENV === 'development') {
            linkCanal1 = pegarLinkDeChat(process.env.ID_CANAL_TESTE)
            linkCanal2 = pegarLinkDeChat(process.env.ID_CANAL_TESTE)
        } else {
            linkCanal1 = pegarLinkDeChat(process.env.ID_CANAL_SINAIS_RICOS)
            linkCanal2 = pegarLinkDeChat(process.env.ID_CANAL_RICO_VIDENTE)
        }
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

const validarTelefone = async (ctx) => {
    ctx.wizard.state.tentativasSms += 1

    if (ctx.message.text == ctx.wizard.state.numeroValidacao) {
        await ctx.reply('Confirmado!')
        await enviarCanaisTelegramGratuito()
        return ctx.wizard.leave()
    }
    if (ctx.wizard.state.tentativasSms < 2) {
        const confirmacao = Markup.inlineKeyboard([Markup.callbackButton('👍 Sim', 'sim'), Markup.callbackButton('👎 Não', 'nao')])
        ctx.reply(`Esse número não é igual ao enviado no SMS. Quer que eu envie um SMS novamente para ${ctx.wizard.state.novoUsuario.telefone}?`, Extra.markup(confirmacao))
        return ctx.wizard.back()
    } else {
        try {
            await adicionarEmNumerosBloqueados(ctx.wizard.state.novoUsuario.telefone, conexao)
            await adicionarEmEmailsBloqueados(ctx.wizard.state.novoUsuario.email, conexao)
            await ctx.reply(`O número que você passou não confere com o que foi enviado pelo SMS novamente.`)
            await ctx.reply(`Por isso, vou deixar seu número de telefone e email registrados como bloqueados. Para desbloqueá-los, envie um email para ${process.env.EMAIL_PARA} com seu nome completo, email e telefone solicitando o desbloqueamento.`)
            await ctx.scene.leave()
        } catch (err) {
            logError(`ERRO AO ADICIONAR NÚMERO E EMAIL DO USUÁRIO AOS BLOQUEADOS ${ctx.wizard.state.novoUsuario.telefone} ${ctx.wizard.state.novoUsuario.email}`, err)
        }
    }
}

module.exports = { enviarSmsDeValidacao, validarTelefone }