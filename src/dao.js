const util = require('util')

const adicionarUsuarioAoBancoDeDados = async (usuario, conexao) => {
    const {idTelegram, nomeCompleto, formaDePagamento, email, telefone, statusAssinatura} = usuario
    const query = util.promisify(conexao.query).bind(conexao)
    try {
        await query(`insert into Usuario (id, nome_completo, telefone, email, forma_de_pagamento, status_assinatura) values ('${idTelegram}', '${nomeCompleto}', '${telefone}', '${email}', '${formaDePagamento}', '${statusAssinatura}')`)
    } catch (err) {
        throw err
    }
}

const limparBancoDeDados = async (conexao) => {
    const query = util.promisify(conexao.query).bind(conexao)
    try {
        await query(`truncate table Usuario`)
        await query(`truncate table EmailBloqueado`)
    }
    catch (err) {
        throw err
    }
}

const adicionarEmEmailsBloqueados = async (email, conexao) => {
    const query = util.promisify(conexao.query).bind(conexao)
    try {
        const emailsBloqueados = await query(`select * from EmailBloqueado`)
        const emailsIguais = emailsBloqueados.filter(emailBloqueado => emailBloqueado.email === email)
        if (emailsIguais.length === 0) {
            await query(`insert into EmailBloqueado values ('${email}')`)
        }
    } catch (err) {
        throw err
    }
}

const pegarTodosEmailsBloqueados = async (conexao) => {
    const query = util.promisify(conexao.query).bind(conexao)
    try {
        return await query(`select * from EmailBloqueado`)
    } catch (err) {
        throw err
    }
}

const pegarTodosUsuariosDoBancoDeDados = async (conexao) => {
    const query = util.promisify(conexao.query).bind(conexao)
    try {
        return await query(`select * from Usuario`)
    } catch (err) {
        throw err
    }
}

const pegarUsuarioPeloId = async (id, conexao) => {
    const query = util.promisify(conexao.query).bind(conexao)
    try {
        const usuario = await query(`select * from Usuario where id=${id}`)
        return usuario[0]
    } catch (err) {
        throw err
    }
}

const atualizarStatusDeAssinaturaDeUsuarios = async (usuarios, novosStatus, conexao) => {
    const query = util.promisify(conexao.query).bind(conexao)
    const queries = []
    usuarios.forEach((usuario, index) => {
        queries.push(query(`update Usuario set status_assinatura='${novosStatus[index]}' where id=${usuario.id}`))
    })
    try {
        await Promise.all(usuarios)
    } catch (err) {
        throw err
    }
}

const aumentarAvisoDeBanimento = async (usuario, conexao) => {
    const query = util.promisify(conexao.query).bind(conexao)
    try {
        if (usuario.aviso_banimento === 0) {
            await query(`update Usuario set aviso_banimento=1 where id=${usuario.id}`)
        }
        if (usuario.aviso_banimento === 1) {
            await query(`update Usuario set aviso_banimento=2 where id=${usuario.id}`)
        }
        if (usuario.aviso_banimento === 2) {
            await query(`update Usuario set aviso_banimento=3 where id=${usuario.id}`)
        }
    } catch (err) {
        throw err
    }
}

const zerarAvisoDeBanimento = async (usuario, conexao) => {
    const query = util.promisify(conexao.query).bind(conexao)
    try {
        await query(`update Usuario set aviso_banimento=0 where id=${usuario.id}`)
    } catch (err) {
        throw err
    }
}

const pegarMensagem = async (tipo, conexao) => {
    const query = util.promisify(conexao.query).bind(conexao)
    try {
        return await query(`select * from Mensagem where id='mensagem-${tipo}'`)
    } catch (err) {
        throw err
    }
}

const atualizarMensagem = async (tipo, mensagem, conexao) => {
    const query = util.promisify(conexao.query).bind(conexao)
    try {
        await query(`update Mensagem set texto='${mensagem}' where id='mensagem-${tipo}'`)
    } catch (err) {
        throw err
    }
}

const pegarSticker = async (tipo, conexao) => {
    const query = util.promisify(conexao.query).bind(conexao)
    try {
        return await query(`select * from Mensagem where id='sticker-${tipo}'`)
    } catch (err) {
        throw err
    }
}
const atualizarSticker = async (tipo, sticker, conexao) => {
    const query = util.promisify(conexao.query).bind(conexao)
    try {
        await query(`update Mensagem set texto='${sticker}' where id='sticker-${tipo}'`)
    } catch (err) {
        throw err
    }
}

const adicionarUsuarioGratuitoAoBancoDeDados = async (usuario, conexao) => {
    const {idTelegram, nomeCompleto, cpf, email, telefone, dataAssinatura, diasDeUso} = usuario
    const query = util.promisify(conexao.query).bind(conexao)
    try {
        await query(
            `insert into UsuarioGratuito (id, nome_completo, cpf, telefone, email, data_de_assinatura, dias_de_uso) values ('${idTelegram}', '${nomeCompleto}', '${cpf}',  '${telefone}', '${email}', '${dataAssinatura}', '${diasDeUso}')`
            )
    } catch (err) {
        throw err
    }
}

const verificarSeJaExisteUsuarioComCpf = async (cpf, conexao) => {
    const query = util.promisify(conexao.query).bind(conexao)
    try {
        return await query(`select * from UsuarioGratuito where cpf='${cpf}'`)
    } catch (err) {
        throw err
    }
    
}

module.exports = {
    adicionarUsuarioAoBancoDeDados,
    adicionarUsuarioGratuitoAoBancoDeDados,
    verificarSeJaExisteUsuarioComCpf,
    limparBancoDeDados,
    adicionarEmEmailsBloqueados,
    pegarTodosEmailsBloqueados,
    pegarTodosUsuariosDoBancoDeDados,
    atualizarStatusDeAssinaturaDeUsuarios,
    aumentarAvisoDeBanimento,
    zerarAvisoDeBanimento,
    pegarUsuarioPeloId,
    atualizarMensagem,
    atualizarSticker,
    pegarMensagem,
    pegarSticker
}
