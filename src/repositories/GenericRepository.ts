import { Id } from '../daos/GenericDao';

export default interface GenericRepository<T> {
    save(item: T): Promise<Id>
    delete(item: T): Promise<void>
    get(item: T): Promise<T>
    exists(item: T): Promise<boolean>
}