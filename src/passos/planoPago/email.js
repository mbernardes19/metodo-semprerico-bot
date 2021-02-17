const Composer = require('telegraf/composer');
const Markup = require('telegraf/markup');
const Extra = require('telegraf/extra');
const { log, logError } = require('../../servicos/logger');
const { confirmado, negado } = require('../../servicos/validacao');
const dao = require('../../dao');
const hotmart = require('../../servicos/hotmart');
const { enviarEmailDeRelatorioDeErro } = require('../../email');
const { pegarLinkDeChat } = require('../../servicos/chatLink');
const { validar } = require('../../servicos/validacao');
const StatusAssinatura = require('../../model/status_assinatura');
const Usuario = require('../../model/usuario');
const UsuarioGratuito = require('../../model/usuario_gratuito');
const { conexaoDb } = require('../../db');
const { cache } = require('../../servicos/cache');

const adicionarUsuarioAoBancoDeDados = async (ctx) => {
  const {
    idTelegram, nomeCompleto, formaDePagamento, email, telefone,
  } = ctx.wizard.state.novoUsuario;
  const novoUsuario = new Usuario(idTelegram, nomeCompleto, formaDePagamento, email, telefone, StatusAssinatura.ATIVA);
  try {
    await dao.adicionarUsuarioAoBancoDeDados(novoUsuario, conexaoDb);
  } catch (err) {
    throw err;
  }
};

const adicionarUsuarioGratuitoAoBancoDeDados = async (ctx) => {
  const data = new Date();
  const ano = data.getFullYear();
  const mes = data.getMonth() + 1 < 10 ? `0${data.getMonth() + 1}` : `${data.getMonth() + 1}`;
  const dia = data.getDate() + 1 < 10 ? `0${data.getDate()}` : `${data.getDate()}`;
  const hoje = `${ano}-${mes}-${dia}`;
  const {
    idTelegram, nomeCompleto, cpf, email, telefone,
  } = ctx.wizard.state.novoUsuario;
  const novoUsuario = new UsuarioGratuito(idTelegram, nomeCompleto, cpf, email, telefone, hoje, 30);
  try {
    await dao.adicionarUsuarioGratuitoAoBancoDeDados(novoUsuario, conexaoDb);
  } catch (err) {
    throw err;
  }
};

const adicionarEmailAosEmailsBloqueados = async (ctx) => {
  const { email } = ctx.wizard.state.novoUsuario;
  log(`Email ${email} adicionado como bloqueado`);
  try {
    await dao.adicionarEmEmailsBloqueados(email, conexaoDb);
  } catch (err) {
    await enviarEmailDeRelatorioDeErro(err, ctx.chat.id);
    log(`Ocorreu um erro ao inserir o email ${email} como email bloqueado: ${JSON.stringify(err)}`);
  } finally {
    await ctx.reply(`O usuário do email ${email} foi bloqueado pois não consta nenhuma compra finalizada por ele na Hotmart.`);
    await ctx.reply(`Caso houve algum engano, verifique se o status da sua compra na Hotmart está como finalizada e inicie novamente sua conversa comigo usando o comando /start, ou envie um email para ${process.env.EMAIL_PARA} para pedir a liberação do seu acesso.`);
    return ctx.scene.leave();
  }
};

const enviarMensagemCompraBoleto = async (ctx) => {
  await ctx.reply('O pagamento da sua assinatura ainda não foi compensado. Pagamentos feitos em boleto podem levar até 3 dias úteis para compensarem.')
  await ctx.reply('Fique de olho no status da sua assinatura na Hotmart. Assim que o pagamento compensar, ele mudará para Ativo.');
  await ctx.reply('Após isso, inicie uma conversa comigo novamente usando o comando /start e então te darei acesso aos canais VIP do Método Sempre Rico!');
}

const atribuirIdTelegramAoNovoUsuario = (ctx) => {
  log('ID Telegram atribuido');
  log(ctx.chat.id);
  ctx.wizard.state.novoUsuario.idTelegram = ctx.chat.id;
};

