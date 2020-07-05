const app = require('express')()

app.get('/', (req, res) => {
    res.send("Bem-vindo!")
})

app.get('/testando', (req, res) => {
    res.send("Teste deu certo!")
})

const PORT = process.env.PORT || process.env.PORT_APP || 3000;
app.listen(PORT, function(){
  console.log(`Servidor rodando em: http://localhost:${PORT}`);
});