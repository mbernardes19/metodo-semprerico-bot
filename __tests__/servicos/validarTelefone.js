/* eslint-disable no-undef */
const twilio = require('../../src/utils/twilioConfig');
const { enviarSmsDeValidacao, enviarWhatsappValidacao } = require('../../src/servicos/validarTelefone');
const { enviarSms } = require('../../src/servicos/request');
const { gerarNumeroValidacaoSms } = require('../../src/utils/codigoVerificacao');
const { logError } = require('../../src/servicos/logger');

jest.mock('../../src/servicos/request');
jest.mock('../../src/utils/codigoVerificacao');
jest.mock('../../src/servicos/logger');

describe('Serviço Validar Telefone', () => {
  it('deve enviar SMS com número de validação', () => {
    gerarNumeroValidacaoSms.mockImplementation(() => '98756');
    const ctx = { wizard: { state: { numeroValidacao: '' } } };
    enviarSmsDeValidacao(ctx, '21997532998');
    expect(enviarSms).toHaveBeenCalledWith('21997532998', 'Número de verificação: 98756');
  });

  it('deve logar erro ao dar erro no envio do SMS', () => {
    enviarSms.mockImplementation(() => {
      throw new Error();
    });
    gerarNumeroValidacaoSms.mockImplementation(() => '98756');
    const ctx = { wizard: { state: { numeroValidacao: '' } } };
    enviarSmsDeValidacao(ctx, '21997532998');
    expect(logError).toHaveBeenCalled();
  });

  it('deve enviar mensagem no Whatsapp do número passado', () => {
    gerarNumeroValidacaoSms.mockImplementation(() => '98756');
    const spy = jest.spyOn(twilio.messages, 'create').mockResolvedValue({});
    const ctx = { wizard: { state: { numeroValidacao: '' } } };
    enviarWhatsappValidacao(ctx, '21997532998');
    expect(spy).toHaveBeenCalledWith({
      from: 'whatsapp:+14155238886',
      to: `whatsapp:+5521997532998`,
      body: `Número de verificação: 98756`,
    });
  });
});
