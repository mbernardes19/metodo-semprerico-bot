export interface Asset {
    pair: string;
    action: string;
    inStrategy?: boolean;
}

export default interface Signal {
    time: string;
    assetList: Asset[];
    expiration: number;
    telegramMessageId: number;
    telegramChannelId: number;
    gale: boolean;
    type: string;
}