const {pegarTransacaoNaMonetizze} = require('./request')
const regex = require('../utils/regex')
const dao = require('../dao')
const { conexao } = require('../db')
const { log } = require('./logger')

const verificarCompraDeUsuarioNaMonetizze = async (ctx) => {
    const { email, formaDePagamento } = await ctx.wizard.state.novoUsuario
    const pagamento = regex.CARTAO.test(formaDePagamento) ? 1 : 3
    try {
        const response = await pegarTransacaoNaMonetizze({
            product: process.env.ID_PRODUTO, email, "status[]": 2
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
    const { email, status_assinatura } = usuario
    try {
        const response = await pegarTransacaoNaMonetizze({
            product: process.env.ID_PRODUTO, email
        })
        if (response.recordCount > 0) {
            return response.dados[0].assinatura.status.toLowerCase().replace(/ /g, "_")
        }
        return status_assinatura
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
    const usuariosASeremBanidos = []
    const usuariosASeremAvisados = []
    const usuariosATeremAvisosZerados = []
    const dadosUsuariosASeremBanidos = []
    const dadosUsuariosAvisados = []
    const dadosUsuariosComAvisosZerados = []

    usuarios.forEach(usuario => {
        if (usuario.status_assinatura !== 'ativa') {
            if (usuario.aviso_banimento > 2) {
                if (process.env.NODE_ENV === 'development') {
                    usuariosASeremBanidos.push(telegramClient.kickChatMember(process.env.ID_CANAL_TESTE, usuario.id))
                    usuariosASeremBanidos.push(telegramClient.kickChatMember(process.env.ID_CANAL_TESTE, usuario.id))
                } else {
                    usuariosASeremBanidos.push(telegramClient.kickChatMember(process.env.ID_CANAL_RICO_VIDENTE, usuario.id))
                    usuariosASeremBanidos.push(telegramClient.kickChatMember(process.env.ID_CANAL_SINAIS_RICOS, usuario.id))
                }
                dadosUsuariosASeremBanidos.push({id: usuario.id, nomeCompleto: usuario.nome_completo, email: usuario.email})
                return
            }
            usuariosASeremAvisados.push(mandarAvisoDeBanimento(usuario, telegramClient))
            dadosUsuariosAvisados.push({id: usuario.id, nomeCompleto: usuario.nome_completo, email: usuario.email})
            return
        } else {
            if (usuario.aviso_banimento > 0) {
                usuariosATeremAvisosZerados.push(dao.zerarAvisoDeBanimento(usuario, conexao))
                dadosUsuariosComAvisosZerados.push({id: usuario.id, nomeCompleto: usuario.nome_completo, email: usuario.email})
            }
        }
    })

    try {
        await Promise.all(usuariosASeremBanidos)
        log(`Usuários ${dadosUsuariosASeremBanidos} foram banidos`)
        await Promise.all(usuariosASeremAvisados)
        log(`Usuários ${dadosUsuariosAvisados} avisados sobre banimento`)
        await Promise.all(usuariosATeremAvisosZerados)
        log(`Usuários ${dadosUsuariosComAvisosZerados} tiveram aviso de banimento zerado`)
    } catch (err) {
        throw err
    }
} 

module.exports = { 
    verificarCompraDeUsuarioNaMonetizze,
    atualizarStatusDeAssinaturaDeUsuarios,
    banirUsuariosSeStatusNaoForAtivo
}