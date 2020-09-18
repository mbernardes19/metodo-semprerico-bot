const twilio = require('../utils/twilioConfig');
const { enviarSms } = require('./request');
const { logError } = require('./logger');
const { gerarNumeroValidacaoSms } = require('../utils/codigoVerificacao');

const enviarSmsDeValidacao = async (ctx, telefone) => {
  const numeroValidacao = gerarNumeroValidacaoSms();
  ctx.wizard.state.numeroValidacao = numeroValidacao;
  const mensagem = `Número de verificação: ${numeroValidacao}`;
  try {
    await enviarSms(telefone, mensagem);
  } catch (err) {
    logError(`ERRO AO ENVIAR SMS DE VALIDAÇÃO ${JSON.stringify(err)}`);
    throw err;
  }
};

const enviarWhatsappValidacao = async (ctx, telefone) => {
  const numeroValidacao = gerarNumeroValidacaoSms();
  ctx.wizard.state.numeroValidacao = numeroValidacao;
  const mensagem = `Número de verificação: ${numeroValidacao}`;
  try {
    await twilio.messages.create({
      from: 'whatsapp:+14155238886',
      to: `whatsapp:+55${telefone}`,
      body: `${mensagem}`,
    });
  } catch (err) {
    logError(`ERRO AO ENVIAR WHATSAPP DE VALIDAÇÃO ${JSON.stringify(err)}`);
    throw err;
  }
};

module.exports = { gerarNumeroValidacaoSms, enviarSmsDeValidacao, enviarWhatsappValidacao };
