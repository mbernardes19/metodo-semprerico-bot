const Composer = require('telegraf/composer')
const Extra = require('telegraf/extra')
const { log } = require('../../servicos/logger')
const { confirmado, negado } = require('../../servicos/validacao')
const Teclado = require('../../utils/Teclado');
const {endConversation, Reason} = require('../../utils/telegraf');

const receberNome = async (ctx) => {
    if (!ctx.message) {
        await ctx.answerCbQuery();
    }
    ctx.wizard.state.novoUsuario = {};
    ctx.wizard.state.novoUsuario.formaDePagamento = 'plano_gratuito';
    await ctx.reply('Vou precisar de alguns dados para liberar seu período gratuito de 7 dias nos nossos canais VIPs do Método Sempre Rico!')
    await ctx.reply('Qual é o seu nome completo?');
    return ctx.wizard.next();
}

const pegarNome = async (ctx) => {
    if (!ctx.message) {
        await ctx.answerCbQuery()
    }
    try {
        await ctx.reply(`Confirmando, seu nome completo é ${ctx.message.text}, certo?`, Extra.inReplyTo(ctx.message.message_id).markup(Teclado.CONFIRMACAO))
        ctx.wizard.state.novoUsuario.nomeCompleto = ctx.message.text
        log(`Nome completo definido`)
        log(ctx.wizard.state.novoUsuario)
        return ctx.wizard.next()
    } catch (err) {
        log(err)
        await endConversation({ctx, isFinished: false, reason: Reason.ERROR})
    }
}

const confirmarNome = new Composer()
confirmarNome.action('sim', async (ctx) => {
    try {
        await ctx.answerCbQuery()
        await ctx.reply(`Qual é o seu email?`)
        return ctx.wizard.next()
    } catch (err) {
        log(err)
    }
})
confirmarNome.action('nao', async (ctx) => {
    try {
        await ctx.answerCbQuery()
        await ctx.reply(`Por favor, insira seu nome completo novamente`)
        return ctx.wizard.back()
    } catch (err) {
        log(err)
    }
})
confirmarNome.use(async (ctx) => {
    log(`Sim/Não`)
    if (confirmado(ctx)) {
        try {
            await ctx.reply(`Qual é o seu email?`)
            return ctx.wizard.next()
        } catch (err) {
            log(err)
        }
    }
    if (negado(ctx)) {
        try {
            await ctx.reply(`Por favor, insira seu nome completo novamente`)
            return ctx.wizard.back()
        } catch (err) {
            log(err)
        }    
    }
    await ctx.reply('Por favor, escolha uma das opções.')
})

module.exports = { receberNome, pegarNome, confirmarNome }