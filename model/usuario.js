class Usuario {
    constructor(nomeCompleto, formaDePagamento, email, telefone, statusAssinatura) {
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