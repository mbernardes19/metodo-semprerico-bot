const WizardScene = require('telegraf/scenes/wizard')
const { receberNome, pegarNome, confirmarNome } = require('../passos/planoGratuito/nomeCompleto')
const { pegarEmail, confirmarEmail } = require('../passos/planoGratuito/email')
const { pegarTelefone, confirmarTelefone } = require('../passos/planoGratuito/telefone')
const { validarTelefone } = require('../passos/planoGratuito/validarTelefone')

const cenaPlanoGratuito = new WizardScene(
    'planoGratuito',
    async ctx => receberNome(ctx),
    async ctx => pegarNome(ctx),
    confirmarNome,
    async ctx => pegarEmail(ctx),
    confirmarEmail,
    async ctx => pegarTelefone(ctx),
    confirmarTelefone,
    async ctx => validarTelefone(ctx),
)

cenaPlanoGratuito.command('stop', async ctx => ctx.scene.leave())

const passoUm = async (ctx) => {
    ctx.reply('Olá, plano gratuito!')
}

module.exports = cenaPlanoGratuito