const {pegarTransacaoNaMonetizze} = require('./request')
const regex = require('./regex')
const dao = require('./dao')
const { conexao } = require('./db')
const { log } = require('./logger')

const verificarCompraDeUsuarioNaMonetizze = async (ctx) => {
    const { email, formaDePagamento } = await ctx.wizard.state.novoUsuario
    const pagamento = regex.CARTAO.test(formaDePagamento) ? 1 : 3
    try {
        const response = await pegarTransacaoNaMonetizze({
            product: process.env.ID_PRODUTO, email, "forma_pagamento[]": pagamento, "status[]": 2, "status[]": 6
        })
        log(`Verificando compra de usuário na Monetizze - ${response}`)
        return response.recordCount == 0 ? false : true
    } catch (err) {
        throw err
    }
}

const atualizarStatusDeAssinaturaDeUsuarios = async (usuarios) => {
    const novosStatusAsync = []
    usuarios.forEach(usuario => novosStatusAsync.push(pegarNovoStatusDeAssinaturaDeUsuario(usuario)))
    try {
        const novosStatus = await Promise.all(novosStatusAsync)
        await dao.atualizarStatusDeAssinaturaDeUsuarios(usuarios, novosStatus, conexao)
        log(`Status de assinatura de todos os usuários atualizado`)
    } catch (err) {
        throw err
    }
} 

const pegarNovoStatusDeAssinaturaDeUsuario = async (usuario) => {
    const { email, forma_de_pagamento } = usuario
    const pagamento = regex.CARTAO.test(forma_de_pagamento) ? 1 : 3
    try {
        const response = await pegarTransacaoNaMonetizze({
            product: process.env.ID_PRODUTO, email, "forma_pagamento[]": pagamento
        })
        return response.dados[0].venda.status.toLowerCase().replace(/ /g, "_")
    } catch (err) {
        throw err
    }
}

const banirUsuariosSeStatusNaoForAtivo = async (usuarios, telegramClient) => {
    const acoes = [];
    let usuarioASerBanido;
    usuarios.forEach(usuario => {
        if (usuario.status_assinatura !== 'ativa') {
            acoes.push(telegramClient.kickChatMember(process.env.ID_CANAL_RICO_VIDENTE, usuario.id))
            acoes.push(telegramClient.kickChatMember(process.env.ID_CANAL_SINAIS_RICOS, usuario.id))
            usuarioASerBanido = usuario.nome_completo
        }
    })
    try {
        await Promise.all(acoes)
        log(`Usuário ${usuarioASerBanido} foi banido`)
    } catch (err) {
        throw err
    }
} 

module.exports = { 
    verificarCompraDeUsuarioNaMonetizze,
    atualizarStatusDeAssinaturaDeUsuarios,
    banirUsuariosSeStatusNaoForAtivo
}