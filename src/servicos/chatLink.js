const { cache } = require('./cache');
const { log } = require('./logger');

const { ID_CANAL_RICO_VIDENTE, ID_CANAL_SINAIS_RICOS, ID_CANAL_TESTE, NODE_ENV } = process.env

const Chat = {
    "RICO_VIDENTE": ID_CANAL_RICO_VIDENTE,
    "SINAIS_RICOS": ID_CANAL_SINAIS_RICOS,
    TESTE: ID_CANAL_TESTE
}

let linkCanalRicoVidente = ''
let linkCanalSinaisRicos = ''
let linkCanalTeste = ''

const exportarLinksDosChats = async () => {
    log(`🔗💬 Gerando novos links para os chats!`)
    try {
        const telegramClient = cache.get('bot')
        console.log(ID_CANAL_RICO_VIDENTE, ID_CANAL_SINAIS_RICOS)
        console.log('NODE ENV', process.env.NODE_ENV)
        if (process.env.NODE_ENV === 'development') {
            console.log('oi')
            linkCanalTeste = await telegramClient.exportChatInviteLink(ID_CANAL_TESTE)
        } else {
            linkCanalRicoVidente = await telegramClient.exportChatInviteLink(ID_CANAL_RICO_VIDENTE)
            linkCanalSinaisRicos = await telegramClient.exportChatInviteLink(ID_CANAL_SINAIS_RICOS)
        }
        log(`🔗💬 Links para chats gerados!`)
        log(`🔗💬 RICO VIDENTE: ${linkCanalRicoVidente}, SINAIS RICOS: ${linkCanalSinaisRicos}`)
    } catch (err) {
        log(`ERRO AO GERAR NOVOS LINKS PARA CHATS ${err}`)
    }
}

const comecarValidacaoDeLinks = async () => {
    log(`VALIDAÇÃO DE LINKS INICIADA!`);
    await exportarLinksDosChats();
}

const pegarLinkDeChat = (chatId) => {
    log(`Pegando link para chat ${chatId}`)
    switch(chatId) {
        case ID_CANAL_RICO_VIDENTE:
            return linkCanalRicoVidente;
        case ID_CANAL_SINAIS_RICOS:
            return linkCanalSinaisRicos;
        case ID_CANAL_TESTE:
            return linkCanalTeste;
        default:
            throw new Error(`Chat buscado não existe ${chatId}`)
    }
}

module.exports = { pegarLinkDeChat, comecarValidacaoDeLinks, exportarLinksDosChats }