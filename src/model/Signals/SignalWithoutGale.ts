import Signal, { SignalData } from "./Signal";

export default class SignalWithoutGale extends Signal {
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