const { usuarios } = require('../__mocks__/usuario_mock')
const dao = require('../dao')
const util = require('util')
const mysql = require('mysql')
const conexao = mysql.createConnection({host:'localhost', port:3306, user:'root', password:'Matheus20031997*', database:'metodo_sempre_rico_bot'})
const query = util.promisify(conexao.query).bind(conexao)

describe('DAO', () => {
    afterEach(async () => await dao.removerTodosUsuarios(conexao));

    it('deve salvar um usuário', async () => {
        await dao.adicionarUsuarioAoBancoDeDados(usuarios[0], conexao)
        const rows = await query("select * from usuario where nome_completo='Matheus'")
        expect(rows[0]).toEqual
        ({
            id: 1,
            nome_completo: 'Matheus',
            telefone: '21997532998',
            email: 'bernardes.matheus@outlook.com',
            forma_de_pagamento: 'cartao_de_credito',
            status_assinatura: 'aguardando_pagamento'
        })
    })
})