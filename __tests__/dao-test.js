const { usuarios } = require('../__mocks__/usuario_mock')
const { emails } = require('../__mocks__/email_mock')
const dao = require('../src/dao')
const util = require('util')
const mysql = require('mysql')
const conexao = mysql.createConnection({host:'localhost', port:3306, user:'root', password:'Matheus20031997*', database:'metodo_sempre_rico_bot'})
const query = util.promisify(conexao.query).bind(conexao)

describe('DAO', () => {
    afterEach(async () => await dao.limparBancoDeDados(conexao));

    it('deve salvar um usuário', async () => {
        await dao.adicionarUsuarioAoBancoDeDados(usuarios[0], conexao)
        const rows = await query("select * from Usuario where nome_completo='Matheus'")
        expect(rows[0]).toEqual
        ({
            id: 123,
            nome_completo: 'Matheus',
            telefone: '21997532998',
            email: 'bernardes.matheus@outlook.com',
            forma_de_pagamento: 'cartao_de_credito',
            status_assinatura: 'aguardando_pagamento'
        })
    })

    it('deve adicionar um email à tabela de emails bloqueados', async () => {
        await dao.adicionarEmEmailsBloqueados(emails[0], conexao)
        const rows = await query("select * from EmailBloqueado where email='laskdmlaks@asda.com'")
        expect(rows[0]).toEqual({email: 'laskdmlaks@asda.com'})
    })
})