const regex = require('./regex')

const validar = (informacao, dado) => {
    switch(informacao) {
        case 'telefone':
            return regex.TELEFONE.test(dado.replace(/ /g, "")) ?
                {temErro: false, mensagemDeErro: ""} :
                {temErro: true, mensagemDeErro: "Telefone inválido. Certifique-se de estar inserindo somente números e o DDD (sem o zero) junto."}
        case 'email':
            return regex.EMAIL.test(dado) ?
                {temErro: false, mensagemDeErro: ""} :
                {temErro: true, mensagemDeErro: "Email inválido. Certifique-se de estar inserindo um email válido."}
        default: return {temErro: false, mensagemDeErro: ""}
    }
}

module.exports = {
    formaDePagamentoValida: (ctx) => regex.CARTAO.test(ctx.message.text) || regex.BOLETO.test(ctx.message.text),
    cartao: (ctx) => regex.CARTAO.test(ctx.message.text),
    boleto: (ctx) => regex.BOLETO.test(ctx.message.text),
    confirmado: (ctx) => regex.SIM.test(ctx.message.text),
    negado: (ctx) => regex.NAO.test(ctx.message.text),
    validar
}
