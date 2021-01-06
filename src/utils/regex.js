/* eslint-disable no-useless-escape */
const CARTAO = /^((cart[a|ã]o)|(cart[a|ã]o de cr[e|é]dito))$/i
const BOLETO = /bolet[a|o]/i
const SIM = /^(sim|s)$/i
const NAO = /^(n[a|ã]o|n)$/i
const TELEFONE = /(^\d{11}$)/
const EMAIL = /^(([^<>()\[\]\\.,;:\s@"]+(\.[^<>()\[\]\\.,;:\s@"]+)*)|(".+"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$/
const SIGNAL_WITH_GALE = /(Rico Baladeiro)|((?<=Par - )[A-Z]{6}\W[A-Z]{3}|[A-Z]{6})|((?<=Ordem - )\w*)|((?<=Horário - )\d{2}:\d{2})/gm
const SINAIS_RICOS_SIGNAL = /(Sinais Ricos)|((?<=Par - )[A-Z]{6}\W[A-Z]{3}|[A-Z]{6})|((?<=Ordem - )\w*)|((?<=Horário - )\d{2}:\d{2})/gm
const SIGNAL_WITHOUT_GALE = /(sinal.+flash)|(.+CALL$|.+PUT$)|((?<=Horário.+)\d{2}:\d{2}$)/gmi
const FILTERING_SIGNAL = /(filtragem.+lista)|((?<=Par.+ )[A-Z]{6})|((?<=Ordem.+ )\w*)|((?<=Horário.+)\d{2}:\d{2})/gmi
const EXTRA_ANALYSIS = /(an[á|a]lise extra)|(.+CALL$|.+PUT$)|((?<=Horário.+)\d{2}:\d{2}$)/gmi
const PLANO_GRATUITO = /(^plano gratuito|plano|gratuito|planogratuito|p$)/i

module.exports = {
    CARTAO, BOLETO, SIM, NAO, TELEFONE, EMAIL, SIGNAL_WITH_GALE, SIGNAL_WITHOUT_GALE, PLANO_GRATUITO, FILTERING_SIGNAL, EXTRA_ANALYSIS, SINAIS_RICOS_SIGNAL
}