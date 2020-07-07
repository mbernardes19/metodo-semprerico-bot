const app = require('express')()
const { Telegraf } = require('telegraf')
require('dotenv').config()
const session = require('telegraf/session')
const Stage = require('telegraf/stage')
const WizardScene = require('telegraf/scenes/wizard')
const Extra = require('telegraf/extra')
const db = require('./db');
const mensagem = require('./mensagem')
const {confirmado, negado, formaDePagamentoValida} = require('./validacao');
const { pegarTransacaoNaMonetizze } = require('./request')
const regex = require('./regex')


const conexao = db.conexao
conexao.connect((err) => {
    if (err) return console.log(err)
    console.log('conectou!')
})
// const query = util.promisify(conexao.query).bind(conexao)

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
                ctx.wizard.next() : ctx.scene.leave())
                     : ctx.scene.leave()
    }
    if (negado(ctx)) {
        await ctx.reply(`${mensagemConfirmacao.negativo}`)
        return ctx.wizard.back()
    }
    await ctx.reply(`${mensagemConfirmacao.erro}`)
    await ctx.reply(`${mensagemConfirmacao.negativo}`)
    return ctx.wizard.back()
}

const verificarUsuarioNaMonetizze = async (ctx) => {
    if (await usuarioExisteNaMonetizze(ctx)) {
        await ctx.reply('Usuário confirmado!')
        return true
    } else {
        await ctx.reply(`O email ${ctx.wizard.state.novoUsuario.email} foi bloqueado pois não consta nenhum pelo usuário na Monetizze com este email.`)
        await ctx.reply('Caso houve algum engano, inicie novamente seu registro comigo usando o comando /start ou entre em contato com Alberto Soares (email) para pedir a liberação do seu acesso.')
        return false
    }
}

const usuarioExisteNaMonetizze = async (ctx) => {
    const { email } = await ctx.wizard.state.novoUsuario
    const response = await pegarTransacaoNaMonetizze({email})
    return response.dados.length === 0 ? false : true
}

const compraDeUsuarioConfirmadaNaMonetizze = async (ctx) => {
    const { email, formaDePagamento } = await ctx.wizard.state.novoUsuario
    const pagamento = regex.CARTAO.test(formaDePagamento) ? 1 : 3
    const response = await pegarTransacaoNaMonetizze({email, "forma_pagamento[]": pagamento, "status[]": 2, "status[]": 6})
    return response.dados.length === 0 ? false : true
}

const verificarCompraDeUsuarioNaMonetizze = async (ctx) => {
    if (await compraDeUsuarioConfirmadaNaMonetizze(ctx)) {
        await ctx.reply('Usuário confirmado!')
        return true
    } else {
        await ctx.reply(`O usuário do email ${ctx.wizard.state.novoUsuario.email} foi bloqueado pois não consta nenhuma compra finalizada do curso pelo usuário na Monetizze.`)
        await ctx.reply('Caso houve algum engano, inicie novamente seu registro comigo usando o comando /start ou entre em contato com Alberto Soares (email) para pedir a liberação do seu acesso.')
        return false
    }
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