const enviarCanaisTelegram = async (ctx) => {
  log('Sua assinatura Hotmart foi ativada! 🎉');
  const { email } = ctx.wizard.state.novoUsuario;
  try {
    const usuariosGratuitos = await dao.pegarTodosUsuariosGratuitosDoBancoDeDados(conexaoDb);
    const idsTelegram = usuariosGratuitos.map((usuario) => usuario.id);
    atribuirIdTelegramAoNovoUsuario(ctx);
    if (idsTelegram.includes(ctx.wizard.state.novoUsuario.idTelegram)) {
      const telegramClient = cache.get('bot');
      if (process.env.NODE_ENV === 'production') {
        await telegramClient.callApi(
          'unbanChatMember', 
          {
            chat_id: process.env.ID_CANAL_RICO_VIDENTE,
            user_id: ctx.wizard.state.novoUsuario.idTelegram,
            only_if_banned: true
          }
        )
        await telegramClient.callApi(
          'unbanChatMember', 
          {
            chat_id: process.env.ID_CANAL_SINAIS_RICOS,
            user_id: ctx.wizard.state.novoUsuario.idTelegram,
            only_if_banned: true
          }
        )
      } else {
        await telegramClient.callApi(
          'unbanChatMember', 
          {
            chat_id: process.env.ID_CANAL_RICO_VIDENTE,
            user_id: ctx.wizard.state.novoUsuario.idTelegram,
            only_if_banned: true
          }
        )
        await telegramClient.callApi(
          'unbanChatMember', 
          {
            chat_id: process.env.ID_CANAL_SINAIS_RICOS,
            user_id: ctx.wizard.state.novoUsuario.idTelegram,
            only_if_banned: true
          }
        )
      }
    }
    await adicionarUsuarioAoBancoDeDados(ctx);
  } catch (err) {
    if (err.errno === 1062) {
      log('ERRO: Usuário já existe no banco de dados');
      await ctx.reply(`Você já ativou sua assinatura Monettize comigo antes.`);
      const usuarioValidoEExiste = await dao.usuarioExisteEValido(ctx.chat.id, conexaoDb);
      if (usuarioValidoEExiste) {
        await ctx.reply('Vou te enviar novamente nossos canais caso não tenha conseguido acessar antes:');
        let linkCanal1;
        let linkCanal2;
        if (process.env.NODE_ENV === 'development') {
          log(process.env.ID_CANAL_TESTE);
          linkCanal1 = pegarLinkDeChat(process.env.ID_CANAL_TESTE);
          linkCanal2 = pegarLinkDeChat(process.env.ID_CANAL_TESTE);
        } else {
          log(process.env.ID_CANAL_SINAIS_RICOS);
          log(process.env.ID_CANAL_RICO_VIDENTE);
          linkCanal1 = pegarLinkDeChat(process.env.ID_CANAL_SINAIS_RICOS);
          linkCanal2 = pegarLinkDeChat(process.env.ID_CANAL_RICO_VIDENTE);
        }
        const teclado = Markup.inlineKeyboard([
          Markup.urlButton('Canal Sinais Ricos', linkCanal1),
          Markup.urlButton('Canal Rico Vidente', linkCanal2),
        ]);
        await ctx.reply('Aqui:', Extra.markup(teclado));
      }
      return ctx.scene.leave();
    }
    log('ERRO: Genérico');
    log(err);
    await enviarEmailDeRelatorioDeErro(err, ctx.chat.id);
    await ctx.reply(`Sua compra na Hotmart foi confirmada, porém ocorreu um erro ao ativar sua assinatura na Hotmart. O número do erro é ${err.errno}. Por favor, envie um email para ${process.env.EMAIL_PARA} com o print desta tela.`);
    return ctx.scene.leave();
  }
  log('Usuário adicionado ao BD');
  await ctx.reply('Sua assinatura Hotmart foi ativada! 🎉');
  await ctx.reply('Seja bem-vindo!');
  let linkCanal1;
  let linkCanal2;
  if (process.env.NODE_ENV === 'development') {
    linkCanal1 = pegarLinkDeChat(process.env.ID_CANAL_TESTE);
    linkCanal2 = pegarLinkDeChat(process.env.ID_CANAL_TESTE);
  } else {
    linkCanal1 = pegarLinkDeChat(process.env.ID_CANAL_SINAIS_RICOS);
    linkCanal2 = pegarLinkDeChat(process.env.ID_CANAL_RICO_VIDENTE);
  }
  const teclado = Markup.inlineKeyboard([
    Markup.urlButton('Canal Sinais Ricos', linkCanal1),
    Markup.urlButton('Canal Rico Vidente', linkCanal2),
  ]);
  await ctx.reply('Acesse nossos canais aqui:', Extra.markup(teclado));
  log('Canais de Telegram enviados');
  return ctx.scene.leave();
};

