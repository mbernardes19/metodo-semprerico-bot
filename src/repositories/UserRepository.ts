import GenericRepository from './GenericRepository';
import User from '../model/User';
import { Id } from '../daos/GenericDao';

export default interface UserRepository extends GenericRepository<User> {
    save(user: User): Promise<Id>
    get(userId: Id): Promise<User>
    delete(userId: Id): Promise<void>
    exists(userId: Id): Promise<boolean>
    getAllUsersInChannels(): Promise<User[]>
    getAllKickedUsers(): Promise<User[]>
}