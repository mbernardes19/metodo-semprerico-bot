export interface Asset {
    pair: string;
    action: string;
    inStrategy?: boolean;
}

export type SignalType = 'withGale' | 'withoutGale' | 'filtering';

export interface SignalData {
    type: SignalType,
    data: string[],
    telegramMessageId: number,
    telegramChannelId: number,
}

export default class Signal {
    protected time: string;
    protected assetList: Asset[];
    protected expiration: number;
    protected telegramMessageId: number;
    protected telegramChannelId: number;
    protected gale: boolean;
    protected type: SignalType;

    static create(signalData: SignalData) {
        switch(signalData.type) {
            case 'withGale':
                return new SignalWithGale(signalData);
            case 'filtering':
                return new FilteringSignal(signalData);
            case 'withoutGale':
                return new SignalWithoutGale(signalData);
            default:
                throw new Error('Invalid signal type');
        }
    }

    protected parseAssetList(message: string[]): Asset[] {
        const assetsAndActions = message.slice(2);
        return assetsAndActions.map(assetAndAction => ({pair: assetAndAction.slice(0, 6), action: assetAndAction.match(/put|call/gmi)[0], inStrategy: true}))
    }

    getTime() {
        return this.time;
    }
    
    getAssetList() {
        return this.assetList;
    }

    getExpiration() {
        return this.expiration;
    }

    getTelegramMessageId() {
        return this.telegramMessageId;
    }

    getTelegramChannelId() {
        return this.telegramChannelId;
    }

    getGale() {
        return this.gale;
    }

    getType() {
        return this.type;
    }
}

export class SignalWithGale extends Signal {
    constructor(signalData: SignalData) {
        super()
        const {data, telegramMessageId, telegramChannelId} = signalData
        this.assetList = [{pair: data[1], action: data[2], inStrategy: true}];
        this.time = data[3];
        this.expiration = 5;
        this.telegramMessageId = telegramMessageId;
        this.telegramChannelId = telegramChannelId;
        this.gale = true;
        this.type = 'withGale';
    }
}

export class SignalWithoutGale extends Signal {
    constructor(signalData: SignalData) {
        super()
        const {data, telegramMessageId, telegramChannelId} = signalData
        this.assetList = this.parseAssetList(data)
        this.time = data[1];
        this.expiration = 5;
        this.telegramMessageId = telegramMessageId;
        this.telegramChannelId = telegramChannelId;
        this.gale = false;
        this.type = 'withoutGale';
    }
}

export class FilteringSignal extends Signal {
    constructor(signalData: SignalData) {
        super()
        const {data, telegramMessageId, telegramChannelId} = signalData
        this.assetList = [{pair: data[1], action: data[2], inStrategy: true}];
        this.time = data[3];
        this.expiration = 5;
        this.telegramMessageId = telegramMessageId;
        this.telegramChannelId = telegramChannelId;
        this.gale = true;
        this.type = 'filtering';
    }
}