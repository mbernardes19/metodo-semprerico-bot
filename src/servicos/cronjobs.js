const cron = require('node-cron');
const dao = require('../dao');
const { conexaoDb } = require('../db');
const { atualizarStatusDeAssinaturaDeUsuarios, banirUsuariosSeStatusNaoForAtivo } = require('./monetizze');
const { enviarCSVParaEmail, enviarBackupParaEmail, enviarEmailDeRelatorioDeErro } = require('../email');
const { log } = require('./logger');
const { cache } = require('./cache');
const csv = require('./csv');
const mysqldump = require('mysqldump').default;
const { exportarLinksDosChats } = require('./chatLink');

const atualizarStatusDeAssinaturaDeUsuariosTodaMeiaNoiteEMeia = () => {
  cron.schedule('30 9 * * *', async () => {
    const telegramClient = cache.get('bot');
    try {
      const usuarios = await dao.pegarTodosUsuariosDoBancoDeDados(conexaoDb);
      let comeco = 0;
      let limite = 10;
      const intervalId = setInterval(async () => {
        await atualizarStatusDeAssinaturaDeUsuarios(usuarios.slice(comeco, limite));
        await banirUsuariosSeStatusNaoForAtivo(usuarios.slice(comeco, limite), telegramClient);
        if (limite >= usuarios.length) {
          log('Todos usuários atualizados com sucesso');
          clearInterval(intervalId);
        } else {
          comeco = limite;
          limite += 10;
        }
      }, 10000);
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

const recurringMessage = () => {
  // cron.schedule('* * * * *', async () => {
  //   const telegramClient = cache.get('bot');
  //   const message = 'Mensagem teste';
  //   try {
  //     telegramClient.sendMessage(process.env.ID_CANAL_SINAIS_RICOS, message)
  //     telegramClient.sendSticker(process.env.ID_CANAL_SINAIS_RICOS, 'CAACAgIAAxkBAAEBdCRfh55vJqgsgAABQM1j7QABOOkupcK5AAIVAAPANk8TzVamO2GeZOcbBA');
  //   } catch (err) {
  //     log(err);
  //   }
  // })
}

const linkValidation = () => {
  // cron.schedule('*/5 * * * *', async () => {
  //   await exportarLinksDosChats()
  //   const telegramClient = cache.get('bot');
  //   const info = await telegramClient.getWebhookInfo()
  //   log(info)
  // })
}

const start = () => {
  atualizarStatusDeAssinaturaDeUsuariosTodaMeiaNoiteEMeia();
  enviarRelatoriaDeBancoDeDadosTodosOsDiasAsNoveDaManha();
  atualizarPeriodoDeTesteGratuito();
  criaBackUpDoBancoDeDados();
  recurringMessage();
  linkValidation();
};

module.exports = { start };
