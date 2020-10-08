import { Id } from '../daos/GenericDao';

export default interface GenericRepository<T> {
    save(item: T): Promise<Id>
    delete(id: Id): Promise<void>
    get(id: Id): Promise<T>
    exists(id: Id): Promise<boolean>
}