const log = (mensagem) => {
    const data = new Date()
    const dia = data.getDate()
    const mes = data.getMonth()+1
    const ano = data.getFullYear()
    const hora = data.getHours()
    const minuto = data.getMinutes()
    console.log(`${dia}-${mes}-${ano} : ${hora}:${minuto}`, mensagem)
}

module.exports = { log }