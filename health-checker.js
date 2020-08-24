const app = require('express')()
const util = require('util');
const exec = util.promisify(require('child_process').exec);

async function runDeploy() {
    try {
        const {stdout, stderr} = await exec('bash ../../deploy.sh')
        console.log('stdout', stdout)
        console.log('stderr', stderr)
    } catch (err) {
        console.log(err)
    }
}

app.get('/revive', async (req, res) => {
    await runDeploy()
})

const PORT = process.env.PORT_METODO_SEMPRERICO_BOT_HEALTH_CHECKER || process.env.PORT_APP || 3000
app.listen(PORT, () => log(`Health checker rodando na porta ${PORT}`));