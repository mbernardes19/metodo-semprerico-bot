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
const { enviarWhatsappValidacao } = require('./servicos/validarTelefone');
const util = require('util');
const { pegarTransacaoNaMonetizze } = require('./servicos/request')

const cenaPlanoGratuito = require('./cenas/planoGratuito');
const cenaPlanoPago = require('./cenas/planoPago');

const { conexaoDb } = db;
conexaoDb.connect((err) => {
  if (err) return log(err);
});

const tokenBot = process.env.NODE_ENV === 'production' ? process.env.BOT_TOKEN : process.env.BOT_TOKEN_TESTE;
const bot = new Telegraf(tokenBot);
cache.set('bot', bot.telegram);

const verificarSeJaExisteUsuarioComCpf = async (cpf) => {
  const usuarioComMesmoCpf = await dao.verificarSeJaExisteUsuarioComCpf(cpf, conexaoDb);
  return usuarioComMesmoCpf.length > 0;
};

const extrairSinalDeMensagemDeCanal = (mensagemDeCanal) => {
  try {
    const mensagem = mensagemDeCanal.match(SINAL);
    console.log('MENSAGEM PARSEADA', mensagem);
    const par = mensagem[0];
    const ordem = mensagem[1];
    const horario = mensagem[2];
    const expiracao = 5;
    return {
      par, ordem, horario, expiracao,
    };
  } catch (err) {
    throw new Error(`Mensagem não tem padrão de sinal: ${mensagemDeCanal}`);
  }
};

const criarSinalGale = (mensagemDeCanal) => {
  const agora = new Date();
  let horarioAtual;
  if (agora.getHours() < 10) {
    horarioAtual = `0${agora.getHours()}:`;
  } else {
    horarioAtual = `${agora.getHours()}:`;
  }
  if (agora.getMinutes() < 10) {
    horarioAtual += `0${agora.getMinutes()}:10`;
  } else {
    horarioAtual += `${agora.getMinutes()}:10`;
  }
  const sinalAnterior = extrairSinalDeMensagemDeCanal(mensagemDeCanal);
  log('MENSAGEM GALE');
  log(JSON.stringify({ ...sinalAnterior, horario: horarioAtual }));
  return { ...sinalAnterior, horario: horarioAtual };
};

let SERVIDOR_IQ = process.env.NODE_ENV === 'production'
  ? process.env.SERVIDOR_IQ : process.env.SERVIDOR_IQ_TEST;

const enviarSinalParaCompra = async (sinal, ctx) => {
  SERVIDOR_IQ = ctx.channelPost.chat.id == process.env.ID_CANAL_TESTE ? process.env.SERVIDOR_IQ_TEST : process.env.SERVIDOR_IQ;
  try {
    return await axios.post(`${SERVIDOR_IQ}/buy`, sinal);
  } catch (err) {
    log('Moeda indisponível na binária e na digital');
    log(err);
    // await ctx.reply('Moeda não disponível pra M5 na Iq agora, galera', Extra.inReplyTo(ctx.channelPost.message_id))
  }
};

const checarResultadoCompra = async (responseCompra, ctx) => {
  SERVIDOR_IQ = ctx.channelPost.chat.id == process.env.ID_CANAL_TESTE ? process.env.SERVIDOR_IQ_TEST : process.env.SERVIDOR_IQ;
  try {
    log(`ID ${responseCompra}`);
    return await axios.post(`${SERVIDOR_IQ}/check_win`, { idCompra: responseCompra.idCompra, isDigital: responseCompra.isDigital });
  } catch (err) {
    log('Moeda indisponível na binária e na digital');
    log(err);
    // await ctx.reply('Moeda não disponível pra M5 na Iq agora, galera', Extra.inReplyTo(ctx.channelPost.message_id))
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
      // await ctx.reply('Seu período gratuito de acesso aos canais do Método Sempre Rico expirou!\n\nCaso queira continuar em nossos canais VIP, faça aqui sua compra:\n\nAcesso somente as Salas Vips (sinais que VOCÊ NÃO PRECISA ENTENDER, basta seguir) + Gerenciamento sempre Rico:\n✅ https://app.monetizze.com.br/checkout/DXD93081\n\nAcesso às Salas Vips + Curso Completo (aprenda de uma vez por todas) + Gerenciamento Sempre Rico:\n✅https://app.monetizze.com.br/checkout/DYX93082.');
    }
  } else {
    await ctx.reply('Você ainda não ativou sua assinatura Monettize comigo. Digite o comando /start para começar!');
  }
});

