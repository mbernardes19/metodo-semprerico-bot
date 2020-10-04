import { Connection, RowDataPacket, FieldPacket } from 'mysql2/promise';
import GenericDao, { Id } from './GenericDao';
import { UserDataPacket } from '../interfaces/DatabaseQueryResults';

type QueryFunction<T extends RowDataPacket> = (sql: string) => Promise<[T, FieldPacket[]]>;

export default class UserDao implements GenericDao<UserDataPacket> {
    protected _conexao: Connection;
    protected _query: QueryFunction<UserDataPacket>;
    protected _tableName: string;
  
    constructor(conexao: Connection, tableName: string) {
      this._conexao = conexao;
      this._query = conexao.query;
      this._tableName = tableName;
    }

    async save(userDataPacket: UserDataPacket) {
      const {
        id, nome_completo, forma_de_pagamento, email, telefone, status_assinatura
      } = userDataPacket;
      try {
        await this._query(`insert into ${this._tableName} (id, nome_completo, telefone, email, forma_de_pagamento, status_assinatura) values ('${id}', '${nome_completo}', '${telefone}', '${email}', '${forma_de_pagamento}', '${status_assinatura}')`);
        return id;
      } catch (err) {
        throw err
      }
    }

    async get(id: Id) {
      try {
        const [userPacket] = await this._query(`select * from ${this._tableName} where id='${id}'`)
        return userPacket
      } catch (err) {
        throw err;
      }
    }

    async update(id: Id, column: string, value: string|number) {
      try {
        if (typeof value === 'number') {
          await this._query(`update ${this._tableName} set ${column}=${value} where id='${id}'`)
        } else {
          await this._query(`update ${this._tableName} set ${column}='${value}' where id='${id}'`)
        }
      } catch (err) {
        throw err;
      }
    }

    async delete(id: Id) {
      try {
        await this._query(`delete from ${this._tableName} where id='${id}'`);
      } catch (err) {
        throw err
      }
    }

    async exists(id: Id) {
      try {
        const [userPacket] = await this._query(`select * from ${this._tableName} where id='${id}'`)
        return userPacket ? true : false;
      } catch (err) {
        throw err;
      }
    }

    async getActiveUsers() {
      try {
        const [userDataPacket] = await this._query(`select * from ${this._tableName} where status_assinatura='ativo'`)
        return userDataPacket;
      } catch (err) {
        throw err;
      }
    }

    async getKickedUsers() {

    }
}