require('sexy-require');

const path = require('path');
const app = require('express')();
const { Telegraf } = require('telegraf');
require('dotenv').config({ path: path.join(__dirname, '../', '.env') });
const session = require('telegraf/session');
const Stage = require('telegraf/stage');
const Extra = require('telegraf/extra');
const Markup = require('telegraf/markup');
const axios = require('axios').default;
const bodyParser = require('body-parser');
const cors = require('cors');
const differenceInMilliseconds = require('date-fns/differenceInMilliseconds');
const { parseISO } = require('date-fns');
const db = require('./db');
const dao = require('./dao');
const cronjobs = require('./servicos/cronjobs');
const { log } = require('./servicos/logger');
const { cache } = require('./servicos/cache');
const { enviarEmailDeRelatorioDeErro } = require('./email');
const { SINAL } = require('./utils/regex');
const { comecarValidacaoDeLinks, pegarLinkDeChat } = require('./servicos/chatLink');

const cenaPlanoPago = require('./cenas/planoPago');

const { conexaoDb } = db;
conexaoDb.connect((err) => {
  if (err) return log(err);
});

const tokenBot = process.env.NODE_ENV === 'production' ? process.env.BOT_TOKEN : process.env.BOT_TOKEN_TESTE;
const bot = new Telegraf(tokenBot);
cache.set('bot', bot.telegram);

const extrairSinalDeMensagemDeCanal = (ctx) => {
  try {
    const mensagem = ctx.channelPost.text.match(SINAL);
    console.log('MENSAGEM PARSEADA', mensagem);
    const asset = mensagem[0];
    const action = mensagem[1];
    const time = mensagem[2];
    const expiration = 5;
    const telegramMessageId = ctx.channelPost.message_id;
    return {
      asset, action, time, expiration, telegramMessageId
    };
  } catch (err) {
    throw new Error(`Mensagem não tem padrão de sinal: ${ctx.channelPost.text}`);
  }
};

let SERVIDOR_TRADING = process.env.NODE_ENV === 'production'
  ? process.env.SERVIDOR_TRADING : process.env.SERVIDOR_TRADING_TEST;

const enviarSinalParaCompra = async (sinal, ctx) => {
  SERVIDOR_TRADING = ctx.channelPost.chat.id == process.env.ID_CANAL_TESTE ? process.env.SERVIDOR_TRADING_TEST : process.env.SERVIDOR_TRADING;
  try {
    return await axios.post(`${SERVIDOR_TRADING}/check-signal`, sinal);
  } catch (err) {
    log('Moeda indisponível na binária e na digital');
    log(err);
  }
};

const stage = new Stage([cenaPlanoPago], { ttl: 1500 });

bot.use(session());
bot.use(stage.middleware());

