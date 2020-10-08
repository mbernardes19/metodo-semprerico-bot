import User from './User';
import { Id } from '../daos/GenericDao';

export default class PayingUser extends User {
    private _paymentMethod: string;
    private _subscriptionStatus: string;
    private _banNotice: number

    constructor(telegramId: Id, fullName: string, email: string, phoneNumber: string, paymentMethod: string, subscriptionStatus: string) {
        super(telegramId, fullName, email, phoneNumber);
        this._paymentMethod = paymentMethod;
        this._subscriptionStatus = subscriptionStatus;
        this._banNotice = 0;
    }

    getPaymentMethod() {
        return this._paymentMethod;
    }

    getSubscriptionStatus() {
        return this._subscriptionStatus;
    }

    getBanNotice() {
        return this._banNotice;
    }

    setPaymentMethod(paymentMethod: string) {
        this._paymentMethod = paymentMethod;
    }

    setSubscriptionStatus(subscriptionStatus: string) {
        this._subscriptionStatus = subscriptionStatus;
    }

    setBanNotice(banNotice: number) {
        this._banNotice = banNotice;
    }
}