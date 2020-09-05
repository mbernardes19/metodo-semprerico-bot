const { usuarios } = require('../__mocks__/usuario_mock')
const { emails } = require('../__mocks__/email_mock')
const dao = require('../src/dao')
const util = require('util')
const mysql = require('mysql')
const conexao = mysql.createConnection({host:'localhost', port:3306, user:'root', password:'Matheus20031997*', database:'sempre_rico'})
const query = util.promisify(conexao.query).bind(conexao)
const { Telegram } = require('telegraf')

jest.mock('telegraf')

describe('DAO', () => {
    afterEach(async () => await dao.limparBancoDeDados(conexao));

    it('deve salvar um usuário', async () => {
        await dao.adicionarUsuarioAoBancoDeDados(usuarios[0], conexao)
        const rows = await query("select * from Usuario where nome_completo='Matheus'")
        expect(rows[0]).toEqual
        ({
            id: 123,
            aviso_banimento: 0,
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

    it('deve banir usuários gratuitos com dias de uso vencidos', async () => {
        let telegram = new Telegram('1268417828:AAHB_P7nh3I9y_dioePE_f7W6lWGTrvH_RA')
        const spyKickChatMember = jest.spyOn(telegram, 'kickChatMember')
        const usuarios = [{id: 123, dias_de_uso: 0}, {id: 456, dias_de_uso: 1}]
        await dao.banirUsuariosGratuitosDiasVencidos(usuarios, telegram)
        expect(spyKickChatMember).toHaveBeenCalledWith(process.env.ID_CANAL_RICO_VIDENTE, 123)
        expect(spyKickChatMember).toHaveBeenCalledWith(process.env.ID_CANAL_SINAIS_RICOS, 123)
        expect(spyKickChatMember).toHaveBeenCalledTimes(2)
    })

    it('deve remover bloqueio de usuários gratuitos depois de baní-los', async () => {
        let telegram = new Telegram('1268417828:AAHB_P7nh3I9y_dioePE_f7W6lWGTrvH_RA')
        const spyUnbanChatMember = jest.spyOn(telegram, 'unbanChatMember')
        const usuarios = [{id: 123, dias_de_uso: 0}, {id: 456, dias_de_uso: 1}]
        await dao.banirUsuariosGratuitosDiasVencidos(usuarios, telegram)
        expect(spyUnbanChatMember).toHaveBeenCalledWith(process.env.ID_CANAL_RICO_VIDENTE, 123)
        expect(spyUnbanChatMember).toHaveBeenCalledWith(process.env.ID_CANAL_SINAIS_RICOS, 123)
        expect(spyUnbanChatMember).toHaveBeenCalledTimes(2)
    })
})