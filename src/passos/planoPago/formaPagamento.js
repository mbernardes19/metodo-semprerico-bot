const Composer = require('telegraf/composer')
const { log } = require('../../servicos/logger')
const { boleto, cartao, planoGratuito } = require('../../servicos/validacao')

const pedirFormaDePagamento = new Composer()
pedirFormaDePagamento.action('cartao_de_credito', async (ctx) => {
    await ctx.answerCbQuery()
    ctx.wizard.state.novoUsuario.formaDePagamento = 'cartao_de_credito'
    log('Forma de pagamento definida')
    await ctx.reply('Certo!')
    await ctx.reply('Vou precisar de mais alguns dados pra confirmar o pagamento no servidor da Monetizze, tudo bem?')
    await ctx.reply('Qual é o seu nome completo?')
    return ctx.wizard.next()
  })
pedirFormaDePagamento.action('boleto', async (ctx) => {
    await ctx.answerCbQuery()
    ctx.wizard.state.novoUsuario.formaDePagamento = 'boleto'
    log('Forma de pagamento definida')
    await ctx.reply('Certo!')
    await ctx.reply('Vou precisar de mais alguns dados pra confirmar o pagamento no servidor da Monetizze, tudo bem?')
    await ctx.reply('Qual é o seu nome completo?')
    return ctx.wizard.next()
})
pedirFormaDePagamento.action('plano_gratuito', async (ctx) => {
    await ctx.answerCbQuery()
    ctx.wizard.state.novoUsuario.formaDePagamento = 'plano_gratuito'
    log('Forma de pagamento definida')
    await ctx.reply('Certo!')
    return ctx.scene.enter('planoGratuito')
})
pedirFormaDePagamento.use(async (ctx) => {
    if (cartao(ctx)) {
        if (!ctx.message) {
            await ctx.answerCbQuery()
        }
        ctx.wizard.state.novoUsuario.formaDePagamento = 'cartao_de_credito'
        log('Forma de pagamento definida')
        await ctx.reply('Certo!')
        await ctx.reply('Vou precisar de mais alguns dados pra confirmar o pagamento no servidor da Monetizze, tudo bem?')
        await ctx.reply('Qual é o seu nome completo?')
        return ctx.wizard.next()
    }
    if (boleto(ctx)) {
        if (!ctx.message) {
            await ctx.answerCbQuery()
        }
        ctx.wizard.state.novoUsuario.formaDePagamento = 'boleto'
        log('Forma de pagamento definida')
        await ctx.reply('Certo!')
        await ctx.reply('Vou precisar de mais alguns dados pra confirmar o pagamento no servidor da Monetizze, tudo bem?')
        await ctx.reply('Qual é o seu nome completo?')
        return ctx.wizard.next()
    }
    if (planoGratuito(ctx)) {
        if (!ctx.message) {
            await ctx.answerCbQuery()
        }
        ctx.wizard.state.novoUsuario.formaDePagamento = 'plano_gratuito'
        log('Plano gratuito definido')
        await ctx.reply('Certo!')
        return ctx.scene.enter('planoGratuito')
    }
    await ctx.reply('Por favor, escolha uma das opções.')
})

module.exports = { pedirFormaDePagamento }