import { Id } from '../daos/GenericDao';

export default class User {
    private _telegramId: Id;
    private _fullName: string;
    private _email: string;
    private _phoneNumber: string;

    constructor(telegramId: Id, fullName: string, email: string, phoneNumber: string) {
        this._telegramId = telegramId;
        this._fullName = fullName;
        this._email = email;
        this._phoneNumber = phoneNumber;
    }

    getTelegramId() {
        return this._telegramId;
    }

    getFullName() {
        return this._fullName;
    }

    getEmail() {
        return this._email;
    }

    getPhoneNumber() {
        return this._phoneNumber;
    }

    setTelegramId(telegramId: Id) {
        this._telegramId = id;
    }

    setFullName(fullName: string) {
        this._fullName = fullName;
    }

    setEmail(email: string) {
        this._email = email;
    }

    setPhoneNumber(phoneNumber: string) {
        this._phoneNumber = phoneNumber;
    }
}