const nodemailer = require('nodemailer')
const path = require('path')
const { log } = require('./logger')

const transportador = nodemailer.createTransport({
    // host: process.env.SERVIDOR_SMTP,
    // port: 587,
    // secure: false,
    service: "Outlook365",
    auth: {
        user: process.env.USUARIO_EMAIL,
        pass: process.env.SENHA_EMAIL
    }
})

const enviarEmail = async (options={de, para, assunto, texto, anexos}) => {
    const {de, para, assunto, texto, anexos} = options
    try {
        const info = await transportador.sendMail({
            from: de,
            to: para,
            subject: assunto,
            text: texto,
            attachments: anexos
        })
        log(info)
    } catch (err) {
        throw err
    }
}

const enviarCSVParaEmail = async () => {
    try {
        await enviarEmail({
            de: process.env.USUARIO_EMAIL,
            para: process.env.EMAIL_PARA,
            assunto: 'CSV com todos os usuários atualizado!',
            texto: 'Segue um CSV com a sua base de usuários atual',
            anexos: [{path: path.join(__dirname, '..', 'csv', 'usuarios.csv')}]
        })
    } catch (err) {
        log(`ERRO AO ENVIAR ARQUIVO CSV POR EMAIL: ${JSON.stringify(err)}`)
    }
}

const enviarEmailDeRelatorioDeErro = async (erro) => {
    try {
        await enviarEmail({
            de: process.env.USUARIO_EMAIL,
            para: 'bernardes.matheus@outlook.com',
            assunto: 'Ocorreu um erro no MSR Bot!',
            texto: `Segue o erro:\n${JSON.stringify(erro)}`,
        })
    } catch (err) {
        log(`ERRO AO ENVIAR EMAIL DE RELATÓRIO: ${JSON.stringify(err)}`)
    }
}

module.exports = { enviarCSVParaEmail, enviarEmailDeRelatorioDeErro }
