module.exports = {
    response: {
        comDadosInvalidos: {status: 200, dados: [], recordCount: 0, pages: 1, error: ""},
        comDadosValidos: {status: 200, dados: [{comprador: {email: "emailteste@hotmail.com"}, venda: {status: "Ativa"}}], recordCount: 1, pages: 1, error: ""},
        comStatusDeAssinaturaInvalido : {status: 200, dados: [{comprador: {email: "emailteste@hotmail.com"}, venda: {status: "Aguardando Pagamento"}}], recordCount: 1, pages: 1, error: ""},
    }
}