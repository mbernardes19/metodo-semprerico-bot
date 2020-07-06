const app = require('express')()
const {auth, getTransactions} = require('./request')
const { Telegraf } = require('telegraf')
const regex = require('./regex')
require('dotenv').config()
const session = require('telegraf/session')
const Stage = require('telegraf/stage')
const WizardScene = require('telegraf/scenes/wizard')
const db = require('./db');
const mensagens = require('./mensagens')
const bodyParser = require('body-parser')

const conexao = db.conexao
conexao.connect((err) => {
    if (err) return console.log(err)
    console.log('conectou!')
})

const bot = new Telegraf(process.env.BOT_TOKEN)

const wizardTeste = new WizardScene(
    'teste',
    async (ctx) => {
        await darBoasVindas(ctx)
        ctx.wizard.state.novoUsuario = {}
        return ctx.wizard.next()
    },
    (ctx) => {
        if (regex.CARTAO.test(ctx.message.text) || regex.BOLETO.test(ctx.message.text)) {
            ctx.wizard.state.novoUsuario.formaDePagamento = ctx.message.text
            ctx.reply("Ok! E qual é o seu nome todo?")
            console.log(ctx.wizard.state.novoUsuario)
            return ctx.wizard.next()
        }
        
        ctx.reply("Não entendi essa opção. As formas de pagamento válidas são somente 'cartao' ou 'boleto' ")

    }
    )

const stage = new Stage([wizardTeste]);

bot.use(session())
bot.use(stage.middleware())
bot.hears('Oi!', (ctx) => ctx.scene.enter('teste'))
bot.launch()

const darBoasVindas = async (ctx) => {
    await ctx.reply(mensagens.boas_vindas)
}

const PORT = process.env.PORT_METODO_SEMPRERICO_BOT_APP || process.env.PORT_APP || 3000
app.listen(PORT, function(){
  console.log(`Servidor rodando na porta ${PORT}`)
});