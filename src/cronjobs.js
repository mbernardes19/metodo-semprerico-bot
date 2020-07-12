const cron = require('node-cron')
const dao = require('./dao')
const { conexao } = require('./db')
const { atualizarStatusDeAssinaturaDeUsuarios, banirUsuariosSeStatusNaoForAtivo } = require('./monetizze')
const { enviarCSVParaEmail } = require('./email')
const Telegram = require('telegraf/telegram')

const start = () => {
    atualizarStatusDeAssinaturaDeUsuariosTodaMeiaNoiteEMeia()
    enviarRelatoriaDeBancoDeDadosTodosOsDiasAsNoveDaManha()
    console.log(process.env.BOT_TOKEN)
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
    cron.schedule("0 9 * * *", async () => await enviarCSVParaEmail());
}

module.exports = { start }