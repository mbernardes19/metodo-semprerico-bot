require('sexy-require');

const path = require('path')
const app = require('express')()
const { Telegraf } = require('telegraf')
require('dotenv').config({path: path.join(__dirname, "../", '.env')})
const session = require('telegraf/session')
const Stage = require('telegraf/stage')
const WizardScene = require('telegraf/scenes/wizard')
const Extra = require('telegraf/extra')
const db = require('./db');
const mensagem = require('./mensagem')
const dao = require('./dao')
const StatusAssinatura = require('./model/status_assinatura')
const Usuario = require('./model/usuario')
const {confirmado, negado, formaDePagamentoValida} = require('./validacao');
const {
    verificarCompraDeUsuarioNaMonetizze,
    atualizarStatusDeAssinaturaDeUsuarios,
    banirUsuariosSeStatusNaoForAtivo
} = require('./monetizze')
const cron = require('node-cron')

const conexao = db.conexao
conexao.connect((err) => {
    if (err) return console.log(err)
})

const bot = new Telegraf(process.env.BOT_TOKEN)

const wizard = new WizardScene(
    'start',
    async ctx => darBoasVindas(ctx),
    async ctx => pegarFormaDePagamento(ctx),
    async ctx => pegar('nomeCompleto', mensagem.nome_completo , ctx),
    async ctx => confirmar(mensagem.confirmacao_nome_completo, mensagem.pedir_telefone, ctx),
    async ctx => pegar('telefone', mensagem.telefone , ctx),
    async ctx => confirmar(mensagem.confirmacao_telefone, mensagem.pedir_email, ctx),
    async ctx => pegar('email', mensagem.email , ctx),
    async ctx => confirmarEmail(mensagem.confirmacao_email, mensagem.verificar_monetizze, ctx)
)

const darBoasVindas = async (ctx) => {
    await ctx.reply(mensagem.boas_vindas)
    ctx.wizard.state.novoUsuario = {}
    await ctx.reply(mensagem.pedir_forma_pagamento)
    return ctx.wizard.next()
}

const pegarFormaDePagamento = async (ctx) => {
    if (formaDePagamentoValida(ctx)) {
        ctx.wizard.state.novoUsuario.formaDePagamento = ctx.message.text
        ctx.reply(mensagem.pedir_nome_completo)
        return ctx.wizard.next()
    }
    ctx.reply("Não entendi essa opção. As formas de pagamento válidas são somente 'cartao' ou 'boleto' ")
}

const pegar = (informacao, messagem, ctx) => {
    ctx.reply(`${messagem} ${ctx.message.text}?`, Extra.inReplyTo(ctx.message.message_id))
    ctx.wizard.state.novoUsuario[informacao] = ctx.message.text
    return ctx.wizard.next()
}

const confirmar = async (mensagemConfirmacao, mensagemProximaInformacao, ctx) => {
    if (confirmado(ctx)) {
        await ctx.reply(`${mensagemConfirmacao.positivo}`, Extra.inReplyTo(ctx.message.message_id))
        await ctx.reply(`${mensagemProximaInformacao}`)
        return ctx.wizard.next()
    }
    if (negado(ctx)) {
        await ctx.reply(`${mensagemConfirmacao.negativo}`)
        return ctx.wizard.back()
    }
    await ctx.reply(`${mensagemConfirmacao.erro}`)
    await ctx.reply(`${mensagemConfirmacao.negativo}`)
    return ctx.wizard.back()
}

const confirmarEmail = async (mensagemConfirmacao, mensagemProximaInformacao, ctx) => {
    if (confirmado(ctx)) {
        await ctx.reply(`${mensagemConfirmacao.positivo}`, Extra.inReplyTo(ctx.message.message_id))
        await ctx.reply(`${mensagemProximaInformacao}`)
        return await verificarCompraDeUsuarioNaMonetizze(ctx) ? await enviarCanaisTelegram(ctx) : await adicionarEmailAosEmailsBloqueados(ctx)
    }
    if (negado(ctx)) {
        await ctx.reply(`${mensagemConfirmacao.negativo}`)
        return ctx.wizard.back()
    }
    await ctx.reply(`${mensagemConfirmacao.erro}`)
    await ctx.reply(`${mensagemConfirmacao.negativo}`)
    return ctx.wizard.back()
}

const enviarCanaisTelegram = async (ctx) => {
    await ctx.reply('Usuário registrado com sucesso! Seja bem-vindo!')
    await ctx.reply('https://t.me/joinchat/AAAAAFlgKPbG2N2Glr-Xeg')
    await ctx.reply('https://t.me/joinchat/AAAAAFcQJkoI236IbrM_ew')
    atribuirIdTelegramAoNovoUsuario(ctx)
    adicionarUsuarioAoBancoDeDados(ctx);
    return ctx.scene.leave()
}

const atribuirIdTelegramAoNovoUsuario = (ctx) => {
    ctx.wizard.state.novoUsuario.idTelegram = ctx.chat.id;
}

const adicionarUsuarioAoBancoDeDados = async (ctx) => {
    const {idTelegram, nomeCompleto, formaDePagamento, email, telefone} = ctx.wizard.state.novoUsuario
    const novoUsuario = new Usuario(idTelegram, nomeCompleto, formaDePagamento, email, telefone, StatusAssinatura.ATIVA)
    await dao.adicionarUsuarioAoBancoDeDados(novoUsuario, conexao)
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
bot.on('channel_post', async ctx => console.log(ctx.message))

bot.launch()

cron.schedule("0 2 * * *", async () => {
    const usuarios = await dao.pegarTodosUsuariosDoBancoDeDados(conexao)
    await atualizarStatusDeAssinaturaDeUsuarios(usuarios)
    await banirUsuariosSeStatusNaoForAtivo(usuarios)
});

const PORT = process.env.PORT_METODO_SEMPRERICO_BOT_APP || process.env.PORT_APP || 3000
app.listen(PORT, () => console.log(`Servidor rodando na porta ${PORT}`));

module.exports = { confirmarEmail, adicionarUsuarioAoBancoDeDados }