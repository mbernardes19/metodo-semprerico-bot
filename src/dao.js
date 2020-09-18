const util = require('util');
const { log } = require('./servicos/logger');
const { conexaoDb } = require('./db');

const adicionarUsuarioAoBancoDeDados = async (usuario, conexao) => {
  const {
    idTelegram, nomeCompleto, formaDePagamento, email, telefone, statusAssinatura,
  } = usuario;
  const query = util.promisify(conexao.query).bind(conexao);
  try {
    await query(`insert into Usuario (id, nome_completo, telefone, email, forma_de_pagamento, status_assinatura) values ('${idTelegram}', '${nomeCompleto}', '${telefone}', '${email}', '${formaDePagamento}', '${statusAssinatura}')`);
  } catch (err) {
    throw err;
  }
};

const limparBancoDeDados = async (conexao) => {
  const query = util.promisify(conexao.query).bind(conexao);
  try {
    await query('truncate table Usuario');
    await query('truncate table EmailBloqueado');
  } catch (err) {
    throw err;
  }
};

const adicionarEmEmailsBloqueados = async (email, conexao) => {
  const query = util.promisify(conexao.query).bind(conexao);
  try {
    const emailsBloqueados = await query('select * from EmailBloqueado');
    const emailsIguais = emailsBloqueados.filter((emailBloqueado) => emailBloqueado.email === email);
    if (emailsIguais.length === 0) {
      await query(`insert into EmailBloqueado values ('${email}')`);
    }
  } catch (err) {
    throw err;
  }
};

const adicionarEmNumerosBloqueados = async (numero, conexao) => {
  const query = util.promisify(conexao.query).bind(conexao);
  try {
    const numerosBloqueados = await query('select * from NumeroBloqueado');
    const numerosIguais = numerosBloqueados.filter((numerosBloqueados) => numerosBloqueados.numero === numero);
    if (numerosIguais.length === 0) {
      await query(`insert into NumeroBloqueado values ('${numero}')`);
    }
  } catch (err) {
    throw err;
  }
};

const pegarTodosEmailsBloqueados = async (conexao) => {
  const query = util.promisify(conexao.query).bind(conexao);
  try {
    return await query('select * from EmailBloqueado');
  } catch (err) {
    throw err;
  }
};

const pegarTodosNumerosBloqueados = async (conexao) => {
  const query = util.promisify(conexao.query).bind(conexao);
  try {
    const numeros = await query('select * from NumeroBloqueado');
    return numeros.map((numero) => numero.numero);
  } catch (err) {
    throw err;
  }
};

const pegarTodosUsuariosDoBancoDeDados = async (conexao) => {
  const query = util.promisify(conexao.query).bind(conexao);
  try {
    return await query('select * from Usuario');
  } catch (err) {
    throw err;
  }
};

const pegarTodosUsuariosGratuitosDoBancoDeDados = async (conexao) => {
  const query = util.promisify(conexao.query).bind(conexao);
  try {
    return await query('select * from UsuarioGratuito');
  } catch (err) {
    throw err;
  }
};

const usuarioExisteEValido = async (id, conexao) => {
  const query = util.promisify(conexao.query).bind(conexao);
  try {
    const resultado = await query(`select * from Usuario where id='${id}' and status_assinatura='ativa'`);
    return resultado.length > 0;
  } catch (err) {
    throw err;
  }
};

const usuarioGratuitoExisteEValido = async (id, conexao) => {
  const query = util.promisify(conexao.query).bind(conexao);
  try {
    const resultado = await query(`select * from UsuarioGratuito where id='${id}' and not dias_de_uso=0`);
    return resultado.length > 0;
  } catch (err) {
    throw err;
  }
};

const usuarioGratuitoExiste = async (id, conexao) => {
  const query = util.promisify(conexao.query).bind(conexao);
  try {
    const resultado = await query(`select * from UsuarioGratuito where id='${id}'`);
    return resultado.length > 0;
  } catch (err) {
    throw err;
  }
};

