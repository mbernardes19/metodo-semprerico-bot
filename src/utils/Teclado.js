const Markup = require('telegraf/markup');

const Teclado = {
    FORMAS_DE_PAGAMENTO: Markup.inlineKeyboard([
        [Markup.callbackButton('💳 Cartão de Crédito', 'cartao_de_credito')],
        [Markup.callbackButton('📄 Boleto', 'boleto')]
      ]),
    FORMAS_DE_PAGAMENTO_GRATUITO: Markup.inlineKeyboard([
        [Markup.callbackButton('💳 Cartão de Crédito', 'cartao_de_credito')],
        [Markup.callbackButton('📄 Boleto', 'boleto')],
        [Markup.callbackButton('🆓 Plano Gratuito', 'plano_gratuito')]
      ]),
    CONFIRMACAO: Markup.inlineKeyboard([Markup.callbackButton('👍 Sim', 'sim'), Markup.callbackButton('👎 Não', 'nao')])
}

module.exports = Teclado;