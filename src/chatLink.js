const { cache } = require('./cache');
const { log } = require('./logger');

const { ID_CANAL_RICO_VIDENTE, ID_CANAL_SINAIS_RICOS } = process.env

let linkCanalRicoVidente = ''
let linkCanalSinaisRicos = ''

const exportarLinksDosChats = async () => {
    log(`🔗💬 Gerando novos links para os chats!`)
    try {
        const telegramClient = cache.get('bot')
        console.log(ID_CANAL_RICO_VIDENTE, ID_CANAL_SINAIS_RICOS)
        linkCanalRicoVidente = await telegramClient.exportChatInviteLink(ID_CANAL_RICO_VIDENTE)
        linkCanalSinaisRicos = await telegramClient.exportChatInviteLink(ID_CANAL_SINAIS_RICOS)
        log(`🔗💬 Links para chats gerados!`)
        log(`🔗💬 RICO VIDENTE: ${linkCanalRicoVidente}, SINAIS RICOS: ${linkCanalSinaisRicos}`)
    } catch (err) {
        log(`ERRO AO GERAR NOVOS LINKS PARA CHATS ${err}`)
    }
}

const comecarValidacaoDeLinks = async () => {
    log(`VALIDAÇÃO DE LINKS INICIADA!`);
    await exportarLinksDosChats();
    setInterval(async () => await exportarLinksDosChats(), 300000)
}

const pegarLinkDeChat = (chatId) => {
    log(`Pegando link para chat ${chatId}`)
    switch(chatId) {
        case ID_CANAL_RICO_VIDENTE:
            return linkCanalRicoVidente;
        case ID_CANAL_SINAIS_RICOS:
            return linkCanalSinaisRicos;
        default:
            throw new Error(`Chat buscado não existe ${chatId}`)
    }
}

module.exports = { pegarLinkDeChat, comecarValidacaoDeLinks, exportarLinksDosChats }