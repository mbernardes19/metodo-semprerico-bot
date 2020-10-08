import PayingUser from '../model/PayingUser';
import { PayingUserDataPacket } from '../interfaces/DatabaseQueryResults'

export default class UserMapper {
    static toDataPacket(user: PayingUser): PayingUserDataPacket  {
        return {
            constructor: {
                name: 'RowDataPacket'
            },
            id: user.getTelegramId(),
            nome_completo: user.getFullName(),
            telefone: user.getPhoneNumber(),
            email: user.getEmail(),
            forma_de_pagamento: user.getPaymentMethod(),
            status_assinatura: user.getSubscriptionStatus(),
            aviso_banimento: user.getBanNotice()
        }
    }

    static toDomain(userDataPacket: PayingUserDataPacket): PayingUser  {
        const {id, nome_completo, telefone, email, forma_de_pagamento, status_assinatura} = userDataPacket
        return new PayingUser(id, nome_completo, forma_de_pagamento, email, telefone, status_assinatura);
    }
}