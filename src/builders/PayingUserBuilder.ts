import PayingUser from '../model/PayingUser';
import { Id } from '../daos/GenericDao';

export default class PayingUserBuilder {
    private _user: PayingUser;
    constructor() {
        this._user = new PayingUser('', '', '', '', '', '');
    }

    setFullName(fullName: string) {
        this._user.setFullName(fullName)
        return this;
    }
    setTelegramId(telegramId: Id) {
        this._user.setTelegramId(telegramId)
        return this;
    }
    setEmail(email: string) {
        this._user.setEmail(email)
        return this;
    }
    setPhoneNumber(phoneNumber: string) {
        this._user.setPhoneNumber(phoneNumber)
        return this;
    }
    setPaymentMethod(paymentMethod: string) {
        this._user.setPaymentMethod(paymentMethod)
        return this;
    }
    setSubscriptionStatus(subscriptionStatus: string) {
        this._user.setSubscriptionStatus(subscriptionStatus)
        return this;
    }
    build() {
        return this._user;
    }
}