bot.command('n0t1f1c4c40', async (ctx) => {
  // const resp = await pegarTransacaoNaMonetizze({email: 'nicoabreubr@gmail.com'});
  // console.log(resp.dados.map(dado => console.log(dado.venda, dado.assinatura)));
  // try {
  //   const usuarios = await dao.pegarTodosUsuariosGratuitosDoBancoDeDados(conexaoDb);
  //   const usuariosVencidos = await dao.banirUsuariosGratuitosDiasVencidos(usuarios, bot.telegram, conexaoDb);
  //   await dao.enviarMensagemPrivadaParaUsuariosGratuitosVencidos(usuariosVencidos, bot.telegram);
  //   log('Fim - DEU TUDO CERTO');
  // } catch (err) {
  //   log(`ERRO AO KICKAR USUÁRIOS${err}`);
  // }
  // try {
  //     await Promise.allSettled(mensagensAEnviar)
  //     .then(res => res.forEach((result) => log(`Mensagem de emergência enviada a todos os usuários com sucesso! ${result.status}`)))
  //     .catch(err => res.forEach((result) => log(`Erro ao enviar mensagem de emergência pra todos usuários ${result.status}`)))
  // } catch (err) {
  //     await enviarEmailDeRelatorioDeErro(err, ctx.chat.id)
  //     logError('Erro ao enviar notificação pra todos usuários', err)
  // }
});

