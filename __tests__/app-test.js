const app = require('../src/app')
const {makeMockContext} = require('../__mocks__/context_mock')

jest.mock('../src/validacao', () => ({
    confirmado: jest.fn(),
}))
jest.mock('../src/monetizze', () => ({
    verificarCompraDeUsuarioNaMonetizze: jest.fn(),
}))
jest.mock('../src/dao', () => ({
    adicionarUsuarioAoBancoDeDados: jest.fn(),
    adicionarEmEmailsBloqueados: jest.fn()
}))

let {adicionarUsuarioAoBancoDeDados, adicionarEmEmailsBloqueados} = require('../src/dao')
let {verificarCompraDeUsuarioNaMonetizze} = require('../src/monetizze')
let {confirmado} = require('../src/validacao')


describe('App', () => {
    it('se usuário existe no Monetizze e tem compra em status finalizado, deve salvá-lo no banco de dados', async () => {
        const ctx = makeMockContext({ message: {text: 'hehe', chat: { id: 1234 } } });
        confirmado.mockReturnValue(true)
        verificarCompraDeUsuarioNaMonetizze.mockImplementation(() => Promise.resolve(true));
        await app.confirmarEmail({positivo: "oi", negativo: "tchau", erro: "ai"}, "tchau", ctx)
        expect(adicionarUsuarioAoBancoDeDados).toHaveBeenCalled()
    })

    it('se usuário existe no Monetizze e não tem compra em status finalizado, seu email deve ser salvo em emails bloqueados', async () => {
        const ctx = makeMockContext({ message: {text: 'hehe', chat: { id: 1234 } } });
        confirmado.mockReturnValue(true)
        verificarCompraDeUsuarioNaMonetizze.mockImplementation(() => Promise.resolve(false));
        await app.confirmarEmail({positivo: "oi", negativo: "tchau", erro: "ai"}, "tchau", ctx)
        expect(adicionarEmEmailsBloqueados).toHaveBeenCalled()
    })

    it('se usuário não existe no Monetizze e não tem compra em status finalizado, seu email deve ser salvo em emails bloqueados', async () => {
        const ctx = makeMockContext({ message: {text: 'hehe', chat: { id: 1234 } } });
        confirmado.mockReturnValue(true)
        verificarCompraDeUsuarioNaMonetizze.mockImplementation(() => Promise.resolve(false));
        await app.confirmacaoPositiva(ctx)
        expect(adicionarEmEmailsBloqueados).toHaveBeenCalled()
    })
})