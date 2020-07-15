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
        log(`Verificando compra de usuário na Monetizze ${JSON.stringify(response)}`)
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
        if (response.recordCount > 0) {
            return response.dados[0].venda.status.toLowerCase().replace(/ /g, "_")
        }
        return forma_de_pagamento
    } catch (err) {
        throw err
    }
}
const mandarAvisoDeBanimento = async (usuario, telegramClient) => {
    await dao.aumentarAvisoDeBanimento(usuario, conexao)
    const usuarioAtualizado = await dao.pegarUsuarioPeloId(usuario.id, conexao);
    if (usuarioAtualizado.aviso_banimento === 1) {
        return telegramClient.sendMessage(usuario.id, `A sua assinatura no curso da Monetizze não está como ativa. Procure realizar o pagamento do curso para evitar seu banimento dos nossos canais em 2 dias. Caso já tenha realizado o pagamento desse mês, favor ignorar esta mensagem`)
    }
    if (usuarioAtualizado.aviso_banimento === 2) {
        return telegramClient.sendMessage(usuario.id, `A sua assinatura no curso da Monetizze não está como ativa há 1 dia. Procure realizar o pagamento do curso para evitar seu banimento dos nossos canais amanhã. Caso já tenha realizado o pagamento desse mês, favor ignorar esta mensagem`)
    }
}

const banirUsuariosSeStatusNaoForAtivo = async (usuarios, telegramClient) => {
    const acoes = [];
    let usuariosASeremAvisados = [];
    let usuariosASeremBanidos = [];

    usuarios.forEach(usuario => {
        if (usuario.status_assinatura !== 'ativa') {
            if (usuario.aviso_banimento > 2) {
                acoes.push(telegramClient.kickChatMember(process.env.ID_CANAL_RICO_VIDENTE, usuario.id))
                acoes.push(telegramClient.kickChatMember(process.env.ID_CANAL_SINAIS_RICOS, usuario.id))
                usuariosASeremBanidos.push(usuario.nome_completo)
                return
            }
            usuariosASeremAvisados.push(mandarAvisoDeBanimento(usuario, telegramClient))
            return
        } else {
            if (usuario.aviso_banimento > 0) {
                await dao.zerarAvisoDeBanimento(usuario, conexao)
            }
        }
    })
    try {
        await Promise.all(acoes)
        log(`Usuários ${usuariosASeremBanidos} foram banidos`)
        const aprovados = await Promise.all(usuariosASeremAvisados)
        log(`Usuários avisados sobre banimento`)
    } catch (err) {
        throw err
    }
} 

module.exports = { 
    verificarCompraDeUsuarioNaMonetizze,
    atualizarStatusDeAssinaturaDeUsuarios,
    banirUsuariosSeStatusNaoForAtivo
}