bot.command('3m3rg3nc14', async (ctx) => {
  const linkCanal1 = pegarLinkDeChat(process.env.ID_CANAL_SINAIS_RICOS);
  const linkCanal2 = pegarLinkDeChat(process.env.ID_CANAL_RICO_VIDENTE);
  const teclado = Markup.inlineKeyboard([
    Markup.urlButton('Canal Sinais Ricos', linkCanal1),
    Markup.urlButton('Canal Rico Vidente', linkCanal2),
  ]);
  const idsUsuariosGratuitos = await dao.pegarIdDeTodosUsuariosGratuitos(conexaoDb);
  const mensagensAEnviar = [];
  const desbanirDoSinaisRicos = [];
  const desbanirDoRicoVidente = [];
  const mensagem = 'Fizemos uma atualização no meu banco de dados hoje que pode ter tido alguns efeitos não esperados... 😵 Caso os canais do Método Sempre Rico não estejam aparecendo mais pra você, estou te enviando de novo os links de acesso a eles!';
  idsUsuariosGratuitos.map((usuario) => {
    mensagensAEnviar.push(bot.telegram.sendMessage(usuario.id, mensagem, Extra.markup(teclado)));
    desbanirDoRicoVidente.push(bot.telegram.unbanChatMember(process.env.ID_CANAL_RICO_VIDENTE, usuario.id));
    desbanirDoSinaisRicos.push(bot.telegram.unbanChatMember(process.env.ID_CANAL_SINAIS_RICOS, usuario.id));
  });

  try {
    await Promise.allSettled(mensagensAEnviar)
      .then((res) => res.forEach((result) => log(`Mensagem de emergência enviada a todos os usuários com sucesso! ${result.status}`)))
      .catch((err) => res.forEach((result) => log(`Erro ao enviar mensagem de emergência pra todos usuários ${result.status}`)));

    await Promise.allSettled(desbanirDoRicoVidente)
      .then((res) => res.forEach((result) => log(`Usuário desbanido do RICO VIDENTE! ${result.status}`)))
      .catch((err) => res.forEach((result) => log(`Erro desbanir usário do RICO VIDENTE ${result.status}`)));

    await Promise.allSettled(desbanirDoSinaisRicos)
      .then((res) => res.forEach((result) => log(`Usuário desbanido do SINAIS RICOS! ${result.status}`)))
      .catch((err) => res.forEach((result) => log(`Erro desbanir usário do SINAIS RICOS ${result.status}`)));
  } catch (err) {
    await enviarEmailDeRelatorioDeErro(err, ctx.chat.id);
    log(err);
    log('Erro ao enviar mensagem de emergência pra todos usuários');
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
      const sinal = extrairSinalDeMensagemDeCanal(ctx.channelPost.text);
      const horaSinal = parseInt(sinal.horario.substring(0, 2));
      const minutoSinal = parseInt(sinal.horario.substring(3, 5));
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

      const [MENSAGEM_WIN] = await dao.pegarMensagem('win', conexaoDb);
      const [STICKER_WIN] = await dao.pegarSticker('win', conexaoDb);
      const [MENSAGEM_LOSS] = await dao.pegarMensagem('loss', conexaoDb);
      const [STICKER_LOSS] = await dao.pegarSticker('loss', conexaoDb);
      const [MENSAGEM_DOJI] = await dao.pegarMensagem('doji', conexaoDb);

      let response;

      setTimeout(async () => {
        response = await enviarSinalParaCompra(sinal, ctx);
        log(`RESPONSE DA COMPRA, ${response.data}`);
        if (!response.data.idCompra) {
          log('Moeda indisponível na binária e na digital');
          // await ctx.reply('Moeda não disponível pra M5 na Iq agora, galera', Extra.inReplyTo(ctx.channelPost.message_id))
          return;
        }
        let resultado;
        setTimeout(async () => {
          resultado = await checarResultadoCompra(response.data, ctx);
          log(`WIN OU LOSS? ${resultado.data}`);
          if (resultado.data > 0) {
            log('WIN');
            log(resultado.data);
            await ctx.reply(MENSAGEM_WIN.texto, Extra.inReplyTo(ctx.channelPost.message_id));
            await ctx.replyWithSticker(STICKER_WIN.texto, Extra.inReplyTo(ctx.channelPost.message_id));
          } else {
            const resp = await enviarSinalParaCompra(criarSinalGale(ctx.channelPost.text), ctx);
            setTimeout(async () => {
              res = await checarResultadoCompra(resp.data, ctx);
              if (res.data > 0) {
                log('WIN');
                log(res.data);
                await ctx.reply(MENSAGEM_WIN.texto, Extra.inReplyTo(ctx.channelPost.message_id));
                await ctx.replyWithSticker(STICKER_WIN.texto, Extra.inReplyTo(ctx.channelPost.message_id));
              }
              if (res.data === 0) {
                log('DOJI LOSS');
                log(res.data);
                await ctx.reply(MENSAGEM_LOSS.texto, Extra.inReplyTo(ctx.channelPost.message_id));
                await ctx.replyWithSticker(STICKER_LOSS.texto, Extra.inReplyTo(ctx.channelPost.message_id));
                await ctx.reply(MENSAGEM_DOJI.texto, Extra.inReplyTo(ctx.channelPost.message_id));
              }
              if (res.data < 0) {
                log('LOSS');
                log(res.data);
                await ctx.reply(MENSAGEM_LOSS.texto, Extra.inReplyTo(ctx.channelPost.message_id));
                await ctx.replyWithSticker(STICKER_LOSS.texto, Extra.inReplyTo(ctx.channelPost.message_id));
              }
            }, 294000);
          }
        }, 294000);
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
