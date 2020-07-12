const Usuario = require('../src/model/usuario')

module.exports = {
    usuarios: [new Usuario(123, 'Matheus', 'cartao_de_credito', 'bernardes.matheus@outlook.com', '21997532998', 'aguardando_pagamento') ],
    usuariosDoBD: [
        {id: 1313, nome_completo: 'José', telefone: '1231231', email: 'jose@hotmail.com', forma_de_pagamento: 'cartao', status_assinatura: 'ativa'},
        {id: 4543, nome_completo: 'Maria', telefone: '234243', email: 'maria@hotmail.com', forma_de_pagamento: 'boleto', status_assinatura: 'aguardando_pagamento'}
    ]
}