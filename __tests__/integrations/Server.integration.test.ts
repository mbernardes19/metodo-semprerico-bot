import request from 'supertest';
import TelegramBot from '../../src/model/TelegramBot';
import dotenv from 'dotenv';
import path from 'path';
dotenv.config({path: path.join(__dirname, '..', '..', '.env.test')})
import { Extra } from 'telegraf';
import ExpressServer from '../../src/model/ExpressServer';

let server: ExpressServer;
let mockedTelegramBot = new TelegramBot() as jest.Mocked<TelegramBot>

describe('App Integration', () => {
    beforeAll(() => {
        server = new ExpressServer(mockedTelegramBot);
        server.init();
    })
    afterAll(() => {
        server.getServer().close()
    })
    it('should send message to the defined channel when /operation-result is called (without gale and result WIN)', () => {
        // Given
        console.log(process.env.DB_HOST)
        console.log(process.env.DB_HOST_PORT)
        console.log(process.env.DB_DATABASE)
        console.log(process.env.DB_USER)
        console.log(process.env.DB_PASSWORD)

        process.env.CANAL_SINAIS = '-100123';
        const sendMessageSpy = spyOn(mockedTelegramBot.getTelegramClient(), 'sendMessage');

        const operationResult = {
            operationSummary: {
                candleBefore: {},
                candleAfter: {},
                signalAction: 'CALL',
                telegramMessageId: 123,
                telegramChannelId: -1001499474166,
                gale: false
            },
            result: 'WIN',
            telegramMessageId: 123,
            telegramChannelId: -1001499474166,
            gale: false
        };

        // When
        return request(server.getServer())
        .post('/operation-result')
        .send(operationResult)
        .set('Accept', 'application/json')
        .expect(200)
        .then(response => {
            expect(response.body.message).toBe(`Operation result sent to channel -1001499474166`);
            expect(response.body.messageToReply).toBe(123);
            expect(sendMessageSpy).toHaveBeenCalledTimes(1)
            expect(sendMessageSpy).toHaveBeenCalledWith(-1001499474166, '⚡💰⚡', Extra.inReplyTo(123))
        })
    })

    it('should send message to the defined channel when /operation-result is called (without gale and result LOSS)', () => {
        // Given
        process.env.CANAL_SINAIS = '-100123';
        const sendMessageSpy = spyOn(mockedTelegramBot.getTelegramClient(), 'sendMessage');

        const operationResult = {
            operationSummary: {
                candleBefore: {},
                candleAfter: {},
                signalAction: 'CALL',
                telegramMessageId: 123,
                telegramChannelId: -1001460676170,
                gale: false
            },
            result: 'LOSS',
            telegramMessageId: 123,
            telegramChannelId: -1001460676170,
            gale: false
        };

        // When
        return request(server.getServer())
        .post('/operation-result')
        .send(operationResult)
        .set('Accept', 'application/json')
        .expect(200)
        .then(response => {
            expect(response.body.message).toBe(`Operation result sent to channel -1001460676170`);
            expect(response.body.messageToReply).toBe(123);
            expect(sendMessageSpy).toHaveBeenCalledTimes(1)
            expect(sendMessageSpy).toHaveBeenCalledWith(-1001460676170, '⚡❌⚡', Extra.inReplyTo(123))
        })
    })

    it('should send message to the defined channel when /operation-result is called (with gale and result WIN)', () => {
        // Given
        process.env.CANAL_SINAIS = '-100123';
        const sendMessageSpy = spyOn(mockedTelegramBot.getTelegramClient(), 'sendMessage');

        const operationResult = {
            operationSummary: {
                candleBefore: {},
                candleAfter: {},
                signalAction: 'CALL',
                telegramMessageId: 123,
                telegramChannelId: -1001499474166,
                gale: true
            },
            result: 'WIN',
            telegramMessageId: 123,
            telegramChannelId: -1001499474166,
            gale: true
        };

        // When
        return request(server.getServer())
        .post('/operation-result')
        .send(operationResult)
        .set('Accept', 'application/json')
        .expect(200)
        .then(response => {
            expect(response.body.message).toBe(`Operation result sent to channel -1001499474166`);
            expect(response.body.messageToReply).toBe(123);
            expect(sendMessageSpy).toHaveBeenCalledTimes(1)
            expect(sendMessageSpy).toHaveBeenCalledWith(-1001499474166, 'WIN', Extra.inReplyTo(123))
        })
    })

    it('should send message to the defined channel when /operation-result is called (with gale and result LOSS)', () => {
        // Given
        process.env.CANAL_SINAIS = '-100123';
        const sendMessageSpy = spyOn(mockedTelegramBot.getTelegramClient(), 'sendMessage');

        const operationResult = {
            operationSummary: {
                candleBefore: {},
                candleAfter: {},
                signalAction: 'CALL',
                telegramMessageId: 123,
                telegramChannelId: -1001460676170,
                gale: true
            },
            result: 'LOSS',
            telegramMessageId: 123,
            telegramChannelId: -1001460676170,
            gale: true
        };

        // When
        return request(server.getServer())
        .post('/operation-result')
        .send(operationResult)
        .set('Accept', 'application/json')
        .expect(200)
        .then(response => {
            expect(response.body.message).toBe(`Operation result sent to channel -1001460676170`);
            expect(response.body.messageToReply).toBe(123);
            expect(sendMessageSpy).toHaveBeenCalledTimes(1)
            expect(sendMessageSpy).toHaveBeenCalledWith(-1001460676170, 'Loss.', Extra.inReplyTo(123))
        })
    })

})
