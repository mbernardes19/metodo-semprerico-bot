const cron = require('node-cron')
const dao = require('./dao')
const { conexao } = require('./db')
const { atualizarStatusDeAssinaturaDeUsuarios, banirUsuariosSeStatusNaoForAtivo } = require('./monetizze')
const { enviarCSVParaEmail, enviarEmailDeRelatorioDeErro } = require('./email')
const Telegram = require('telegraf/telegram')

const start = () => {
    atualizarStatusDeAssinaturaDeUsuariosTodaMeiaNoiteEMeia()
    enviarRelatoriaDeBancoDeDadosTodosOsDiasAsNoveDaManha()
}

const atualizarStatusDeAssinaturaDeUsuariosTodaMeiaNoiteEMeia = () => {
    cron.schedule("30 0 * * *", async () => {
        const telegramClient = new Telegram(process.env.BOT_TOKEN)
        try {
            const usuarios = await dao.pegarTodosUsuariosDoBancoDeDados(conexao)
            await atualizarStatusDeAssinaturaDeUsuarios(usuarios)
            await banirUsuariosSeStatusNaoForAtivo(usuarios, telegramClient)
        } catch (err) {
            console.log('ERRO AO ATUALIZAR STATUS DE USUÁRIOS ', err)
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
            await enviarCSVParaEmail()
        } catch (err) {
            console.log('ERRO AO CRIAR E/OU ENVIAR ARQUIVO CSV POR EMAIL ', err)
            await enviarEmailDeRelatorioDeErro(err)
        }
    });
}

module.exports = { start }