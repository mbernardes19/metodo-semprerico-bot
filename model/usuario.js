const StatusAssinatura = require('./status_assinatura')

class Usuario {
    constructor(nomeCompleto, formaDePagamento, email, telefone) {
        this.nomeCompleto = nomeCompleto
        this.formaDePagamento = formaDePagamento
        this.email = email
        this.telefone = telefone
        this.statusAssinatura = StatusAssinatura.AGUARDANDO_PAGAMENTO
    }

    alterarStatusAssinatura(statusAssinatura) {
        this.statusAssinatura = statusAssinatura
    }
}

module.exports = Usuario