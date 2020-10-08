import PayingUser from '../model/PayingUser';
import UserDao from '../daos/PayingUserDao';
import UserMapper from '../mappers/UserMapper';
import { conexaoDbPromise } from '../db';
import UserRepository from './UserRepository';
import { Id } from '../daos/GenericDao';

export default class PayingUserRepository implements UserRepository {
    private _dao: UserDao;

    constructor(dao?: UserDao) {
        (async () => {
            const conexao = await conexaoDbPromise
            this._dao = dao ? dao : new UserDao(conexao, 'Usuario');
        })()
    }

    async save(user: PayingUser) {
        const userDataPacket = UserMapper.toDataPacket(user);
        const userId = await this._dao.save(userDataPacket);
        return userId;
    }

    async get(userId: Id) {
        const userDataPacket = await this._dao.get(userId);
        return UserMapper.toDomain(userDataPacket);
    }

    async delete(userId: Id) {
        await this._dao.delete(userId);
    }

    async exists(userId: Id) {
        return await this._dao.exists(userId);
    }

    async getAllKickedUsers() {
        const usersDataPacket = await this._dao.getAllKickedUsers()
        return usersDataPacket.map(userDataPacket => UserMapper.toDomain(userDataPacket));
    }

    async getAllUsersInChannels() {
        const usersDataPacket = await this._dao.getAllUsersInChannels()
        return usersDataPacket.map(userDataPacket => UserMapper.toDomain(userDataPacket));
    }

    async getAllUsersWithActiveSubscription() {
        const usersDataPacket = await this._dao.getAllActiveUsers()
        return usersDataPacket.map(userDataPacket => UserMapper.toDomain(userDataPacket));
    }

    async getAllUsersWithInvalidSubscription() {
        const usersDataPacket = await this._dao.getAllInvalidUsers()
        return usersDataPacket.map(userDataPacket => UserMapper.toDomain(userDataPacket));
    }
}