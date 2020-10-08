import User from './User';

export default class FreeUser extends User {
    private _cpf: string;
    private _subscriptionDate: string;
    private _daysLeftOfUsage: number;

    constructor(telegramId: string, fullName: string, email: string, phoneNumber: string, cpf: string, subscriptionDate: string) {
        super(telegramId, fullName, email, phoneNumber);
        this._cpf = cpf;
        this._subscriptionDate = subscriptionDate;
    }

    getCpf() {
        return this._cpf;
    }

    getSubscriptionDate() {
        return this._subscriptionDate;
    }

    getDaysLeftOfUsage() {
        return this._daysLeftOfUsage;
    }
}