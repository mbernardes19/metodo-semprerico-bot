import { TelegrafContext } from "telegraf/typings/context";

require('sexy-require');

const path = require('path');
const app = require('express')();
if (process.env.NODE_ENV === 'production') {
  require('dotenv').config({ path: path.join(__dirname, '..', '.env') });
} else {
  require('dotenv').config({ path: path.join(__dirname, '..', '.env.test') });
}
const Extra = require('telegraf/extra');
const Markup = require('telegraf/markup');
const axios = require('axios').default;
const differenceInMilliseconds = require('date-fns/differenceInMilliseconds');
const { parseISO } = require('date-fns');
const db = require('./db');
const dao = require('./dao');
const cronjobs = require('./servicos/cronjobs');
const { log } = require('./servicos/logger');
const { enviarEmailDeRelatorioDeErro } = require('./email');
const { SIGNAL_WITH_GALE } = require('./utils/regex');
const { comecarValidacaoDeLinks, pegarLinkDeChat } = require('./servicos/chatLink');
const MessageMapper = require('./mappers/MessageMapper').default;
const TelegramBot = require('./model/TelegramBot').default;
const Server = require('./model/ExpressServer').default;

console.log('TRADING', process.env.SERVIDOR_TRADING)

const { conexaoDb } = db;
conexaoDb.connect((err) => {
  if (err) return log(err);
});

const bot = new TelegramBot();
const server = new Server();
server.init();

const extrairSinalDeMensagemDeCanal = (mensagemCanal) => {
  try {
    const mensagem = mensagemCanal.texto.match(SIGNAL_WITH_GALE);
    console.log('MENSAGEM PARSEADA', mensagem);
    const asset = mensagem[0];
    const action = mensagem[1];
    const time = mensagem[2];
    const expiration = 5;
    const telegramMessageId = mensagemCanal.id
    return {
      asset, action, time, expiration, telegramMessageId
    };
  } catch (err) {
    throw new Error(`Mensagem não tem padrão de sinal: ${mensagemCanal.texto}`);
  }
};

const enviarSinalParaCompra = async (sinal) => {
  try {
    return await axios.post(`${process.env.SERVIDOR_TRADING}/check-signal`, sinal);
  } catch (err) {
    log('Moeda indisponível na binária e na digital');
    log(err);
  }
};

bot.getBot().command('canais', async (ctx) => {
  const usuarioExiste = await dao.usuarioExiste(ctx.chat.id, conexaoDb);
  if (usuarioExiste) {
    const usuarioValido = await dao.usuarioExisteEValido(ctx.chat.id, conexaoDb);
    if (usuarioValido) {
      let linkCanal1;
      let linkCanal2;
      if (process.env.NODE_ENV === 'production') {
        linkCanal1 = pegarLinkDeChat(process.env.ID_CANAL_SINAIS_RICOS);
        linkCanal2 = pegarLinkDeChat(process.env.ID_CANAL_RICO_VIDENTE);
      } else {
        linkCanal1 = pegarLinkDeChat(process.env.ID_CANAL_TESTE);
        linkCanal2 = pegarLinkDeChat(process.env.ID_CANAL_TESTE);
      }
      console.log('LINK CANAL', linkCanal1);
      console.log('LINK CANAL', linkCanal2);
      const teclado = Markup.inlineKeyboard([
        Markup.urlButton('Canal Sinais Ricos', linkCanal1),
        Markup.urlButton('Canal Rico Vidente', linkCanal2),
      ]);
      try {
        await ctx.reply('É pra já!', Extra.markup(teclado));
      } catch (err) {
        if (err.response && err.response.error_code === 403) {
          return;
        }
        await ctx.reply('Ocorreu um erro ao gerar os links dos canais para você. Tente digitar o comando /canais novamente, por favor.');
      }
    } else {
      await ctx.reply('Sua assinatura Monetizze não está ativa. Ative-a novamente para ter acesso aos canais exclusivos do Método Sempre Rico!');
    }
  } else {
    await ctx.reply('Você ainda não ativou sua assinatura Monettize comigo. Digite o comando /start para começar!');
  }
});

bot.getBot().command('start', async (ctx) => {
  try {
    await bot.getTelegramClient().sendMessage(ctx.chat.id, '🦁');
    ctx.scene.enter('planoPago');
  } catch (err) {
    await enviarEmailDeRelatorioDeErro(err, ctx.chat.id);
    if (err.response && err.response.error_code === 403) {
      log(`Usuário bloqueado ${ctx.chat.id}`);
    }
    log(err);
  }
});

bot.getBot().on('channel_post', async (ctx: TelegrafContext) => {
  if (ctx.channelPost.chat.id === parseInt(process.env.ID_CANAL_RICO_VIDENTE, 10)) {
    log('CANAL RICO VIDENTE');
  }
  if (ctx.channelPost.chat.id === parseInt(process.env.ID_CANAL_SINAIS_RICOS, 10)) {
    log('CANAL SINAIS RICOS');
  }
  log(`CTX MESSAGE, ${ctx.channelPost.text}`);
  log(ctx.channelPost.chat.id, process.env.CANAL_SINAIS)
  if (ctx.channelPost.chat.id == parseInt(process.env.CANAL_SINAIS, 10) && ctx.channelPost.text && (ctx.channelPost.text.includes('Par - ') || ctx.channelPost.text.includes('Sinal Flash'))) {
    try {
      const sinal = MessageMapper.toSignal({texto: ctx.channelPost.text, id: ctx.channelPost.message_id});
      const horaSinal = parseInt(sinal.time.substring(0, 2));
      const minutoSinal = parseInt(sinal.time.substring(3, 5));
      process.env.TZ = 'America/Sao_Paulo';
      const agora = new Date();
      const agoraStr = new Date().toISOString();
      console.log(horaSinal);
      console.log(minutoSinal);
      const sinalAgora = new Date(agora.getFullYear(), agora.getMonth(), agora.getDate(), horaSinal, minutoSinal, 0);
      const sinalAgoraStr = sinalAgora.toISOString();

      console.log('AGORA', agoraStr);
      console.log('SINALAGORA', sinalAgoraStr);
      const diff = Math.abs(differenceInMilliseconds(parseISO(agoraStr), parseISO(sinalAgoraStr)));

      console.log('DIFF', diff);

      let response;

      setTimeout(async () => {
        response = await enviarSinalParaCompra(sinal);
        if (response.status === 400) {
          log('Par indisponível no momento');
          return;
        }
        log(`Sinal enviado!`);
      }, diff);
    } catch (err) {
      await enviarEmailDeRelatorioDeErro(ctx.channelPost.text, ctx.chat.id);
      log(err);
    }
  }
});

bot.getBot().on('message', async (ctx) => {
  try {
      await ctx.reply('Olá, sou o Bot do Método Sempre Rico 🤖💵! Segue abaixo meus comandos:\n\n/start - Começar nossa conversa\n/stop - Parar nossa conversa\n');
  } catch (err) {

  }
});
bot.getBot().launch();
cronjobs.start();
comecarValidacaoDeLinks();


module.exports = { app, extrairSinalDeMensagemDeCanal, enviarSinalParaCompra }
