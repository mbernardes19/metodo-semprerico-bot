import Signal, { SignalData } from "./Signal";

export default class FilteringSignal extends Signal {
    constructor(signalData: SignalData) {
        super()
        const {data, telegramMessageId, telegramChannelId} = signalData
        this.assetList = [{pair: data[1], action: data[2], inStrategy: true}];
        this.time = data[3];
        this.expiration = 5;
        this.telegramMessageId = telegramMessageId;
        this.telegramChannelId = telegramChannelId;
        this.gale = false;
        this.type = 'filtering';
    }
}