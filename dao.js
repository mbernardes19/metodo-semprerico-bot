const util = require('util')

const adicionarUsuarioAoBancoDeDados = async (usuario, conexao) => {
    const {nomeCompleto, formaDePagamento, email, telefone, statusAssinatura} = usuario
    const query = util.promisify(conexao.query).bind(conexao)
    await query(`insert into usuario (id, nome_completo, telefone, email, forma_de_pagamento, status_assinatura) values (NULL, '${nomeCompleto}', '${telefone}', '${email}', '${formaDePagamento}', '${statusAssinatura}')`)
}

const removerTodosUsuarios = async (conexao) => {
    const query = util.promisify(conexao.query).bind(conexao)
    await query(`truncate table usuario`)
}

module.exports = {adicionarUsuarioAoBancoDeDados, removerTodosUsuarios}