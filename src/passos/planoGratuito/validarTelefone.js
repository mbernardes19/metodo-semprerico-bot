const Extra = require('telegraf/extra');
const Markup = require('telegraf/markup');
const Composer = require('telegraf/composer');
const dao = require('../../dao');
const { conexaoDb } = require('../../db');
const { log, logError } = require('../../servicos/logger');
const UsuarioGratuito = require('../../model/usuario_gratuito');
const { pegarLinkDeChat } = require('../../servicos/chatLink');
const { enviarSmsDeValidacao, enviarWhatsappValidacao } = require('../../servicos/validarTelefone');
const { confirmado, negado } = require('../../servicos/validacao');
const Teclado = require('../../utils/Teclado');

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
    logError('ERRO AO ADICIONAR USUÁRIO NO BANCO DE DADOS', err);
    throw err;
  }
};

const atribuirIdTelegramAoNovoUsuario = (ctx) => {
  log('ID Telegram atribuido');
  log(ctx.chat.id);
  ctx.wizard.state.novoUsuario.idTelegram = ctx.chat.id;
};

const enviarCanaisTelegramGratuito = async (ctx) => {
  log('Seu período de 1 mês de acesso grauito aos canais VIP do Método Sempre Rico foi ativado! 🎉');
  const { email } = ctx.wizard.state.novoUsuario;
  try {
    atribuirIdTelegramAoNovoUsuario(ctx);
    await adicionarUsuarioGratuitoAoBancoDeDados(ctx);
  } catch (err) {
    if (err.errno === 1062) {
      log('ERRO: Usuário já existe no banco de dados');
      await ctx.reply(`Você já ativou sua assinatura Monettize comigo antes. Seu email registrado é: ${email}.`);
      const usuarioValidoEExiste = await dao.usuarioGratuitoExisteEValido(ctx.chat.id, conexaoDb);
      if (usuarioValidoEExiste) {
        await ctx.reply('Vou te enviar novamente nossos canais caso não tenha conseguido acessar antes:');
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
        await ctx.reply('Aqui:', Extra.markup(teclado));
      }
      return ctx.scene.leave();
    }
    log('ERRO: Genérico');
    logError('ERRO AO SALVAR USUÁRIO NO BD', err);
    await ctx.reply(`Sua compra na Monetizze foi confirmada, porém ocorreu um erro ao ativar sua assinatura na Monetizze. O número do erro é ${err.errno}. Por favor, envie um email para ${process.env.EMAIL_PARA} com o print desta tela.`);
    return ctx.scene.leave();
  }
  log('Usuário adicionado ao BD');
  await ctx.reply('Seu período de 1 mês de acesso grauito aos canais VIP do Método Sempre Rico foi ativado! 🎉');
  await ctx.reply('Seja bem-vindo!');
  let teclado;
  try {
    let linkCanal1;
    let linkCanal2;
    if (process.env.NODE_ENV === 'development') {
      linkCanal1 = pegarLinkDeChat(process.env.ID_CANAL_TESTE);
      linkCanal2 = pegarLinkDeChat(process.env.ID_CANAL_TESTE);
    } else {
      linkCanal1 = pegarLinkDeChat(process.env.ID_CANAL_SINAIS_RICOS);
      linkCanal2 = pegarLinkDeChat(process.env.ID_CANAL_RICO_VIDENTE);
    }
    teclado = Markup.inlineKeyboard([
      Markup.urlButton('Canal Sinais Ricos', linkCanal1),
      Markup.urlButton('Canal Rico Vidente', linkCanal2),
    ]);
  } catch (err) {
    const linkCanal1 = pegarLinkDeChat(process.env.ID_CANAL_TESTE);
    teclado = Markup.inlineKeyboard([
      Markup.urlButton('Canal Teste', linkCanal1),
    ]);
  }
  await ctx.reply('Acesse nossos canais aqui:', Extra.markup(teclado));
  log('Canais de Telegram enviados');
  await ctx.reply('Caso ocorra algum erro ao acessá-los, digite o comando /canais para recebê-los novamente');
  return ctx.scene.leave();
};

const validarTelefoneWhatsapp = new Composer();

validarTelefoneWhatsapp.action('sim', async (ctx) => {
  await ctx.answerCbQuery();
  console.log('OLÁÁÁÁÁ');
  await enviarWhatsappValidacao(ctx, ctx.wizard.state.novoUsuario.telefone.replace(/ /g, ''));
  ctx.wizard.state.tentativasWhatsapp += 1;
  await ctx.reply('Foi enviado agora pro seu Whatsapp o número de verificação. Por favor, diga-me aqui qual é esse número.');
  ctx.wizard.next();
});

