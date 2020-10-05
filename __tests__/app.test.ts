/* eslint-disable no-undef */
const app = require('../src/app');
const { makeMockContext } = require('../__mocks__/context_mock');
const axios = require('axios');

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

jest.mock('axios', () => ({
  default: {
    post: jest.fn()
  }
}))

describe('App', () => {
  it('deve extrair sinal de mensagem de canal', () => {
    const textoMensagemCanal = `🌘 Rico Baladeiro 🌘

    💱 Par - GBPCAD
    
    💗 Ordem - PUT
    
    ⏳ Horário - 06:50
    
    Expiração: M5
    Se perder fazer no máximo 1 gale`;
    const sinal = app.extrairSinalDeMensagemDeCanal({texto: textoMensagemCanal, id: 234})
    expect(sinal.telegramMessageId).toBe(234)
  })

  it('deve lançar erro ao receber sinal fora de padrão', () => {
    const textoMensagemCanal = `🌘 Rico Baladeiro 🌘

    💱 Par - GBPCAD
    
    💗 Ordem : PUT
    
    ⏳ Horário - 06:50
    
    Expiração: M5
    Se perder fazer no máximo 1 gale`;
    app.extrairSinalDeMensagemDeCanal({texto: textoMensagemCanal, id: 234})
    expect(app.extrairSinalDeMensagemDeCanal).toThrow()
  })

  it('deve enviar sinal para servidor de trading', async () => {
    process.env.SERVIDOR_TRADING = 'http://localhost:8080'

    const sinal = {
      action: 'PUT',
      asset: 'EURUSD',
      time: '10:15',
      expiration: 5,
      telegramMessageId: 123
    }

    await app.enviarSinalParaCompra(sinal);
    expect(axios.default.post).toHaveBeenCalledWith(`http://localhost:8080/check-signal`, sinal)
  })
});