const confirmacaoPositiva = async (ctx) => {
  const Hotmart = new hotmart.default(true);
  await Hotmart.authenticate();
  const validacao = validar('email', ctx.wizard.state.novoUsuario.email);
  if (!validacao.temErro) {
    try {
      const emailsBloqueados = await dao.pegarTodosEmailsBloqueados(conexaoDb);
      const emailBloqueado = emailsBloqueados.filter((emailBloqueado) => emailBloqueado.email === ctx.wizard.state.novoUsuario.email);
      if (emailBloqueado.length > 0) {
        await ctx.reply(`Seu email está registrado como bloqueado. Caso tenha ocorrido um engano, envie um email explicando sua situação para ${process.env.EMAIL_PARA}`);
        return ctx.scene.leave();
      }
    } catch (err) {
      logError(`ERRO AO VERIFICAR SE EMAIL JÁ ESTÁ BLOQUEADO, ${ctx.wizard.state.novoUsuario.email}`, err);
      await enviarEmailDeRelatorioDeErro(err, ctx.chat.id);
    }
    await ctx.reply('Estou verificando no servidor da Hotmart a sua compra, só um momento...');
    try {
      return await Hotmart.verifyUserPurchase(ctx.wizard.state.novoUsuario.email)
        ? await enviarCanaisTelegram(ctx) :
          await Hotmart.wasPurchasedByBoleto(ctx.wizard.state.novoUsuario.email) ?
           await enviarMensagemCompraBoleto(ctx) : await adicionarEmailAosEmailsBloqueados(ctx);
    } catch (err) {
      await ctx.reply(`Erro ao acessar Hotmart para verificação de dados. Tente iniciar uma conversa comigo novamente mais tarde usando o comando /start. Caso este erro persista, envie um email para ${process.env.EMAIL_PARA} com o print desta conversa`);
      log(`ERRO AO VERIFICAR COMPRA DE USUÁRIO NA HOTMART, ${err}`);
      await enviarEmailDeRelatorioDeErro(err, ctx.chat.id);
      return ctx.scene.leave();
    }
  }
  await ctx.reply(`${validacao.mensagemDeErro}`);
  await ctx.reply('Por favor, insira seu email novamente');
  return ctx.wizard.back();
};

const pegarEmail = async (ctx) => {
  if (!ctx.message) {
    await ctx.answerCbQuery();
  }
  try {
    const confirmacao = Markup.inlineKeyboard([Markup.callbackButton('👍 Sim', 'sim'), Markup.callbackButton('👎 Não', 'nao')]);
    await ctx.reply(`Confirmando, seu email é ${ctx.message.text}, certo?`, Extra.inReplyTo(ctx.message.message_id).markup(confirmacao));
    ctx.wizard.state.novoUsuario.email = ctx.message.text;
    log('Email definido');
    log(ctx.wizard.state.novoUsuario);
    ctx.wizard.next();
  } catch (err) {
    ctx.scene.leave();
  }
};

const confirmarEmail = new Composer();
confirmarEmail.action('sim', async (ctx) => {
  try {
    await ctx.answerCbQuery();
    return await confirmacaoPositiva(ctx);
  } catch (err) {
    log(err);
  }
});
confirmarEmail.action('nao', async (ctx) => {
  try {
    await ctx.answerCbQuery();
    await ctx.reply('Por favor, insira seu email novamente');
    return ctx.wizard.back();
  } catch (err) {
    log(err);
  }
});
confirmarEmail.use(async (ctx) => {
  log('Sim/Não');
  if (confirmado(ctx)) {
    try {
      return await confirmacaoPositiva(ctx);
    } catch (err) {
      log(err);
    }
  }
  if (negado(ctx)) {
    try {
      await ctx.reply('Por favor, insira seu email novamente');
      return ctx.wizard.back();
    } catch (err) {
      log(err);
    }
  }
  await ctx.reply('Por favor, escolha uma das opções.');
});

module.exports = { pegarEmail, confirmarEmail };
