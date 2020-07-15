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
const {confirmado, negado, cartao, boleto, validar} = require('./validacao');
const { verificarCompraDeUsuarioNaMonetizze } = require('./monetizze')
const cronjobs = require('./cronjobs')
const { log } = require('./logger')
const { cache } = require('./cache')
const { enviarEmailDeRelatorioDeErro, enviarCSVParaEmail } = require('./email')

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
    return ctx.wizard.next()
  })
pedirFormaDePagamento.action('boleto', async (ctx) => {
    await ctx.answerCbQuery()
    await ctx.reply('Certo!')
    ctx.wizard.state.novoUsuario.formaDePagamento = 'boleto'
  await ctx.reply(mensagem.pedir_nome_completo)
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
        return ctx.wizard.next()
    }
    if (boleto(ctx)) {
        if (!ctx.message) {
            await ctx.answerCbQuery()
        }
        await ctx.reply('Certo!')
        ctx.wizard.state.novoUsuario.formaDePagamento = 'boleto'
        await ctx.reply(mensagem.pedir_nome_completo)
        log('Forma de pagamento definida')
        return ctx.wizard.next()
    }
    await ctx.reply('Por favor, escolha uma das opções.')
})

const confirmar = new Composer()
confirmar.action('sim', async (ctx) => confirmacaoPositiva(ctx))
confirmar.action('nao', async (ctx) => confirmacaoNegativa(ctx))
confirmar.use(async (ctx) => {
    if (confirmado(ctx)) {
        return confirmacaoPositiva(ctx)
    }
    if (negado(ctx)) {
        return confirmacaoNegativa(ctx)
    }
    await ctx.reply('Por favor, escolha uma das opções.')
})

const bot = new Telegraf(process.env.BOT_TOKEN)
cache.set('bot', bot.telegram)

const wizard = new WizardScene(
    'start',
    async ctx => darBoasVindas(ctx),
    pedirFormaDePagamento,
    async ctx => pegar('nomeCompleto', mensagem.nome_completo, mensagem.confirmacao_nome_completo, mensagem.pedir_telefone, ctx),
    confirmar,
    async ctx => pegar('telefone', mensagem.telefone, mensagem.confirmacao_telefone, mensagem.pedir_email, ctx),
    confirmar,
    async ctx => pegar('email', mensagem.email, mensagem.confirmacao_email, mensagem.verificar_monetizze, ctx),
    confirmar
)

const darBoasVindas = async (ctx) => {
    await ctx.reply(mensagem.boas_vindas)
    await ctx.reply('Preciso primeiramente confirmar no servidor da Monetizze se o seu pagamento já foi aprovado!\n\nVou precisar da sua ajuda aqui com algumas informações...')
    ctx.wizard.state.novoUsuario = {}
    const pagamento = Markup.inlineKeyboard([
        [Markup.callbackButton('💳 Cartão de Crédito', 'cartao_de_credito')],
        [Markup.callbackButton('📄 Boleto', 'boleto')]
    ])
    await ctx.reply(mensagem.pedir_forma_pagamento, Extra.markup(pagamento))
    return ctx.wizard.next()
}

const pegar = async (informacao, messagem, mensagemConfirmacao, mensagemProximaInformacao, ctx) => {
    ctx.wizard.state.novoUsuario[informacao] = ctx.message.text
    ctx.wizard.state.informacao = informacao
    ctx.wizard.state.mensagemConfirmacao = mensagemConfirmacao
    ctx.wizard.state.mensagemProximaInformacao = mensagemProximaInformacao
    ctx.wizard.state.mensagem = ctx.message

    const confirmacao = Markup.inlineKeyboard([Markup.callbackButton('👍 Sim', 'sim'), Markup.callbackButton('👎 Não', 'nao')])
    await ctx.reply(`${messagem} ${ctx.message.text}, certo?`, Extra.inReplyTo(ctx.message.message_id).markup(confirmacao))
    log(`${informacao} definido`)
    return ctx.wizard.next()
}

