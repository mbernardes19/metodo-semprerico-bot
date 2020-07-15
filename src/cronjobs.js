const cron = require('node-cron')
const dao = require('./dao')
const { conexao } = require('./db')
const { atualizarStatusDeAssinaturaDeUsuarios, banirUsuariosSeStatusNaoForAtivo } = require('./monetizze')
const { enviarCSVParaEmail, enviarEmailDeRelatorioDeErro } = require('./email')
const Telegram = require('telegraf/telegram')
const { log } = require('./logger')
const { cache } = require('./cache')

const start = () => {
    atualizarStatusDeAssinaturaDeUsuariosTodaMeiaNoiteEMeia()
    enviarRelatoriaDeBancoDeDadosTodosOsDiasAsNoveDaManha()
}

const atualizarStatusDeAssinaturaDeUsuariosTodaMeiaNoiteEMeia = () => {
    cron.schedule("30 9 * * *", async () => {
        const telegramClient = cache.get('bot')
        try {
            const usuarios = await dao.pegarTodosUsuariosDoBancoDeDados(conexao)
            await atualizarStatusDeAssinaturaDeUsuarios(usuarios)
            await banirUsuariosSeStatusNaoForAtivo(usuarios, telegramClient)
            log(`Status de assinatura de usuários atualizado com sucesso!`)
        } catch (err) {
            log(`ERRO AO ATUALIZAR STATUS DE USUÁRIOS: ${JSON.stringify(err)}`)
            await enviarEmailDeRelatorioDeErro(err)
        }
    });
}

const enviarRelatoriaDeBancoDeDadosTodosOsDiasAsNoveDaManha = () => {
    cron.schedule("0 9 * * *", async () => {
        try {
            const usuarios = await dao.pegarTodosUsuariosDoBancoDeDados(conexao)
            await csv.criarArquivoCSV(
                ['Id', 'Nome Completo', 'Telefone', 'Email', 'Forma De Pagamento', 'Status Assinatura'],
                usuarios, 'usuarios.csv'
            )
            log(`CSV com usuários atuais criado com sucesso!`)
            await enviarCSVParaEmail()
            log(`Email com relatório de usuários enviado com sucesso!`)
        } catch (err) {
            log(`ERRO AO CRIAR CSV: ${JSON.stringify(err)}`)
            await enviarEmailDeRelatorioDeErro(err)
        }
    });
}

module.exports = { start }