validarTelefoneWhatsapp.action('nao', async (ctx) => {
  await ctx.answerCbQuery();
  return ctx.wizard.back();
});

validarTelefoneWhatsapp.use(async (ctx) => {
  if (confirmado(ctx)) {
    console.log('OLÁÁÁÁÁ');
    await enviarWhatsappValidacao(ctx, ctx.wizard.state.novoUsuario.telefone.replace(/ /g, ''));
    ctx.wizard.state.tentativasWhatsapp += 1;
    await ctx.reply('Foi enviado agora pro seu Whatsapp o número de verificação. Por favor, diga-me aqui qual é esse número.');
    return ctx.wizard.next();
  }
  if (negado(ctx)) {
    await ctx.reply('Infelizmente não foi possível confirmar seu número de celular 😕.\nMas você pode tentar de novo com outro número começando uma nova conversa comigo usando o comando /start');
    return ctx.scene.leave();
  }
  await ctx.reply('Por favor, escolha uma das opções.');
});

const validarTelefone = async (ctx) => {
  ctx.wizard.state.numeroValidacaoEnviado = false;
  ctx.wizard.state.tentativasSms += 1;

  console.log('MESSAGE', ctx.message.text);
  console.log('NUMERO VALIDACAO', ctx.wizard.state.numeroValidacao);

  console.log('TENTATIVA SMS', ctx.wizard.state.tentativasSms);
  console.log('TENTATIVA WPP', ctx.wizard.state.tentativasWhatsapp);
  if (!ctx.message) {
    if (ctx.update.message.text === ctx.wizard.state.numeroValidacao) {
      ctx.wizard.state.numeroValidacaoEnviado = true;
      await ctx.reply('Confirmado!');
      await enviarCanaisTelegramGratuito(ctx);
      return ctx.scene.leave();
    }
  } else if (ctx.message.text == ctx.wizard.state.numeroValidacao) {
    ctx.wizard.state.numeroValidacaoEnviado = true;
    await ctx.reply('Confirmado!');
    await enviarCanaisTelegramGratuito(ctx);
    return ctx.scene.leave();
  }

  if (ctx.wizard.state.tentativasWhatsapp === 1) {
    try {
      await dao.adicionarEmNumerosBloqueados(ctx.wizard.state.novoUsuario.telefone, conexaoDb);
      await dao.adicionarEmEmailsBloqueados(ctx.wizard.state.novoUsuario.email, conexaoDb);
      await ctx.reply('O número que você passou não confere com o que foi enviado pelo Whatsapp.');
      await ctx.reply(`Por isso, vou deixar seu número de telefone e email registrados como bloqueados. Para desbloqueá-los, envie um email para ${process.env.EMAIL_PARA} com seu nome completo, email e telefone solicitando o desbloqueamento.`);
      return await ctx.scene.leave();
    } catch (err) {
      logError(`ERRO AO ADICIONAR NÚMERO E EMAIL DO USUÁRIO AOS BLOQUEADOS ${ctx.wizard.state.novoUsuario.telefone} ${ctx.wizard.state.novoUsuario.email}`, err);
    }
  }

  if (ctx.wizard.state.tentativasSms < 2) {
    ctx.wizard.state.numeroValidacaoEnviado = true;
    ctx.reply(`Esse número não é igual ao enviado no SMS. Quer que eu envie um SMS novamente para ${ctx.wizard.state.novoUsuario.telefone}?`, Extra.markup(Teclado.CONFIRMACAO));
    return ctx.wizard.selectStep(6);
  }

  try {
    await dao.adicionarEmNumerosBloqueados(ctx.wizard.state.novoUsuario.telefone, conexaoDb);
    await dao.adicionarEmEmailsBloqueados(ctx.wizard.state.novoUsuario.email, conexaoDb);
    await ctx.reply('O número que você passou não confere com o que foi enviado pelo SMS novamente.');
    await ctx.reply(`Por isso, vou deixar seu número de telefone e email registrados como bloqueados. Para desbloqueá-los, envie um email para ${process.env.EMAIL_PARA} com seu nome completo, email e telefone solicitando o desbloqueamento.`);
    await ctx.scene.leave();
  } catch (err) {
    logError(`ERRO AO ADICIONAR NÚMERO E EMAIL DO USUÁRIO AOS BLOQUEADOS ${ctx.wizard.state.novoUsuario.telefone} ${ctx.wizard.state.novoUsuario.email}`, err);
  }
};

module.exports = { enviarSmsDeValidacao, validarTelefone, validarTelefoneWhatsapp };
