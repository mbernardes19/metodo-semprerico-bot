const app = require('express')()
const { Telegraf } = require('telegraf')
require('dotenv').config()
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
const {verificarCompraDeUsuarioNaMonetizze, verificarUsuarioNaMonetizze} = require('./monetizze')

const conexao = db.conexao
conexao.connect((err) => {
    if (err) return console.log(err)
})

const bot = new Telegraf(process.env.BOT_TOKEN)

const wizardTeste = new WizardScene(
    'teste',
    async (ctx) => darBoasVindas(ctx),
    async (ctx) => pegarFormaDePagamento(ctx),
    async (ctx) => pegar('nomeCompleto', mensagem.nome_completo , ctx),
    async (ctx) => confirmar(mensagem.confirmacao_nome_completo, mensagem.pedir_telefone, ctx),
    async (ctx) => pegar('telefone', mensagem.telefone , ctx),
    async (ctx) => confirmar(mensagem.confirmacao_telefone, mensagem.pedir_email, ctx),
    async (ctx) => pegar('email', mensagem.email , ctx),
    async (ctx) => confirmarEmail(mensagem.confirmacao_email, mensagem.verificar_monetizze, ctx),
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
        return await verificarUsuarioNaMonetizze(ctx) ? 
            (await verificarCompraDeUsuarioNaMonetizze(ctx) ? 
                await adicionarUsuarioAoBancoDeDados(ctx) : await adicionarEmailAosEmailsBloqueados(ctx))
                     : await adicionarEmailAosEmailsBloqueados(ctx)
    }
    if (negado(ctx)) {
        await ctx.reply(`${mensagemConfirmacao.negativo}`)
        return ctx.wizard.back()
    }
    await ctx.reply(`${mensagemConfirmacao.erro}`)
    await ctx.reply(`${mensagemConfirmacao.negativo}`)
    return ctx.wizard.back()
}

const adicionarUsuarioAoBancoDeDados = async (ctx) => {
    const {nomeCompleto, formaDePagamento, email, telefone} = ctx.wizard.state.novoUsuario
    const novoUsuario = new Usuario(nomeCompleto, formaDePagamento, email, telefone, StatusAssinatura.ATIVA)
    await dao.adicionarUsuarioAoBancoDeDados(novoUsuario, conexao)
}

const adicionarEmailAosEmailsBloqueados = async (ctx) => {
    const { email } = ctx.wizard.state.novoUsuario
    await dao.adicionarEmEmailsBloqueados(email, conexao)
    return ctx.scene.leave()
}


const stage = new Stage([wizardTeste]);

bot.use(session())
bot.use(stage.middleware())
bot.command('start', (ctx) => ctx.scene.enter('teste'))
bot.launch()

// cron.schedule("* * * * *", () => fs.appendFileSync('log.txt', 'Executando a tarefa a cada 1 minuto'));

const PORT = process.env.PORT_METODO_SEMPRERICO_BOT_APP || process.env.PORT_APP || 3000
app.listen(PORT, function(){
  console.log(`Servidor rodando na porta ${PORT}`)
});

module.exports = { confirmarEmail, adicionarUsuarioAoBancoDeDados }