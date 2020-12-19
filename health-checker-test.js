const app = require('express')()
const util = require('util');
const exec = util.promisify(require('child_process').exec);

async function runDeploy() {
    try {
        const {stdout, stderr} = await exec('pm2 restart app-teste')
        console.log('stdout', stdout)
        console.log('stderr', stderr)
    } catch (err) {
        console.log(err)
    }
}

app.get('/', (req, res) => {
    res.send('Hello SEMPRE RICO TESTE').status(200)
})
app.get('//HealthTeste', (req, res) => {
    res.send('Hello SEMPRE RICO TESTE').status(200)
})
app.get('//HealthTeste/revive', async (req, res) => {
    await runDeploy()
    res.sendStatus(200);
})

const PORT = process.env.PORT_TESTE_METODO_SEMPRERICO_BOT_HEALTH_CHECKER_TEST || process.env.PORT_APP || 21379 || 3000
app.listen(PORT, () => console.log(`Health checker rodando na porta ${PORT}`));