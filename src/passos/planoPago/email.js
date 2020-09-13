const Composer = require('telegraf/composer')
const Markup = require('telegraf/markup')
const Extra = require('telegraf/extra')
const { log, logError } = require('../../servicos/logger')
const { confirmado, negado } = require('../../servicos/validacao')
const dao = require('../../dao')
const monetizze = require('../../servicos/monetizze')
const { enviarEmailDeRelatorioDeErro } = require('../../email')
const { pegarLinkDeChat } = require('../../servicos/chatLink')
const { validar } = require('../../servicos/validacao')
const StatusAssinatura = require('../../model/status_assinatura')
const Usuario = require('../../model/usuario')
const UsuarioGratuito = require('../../model/usuario_gratuito')
const { conexao } = require('../../db')

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

const atribuirIdTelegramAoNovoUsuario = (ctx) => {
    log(`ID Telegram atribuido`)
    ctx.wizard.state.novoUsuario.idTelegram = ctx.chat.id;
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
            const usuarioValidoEExiste = await dao.usuarioExisteEValido(ctx.chat.id, conexao)
            if (usuarioValidoEExiste) {
                await ctx.reply(`Vou te enviar novamente nossos canais caso não tenha conseguido acessar antes:`)
                let linkCanal1
                let linkCanal2
                if (process.env.NODE_ENV === 'development') {
                    log(process.env.ID_CANAL_TESTE)
                    linkCanal1 = pegarLinkDeChat(process.env.ID_CANAL_TESTE)
                    linkCanal2 = pegarLinkDeChat(process.env.ID_CANAL_TESTE)
                } else {
                    log(process.env.ID_CANAL_SINAIS_RICOS)
                    log(process.env.ID_CANAL_RICO_VIDENTE)
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
    await ctx.reply('Sua assinatura Monetizze foi ativada! 🎉')
    await ctx.reply('Seja bem-vindo!')
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
    await ctx.reply('Acesse nossos canais aqui:', Extra.markup(teclado))
    log(`Canais de Telegram enviados`)
    return ctx.scene.leave()
}

const confirmacaoPositiva = async (ctx) => {
    const validacao = validar('email', ctx.wizard.state.novoUsuario.email);
    if (!validacao.temErro) {
        if (ctx.wizard.state.novoUsuario.formaDePagamento !== 'plano_gratuito') {
            try {
                const emailsBloqueados = await dao.pegarTodosEmailsBloqueados(conexao)
                const emailBloqueado = emailsBloqueados.filter(emailBloqueado => emailBloqueado.email === ctx.wizard.state.novoUsuario.email)
                if (emailBloqueado.length > 0) {
                    await ctx.reply(`Seu email está registrado como bloqueado. Caso tenha ocorrido um engano, envie um email explicando sua situação para ${process.env.EMAIL_PARA}`)
                    return ctx.scene.leave()
                }
            } catch (err) {
                logError(`ERRO AO VERIFICAR SE EMAIL JÁ ESTÁ BLOQUEADO, ${ctx.wizard.state.novoUsuario.email}`, err)
                await enviarEmailDeRelatorioDeErro(err, ctx.chat.id)
            }
            await ctx.reply(`Estou verificando no servidor da Monetizze a sua compra, só um momento...`)
            try {
                return await monetizze.verificarCompraDeUsuarioNaMonetizze(ctx) ?
                    await enviarCanaisTelegram(ctx) : await adicionarEmailAosEmailsBloqueados(ctx)
            } catch (err) {
                await ctx.reply(`Erro ao acessar Monetizze para verificação de dados. Tente iniciar uma conversa comigo novamente mais tarde usando o comando /start. Caso este erro persista, envie um email para ${process.env.EMAIL_PARA} com o print desta conversa`)
                log(`ERRO AO VERIFICAR COMPRA DE USUÁRIO NA MONETIZZE, ${err}`)
                await enviarEmailDeRelatorioDeErro(err, ctx.chat.id)
                return ctx.scene.leave()
            }
        }
        return ctx.wizard.next()
    }
    await ctx.reply(`${validacao.mensagemDeErro}`)
    await ctx.reply(`Por favor, insira seu email novamente`)
    return ctx.wizard.back()
}

const pegarEmail = async (ctx) => {
    if (!ctx.message) {
        await ctx.answerCbQuery()
    }
    try {
        const confirmacao = Markup.inlineKeyboard([Markup.callbackButton('👍 Sim', 'sim'), Markup.callbackButton('👎 Não', 'nao')])
        await ctx.reply(`Confirmando, seu email é ${ctx.message.text}, certo?`, Extra.inReplyTo(ctx.message.message_id).markup(confirmacao))
        ctx.wizard.state.novoUsuario.email = ctx.message.text
        log(`Email definido`)
        log(ctx.wizard.state.novoUsuario)
        ctx.wizard.next()
    } catch (err) {
        ctx.scene.leave()
    }
}

const confirmarEmail = new Composer()
confirmarEmail.action('sim', async (ctx) => {
    try {
        await ctx.answerCbQuery()
        return await confirmacaoPositiva(ctx)
    } catch (err) {
        log(err)
    }
})
confirmarEmail.action('nao', async (ctx) => {
    try {
        await ctx.answerCbQuery()
        await ctx.reply(`Por favor, insira seu email novamente`)
        return ctx.wizard.back()
    } catch (err) {
        log(err)
    }
})
confirmarEmail.use(async (ctx) => {
    log(`Sim/Não`)
    if (confirmado(ctx)) {
        try {
            return await confirmacaoPositiva(ctx)
        } catch (err) {
            log(err)
        }
    }
    if (negado(ctx)) {
        try {
            await ctx.reply(`Por favor, insira seu email novamente`)
            return ctx.wizard.back()
        } catch (err) {
            log(err)
        }    }
    await ctx.reply('Por favor, escolha uma das opções.')
})

module.exports = { pegarEmail, confirmarEmail }