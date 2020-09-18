const cron = require('node-cron');
const dao = require('../dao');
const { conexaoDb } = require('../db');
const { atualizarStatusDeAssinaturaDeUsuarios, banirUsuariosSeStatusNaoForAtivo } = require('./monetizze');
const { enviarCSVParaEmail, enviarBackupParaEmail, enviarEmailDeRelatorioDeErro } = require('../email');
const { log } = require('./logger');
const { cache } = require('./cache');
const csv = require('./csv');
const mysqldump = require('mysqldump').default;

const atualizarStatusDeAssinaturaDeUsuariosTodaMeiaNoiteEMeia = () => {
  cron.schedule('30 9 * * *', async () => {
    const telegramClient = cache.get('bot');
    try {
      const usuarios = await dao.pegarTodosUsuariosDoBancoDeDados(conexaoDb);
      await atualizarStatusDeAssinaturaDeUsuarios(usuarios);
      await banirUsuariosSeStatusNaoForAtivo(usuarios, telegramClient);
      log('Status de assinatura de usuários atualizado com sucesso!');
    } catch (err) {
      await enviarEmailDeRelatorioDeErro(err);
      log(`ERRO AO ATUALIZAR STATUS DE USUÁRIOS: ${JSON.stringify(err)}`);
      log(err);
    }
  });
};

const atualizarPeriodoDeTesteGratuito = () => {
  cron.schedule('00 0 * * *', async () => {
    const telegramClient = cache.get('bot');
    try {
      const usuarios = await dao.pegarTodosUsuariosGratuitosDoBancoDeDados(conexaoDb);
      console.log('USUARIOS GRATUITOS', usuarios);
      await dao.atualizarDiasDeUso(usuarios, conexaoDb);
      const usuariosAtualizados = await dao.pegarTodosUsuariosGratuitosDoBancoDeDados(conexaoDb);
      const usuariosVencidos = await dao.banirUsuariosGratuitosDiasVencidos(usuariosAtualizados, telegramClient, conexaoDb);
      await dao.enviarMensagemPrivadaParaUsuariosGratuitosVencidos(usuariosVencidos, telegramClient);
      log('Dias de uso de usuários gratuitos atualizado com sucesso');
    } catch (err) {
      await enviarEmailDeRelatorioDeErro(err);
      log(`ERRO AO ATUALIZAR DIAS DE USO DE USUÁRIOS GRATUITOS: ${JSON.stringify(err)}`);
      log(err);
    }
  });
};

const enviarRelatoriaDeBancoDeDadosTodosOsDiasAsNoveDaManha = () => {
  cron.schedule('0 9 * * *', async () => {
    try {
      const usuarios = await dao.pegarTodosUsuariosDoBancoDeDados(conexaoDb);
      await csv.criarArquivoCSV(
        ['Id', 'Nome Completo', 'Telefone', 'Email', 'Forma De Pagamento', 'Status Assinatura'],
        usuarios, 'usuarios.csv',
      );
      log('CSV com usuários atuais criado com sucesso!');
      await enviarCSVParaEmail();
      log('Email com relatório de usuários enviado com sucesso!');
    } catch (err) {
      await enviarEmailDeRelatorioDeErro(err);
      log(`ERRO AO CRIAR CSV: ${JSON.stringify(err)}`);
      log(err);
    }
  });
};

const criaBackUpDoBancoDeDados = () => {
  cron.schedule('0 */2 * * *', async () => {
    try {
      await mysqldump({
        connection: {
          host: process.env.DB_HOST,
          user: process.env.DB_USER,
          password: process.env.DB_PASSWORD,
          database: process.env.DB_DATABASE,
        },
        dumpToFile: './dump.sql',
      });
      await enviarBackupParaEmail();
    } catch (err) {
      await enviarEmailDeRelatorioDeErro(err);
      log(`ERRO GERAR BACKUP DE BANCO DE DADOS: ${JSON.stringify(err)}`);
      log(err);
    }
  });
};

const start = () => {
  atualizarStatusDeAssinaturaDeUsuariosTodaMeiaNoiteEMeia();
  enviarRelatoriaDeBancoDeDadosTodosOsDiasAsNoveDaManha();
  atualizarPeriodoDeTesteGratuito();
  criaBackUpDoBancoDeDados();
};

module.exports = { start };
