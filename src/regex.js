const CARTAO = /^((cart[a|ã]o)|(cart[a|ã]o de cr[e|é]dito))$/i
const BOLETO = /bolet[a|o]/i
const SIM = /^(sim|s)$/i
const NAO = /^(n[a|ã]o|n)$/i
const TELEFONE = /(^\d{11}$)/
const EMAIL = /^(([^<>()\[\]\\.,;:\s@"]+(\.[^<>()\[\]\\.,;:\s@"]+)*)|(".+"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$/


module.exports = {
    CARTAO, BOLETO, SIM, NAO, TELEFONE, EMAIL
}