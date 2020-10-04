import GenericRepository from './GenericRepository';
import Usuario from '../model/usuarios';
import UserDao from '../daos/UserDao';
import UserMapper from '../mappers/UserMapper';
import { conexaoDb } from '../db';

export default class UserRepository implements GenericRepository<Usuario> {
    private _dao: UserDao;

    constructor(dao?: UserDao) {
        this._dao = dao ? dao : new UserDao(conexaoDb, 'Usuario');
    }

    async save(user: Usuario) {
        const userDataPacket = UserMapper.toDataPacket(user);
        const userId = await this._dao.save(userDataPacket);
        return userId;
    }

    async get(user: Usuario) {
        const userDataPacket = await this._dao.get(user.idTelegram);
        return UserMapper.toDomain(userDataPacket);
    }

    async delete(user: Usuario) {
        await this._dao.delete(user.idTelegram);
    }

    async exists(user: Usuario) {
        return await this._dao.exists(user.idTelegram);
    }

    async getActiveUsers() {
        const userDataPacket = await this._dao.getActiveUsers();
        return UserMapper.toDomain(userDataPacket);
    }
}