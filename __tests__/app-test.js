/* eslint-disable no-undef */
const app = require('../src/app');
const { makeMockContext } = require('../__mocks__/context_mock');

jest.mock('../src/servicos/validacao', () => ({
  confirmado: jest.fn(),
}));
jest.mock('../src/servicos/monetizze', () => ({
  verificarCompraDeUsuarioNaMonetizze: jest.fn(),
}));
jest.mock('../src/dao', () => ({
  adicionarUsuarioAoBancoDeDados: jest.fn(),
  adicionarEmEmailsBloqueados: jest.fn(),
}));

describe('App', () => {
  it('deve extrair sinal de mensagem de canal produção', () => {
    const textoMensagemCanal = `🌘 Rico Baladeiro 🌘

    💱 Par - GBPCAD
    
    💗 Ordem - PUT
    
    ⏳ Horário - 06:50
    
    Expiração: M5
    Se perder fazer no máximo 1 gale`;
    const sinal = app.extrairSinalDeMensagemDeCanal({texto: textoMensagemCanal, id: 234}, -1001460676170)
    expect(sinal.telegramMessageId).toBe(10234)
  })

  it('deve extrair sinal de mensagem de canal teste', () => {
    const textoMensagemCanal = `🌘 Rico Baladeiro 🌘

    💱 Par - GBPCAD
    
    💗 Ordem - PUT
    
    ⏳ Horário - 06:50
    
    Expiração: M5
    Se perder fazer no máximo 1 gale`;
    const sinal = app.extrairSinalDeMensagemDeCanal({texto: textoMensagemCanal, id: 234}, -1001428419509)
    expect(sinal.telegramMessageId).toBe(20234)
  })
});
