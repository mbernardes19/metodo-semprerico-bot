const cron = require('node-cron')
const dao = require('./dao')
const { conexao } = require('./db')
const { atualizarStatusDeAssinaturaDeUsuarios, banirUsuariosSeStatusNaoForAtivo } = require('./monetizze')
const { enviarCSVParaEmail } = require('./email')
const Telegram = require('telegraf/telegram')

const start = () => {
    atualizarStatusDeAssinaturaDeUsuariosTodaMeiaNoiteEMeia()
    enviarRelatoriaDeBancoDeDadosTodosOsDiasAsNoveDaManha()
}

const atualizarStatusDeAssinaturaDeUsuariosTodaMeiaNoiteEMeia = () => {
    cron.schedule("30 0 * * *", async () => {
        const telegramClient = new Telegram(process.env.BOT_TOKEN)
        const usuarios = await dao.pegarTodosUsuariosDoBancoDeDados(conexao)
        await atualizarStatusDeAssinaturaDeUsuarios(usuarios)
        await banirUsuariosSeStatusNaoForAtivo(usuarios, telegramClient)
    });
}

const enviarRelatoriaDeBancoDeDadosTodosOsDiasAsNoveDaManha = () => {
    cron.schedule("0 9 * * *", async () => {
        const usuarios = await dao.pegarTodosUsuariosDoBancoDeDados(conexao)
        await csv.criarArquivoCSV(
            ['Id', 'Nome Completo', 'Telefone', 'Email', 'Forma De Pagamento', 'Status Assinatura'],
            usuarios, 'usuarios.csv'
        )
        await enviarCSVParaEmail()
    });
}

module.exports = { start }