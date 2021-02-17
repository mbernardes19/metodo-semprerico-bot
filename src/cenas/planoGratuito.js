const WizardScene = require('telegraf/scenes/wizard');
const { pegarNome, confirmarNome } = require('../passos/planoGratuito/nomeCompleto');
const { pegarEmail, confirmarEmail } = require('../passos/planoGratuito/email');
const { pegarTelefone, confirmarTelefone } = require('../passos/planoGratuito/telefone');
const { validarTelefone } = require('../passos/planoGratuito/validarTelefone');
const {endConversation, Reason} = require('../utils/telegraf');

const cenaPlanoGratuito = new WizardScene(
  'planoGratuito',
  async (ctx) => darBoasVindas(ctx),
  async (ctx) => pegarNome(ctx),
  confirmarNome,
  async (ctx) => pegarEmail(ctx),
  confirmarEmail,
  async (ctx) => pegarTelefone(ctx),
  confirmarTelefone,
  validarTelefone
);

const darBoasVindas = async (ctx) => {
  try {
    await ctx.reply('Olá, eu sou o Bot do Método Sempre Rico 🤖💵 Estou aqui para te dar acesso aos nossos canais de Telegram para que você possa começar a trilhar seu caminho rumo à riqueza!');
  } catch (err) {
    await ctx.reply('Preciso primeiramente confirmar no servidor da Hotmart se o seu pagamento já foi aprovado.\n\nPor isso, gostaria de saber algumas informações de você...');
  }
  ctx.wizard.state.novoUsuario = {};

  if (!ctx.message) {
      await ctx.answerCbQuery();
  }
  ctx.wizard.state.novoUsuario.formaDePagamento = 'plano_gratuito';
  await ctx.reply('Vou precisar de alguns dados para liberar seu período gratuito de 7 dias nos nossos canais VIPs do Método Sempre Rico!')
  await ctx.reply('Qual é o seu nome completo?');
  return ctx.wizard.next();
};

cenaPlanoGratuito.command('stop', async (ctx) => await endConversation({ctx, isFinished: false, reason: Reason.USER_INTENT}));

module.exports = cenaPlanoGratuito;
