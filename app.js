const app = require('express')()

app.get('/', (req, res) => {
    res.send("Bem-vindo!")
})

app.get('/testando', (req, res) => {
    res.send("Teste deu certo!")
})