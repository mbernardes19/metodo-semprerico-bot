const Composer = require('telegraf/composer')
const Markup = require('telegraf/markup')
const Extra = require('telegraf/extra')
const { log, logError } = require('../../servicos/logger')
const { confirmado, negado, validar } = require('../../servicos/validacao')
const { enviarSmsDeValidacao } = require('./validarTelefone')
const { pegarTodosNumerosBloqueados } = require('../../dao')
const { conexao } = require('../../db')

const confirmacaoPositiva = async (ctx) => {
    const validacao = validar('telefone', ctx.wizard.state.novoUsuario.telefone);
    if (!validacao.temErro) {
        try {
            const numeros = await pegarTodosNumerosBloqueados(conexao)
            console.log(numeros)
            if (numeros.includes(ctx.wizard.state.novoUsuario.telefone)) {
                await ctx.reply(`Seu número de telefone está registrado como bloqueado. Caso tenha ocorrido um engano, envie um email explicando sua situação com seus dados (nome completo, email e telefone) para ${process.env.EMAIL_PARA}`)
                return ctx.scene.leave()
            }
            await enviarSmsDeValidacao(ctx, ctx.wizard.state.novoUsuario.telefone)
            await ctx.reply(`Foi enviado agora um SMS com um número de verificação para o número ${ctx.wizard.state.novoUsuario.telefone}. Por favor, diga-me aqui qual foi o número.`)
            return ctx.wizard.next()
        } catch (err) {
            logError(`ERRO AO ENVIAR SMS DE VERIFICAÇÃO`, err)
            await ctx.reply(`Ocorreu um erro ao enviar o SMS de verificação para o número ${ctx.wizard.state.novoUsuario.telefone}. Por favor, inicie uma conversa comigo novamente com o comando /start`)
            return ctx.scene.leave()
        }
    }
    await ctx.reply(`${validacao.mensagemDeErro}`)
    await ctx.reply(`Por favor, insira seu telefone novamente`)
    return ctx.wizard.back()
}

const pegarTelefone = async (ctx) => {
    if (!ctx.message) {
        await ctx.answerCbQuery()
    }
    try {
        ctx.wizard.state.tentativasSms = 0
        const confirmacao = Markup.inlineKeyboard([Markup.callbackButton('👍 Sim', 'sim'), Markup.callbackButton('👎 Não', 'nao')])
        await ctx.reply(`Confirmando, seu telefone é ${ctx.message.text}, certo?`, Extra.inReplyTo(ctx.message.message_id).markup(confirmacao))
        ctx.wizard.state.novoUsuario.telefone = ctx.message.text.replace(/ /g, "")
        log(`Telefone definido`)
        log(ctx.wizard.state.novoUsuario)
        ctx.wizard.next()
    } catch (err) {
        ctx.scene.leave()
    }
}

const confirmarTelefone = new Composer()
confirmarTelefone.action('sim', async (ctx) => {
        try {
            await ctx.answerCbQuery()
            return await confirmacaoPositiva(ctx)
        } catch (err) {
            log(err)
        }
})
confirmarTelefone.action('nao', async (ctx) => {
    try {
        await ctx.answerCbQuery()
        await ctx.reply(`Por favor, insira seu telefone novamente`)
        return ctx.wizard.back()
    } catch (err) {
        log(err)
    }
})
confirmarTelefone.use(async (ctx) => {
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
            await ctx.reply(`Por favor, insira seu telefone novamente`)
            return ctx.wizard.back()
        } catch (err) {
            log(err)
        }
    }
    await ctx.reply('Por favor, escolha uma das opções.')
})

module.exports = { pegarTelefone, confirmarTelefone }