const axios = require('axios').default;
const createRequest = () => axios.create({
    baseURL: 'https://api.monetizze.com.br/2.1/',
    headers: {'X_CONSUMER_KEY': `${process.env.MONETIZZE_KEY}`}
})

const createAuthorizedRequest = (token) => {
    return axios.create({
        baseURL: 'https://api.monetizze.com.br/2.1/',
        headers: {'Content-Type': 'application/x-www-form-urlencoded', 'TOKEN': `${token}`}
    })
} 

const auth = async () => {
    try {
        const response = await createRequest().get('/token')
        return response.data.token
    } catch (err) {
        throw err
    }
}

const getTransactions = async (auth, options={product, transaction, email, date_min, date_max, end_date_min, end_date_max, 'status[]': any, 'forma_pagamento[]': any, page}) => {
    try {
        const response = await createAuthorizedRequest(auth).get('/transactions', {params: options})
        return response.data
    } catch (err) {
        throw err
    }
}

const pegarTransacaoNaMonetizze = async (options={product, transaction, email, date_min, date_max, end_date_min, end_date_max, 'status[]': any, 'forma_pagamento[]': any, page}) => {
    try {
        const token  = await auth()
        return await getTransactions(token, options)
    } catch(err) {
        throw err
    }
}

module.exports = {
    createRequest, createAuthorizedRequest, auth, getTransactions, pegarTransacaoNaMonetizze
}