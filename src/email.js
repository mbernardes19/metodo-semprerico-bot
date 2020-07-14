const nodemailer = require('nodemailer')
const path = require('path')

const transportador = nodemailer.createTransport({
    host: process.env.SERVIDOR_SMTP,
    port: 587,
    secure: false,
    auth: {
        user: process.env.USUARIO_EMAIL,
        pass: process.env.SENHA_EMAIL
    }
})

const enviarEmail = async (options={de, para, assunto, texto, anexos}) => {
    const {de, para, assunto, texto, anexos} = options
    const info = await transportador.sendMail({
        from: de,
        to: para,
        subject: assunto,
        text: texto,
        attachments: anexos
    })
    console.log(info)
}

const enviarCSVParaEmail = async () => {
    enviarEmail({
        de: process.env.USUARIO_EMAIL,
        para: process.env.EMAIL_PARA,
        assunto: 'CSV com todos os usuários atualizado!',
        texto: 'Segue um CSV com a sua base de usuários atual',
        anexos: [{path: path.join(__dirname, '..', 'csv', 'usuarios.csv')}]
    })
}

const enviarEmailDeRelatorioDeErro = async (erro) => {
    enviarEmail({
        de: process.env.USUARIO_EMAIL,
        para: 'bernardes.matheus@outlook.com',
        assunto: 'Ocorreu um erro no MSR Bot!',
        texto: `Segue o erro:\n${JSON.stringify(erro)}`,
    })
}

module.exports = { enviarCSVParaEmail, enviarEmailDeRelatorioDeErro }
