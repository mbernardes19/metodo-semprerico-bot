const axios = require('axios').default;

const createSmsRequest = () => axios.create({
    baseURL: `https://api.smsdev.com.br/v1/`
})

const createMonetizzeRequest = () => axios.create({
    baseURL: 'https://api.monetizze.com.br/2.1/',
    headers: {'X_CONSUMER_KEY': `${process.env.MONETIZZE_KEY}`}
})

const createAuthorizedMonetizzeRequest = (token) => {
    return axios.create({
        baseURL: 'https://api.monetizze.com.br/2.1/',
        headers: {'Content-Type': 'application/x-www-form-urlencoded', 'TOKEN': `${token}`}
    })
} 

const auth = async () => {
    try {
        const response = await createMonetizzeRequest().get('/token')
        return response.data.token
    } catch (err) {
        throw err
    }
}

const getTransactions = async (auth, options={product, transaction, email, date_min, date_max, end_date_min, end_date_max, 'status[]': any, 'forma_pagamento[]': any, page}) => {
    try {
        const response = await createAuthorizedMonetizzeRequest(auth).get('/transactions', {params: options})
        return response.data
    } catch (err) {
        throw err
    }
}

const pegarTransacaoNaMonetizze = async (options={product, transaction, email, date_min, date_max, end_date_min, end_date_max, 'status': any, 'forma_pagamento': any, page}) => {
    try {
        const token  = await auth()
        return await getTransactions(token, options)
    } catch(err) {
        throw err
    }
}

const enviarSms = async (paraNumero, mensagem) => {
    try {
        await createSmsRequest().get('/send', {params: { key: process.env.SMS_KEY, type: 9, number: paraNumero, msg: mensagem }})
    } catch (err) {
        throw err;
    }
}

module.exports = {
    createMonetizzeRequest, createAuthorizedMonetizzeRequest, auth, getTransactions, pegarTransacaoNaMonetizze, enviarSms
}