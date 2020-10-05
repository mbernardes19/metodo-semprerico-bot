const CARTAO = /^((cart[a|ã]o)|(cart[a|ã]o de cr[e|é]dito))$/i
const BOLETO = /bolet[a|o]/i
const SIM = /^(sim|s)$/i
const NAO = /^(n[a|ã]o|n)$/i
const TELEFONE = /(^\d{11}$)/
const EMAIL = /^(([^<>()\[\]\\.,;:\s@"]+(\.[^<>()\[\]\\.,;:\s@"]+)*)|(".+"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$/
const SIGNAL_WITH_GALE = /((?<=Par - )[A-Z]{6}\W[A-Z]{3}|[A-Z]{6})|((?<=Ordem - )\w*)|((?<=Horário - )\d{2}:\d{2})/gm
const SIGNAL_WITHOUT_GALE = /((?<=Par c\/ Ordem:\n)[A-Z]{6})|((?<=Par c\/ Ordem:\n[A-Z]{6} - )[A-Z]{4})|((?<=Horário - )\d{2}:\d{2})/gm
const PLANO_GRATUITO = /(^plano gratuito|plano|gratuito|planogratuito|p$)/i

module.exports = {
    CARTAO, BOLETO, SIM, NAO, TELEFONE, EMAIL, SIGNAL_WITH_GALE, SIGNAL_WITHOUT_GALE, PLANO_GRATUITO
}