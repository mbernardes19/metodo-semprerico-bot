import TelegramBot from '../src/model/TelegramBot';
import TelegramBotManager from '../src/model/TelegramBotManager';
import Telegraf from 'telegraf';
import dotenv from 'dotenv';
import path from 'path';
import MessageMapper from '../src/mappers/MessageMapper';
dotenv.config({ path: path.join(__dirname, '..', '.env.test')})

describe('TelegramBotManager', () => {
    let telegramBotManager: TelegramBotManager
    let botClient = new Telegraf(process.env.BOT_TOKEN);
    let telegramBot = new TelegramBot(botClient);

    beforeEach(() => {
        telegramBotManager = new TelegramBotManager(telegramBot)
    })

    it('should run ActionFunction ', async () => {
        const spy = jest.spyOn(MessageMapper, 'toSignal')
        process.env.SINAIS_SINAIS_RICOS = 'true'
        process.env.SINAIS_RICO_VIDENTE = 'true'

        telegramBotManager.manageChannelPosts();
        expect(spy).toHaveBeenCalled();
    });
});