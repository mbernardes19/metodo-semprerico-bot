const util = require('util')

const adicionarUsuarioAoBancoDeDados = async (usuario, conexao) => {
    const {idTelegram, nomeCompleto, formaDePagamento, email, telefone, statusAssinatura} = usuario
    const query = util.promisify(conexao.query).bind(conexao)
    await query(`insert into Usuario (id, nome_completo, telefone, email, forma_de_pagamento, status_assinatura) values ('${idTelegram}', '${nomeCompleto}', '${telefone}', '${email}', '${formaDePagamento}', '${statusAssinatura}')`)
}

const limparBancoDeDados = async (conexao) => {
    const query = util.promisify(conexao.query).bind(conexao)
    await query(`truncate table Usuario`)
    await query(`truncate table EmailBloqueado`)
}

const adicionarEmEmailsBloqueados = async (email, conexao) => {
    const query = util.promisify(conexao.query).bind(conexao)
    await query(`insert into EmailBloqueado values ('${email}')`)
}

const pegarTodosUsuariosDoBancoDeDados = async (conexao) => {
    const query = util.promisify(conexao.query).bind(conexao)
    return await query(`select * from Usuario`)
}

const atualizarStatusDeAssinaturaDeUsuarios = async (usuarios, novosStatus, conexao) => {
    const query = util.promisify(conexao.query).bind(conexao)
    const queries = []
    usuarios.forEach((usuario, index) => {
        queries.push(query(`update Usuario set status_assinatura='${novosStatus[index]}' where id=${usuario.id}`))
    })
    await Promise.all(usuarios)
}

module.exports = {
    adicionarUsuarioAoBancoDeDados,
    limparBancoDeDados,
    adicionarEmEmailsBloqueados,
    pegarTodosUsuariosDoBancoDeDados,
    atualizarStatusDeAssinaturaDeUsuarios
}