bot.command('canais', async (ctx) => {
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

bot.command('start', async (ctx) => {
  try {
    await bot.telegram.sendMessage(ctx.chat.id, '🦁');
    ctx.scene.enter('planoPago');
  } catch (err) {
    await enviarEmailDeRelatorioDeErro(err, ctx.chat.id);
    if (err.response && err.response.error_code === 403) {
      log(`Usuário bloqueado ${ctx.chat.id}`);
    }
    log(err);
  }
});

bot.on('channel_post', async (ctx) => {
  log(ctx.channelPost.chat.id);
  if (ctx.channelPost.chat.id == process.env.ID_CANAL_RICO_VIDENTE) {
    log('CANAL RICO VIDENTE');
  }
  if (ctx.channelPost.chat.id == process.env.ID_CANAL_SINAIS_RICOS) {
    log('CANAL SINAIS RICOS');
  }
  log(`CTX MESSAGE, ${ctx.channelPost.text}`);
  if (ctx.channelPost.chat.id == process.env.ID_CANAL_RICO_VIDENTE || ctx.channelPost.chat.id == process.env.ID_CANAL_TESTE && ctx.channelPost.text && ctx.channelPost.text.includes('Par - ')) {
    try {
      const sinal = extrairSinalDeMensagemDeCanal(ctx);
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
        response = await enviarSinalParaCompra(sinal, ctx);
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

bot.on('message', async (ctx) => {
  try {
      await ctx.reply('Olá, sou o Bot do Método Sempre Rico 🤖💵! Segue abaixo meus comandos:\n\n/start - Começar nossa conversa\n/stop - Parar nossa conversa\n');
  } catch (err) {

  }
});
bot.launch();
cronjobs.start();
comecarValidacaoDeLinks();

app.use(cors());
app.use(bodyParser.json());

app.post('/operation-result', async (req, res) => {
  const telegramClient = bot.telegram;
  const channelMessageId = req.body.telegramMessageId

  const [MENSAGEM_WIN] = await dao.pegarMensagem('win', conexaoDb);
  const [STICKER_WIN] = await dao.pegarSticker('win', conexaoDb);
  const [MENSAGEM_LOSS] = await dao.pegarMensagem('loss', conexaoDb);
  const [STICKER_LOSS] = await dao.pegarSticker('loss', conexaoDb);
  const [MENSAGEM_DOJI] = await dao.pegarMensagem('doji', conexaoDb);

  const resultadoOperacao = req.body
  if (resultadoOperacao.result === 'WIN') {
    log('WIN');
    await telegramClient.sendMessage(process.env.ID_CANAL_RICO_VIDENTE, MENSAGEM_WIN.texto, Extra.inReplyTo(channelMessageId));
    await telegramClient.sendSticker(process.env.ID_CANAL_RICO_VIDENTE, STICKER_WIN.texto, Extra.inReplyTo(channelMessageId));
    await telegramClient.sendMessage(process.env.ID_CANAL_TESTE, MENSAGEM_WIN.texto, Extra.inReplyTo(channelMessageId));
    await telegramClient.sendSticker(process.env.ID_CANAL_TESTE, STICKER_WIN.texto, Extra.inReplyTo(channelMessageId));
    res.status(200).send();
    return;
  }
  if (resultadoOperacao.result === 'LOSS') {
    log('LOSS');
    await telegramClient.sendMessage(process.env.ID_CANAL_RICO_VIDENTE, MENSAGEM_LOSS.texto, Extra.inReplyTo(channelMessageId));
    await telegramClient.sendSticker(process.env.ID_CANAL_RICO_VIDENTE, STICKER_LOSS.texto, Extra.inReplyTo(channelMessageId));
    await telegramClient.sendMessage(process.env.ID_CANAL_TESTE, MENSAGEM_LOSS.texto, Extra.inReplyTo(channelMessageId));
    await telegramClient.sendSticker(process.env.ID_CANAL_TESTE, STICKER_LOSS.texto, Extra.inReplyTo(channelMessageId));
    res.status(200).send();
    return;
  }
  if (resultadoOperacao.result === 'DOJI') {
    log('DOJI LOSS');
    await telegramClient.sendMessage(process.env.ID_CANAL_RICO_VIDENTE, MENSAGEM_LOSS.texto, Extra.inReplyTo(channelMessageId));
    await telegramClient.sendSticker(process.env.ID_CANAL_RICO_VIDENTE, STICKER_LOSS.texto, Extra.inReplyTo(channelMessageId));
    await telegramClient.sendMessage(process.env.ID_CANAL_RICO_VIDENTE, MENSAGEM_DOJI.texto, Extra.inReplyTo(channelMessageId));
    await telegramClient.sendMessage(process.env.ID_CANAL_TESTE, MENSAGEM_LOSS.texto, Extra.inReplyTo(channelMessageId));
    await telegramClient.sendSticker(process.env.ID_CANAL_TESTE, STICKER_LOSS.texto, Extra.inReplyTo(channelMessageId));
    await telegramClient.sendMessage(process.env.ID_CANAL_TESTE, MENSAGEM_DOJI.texto, Extra.inReplyTo(channelMessageId));
    res.status(200).send();
    return;
  }
});

app.post('/mensagem-win', async (req, res) => {
  log(req.body);
  const { mensagemWin } = req.body;
  try {
    await dao.atualizarMensagem('win', mensagemWin, conexaoDb);
    res.set('Access-Control-Allow-Origin', '*');
    res.sendStatus(200);
  } catch (err) {
    await enviarEmailDeRelatorioDeErro(err);
    log(err);
    res.sendStatus(500);
  }
});

app.post('/sticker-win', async (req, res) => {
  const { stickerWin } = req.body;
  try {
    await dao.atualizarSticker('win', stickerWin, conexaoDb);
    res.set('Access-Control-Allow-Origin', '*');
    res.sendStatus(200);
  } catch (err) {
    await enviarEmailDeRelatorioDeErro(err);
    log(err);
    res.sendStatus(500);
  }
});

app.post('/mensagem-loss', async (req, res) => {
  const { mensagemLoss } = req.body;
  try {
    await dao.atualizarMensagem('loss', mensagemLoss, conexaoDb);
    res.set('Access-Control-Allow-Origin', '*');
    res.sendStatus(200);
  } catch (err) {
    await enviarEmailDeRelatorioDeErro(err);
    log(err);
    res.sendStatus(500);
  }
});

app.post('/sticker-loss', async (req, res) => {
  const { stickerLoss } = req.body;
  try {
    await dao.atualizarSticker('loss', stickerLoss, conexaoDb);
    res.set('Access-Control-Allow-Origin', '*');
    res.sendStatus(200);
  } catch (err) {
    await enviarEmailDeRelatorioDeErro(err);
    res.sendStatus(500);
  }
});

app.post('/mensagem-doji', async (req, res) => {
  const { mensagemDoji } = req.body;
  try {
    await dao.atualizarMensagem('doji', mensagemDoji, conexaoDb);
    res.set('Access-Control-Allow-Origin', '*');
    res.sendStatus(200);
  } catch (err) {
    await enviarEmailDeRelatorioDeErro(err);
    res.sendStatus(500);
  }
});

app.get('/', (req, res) => {
  res.status(200).send('<h1>Olá!</h1>');
});

app.get('/mensagem-win', async (req, res) => {
  try {
    const [mensagemWin] = await dao.pegarMensagem('win', conexaoDb);
    res.set('Access-Control-Allow-Origin', '*');
    res.status(200).json({ id: mensagemWin.id, texto: mensagemWin.texto });
  } catch (err) {
    await enviarEmailDeRelatorioDeErro(err);
    log(err);
    res.sendStatus(500);
  }
});

app.get('/sticker-win', async (req, res) => {
  try {
    const [stickerWin] = await dao.pegarSticker('win', conexaoDb);
    res.set('Access-Control-Allow-Origin', '*');
    res.status(200).json({ id: stickerWin.id, texto: stickerWin.texto });
  } catch (err) {
    await enviarEmailDeRelatorioDeErro(err);
    log(err);
    res.sendStatus(500);
  }
});

app.get('/mensagem-loss', async (req, res) => {
  try {
    const [mensagemLoss] = await dao.pegarMensagem('loss', conexaoDb);
    res.set('Access-Control-Allow-Origin', '*');
    res.status(200).json({ id: mensagemLoss.id, texto: mensagemLoss.texto });
  } catch (err) {
    await enviarEmailDeRelatorioDeErro(err);
    log(err);
    res.sendStatus(500);
  }
});

app.get('/sticker-loss', async (req, res) => {
  try {
    const [stickerLoss] = await dao.pegarSticker('loss', conexaoDb);
    res.set('Access-Control-Allow-Origin', '*');
    res.status(200).json({ id: stickerLoss.id, texto: stickerLoss.texto });
  } catch (err) {
    await enviarEmailDeRelatorioDeErro(err);
    res.sendStatus(500);
  }
});

app.get('/mensagem-doji', async (req, res) => {
  try {
    const [mensagemDoji] = await dao.pegarMensagem('doji', conexaoDb);
    res.set('Access-Control-Allow-Origin', '*');
    res.status(200).json({ id: mensagemDoji.id, texto: mensagemDoji.texto });
  } catch (err) {
    await enviarEmailDeRelatorioDeErro(err);
    res.sendStatus(500);
  }
});

let PORT;
if (process.env.NODE_ENV === 'production') {
  PORT = process.env.PORT_METODO_SEMPRERICO_BOT_SRC_APP || process.env.PORT_APP || 3000;
} else {
  PORT = 6000;
}
app.listen(PORT, () => log(`Servidor rodando na porta ${PORT}`));