const pegarUsuarioPeloId = async (id, conexao) => {
  const query = util.promisify(conexao.query).bind(conexao);
  try {
    const usuario = await query(`select * from Usuario where id=${id}`);
    return usuario[0];
  } catch (err) {
    throw err;
  }
};

const pegarUsuarioGratuitoPeloId = async (id, conexao) => {
  const query = util.promisify(conexao.query).bind(conexao);
  try {
    const usuario = await query(`select * from UsuarioGratuito where id=${id}`);
    return usuario[0];
  } catch (err) {
    throw err;
  }
};

const atualizarStatusDeAssinaturaDeUsuarios = async (usuarios, novosStatus, conexao) => {
  const query = util.promisify(conexao.query).bind(conexao);
  const queries = [];
  usuarios.forEach((usuario, index) => {
    queries.push(query(`update Usuario set status_assinatura='${novosStatus[index]}' where id=${usuario.id}`));
  });
  try {
    await Promise.all(queries);
  } catch (err) {
    throw err;
  }
};

const atualizarDiasDeUso = async (usuarios, conexao) => {
  const diasDeUso = await pegarDiasDeUsoDeTodosUsuariosGratuitos(usuarios, conexao);
  console.log('DIAS DE USO', diasDeUso);
  const diasDeUsoAtualizados = diasDeUso.map((dias) => dias[0].dias_de_uso - 1);
  const query = util.promisify(conexao.query).bind(conexao);
  const queries = [];
  console.log('ATUALIZADOS', diasDeUsoAtualizados);
  usuarios.forEach((usuario, index) => {
    queries.push(query(`update UsuarioGratuito set dias_de_uso='${diasDeUsoAtualizados[index]}' where id=${usuario.id}`));
  });
  try {
    await Promise.all(queries);
  } catch (err) {
    throw err;
  }
};

const pegarDiasDeUsoDeTodosUsuariosGratuitos = async (usuarios, conexao) => {
  const query = util.promisify(conexao.query).bind(conexao);
  const queries = [];
  usuarios.forEach((usuario) => {
    queries.push(query(`select dias_de_uso from UsuarioGratuito where id=${usuario.id}`));
  });
  try {
    const diasDeUso = await Promise.all(queries);
    return diasDeUso;
  } catch (err) {
    throw err;
  }
};

const marcarUsuarioGratuitoComoKickado = async (usuario, conexao) => {
  const query = util.promisify(conexao.query).bind(conexao);
  try {
    await query(`update UsuarioGratuito set kickado='S' where id='${usuario.id}'`);
  } catch (err) {
    throw err;
  }
};

const banirUsuariosGratuitosDiasVencidos = async (usuarios, telegramClient) => {
  const usuariosASeremBanidos = [];
  const usuariosATirarBloqueio = [];
  const usuariosBanidos = [];
  usuarios.forEach((usuario) => {
    if (usuario.dias_de_uso == 0 && usuario.kickado === 'N') {
      if (process.env.NODE_ENV === 'production') {
        usuariosASeremBanidos.push(telegramClient.kickChatMember(process.env.ID_CANAL_RICO_VIDENTE, usuario.id));
        usuariosASeremBanidos.push(telegramClient.kickChatMember(process.env.ID_CANAL_SINAIS_RICOS, usuario.id));
        usuariosBanidos.push(usuario);
        usuariosASeremBanidos.push(marcarUsuarioGratuitoComoKickado(usuario, conexaoDb));
        // usuariosATirarBloqueio.push(telegramClient.unbanChatMember(process.env.ID_CANAL_RICO_VIDENTE, usuario.id));
        // usuariosATirarBloqueio.push(telegramClient.unbanChatMember(process.env.ID_CANAL_SINAIS_RICOS, usuario.id));
      } else {
        usuariosASeremBanidos.push(telegramClient.kickChatMember(process.env.ID_CANAL_TESTE, usuario.id));
        usuariosBanidos.push(usuario);
        // usuariosATirarBloqueio.push(telegramClient.unbanChatMember(process.env.ID_CANAL_TESTE, usuario.id));
      }
    }
  });
  try {
    await Promise.allSettled(usuariosASeremBanidos)
    .then(res => res.forEach((result) => log(`Banimento realizado! ${result.status} ${result.value}`)))
    .catch(err => res.forEach((result) => log(`Erro ao banir ${result.status} ${result.value}`)))
    // await Promise.allSettled(usuariosATirarBloqueio)
    // .then(res => res.forEach((result) => log(`Bloqueio retirado! ${result.status} ${result.value}`)))
    // .catch(err => res.forEach((result) => log(`Erro ao retirar bloqueio ${result.status} ${result.value}`)))
    log('Usuários gratuitos vencidos banidos');
    log(`Usuários banidos: ${usuariosBanidos.map(usuario => usuario.nome_completo)}`);
    return usuariosBanidos;
  } catch (err) {
    throw err;
  }
};

