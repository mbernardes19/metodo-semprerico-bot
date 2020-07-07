const regex = require('./regex')

module.exports = {
    formaDePagamentoValida: (ctx) => regex.CARTAO.test(ctx.message.text) || regex.BOLETO.test(ctx.message.text),
    confirmado: (ctx) => regex.SIM.test(ctx.message.text),
    negado: (ctx) => regex.NAO.test(ctx.message.text)
}
