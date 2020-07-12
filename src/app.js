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
const csv = require('./csv')

const conexao = db.conexao
conexao.connect((err) => {
    if (err) return console.log(err)
})

const pedirFormaDePagamento = new Composer()
pedirFormaDePagamento.action('cartao_de_credito', async (ctx) => {
    await ctx.answerCbQuery()
    ctx.reply('Cartao!')
    ctx.wizard.state.novoUsuario.formaDePagamento = 'cartao_de_credito'
    ctx.reply(mensagem.pedir_nome_completo)
    return ctx.wizard.next()
  })
pedirFormaDePagamento.action('boleto', async (ctx) => {
    await ctx.answerCbQuery()
  ctx.reply('Boleto!')
  ctx.wizard.state.novoUsuario.formaDePagamento = 'boleto'
  ctx.reply(mensagem.pedir_nome_completo)
  return ctx.wizard.next()
})
pedirFormaDePagamento.use(async (ctx) => {
    if (cartao(ctx)) {
        if (!ctx.message.text) {
            await ctx.answerCbQuery()
        }
        ctx.reply('Cartao!')
        ctx.wizard.state.novoUsuario.formaDePagamento = 'cartao_de_credito'
        ctx.reply(mensagem.pedir_nome_completo)
        return ctx.wizard.next()
    }
    if (boleto(ctx)) {
        if (!ctx.message.text) {
            await ctx.answerCbQuery()
        }
        ctx.reply('Boleto!')
        ctx.wizard.state.novoUsuario.formaDePagamento = 'boleto'
        ctx.reply(mensagem.pedir_nome_completo)
        return ctx.wizard.next()
    }
    ctx.reply('Por favor, escolha uma das opções.')
})

const confirmar = new Composer()
confirmar.action('sim', async (ctx) => {
    confirmacaoPositiva(ctx)
  })
  confirmar.action('nao', async (ctx) => {
    confirmacaoNegativa(ctx)
})
confirmar.use(async (ctx) => {
    if (confirmado(ctx)) {
        confirmacaoPositiva(ctx)
    }
    if (negado(ctx)) {
        confirmacaoNegativa(ctx)
    }
})

const bot = new Telegraf(process.env.BOT_TOKEN)

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
    ctx.wizard.state.novoUsuario = {}
    const pagamento = Markup.inlineKeyboard([
        [Markup.callbackButton('💳 Cartão de Crédito', 'cartao_de_credito')],
        [Markup.callbackButton('📄 Boleto', 'boleto')]
    ])
    await ctx.reply(mensagem.pedir_forma_pagamento, Extra.markup(pagamento))
    return ctx.wizard.next()
}

const pegar = (informacao, messagem, mensagemConfirmacao, mensagemProximaInformacao, ctx) => {
    ctx.wizard.state.novoUsuario[informacao] = ctx.message.text
    ctx.wizard.state.informacao = informacao
    ctx.wizard.state.mensagemConfirmacao = mensagemConfirmacao
    ctx.wizard.state.mensagemProximaInformacao = mensagemProximaInformacao
    ctx.wizard.state.mensagem = ctx.message

    const confirmacao = Markup.inlineKeyboard([Markup.callbackButton('Sim', 'sim'), Markup.callbackButton('Não', 'nao')])
    ctx.reply(`${messagem} ${ctx.message.text}?`, Extra.inReplyTo(ctx.message.message_id).markup(confirmacao))
    return ctx.wizard.next()
}

const confirmacaoPositiva = async (ctx) => {
    if (!ctx.message.text) {
        await ctx.answerCbQuery()
    }
    const { informacao, mensagemConfirmacao, mensagemProximaInformacao, mensagem } = ctx.wizard.state
    const validacaoDeInformacao = validar(informacao, ctx.wizard.state.novoUsuario[informacao])
    if (!validacaoDeInformacao.temErro) {
        await ctx.reply(`${mensagemConfirmacao.positivo}`, Extra.inReplyTo(mensagem.id))
        await ctx.reply(`${mensagemProximaInformacao}`)
        if (informacao === 'email') {
            return await verificarCompraDeUsuarioNaMonetizze(ctx) ? await enviarCanaisTelegram(ctx) : await adicionarEmailAosEmailsBloqueados(ctx)
        }
        return ctx.wizard.next()
    }
    await ctx.reply(`${validacaoDeInformacao.mensagemDeErro}`)
    await ctx.reply(`${mensagemConfirmacao.negativo}`)
    return ctx.wizard.back()
}

const confirmacaoNegativa = async (ctx) => {
    if (!ctx.message.text) {
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
    await ctx.reply('Usuário registrado com sucesso! Seja bem-vindo!')
    const linkCanal1 = await ctx.telegram.exportChatInviteLink(process.env.ID_CANAL_SINAIS_RICOS)
    const linkCanal2 = await ctx.telegram.exportChatInviteLink(process.env.ID_CANAL_RICO_VIDENTE)
    const teclado = Markup.inlineKeyboard([
        Markup.urlButton('Canal Sinais Ricos', linkCanal1),
        Markup.urlButton('Canal Rico Vidente', linkCanal2)
    ])
    await ctx.reply('ola', Extra.markup(teclado))
    atribuirIdTelegramAoNovoUsuario(ctx)
    await adicionarUsuarioAoBancoDeDados(ctx);
    return ctx.scene.leave()
}

const atribuirIdTelegramAoNovoUsuario = (ctx) => {
    ctx.wizard.state.novoUsuario.idTelegram = ctx.chat.id;
}

const adicionarUsuarioAoBancoDeDados = async (ctx) => {
    const {idTelegram, nomeCompleto, formaDePagamento, email, telefone} = ctx.wizard.state.novoUsuario
    const novoUsuario = new Usuario(idTelegram, nomeCompleto, formaDePagamento, email, telefone, StatusAssinatura.ATIVA)
    await dao.adicionarUsuarioAoBancoDeDados(novoUsuario, conexao)
    const usuarios = await dao.pegarTodosUsuariosDoBancoDeDados(conexao)
    await csv.criarArquivoCSV(
        ['Id', 'Nome Completo', 'Telefone', 'Email', 'Forma De Pagamento', 'Status Assinatura'],
        usuarios, 'usuarios.csv'
    )
}

const adicionarEmailAosEmailsBloqueados = async (ctx) => {
    const { email } = ctx.wizard.state.novoUsuario
    await dao.adicionarEmEmailsBloqueados(email, conexao)
    await ctx.reply(`O usuário do email ${ctx.wizard.state.novoUsuario.email} foi bloqueado pois não consta nenhuma compra finalizada por ele na Monetizze.`)
    await ctx.reply('Caso houve algum engano, inicie novamente seu registro comigo usando o comando /start ou entre em contato com Alberto Soares (email) para pedir a liberação do seu acesso.')
    return ctx.scene.leave()
}

const stage = new Stage([wizard]);

bot.use(session())
bot.use(stage.middleware())
bot.command('start', (ctx) => ctx.scene.enter('start'))
bot.on('channel_post', (ctx) => console.log('channel post', ctx.channelPost))

bot.launch()
cronjobs.start()


const PORT = process.env.PORT_METODO_SEMPRERICO_BOT_APP || process.env.PORT_APP || 3000
app.listen(PORT, () => console.log(`Servidor rodando na porta ${PORT}`));

module.exports = { confirmarEmail, adicionarUsuarioAoBancoDeDados }