const enviarMensagemPrivadaParaUsuariosGratuitosVencidos = async (usuariosVencidos, telegramClient) => {
  const mensagemPrivada = 'Curtiu esse mês com a gente? 😍 Acredito que sim!! Que mês incrível, que assertividade!! Mas como tudo que é bom dura pouco, Infelizmente seu mês gratuito encerrou. Mas não deixe sua banca parada, não perca tudo que conquistou com salas mentirosas e falsas promessas ❌.\n💰Continue com a gente e você terá acesso a muito mais: terá acesso a nossa mentoria, ao nosso gerenciamento com uma planilha exclusiva, ao nosso material didático interativo 📕 e muito mais. Além disso, teremos novidades que será adicionada para todos os membros de forma gratuita. Temos o orgulho de dizer que esse é o método que não para e está sempre se inovando.\nVenha fazer parte dessa família de forma definitiva:\n\nAcesso somente as Salas Vips (sinais que VOCÊ NÃO PRECISA ENTENDER, basta seguir) + Gerenciamento sempre Rico:\n✅ https://app.monetizze.com.br/checkout/DXD93081\n\nAcesso às Salas Vips + Curso Completo (aprenda de uma vez por todas) + Gerenciamento Sempre Rico:\n✅https://app.monetizze.com.br/checkout/DBP94359\n\nAgradecemos por toda a confiança que você nos deu❤️ e até daqui a pouco com mais sinais incríveis🏆';
  const stickerMensagemPrivada = 'CAACAgIAAxkBAAEBNKlfOAV8X58j0iAGkjDysQU2g3ZsZAACvAADJQNSD9AxVNZarPUYGgQ';
  const mensagensAEnviar = [];
  usuariosVencidos.forEach((usuario) => {
    mensagensAEnviar.push(telegramClient.sendMessage(usuario.id, mensagemPrivada));
    mensagensAEnviar.push(telegramClient.sendSticker(usuario.id, stickerMensagemPrivada));
  });
  try {
    await Promise.allSettled(mensagensAEnviar)
    .then(res => {
      log(`${res.length} Receberam a mensagem!`)
      res.forEach((result) => log(`Mensagem enviada! ${result.status} ${result.value}`))
    })
    .catch(err => {
      log(`${res.length} Não receberam a mensagem!`)
      res.forEach((result) => log(`Erro mandar mensagem ${result.status} ${result.value}`))
    })
    log('Usuários gratuitos vencidos removidos dos canais com sucesso');
  } catch (err) {
    throw err;
  }
};

const aumentarAvisoDeBanimento = async (usuario, conexao) => {
  const query = util.promisify(conexao.query).bind(conexao);
  try {
    if (usuario.aviso_banimento === 0) {
      await query(`update Usuario set aviso_banimento=1 where id=${usuario.id}`);
    }
    if (usuario.aviso_banimento === 1) {
      await query(`update Usuario set aviso_banimento=2 where id=${usuario.id}`);
    }
    if (usuario.aviso_banimento === 2) {
      await query(`update Usuario set aviso_banimento=3 where id=${usuario.id}`);
    }
  } catch (err) {
    throw err;
  }
};

