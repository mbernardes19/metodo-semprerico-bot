const monetizze = require('../src/monetizze')

const {makeMockContext} = require('../__mocks__/context_mock')
const regex = require('../src/regex')
const { usuariosDoBD } = require('../__mocks__/usuario_mock')
const { response } = require('../__mocks__/monetizze_response_mock')
const { conexao } = require('../src/db')

jest.mock('../src/request', () => ({
    pegarTransacaoNaMonetizze: jest.fn()
}))

jest.mock('../src/dao', () => ({
    atualizarStatusDeAssinaturaDeUsuarios: jest.fn()
}))

jest.mock('telegraf/telegram')

const dao = require('../src/dao')
const { pegarTransacaoNaMonetizze } = require('../src/request')
const Telegram = require('telegraf/telegram')




describe('Monetizze', () => {
    it('deve confirmar compra de usuário quando parâmetros recebidos da API Monetizze forem válidos', async () => {
        const ctx = makeMockContext({ message: {text: 'hehe', chat: { id: 1234 } } });
        pegarTransacaoNaMonetizze.mockImplementation(() => Promise.resolve(response.comDadosValidos))
        const res = await monetizze.verificarCompraDeUsuarioNaMonetizze(ctx)
        expect(res).toBe(true)
        expect(pegarTransacaoNaMonetizze).toHaveBeenCalledWith({product: undefined, email:'asdasda', "forma_pagamento[]": 3, "status[]": 2, "status[]": 6})
    })

    it('deve negar compra de usuário quando parâmetros recebidos da API Monetizze forem inválidos', async () => {
        const ctx = makeMockContext({ message: {text: 'hehe', chat: { id: 1234 } } });
        pegarTransacaoNaMonetizze.mockImplementation(() => Promise.resolve(response.comDadosInvalidos))
        const res = await monetizze.verificarCompraDeUsuarioNaMonetizze(ctx)
        expect(res).toBe(false)
        expect(pegarTransacaoNaMonetizze).toHaveBeenCalledWith({product: undefined, email:'asdasda', "forma_pagamento[]": 3, "status[]": 2, "status[]": 6})
    })

    it('deve atualizar a assinatura de usuários', async () => {
        pegarTransacaoNaMonetizze.mockImplementationOnce(() => Promise.resolve(response.comStatusDeAssinaturaInvalido))
        pegarTransacaoNaMonetizze.mockImplementationOnce(() => Promise.resolve(response.comDadosValidos))
        await monetizze.atualizarStatusDeAssinaturaDeUsuarios(usuariosDoBD)
        expect(dao.atualizarStatusDeAssinaturaDeUsuarios).toHaveBeenCalledWith(usuariosDoBD, ['aguardando_pagamento', 'ativa'], conexao)
    })

    it('deve banir um usuário se o status de pagamento recebido não for ativo', async () => {
        const BOT_TOKEN = '1122807041:AAHPKarqVMnCoQqH7N1QLFaSPu3F4V407dI'
        const telegramClient = new Telegram(BOT_TOKEN)
        await monetizze.banirUsuariosSeStatusNaoForAtivo(usuariosDoBD, telegramClient)
        expect(telegramClient.kickChatMember).toHaveBeenCalled()
    })
})