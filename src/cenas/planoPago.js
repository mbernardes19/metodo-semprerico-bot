const Extra = require('telegraf/extra');
const WizardScene = require('telegraf/scenes/wizard');
const { pegarNome, confirmarNome } = require('../passos/planoPago/nomeCompleto');
const { pegarEmail, confirmarEmail } = require('../passos/planoPago/email');
const { pegarTelefone, confirmarTelefone } = require('../passos/planoPago/telefone');
const { pedirFormaDePagamento } = require('../passos/planoPago/formaPagamento');
const { logError } = require('../servicos/logger');
const Teclado = require('../utils/Teclado');

const cenaPlanoPago = new WizardScene(
  'planoPago',
  async (ctx) => darBoasVindas(ctx),
  pedirFormaDePagamento,
  async (ctx) => pegarNome(ctx),
  confirmarNome,
  async (ctx) => pegarTelefone(ctx),
  confirmarTelefone,
  async (ctx) => pegarEmail(ctx),
  confirmarEmail,
);

cenaPlanoPago.command('stop', async (ctx) => ctx.scene.leave());

const darBoasVindas = async (ctx) => {
  try {
    await ctx.reply('Olá, eu sou o Bot do Método Sempre Rico 🤖💵 Estou aqui para te dar acesso aos nossos canais de Telegram para que você possa começar a trilhar seu caminho rumo à riqueza!');
  } catch (err) {
    await ctx.reply('Preciso primeiramente confirmar no servidor da Hotmart se o seu pagamento já foi aprovado.\n\nPor isso, gostaria de saber algumas informações de você...');
    logError('ERRO AO ENVIAR PRIMEIRA MENSAGEM', err);
  }
  ctx.wizard.state.novoUsuario = {};

  if (process.env.PLANO_GRATUITO === 'true') {
    await ctx.reply('Você pagou em cartão de crédito, boleto ou contratou o plano gratuito de 7 dias?', Extra.markup(Teclado.FORMAS_DE_PAGAMENTO_GRATUITO))
  } else {
    await ctx.reply('Você pagou em cartão de crédito ou boleto?', Extra.markup(Teclado.FORMAS_DE_PAGAMENTO));
  }

  return ctx.wizard.next();
};

module.exports = cenaPlanoPago;
