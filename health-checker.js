const app = require('express')()
const util = require('util');
const exec = util.promisify(require('child_process').exec);

async function runDeploy() {
    try {
        const {stdout, stderr} = await exec('cd .. && cd metodo-semprerico-bot && bash ../../restart.sh && pwd')
        console.log('stdout', stdout)
        console.log('stderr', stderr)
    } catch (err) {
        console.log(err)
    }
}

app.get('/', (req, res) => {
    res.send('Hello SEMPRE RICO').status(200)
})
app.get('/revive', async (req, res) => {
    await runDeploy()
    res.sendStatus(200);
})

const PORT = process.env.PORT_METODO_SEMPRERICO_BOT_HEALTH_CHECKER || process.env.PORT_APP || 21563 || 3000
app.listen(PORT, () => console.log(`Health checker rodando na porta ${PORT}`));