const zerarAvisoDeBanimento = async (usuario, conexao) => {
  const query = util.promisify(conexao.query).bind(conexao);
  try {
    await query(`update Usuario set aviso_banimento=0 where id=${usuario.id}`);
  } catch (err) {
    throw err;
  }
};

const pegarMensagem = async (tipo, conexao) => {
  const query = util.promisify(conexao.query).bind(conexao);
  try {
    return await query(`select * from Mensagem where id='mensagem-${tipo}'`);
  } catch (err) {
    throw err;
  }
};

const pegarIdDeTodosUsuariosGratuitos = async (conexao) => {
  const query = util.promisify(conexao.query).bind(conexao);
  try {
    return await query('select id from UsuarioGratuito');
  } catch (err) {
    throw err;
  }
};

const atualizarMensagem = async (tipo, mensagem, conexao) => {
  const query = util.promisify(conexao.query).bind(conexao);
  try {
    await query(`update Mensagem set texto='${mensagem}' where id='mensagem-${tipo}'`);
  } catch (err) {
    throw err;
  }
};

const pegarSticker = async (tipo, conexao) => {
  const query = util.promisify(conexao.query).bind(conexao);
  try {
    return await query(`select * from Mensagem where id='sticker-${tipo}'`);
  } catch (err) {
    throw err;
  }
};
const atualizarSticker = async (tipo, sticker, conexao) => {
  const query = util.promisify(conexao.query).bind(conexao);
  try {
    await query(`update Mensagem set texto='${sticker}' where id='sticker-${tipo}'`);
  } catch (err) {
    throw err;
  }
};

const adicionarUsuarioGratuitoAoBancoDeDados = async (usuario, conexao) => {
  const {
    idTelegram, nomeCompleto, cpf, email, telefone, dataAssinatura, diasDeUso,
  } = usuario;
  const query = util.promisify(conexao.query).bind(conexao);
  try {
    await query(
      `insert into UsuarioGratuito (id, nome_completo, cpf, telefone, email, data_de_assinatura, dias_de_uso, kickado) values ('${idTelegram}', '${nomeCompleto}', '${cpf}',  '${telefone}', '${email}', '${dataAssinatura}', '${diasDeUso}', 'N')`,
    );
  } catch (err) {
    throw err;
  }
};

const verificarSeJaExisteUsuarioComCpf = async (cpf, conexao) => {
  const query = util.promisify(conexao.query).bind(conexao);
  try {
    return await query(`select * from UsuarioGratuito where cpf='${cpf}'`);
  } catch (err) {
    throw err;
  }
};

module.exports = {
  adicionarUsuarioAoBancoDeDados,
  adicionarUsuarioGratuitoAoBancoDeDados,
  verificarSeJaExisteUsuarioComCpf,
  limparBancoDeDados,
  usuarioExisteEValido,
  usuarioGratuitoExiste,
  usuarioGratuitoExisteEValido,
  adicionarEmEmailsBloqueados,
  adicionarEmNumerosBloqueados,
  pegarTodosEmailsBloqueados,
  pegarTodosNumerosBloqueados,
  pegarDiasDeUsoDeTodosUsuariosGratuitos,
  pegarTodosUsuariosDoBancoDeDados,
  pegarTodosUsuariosGratuitosDoBancoDeDados,
  atualizarStatusDeAssinaturaDeUsuarios,
  pegarIdDeTodosUsuariosGratuitos,
  atualizarDiasDeUso,
  enviarMensagemPrivadaParaUsuariosGratuitosVencidos,
  banirUsuariosGratuitosDiasVencidos,
  aumentarAvisoDeBanimento,
  zerarAvisoDeBanimento,
  pegarUsuarioPeloId,
  marcarUsuarioGratuitoComoKickado,
  pegarUsuarioGratuitoPeloId,
  atualizarMensagem,
  atualizarSticker,
  pegarMensagem,
  pegarSticker,
};
