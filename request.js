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
    const response = await createRequest().get('/token')
    return response.data.token
}

const getTransactions = async (auth, options={product, transaction, email, date_min, date_max, end_date_min, end_date_max, 'status[]': any, 'forma_pagamento[]': any, page}) => {
    const response = await createAuthorizedRequest(auth).get('/transactions', {params: options})
    return response.data
}

module.exports = {
    createRequest, createAuthorizedRequest, auth, getTransactions
}