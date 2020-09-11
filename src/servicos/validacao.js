const regex = require('../utils/regex')

const validar = (informacao, dado) => {
    switch(informacao) {
        case 'telefone':
            return regex.TELEFONE.test(dado.replace(/ /g, "")) ?
                {temErro: false, mensagemDeErro: ""} :
                {temErro: true, mensagemDeErro: "Telefone inválido. Certifique-se de estar inserindo somente números e o DDD (sem o zero) junto."}
        case 'email':
            return regex.EMAIL.test(dado) ?
                {temErro: false, mensagemDeErro: ""} :
                {temErro: true, mensagemDeErro: "Email inválido. Certifique-se de estar inserindo um email válido."}
        case 'cpf':
            return validarCPF(dado) ?
                {temErro: false, mensagemDeErro: ""} :
                {temErro: true, mensagemDeErro: "CPF inválido. Certifique-se de estar inserindo um CPF válido."}
        default: return {temErro: false, mensagemDeErro: ""}

    }
}

const validarCPF = (valor) => {
    var calcChecker1 = function calcChecker1(firstNineDigits) {
        var sum = null;
        for (var j = 0; j < 9; ++j) {
            sum += firstNineDigits.toString().charAt(j) * (10 - j);
        }
        var lastSumChecker1 = sum % 11;
        var checker1 = lastSumChecker1 < 2 ? 0 : 11 - lastSumChecker1;
        return checker1;
    };
    var calcChecker2 = function calcChecker2(cpfWithChecker1) {
        var sum = null;
        for (var k = 0; k < 10; ++k) {
            sum += cpfWithChecker1.toString().charAt(k) * (11 - k);
        }
        var lastSumChecker2 = sum % 11;
        var checker2 = lastSumChecker2 < 2 ? 0 : 11 - lastSumChecker2;
        return checker2;
    };
    function validar(value) {
        if (!value || value === true) {
            return;
        }
        if (typeof value === 'number') {
            value = String(value);
        }
        var cleanCPF = value.replace(/[^\d]/g, '');
        var firstNineDigits = cleanCPF.substring(0, 9);
        var checker = cleanCPF.substring(9, 11);
        if (cleanCPF.length !== 11) {
            return false;
        }
        // Checking if all digits are equal
        for (var i = 0; i < 10; i++) {
            if ('' + firstNineDigits + checker === Array(12).join(i)) {
                return false;
            }
        }
        var checker1 = calcChecker1(firstNineDigits);
        var checker2 = calcChecker2('' + firstNineDigits + checker1);
        if (checker.toString() === checker1.toString() + checker2.toString()) {
            return true;
        } else {
            return false;
        }
    };
    return validar(valor)
}

module.exports = {
    formaDePagamentoValida: (ctx) => regex.CARTAO.test(ctx.message.text) || regex.BOLETO.test(ctx.message.text),
    cartao: (ctx) => ctx.message ? regex.CARTAO.test(ctx.message.text) : regex.CARTAO.test(ctx.update.message.text),
    boleto: (ctx) => ctx.message ? regex.BOLETO.test(ctx.message.text) : regex.BOLETO.test(ctx.update.message.text),
    planoGratuito: (ctx) => ctx.message ? regex.PLANO_GRATUITO.test(ctx.message.text) : regex.PLANO_GRATUITO.test(ctx.update.message.text),
    confirmado: (ctx) => ctx.message ? regex.SIM.test(ctx.message.text) : regex.SIM.test(ctx.update.message.text),
    negado: (ctx) => ctx.message ? regex.NAO.test(ctx.message.text) : regex.NAO.test(ctx.update.message.text),
    validar,
    validarCPF
}
