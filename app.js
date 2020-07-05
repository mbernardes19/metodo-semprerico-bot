const app = require('express')()
const { Telegraf } = require('telegraf')
require('dotenv').config()


app.get('/', (req, res) => {
    res.send("Bem-vindo!")
})

app.get('/testando', (req, res) => {
    res.send("Teste deu certo!")
})

const PORT = process.env.PORT_APP || 3000
app.listen(PORT, function(){
    console.log(process.env.VARIAVEL_TESTE)
  console.log(`Servidor rodando na porta ${PORT}`)
});