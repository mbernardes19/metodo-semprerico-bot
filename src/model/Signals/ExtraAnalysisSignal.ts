import Signal, { SignalData } from "./Signal";

export default class ExtraAnalysisSignal extends Signal {
    constructor(signalData: SignalData) {
        super()
        const {data, telegramMessageId, telegramChannelId} = signalData
        this.assetList = this.parseAssetList(data)
        this.time = data[1];
        this.expiration = 5;
        this.telegramMessageId = telegramMessageId;
        this.telegramChannelId = telegramChannelId;
        this.gale = true;
        this.type = 'extraAnalysis';
    }
}