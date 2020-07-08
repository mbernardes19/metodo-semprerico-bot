const {pegarTransacaoNaMonetizze} = require('./request')
const regex = require('./regex')

const verificarUsuarioNaMonetizze = async (ctx) => {
    if (await usuarioExisteNaMonetizze(ctx)) {
        await ctx.reply('Usuário confirmado!')
        return true
    } else {
        await ctx.reply(`O email ${ctx.wizard.state.novoUsuario.email} foi bloqueado pois não consta nenhum pelo usuário na Monetizze com este email.`)
        await ctx.reply('Caso houve algum engano, inicie novamente seu registro comigo usando o comando /start ou entre em contato com Alberto Soares (email) para pedir a liberação do seu acesso.')
        return false
    }
}

const usuarioExisteNaMonetizze = async (ctx) => {
    const { email } = await ctx.wizard.state.novoUsuario
    const response = await pegarTransacaoNaMonetizze({email})
    return response.dados.length === 0 ? false : true
}

const compraDeUsuarioConfirmadaNaMonetizze = async (ctx) => {
    const { email, formaDePagamento } = await ctx.wizard.state.novoUsuario
    const pagamento = regex.CARTAO.test(formaDePagamento) ? 1 : 3
    const response = await pegarTransacaoNaMonetizze({email, "forma_pagamento[]": pagamento, "status[]": 2, "status[]": 6})
    return response.dados.length === 0 ? false : true
}

const verificarCompraDeUsuarioNaMonetizze = async (ctx) => {
    if (await compraDeUsuarioConfirmadaNaMonetizze(ctx)) {
        await ctx.reply('Usuário confirmado!')
        return true
    } else {
        await ctx.reply(`O usuário do email ${ctx.wizard.state.novoUsuario.email} foi bloqueado pois não consta nenhuma compra finalizada por ele na Monetizze.`)
        await ctx.reply('Caso houve algum engano, inicie novamente seu registro comigo usando o comando /start ou entre em contato com Alberto Soares (email) para pedir a liberação do seu acesso.')
        return false
    }
}

module.exports = {
    verificarUsuarioNaMonetizze, verificarCompraDeUsuarioNaMonetizze, usuarioExisteNaMonetizze, compraDeUsuarioConfirmadaNaMonetizze
}