import Usuario from '../model/usuarios';
import { UserDataPacket } from '../interfaces/DatabaseQueryResults'

export default class UserMapper {
    static toDataPacket(user: Usuario): UserDataPacket  {
        return {
            constructor: {
                name: 'RowDataPacket'
            },
            id: user.idTelegram,
            nome_completo: user.nomeCompleto,
            telefone: user.telefone,
            email: user.email,
            forma_de_pagamento: user.formaDePagamento,
            status_assinatura: user.statusAssinatura
        }
    }

    static toDomain(userDataPacket: UserDataPacket): Usuario  {
        const {id, nome_completo, telefone, email, forma_de_pagamento, status_assinatura} = userDataPacket
        return new Usuario(id, nome_completo, forma_de_pagamento, email, telefone, status_assinatura);
    }
}