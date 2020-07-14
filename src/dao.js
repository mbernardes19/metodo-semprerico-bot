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

const pegarTodosUsuariosDoBancoDeDados = async (conexao) => {
    const query = util.promisify(conexao.query).bind(conexao)
    try {
        return await query(`select * from Usuario`)
    } catch (err) {
        throw err;
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
        throw err;
    }
}

module.exports = {
    adicionarUsuarioAoBancoDeDados,
    limparBancoDeDados,
    adicionarEmEmailsBloqueados,
    pegarTodosUsuariosDoBancoDeDados,
    atualizarStatusDeAssinaturaDeUsuarios
}