const confirmacaoPositiva = async (ctx) => {
    if (!ctx.message) {
        await ctx.answerCbQuery()
    }
    const { informacao, mensagemConfirmacao, mensagemProximaInformacao, mensagem } = ctx.wizard.state
    const validacaoDeInformacao = validar(informacao, ctx.wizard.state.novoUsuario[informacao])
    if (!validacaoDeInformacao.temErro) {
        await ctx.reply(`${mensagemConfirmacao.positivo}`, Extra.inReplyTo(mensagem.id))
        await ctx.reply(`${mensagemProximaInformacao}`)
        if (informacao === 'email') {
            await ctx.reply(`Estou verificando no servidor da Monetizze a sua compra, só um momento...`)
            try {
                return await verificarCompraDeUsuarioNaMonetizze(ctx) ?
                    await enviarCanaisTelegram(ctx) : await adicionarEmailAosEmailsBloqueados(ctx)
            } catch (err) {
                await ctx.reply('Erro ao acessar Monetizze para verificação de dados. Tente iniciar uma conversa comigo novamente mais tarde usando o comando /start.')
                return ctx.scene.leave()
            }
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
            const linkCanal1 = await ctx.telegram.exportChatInviteLink(process.env.ID_CANAL_SINAIS_RICOS)
            const linkCanal2 = await ctx.telegram.exportChatInviteLink(process.env.ID_CANAL_RICO_VIDENTE)
            const teclado = Markup.inlineKeyboard([
                Markup.urlButton('Canal Sinais Ricos', linkCanal1),
                Markup.urlButton('Canal Rico Vidente', linkCanal2)
            ])
            await ctx.reply('Aqui:', Extra.markup(teclado))
            return ctx.scene.leave()
        } else {
            log(`ERRO: Genérico`)
            await ctx.reply(`Sua compra na Monetizze foi confirmada, porém ocorreu um erro ao registrar seu usuário. O número do erro é ${err.errno}. Por favor, envie um email para ${process.env.EMAIL_PARA} com o print desta tela.`)
            return ctx.scene.leave()
        }
    }
    log(`Usuário adicionado ao BD`)
    await ctx.reply('Sua assinatura Monetizze foi ativada! 🎉')
    await ctx.reply('Seja bem-vindo!')
    const linkCanal1 = await ctx.telegram.exportChatInviteLink(process.env.ID_CANAL_SINAIS_RICOS)
    const linkCanal2 = await ctx.telegram.exportChatInviteLink(process.env.ID_CANAL_RICO_VIDENTE)
    const teclado = Markup.inlineKeyboard([
        Markup.urlButton('Canal Sinais Ricos', linkCanal1),
        Markup.urlButton('Canal Rico Vidente', linkCanal2)
    ])
    await ctx.reply('Acesse nossos canais aqui:', Extra.markup(teclado))
    log(`Canais de Telegram enviados`)
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

const adicionarEmailAosEmailsBloqueados = async (ctx) => {
    const { email } = ctx.wizard.state.novoUsuario
    log(`Email ${email} adicionado como bloqueado`)
    try {
        await dao.adicionarEmEmailsBloqueados(email, conexao)
    } catch (err) {
        log(`Ocorreu um erro ao inserir o email ${email} como email bloqueado: ${JSON.stringify(err)}`)
    } finally {
        await ctx.reply(`O usuário do email ${email} foi bloqueado pois não consta nenhuma compra finalizada por ele na Monetizze.`)
        await ctx.reply(`Caso houve algum engano, verifique se o status da sua compra na Monetizze está como finalizada e inicie novamente sua conversa comigo usando o comando /start, ou envie um email para ${process.env.EMAIL_PARA} para pedir a liberação do seu acesso.`)
        return ctx.scene.leave()
    }
}

const stage = new Stage([wizard]);

bot.use(session())
bot.use(stage.middleware())
bot.command('start', (ctx) => ctx.scene.enter('start'))
bot.on('channel_post', (ctx) => log(`channel post: ${JSON.stringify(ctx.channelPost)}`))

bot.launch()
cronjobs.start()


const PORT = process.env.PORT_METODO_SEMPRERICO_BOT_APP || process.env.PORT_APP || 3000
app.listen(PORT, () => log(`Servidor rodando na porta ${PORT}`));

module.exports = { confirmarEmail, adicionarUsuarioAoBancoDeDados }