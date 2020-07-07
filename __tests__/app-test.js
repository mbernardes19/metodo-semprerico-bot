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
jest.mock('../dao', () => ({
    adicionarUsuarioAoBancoDeDados: jest.fn(),
    adicionarEmEmailsBloqueados: jest.fn()
}))

let {adicionarUsuarioAoBancoDeDados, adicionarEmEmailsBloqueados} = require('../dao')
let {verificarUsuarioNaMonetizze, verificarCompraDeUsuarioNaMonetizze} = require('../monetizze')
let {confirmado} = require('../validacao')


describe('App', () => {
    it('se usuário existe no Monetizze e tem compra em status finalizado, deve salvá-lo no banco de dados', async () => {
        const ctx = makeMockContext({ message: {text: 'hehe', chat: { id: 1234 } } });
        confirmado.mockReturnValue(true)
        verificarUsuarioNaMonetizze.mockImplementation(() => Promise.resolve(true));
        verificarCompraDeUsuarioNaMonetizze.mockImplementation(() => Promise.resolve(true));
        const result = await app.confirmarEmail({positivo: "oi", negativo: "tchau", erro: "ai"}, "tchau", ctx)
        expect(adicionarUsuarioAoBancoDeDados).toHaveBeenCalled()
    })

    it('se usuário existe no Monetizze e não tem compra em status finalizado, seu email deve ser salvo em emails bloqueados', async () => {
        const ctx = makeMockContext({ message: {text: 'hehe', chat: { id: 1234 } } });
        confirmado.mockReturnValue(true)
        verificarUsuarioNaMonetizze.mockImplementation(() => Promise.resolve(true));
        verificarCompraDeUsuarioNaMonetizze.mockImplementation(() => Promise.resolve(false));
        const result = await app.confirmarEmail({positivo: "oi", negativo: "tchau", erro: "ai"}, "tchau", ctx)
        expect(adicionarEmEmailsBloqueados).toHaveBeenCalled()
    })

    it('se usuário não existe no Monetizze e não tem compra em status finalizado, seu email deve ser salvo em emails bloqueados', async () => {
        const ctx = makeMockContext({ message: {text: 'hehe', chat: { id: 1234 } } });
        confirmado.mockReturnValue(true)
        verificarUsuarioNaMonetizze.mockImplementation(() => Promise.resolve(false));
        verificarCompraDeUsuarioNaMonetizze.mockImplementation(() => Promise.resolve(false));
        const result = await app.confirmarEmail({positivo: "oi", negativo: "tchau", erro: "ai"}, "tchau", ctx)
        expect(adicionarEmEmailsBloqueados).toHaveBeenCalled()
    })
})