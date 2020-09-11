const formatarData = () => {
    const data = new Date()
    const dia = data.getDate()
    const mes = data.getMonth()+1
    const ano = data.getFullYear()
    const hora = data.getHours()
    const minuto = data.getMinutes()
    const segundo = data.getSeconds()
    return `[${dia}-${mes}-${ano} : ${hora}:${minuto}:${segundo  }] - `
}

const log = (mensagem) => {
    console.log(formatarData(), mensagem)
}

const logError = (mensagem, erro) => {
    console.log(formatarData(), mensagem, erro)
}

module.exports = { log, logError }