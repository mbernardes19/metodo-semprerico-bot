const {pegarTransacaoNaMonetizze} = require('./request')
const regex = require('./regex')
const { atualizarStatusDeAssinaturaDeUsuario } = require('./dao')
const { conexao } = require('./db')
const Telegram = require('telegraf/telegram')

const verificarCompraDeUsuarioNaMonetizze = async (ctx) => {
    const { email, formaDePagamento } = await ctx.wizard.state.novoUsuario
    const pagamento = regex.CARTAO.test(formaDePagamento) ? 1 : 3
    const response = await pegarTransacaoNaMonetizze({
        product: process.env.ID_PRODUTO, email, "forma_pagamento[]": pagamento, "status[]": 2, "status[]": 6
    })
    return response.recordCount === 0 ? false : true
}

const atualizarStatusDeAssinaturaDeUsuarios = async (usuarios) => {
    usuarios.forEach(async usuario => {
        const novoStatus = await pegarNovoStatusDeAssinaturaDeUsuario(usuario)
        await atualizarStatusDeAssinaturaDeUsuario(usuario, novoStatus, conexao)
    })
} 

const pegarNovoStatusDeAssinaturaDeUsuario = async (usuario) => {
    const { email, forma_de_pagamento } = usuario
    const pagamento = regex.CARTAO.test(forma_de_pagamento) ? 1 : 3
    const response = await pegarTransacaoNaMonetizze({
        product: process.env.ID_PRODUTO, email, "forma_pagamento[]": pagamento
    })
    return response.dados[0].venda.status.toLowerCase().replace(/ /g, "_")
}

const banirUsuariosSeStatusNaoForAtivo = async (usuario) => {
    usuario.forEach(async usuario => {
        if (usuario.status_assinatura !== 'ativa') {
            const telegram = new Telegram(process.env.BOT_TOKEN)
            await telegram.kickChatMember(process.env.ID_CANAL_RICO_VIDENTE, usuario.id)
            await telegram.kickChatMember(process.env.ID_CANAL_SINAIS_RICOS, usuario.id)
        }
    })
} 

module.exports = { 
    verificarCompraDeUsuarioNaMonetizze,
    atualizarStatusDeAssinaturaDeUsuarios,
    banirUsuariosSeStatusNaoForAtivo 
}