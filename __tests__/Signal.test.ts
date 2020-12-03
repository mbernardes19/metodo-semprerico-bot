import Signal, { SignalData } from "../src/model/Signal"

describe('Signal', () => {
    it('creates Signal With Gale', () => {
        const signalData: SignalData = {
            data: ['Rico Baladeiro', 'USDJPY', 'PUT', '10:30'],
            telegramChannelId: 123,
            telegramMessageId: 1234,
            type: 'withGale',
        }

        const signalWithGale = Signal.create(signalData)
        expect(signalWithGale.getAssetList().length).toBe(1)
        expect(signalWithGale.getAssetList()[0]).toStrictEqual({pair: 'USDJPY', action: 'PUT', inStrategy: true})
        expect(signalWithGale.getExpiration()).toBe(5)
        expect(signalWithGale.getGale()).toBe(true)
        expect(signalWithGale.getType()).toBe('withGale')
        expect(signalWithGale.getTelegramChannelId()).toBe(123)
        expect(signalWithGale.getTelegramMessageId()).toBe(1234)
    })

    it('creates Filtering Signal', () => {
        const signalData: SignalData = {
            data: ['Filtragem da List', 'USDJPY', 'PUT', '10:30'],
            telegramChannelId: 123,
            telegramMessageId: 1234,
            type: 'filtering',
        }

        const signalWithGale = Signal.create(signalData)
        expect(signalWithGale.getAssetList().length).toBe(1)
        expect(signalWithGale.getAssetList()[0]).toStrictEqual({pair: 'USDJPY', action: 'PUT', inStrategy: true})
        expect(signalWithGale.getExpiration()).toBe(5)
        expect(signalWithGale.getGale()).toBe(true)
        expect(signalWithGale.getType()).toBe('filtering')
        expect(signalWithGale.getTelegramChannelId()).toBe(123)
        expect(signalWithGale.getTelegramMessageId()).toBe(1234)
    })

    it('creates Signal Without Gale', () => {
        const signalData: SignalData = {
            data: ['Sinal Flash', '04:45', 'AUDJPY- CALL', 'EURUSD- CALL', 'BRLJPY- PUT'],
            telegramChannelId: 123,
            telegramMessageId: 1234,
            type: 'withoutGale',
        }

        const signalWithoutGale = Signal.create(signalData)
        expect(signalWithoutGale.getAssetList().length).toBe(3)
        expect(signalWithoutGale.getAssetList()[0]).toStrictEqual({pair: 'AUDJPY', action: 'CALL', inStrategy: true})
        expect(signalWithoutGale.getAssetList()[1]).toStrictEqual({pair: 'EURUSD', action: 'CALL', inStrategy: true})
        expect(signalWithoutGale.getAssetList()[2]).toStrictEqual({pair: 'BRLJPY', action: 'PUT', inStrategy: true})
        expect(signalWithoutGale.getExpiration()).toBe(5)
        expect(signalWithoutGale.getGale()).toBe(false)
        expect(signalWithoutGale.getType()).toBe('withoutGale')
        expect(signalWithoutGale.getTelegramChannelId()).toBe(123)
        expect(signalWithoutGale.getTelegramMessageId()).toBe(1234)
    })
})