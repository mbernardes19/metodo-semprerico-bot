class UsuarioGratuito {
    constructor(idTelegram, nomeCompleto, cpf, email, telefone, dataAssinatura, diasDeUso) {
        this.idTelegram = idTelegram
        this.nomeCompleto = nomeCompleto
        this.cpf = cpf
        this.email = email
        this.telefone = telefone
        this.dataAssinatura = dataAssinatura
        this.diasDeUso = diasDeUso
    }
}

module.exports = UsuarioGratuito