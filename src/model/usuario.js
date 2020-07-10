class Usuario {
    constructor(idTelegram, nomeCompleto, formaDePagamento, email, telefone, statusAssinatura) {
        this.idTelegram = idTelegram
        this.nomeCompleto = nomeCompleto
        this.formaDePagamento = formaDePagamento
        this.email = email
        this.telefone = telefone
        this.statusAssinatura = statusAssinatura
    }

    alterarStatusAssinatura(statusAssinatura) {
        this.statusAssinatura = statusAssinatura
    }
}

module.exports = Usuario