const { pegarNome, confirmarNome } = require('../passos/planoPago/nomeCompleto')
const { pegarEmail, confirmarEmail } = require('../passos/planoPago/email')
const { pegarTelefone, confirmarTelefone } = require('../passos/planoPago/telefone')
const { pedirFormaDePagamento } = require('../passos/planoPago/formaPagamento')
const { log, logError } = require('../servicos/logger')
const Extra = require('telegraf/extra')
const Markup = require('telegraf/markup')

const WizardScene = require('telegraf/scenes/wizard')

const cenaPlanoPago = new WizardScene(
    'planoPago',
    async ctx => darBoasVindas(ctx),
    pedirFormaDePagamento,
    async ctx => pegarNome(ctx),
    confirmarNome,
    async ctx => pegarTelefone(ctx),
    confirmarTelefone,
    async ctx => pegarEmail(ctx),
    confirmarEmail
)

cenaPlanoPago.command('stop', async ctx => ctx.scene.leave())


const darBoasVindas = async (ctx) => {
    try {
        await ctx.reply('Olá, eu sou o Bot do Método Sempre Rico 🤖💵 Estou aqui para te dar acesso aos nossos canais de Telegram para que você possa começar a trilhar seu caminho rumo à riqueza!')
    } catch (err) {
        await ctx.reply('Preciso primeiramente confirmar no servidor da Monetizze se o seu pagamento já foi aprovado.\n\nPor isso, gostaria de saber algumas informações de você...')
        logError('ERRO AO ENVIAR PRIMEIRA MENSAGEM', err)
    }
    ctx.wizard.state.novoUsuario = {}
    const pagamento = Markup.inlineKeyboard([
        [Markup.callbackButton('💳 Cartão de Crédito', 'cartao_de_credito')],
        [Markup.callbackButton('📄 Boleto', 'boleto')],
        [Markup.callbackButton('🆓 Plano Gratuito', 'plano_gratuito')]
    ])
    await ctx.reply('Você pagou em cartão de crédito, boleto ou contratou o plano gratuito de 1 mês?', Extra.markup(pagamento))
    return ctx.wizard.next()
}

module.exports = cenaPlanoPago