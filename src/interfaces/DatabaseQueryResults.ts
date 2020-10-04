import { RowDataPacket } from 'mysql2';
import { Id } from '../daos/GenericDao';

export interface EmailBloqueadoPacket extends RowDataPacket {
    email: string
}

export interface UserDataPacket extends RowDataPacket {
    id: Id,
    nome_completo: string,
    telefone: string,
    email: string,
    forma_de_pagamento: string,
    status_assinatura: string
}