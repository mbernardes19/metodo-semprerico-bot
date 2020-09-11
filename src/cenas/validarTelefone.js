const { enviarSms } = require('../servicos/request')

const gerarNumeroValidacaoSms = () => {
    let numero = ''
    for (let i = 0; i < 5; i++) {
        numero += Math.trunc(Math.random() * 10)
    }
    return numero;
}

const enviarSmsDeValidacao = async (ctx, telefone) => {
    const numeroValidacao = gerarNumeroValidacaoSms()
    ctx.wizard.state.numeroValidacao = numeroValidacao
    try {
        await enviarSms(telefone, numeroValidacao)
    } catch (err) {
        log(`ERRO AO ENVIAR SMS DE VALIDAÇÃO ${JSON.stringify(err)}`)
        throw err
    }
}

const validarTelefone = (ctx) => {
    if (ctx.message.text == ctx.wizard.state.numeroValidacao) {
        ctx.reply('Confirmado!')
        ctx.reply('Qual é o seu email?')
        return ctx.wizard.next()
    }
    ctx.reply(`Esse número não é igual ao enviado no SMS. Quer que eu envie um SMS novamente para ${ctx.wizard.state.novoUsuario.telefone}?`)
    return ctx.wizard.back()
}

module.exports = { enviarSmsDeValidacao, validarTelefone }