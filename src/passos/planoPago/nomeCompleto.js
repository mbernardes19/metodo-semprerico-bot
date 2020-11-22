const Composer = require('telegraf/composer');
const Markup = require('telegraf/markup');
const Extra = require('telegraf/extra');
const { log } = require('../../servicos/logger');
const { confirmado, negado } = require('../../servicos/validacao');

const pegarNome = async (ctx) => {
  let mensagem;
  let textoMensagem;
  if (!ctx.message) {
    textoMensagem = ctx.update.message.text;
    mensagem = ctx.update.message;
    await ctx.answerCbQuery();
  } else {
    textoMensagem = ctx.message.text;
    mensagem = ctx.message;
  }
  try {
    const confirmacao = Markup.inlineKeyboard([Markup.callbackButton('👍 Sim', 'sim'), Markup.callbackButton('👎 Não', 'nao')]);
    await ctx.reply(`Confirmando, seu nome completo é ${textoMensagem}, certo?`, Extra.inReplyTo(mensagem.message_id).markup(confirmacao));
    ctx.wizard.state.novoUsuario.nomeCompleto = textoMensagem;
    log('Nome completo definido');
    log(ctx.wizard.state.novoUsuario);
    return ctx.wizard.next();
  } catch (err) {
    log(err);
    await ctx.reply('Perdão! Ocorreu um erro inesperado agora. Por favor, inicie uma conversa comigo novamente com o comando /start');
    ctx.scene.leave();
  }
};

const confirmarNome = new Composer();
confirmarNome.action('sim', async (ctx) => {
  try {
    await ctx.answerCbQuery();
    await ctx.reply('Qual é o seu telefone com DDD?');
    return ctx.wizard.next();
  } catch (err) {
    log(err);
  }
});
confirmarNome.action('nao', async (ctx) => {
  try {
    await ctx.answerCbQuery();
    await ctx.reply('Por favor, insira seu nome completo novamente');
    return ctx.wizard.back();
  } catch (err) {
    log(err);
  }
});
confirmarNome.use(async (ctx) => {
  log('Sim/Não');
  if (confirmado(ctx)) {
    try {
      await ctx.reply('Qual é o seu telefone com DDD?');
      return ctx.wizard.next();
    } catch (err) {
      log(err);
    }
  }
  if (negado(ctx)) {
    try {
      await ctx.reply('Por favor, insira seu nome completo novamente');
      return ctx.wizard.back();
    } catch (err) {
      log(err);
    }
  }
  await ctx.reply('Por favor, escolha uma das opções.');
});

module.exports = { pegarNome, confirmarNome };
