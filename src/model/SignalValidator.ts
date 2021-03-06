import Message from "./Message";
import { SIGNAL_WITHOUT_GALE, SIGNAL_WITH_GALE, FILTERING_SIGNAL, EXTRA_ANALYSIS, SINAIS_RICOS_SIGNAL } from "../utils/regex";
import { SignalData } from "./Signals/Signal";

export default class SignalValidator {
    private static isSignalWithoutGale(message: Message) {
        const result = message.text.match(SIGNAL_WITHOUT_GALE)
        return result[0].toLowerCase() === 'sinal flash' || result[0].toLowerCase() === 'sinalflash' ? true : false
    }
    private static isSignalWithGale(message: Message) {
        const result = message.text.match(SIGNAL_WITH_GALE)
        return result[0].toLowerCase() === 'rico baladeiro' ? true : false
    }
    private static isSinaisRicosSignal(message: Message) {
        const result = message.text.match(SINAIS_RICOS_SIGNAL)
        return result[0].toLowerCase() === 'sinais ricos' ? true : false
    }
    private static isFilteringSignal(message: Message) {
        const result = message.text.match(FILTERING_SIGNAL)
        return result[0].toLowerCase().includes('filtragem') ? true : false
    }
    private static isExtraAnalysisSignal(message: Message) {
        const result = message.text.match(EXTRA_ANALYSIS)
        return result[0].toLowerCase().includes('análise extra') || result[0].toLowerCase().includes('analise extra')
    }

    static validate(message: Message): SignalData {
        try {
            if (this.isSignalWithoutGale(message)) {
                console.log('PARSED MESSAGE', message.text.match(SIGNAL_WITHOUT_GALE))
                return {
                    type: 'withoutGale',
                    data: message.text.match(SIGNAL_WITHOUT_GALE),
                    telegramMessageId: message.id,
                    telegramChannelId: message.channelId
                }
            }
            if (this.isSignalWithGale(message)) {
                console.log('PARSED MESSAGE', message.text.match(SIGNAL_WITH_GALE))
                return {
                    type: 'withGale',
                    data: message.text.match(SIGNAL_WITH_GALE),
                    telegramMessageId: message.id,
                    telegramChannelId: message.channelId
                }
            }
            if (this.isSinaisRicosSignal(message)) {
                console.log('PARSED MESSAGE', message.text.match(SINAIS_RICOS_SIGNAL))
                return {
                    type: 'sinaisRicos',
                    data: message.text.match(SINAIS_RICOS_SIGNAL),
                    telegramMessageId: message.id,
                    telegramChannelId: message.channelId
                }
            }
            if (this.isFilteringSignal(message)) {
                console.log('PARSED MESSAGE', message.text.match(FILTERING_SIGNAL))
                return {
                    type: 'filtering',
                    data: message.text.match(FILTERING_SIGNAL),
                    telegramMessageId: message.id,
                    telegramChannelId: message.channelId
                }
            }
            if (this.isExtraAnalysisSignal(message)) {
                console.log('PARSED MESSAGE', message.text.match(EXTRA_ANALYSIS))
                return {
                    type: 'extraAnalysis',
                    data: message.text.match(EXTRA_ANALYSIS),
                    telegramMessageId: message.id,
                    telegramChannelId: message.channelId
                }
            }
            throw Error('Message not in any Signal pattern')
        } catch (err) {
            throw Error('Message not in any Signal pattern')
        }

    }
}