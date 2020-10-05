export default interface Signal {
    time: string;
    asset: string;
    action: string;
    expiration: number;
    telegramMessageId: number;
    gale: boolean;
}