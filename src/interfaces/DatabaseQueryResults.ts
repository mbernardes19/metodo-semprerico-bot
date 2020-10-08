import { RowDataPacket } from 'mysql2';
import { Id } from '../daos/GenericDao';

export interface EmailBloqueadoPacket extends RowDataPacket {
    email: string
}

export interface PayingUserDataPacket extends RowDataPacket {
    id: Id,
    nome_completo: string,
    telefone: string,
    email: string,
    forma_de_pagamento: string,
    status_assinatura: string,
    aviso_banimento: number
}

export interface FreeUserDataPacket extends RowDataPacket {
    id: Id,
    nome_completo: string,
    cpf: string,
    telefone: string,
    email: string,
    data_de_assinatura: string,
    dias_de_uso: number,
    kickado: string
}