const Composer = require('telegraf/composer')
const Extra = require('telegraf/extra')
const { log } = require('../../servicos/logger')
const { confirmado, negado } = require('../../servicos/validacao')
const dao = require('../../dao')
const { validar } = require('../../servicos/validacao')
const { conexaoDb } = require('../../db')
const Teclado = require('../../utils/Teclado');

const confirmacaoPositiva = async (ctx) => {
    const validacao = validar('email', ctx.wizard.state.novoUsuario.email);
    if (!validacao.temErro) {
        const emailsBloqueados = await dao.pegarTodosEmailsBloqueados(conexaoDb)
        const emailBloqueado = emailsBloqueados.filter(emailBloqueado => emailBloqueado.email === ctx.wizard.state.novoUsuario.email)
        if (emailBloqueado.length > 0) {
            await ctx.reply(`Seu email está registrado como bloqueado. Caso tenha ocorrido um engano, envie um email explicando sua situação para ${process.env.EMAIL_PARA}`)
            return ctx.scene.leave()
        }
        await ctx.reply('Ok!')
        await ctx.reply('Qual é o seu telefone com DDD?')
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
        await ctx.reply(`Confirmando, seu email é ${ctx.message.text}, certo?`, Extra.inReplyTo(ctx.message.message_id).markup(Teclado.CONFIRMACAO))
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