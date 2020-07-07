const app = require('../app')
const Context = require('telegraf/context')
const {makeMockContext} = require('../__mocks__/context_mock')
const Scene = require('telegraf/scenes/base')

jest.mock('../validacao', () => ({
    confirmado: jest.fn(),
}))
jest.mock('../monetizze', () => ({
    verificarCompraDeUsuarioNaMonetizze: jest.fn(),
    usuarioExisteNaMonetizze: jest.fn(),
    compraDeUsuarioConfirmadaNaMonetizze: jest.fn(),
    verificarUsuarioNaMonetizze: jest.fn()
}))

let {verificarUsuarioNaMonetizze, verificarCompraDeUsuarioNaMonetizze, compraDeUsuarioConfirmadaNaMonetizze, usuarioExisteNaMonetizze} = require('../monetizze')
let {confirmado} = require('../validacao')


describe('App', () => {
    beforeEach(() => jest.resetModules());

    it('usuário existe no Monetizze e tem compra em status finalizado deve ser bem sucedido', async () => {
        const ctx = makeMockContext({ message: {text: 'hehe', chat: { id: 1234 } } });
        confirmado.mockReturnValue(true)
        verificarUsuarioNaMonetizze.mockImplementation(() => Promise.resolve(true));
        verificarCompraDeUsuarioNaMonetizze.mockImplementation(() => Promise.resolve(true));
        const result = await app.confirmarEmail({positivo: "oi", negativo: "tchau", erro: "ai"}, "tchau", ctx)
        expect(result).toBe(true)
    })

    it('usuário existe no Monetizze e não tem compra em status finalizado deve ser malsucedido', async () => {
        const ctx = makeMockContext({ message: {text: 'hehe', chat: { id: 1234 } } });
        confirmado.mockReturnValue(true)
        verificarUsuarioNaMonetizze.mockImplementation(() => Promise.resolve(true));
        verificarCompraDeUsuarioNaMonetizze.mockImplementation(() => Promise.resolve(false));
        const result = await app.confirmarEmail({positivo: "oi", negativo: "tchau", erro: "ai"}, "tchau", ctx)
        expect(result).toBe(false)
    })

    it('usuário não existe no Monetizze e não tem compra em status finalizado deve ser malsucedido', async () => {
        const ctx = makeMockContext({ message: {text: 'hehe', chat: { id: 1234 } } });
        confirmado.mockReturnValue(true)
        verificarUsuarioNaMonetizze.mockImplementation(() => Promise.resolve(false));
        verificarCompraDeUsuarioNaMonetizze.mockImplementation(() => Promise.resolve(false));
        const result = await app.confirmarEmail({positivo: "oi", negativo: "tchau", erro: "ai"}, "tchau", ctx)
        expect(result).toBe(false)
    })
})