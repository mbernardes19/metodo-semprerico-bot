import { Telegraf, Telegram } from 'telegraf';
import { TelegrafContext } from "telegraf/typings/context";
import session from 'telegraf/session';
import Stage from 'telegraf/stage';
import cenaPlanoPago from '../cenas/planoPago';
import { cache } from '../servicos/cache';
import { SceneContextMessageUpdate } from 'telegraf/typings/stage';

export type ActionFunction = (ctx: TelegrafContext) => Promise<void>

export default class TelegramBot {
    private _botClient: Telegraf<TelegrafContext>
    private _telegramClient: Telegram

    constructor(botClient?: Telegraf<TelegrafContext>) {
        console.log('TOKEN', process.env.BOT_TOKEN);
        this._botClient = botClient ? botClient : new Telegraf(process.env.BOT_TOKEN)

        const stage = new Stage([cenaPlanoPago], { ttl: 1500 });

        this._botClient.use(session());
        this._botClient.use(stage.middleware());
        this._botClient.telegram.webhookReply = true;
        this._telegramClient = this._botClient.telegram;
        cache.set('bot', this._telegramClient);
    }

    getTelegramClient() {
        return this._telegramClient;
    }

    getBot() {
        return this._botClient;
    }

    onChannelPost(actionFunction: ActionFunction) {
        this._botClient.on('channel_post', actionFunction)
    }


}