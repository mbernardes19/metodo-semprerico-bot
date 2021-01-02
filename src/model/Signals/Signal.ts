import SignalWithGale from "./SignalWithGale";
import FilteringSignal from "./FilteringSignal";
import SignalWithoutGale from "./SignalWithoutGale";
import ExtraAnalysisSignal from "./ExtraAnalysisSignal";

export interface Asset {
    pair: string;
    action: string;
    inStrategy?: boolean;
}

export type SignalType = 'withGale' | 'withoutGale' | 'filtering' | 'extraAnalysis';

export interface SignalData {
    type: SignalType,
    data: string[],
    telegramMessageId: number,
    telegramChannelId: number,
}

export default class Signal {

    constructor() {}

    protected time: string;
    protected assetList: Asset[];
    protected expiration: number;
    protected telegramMessageId: number;
    protected telegramChannelId: number;
    protected gale: boolean;
    protected type: SignalType;

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
