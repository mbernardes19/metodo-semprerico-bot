import SignalValidator from '../../src/model/SignalValidator'
import Message from '../../src/model/Message';

describe('Signal Validator Service', () => {

    it('validates Signal With Gale (Sinais Ricos)', () => {
        const signalWithGale = `🎯 Sinais Ricos 🎯

        💵 Par - EURGBP
        
        ➡️ Ordem - CALL
        
        🕘 Horário - 08:15
        
        Expiração: M5
        Se perder fazer no máximo 1 gale`;

        const message: Message = {id: 12, text: signalWithGale, channelId: 123}
        const signalData = SignalValidator.validate(message);
        expect(signalData.type).toBe('withGale');
    })

    it('validates Signal With Gale (Rico Baladeiro)', () => {
        const signalWithGale = `🌘 Rico Baladeiro 🌘

        💱 Par - CADJPY
        
        💚 Ordem - CALL
        
        ⏳ Horário - 03:45
        
        Expiração: M5
        Se perder fazer no máximo 1 gale`;

        const message: Message = {id: 12, text: signalWithGale, channelId: 123}
        const signalData = SignalValidator.validate(message);
        expect(signalData.type).toBe('withGale');
    })

    it('validates Signal Without Gale', () => {
        const signalWithoutGale =
`⚡ Sinal Flash ⚡
Expiração: M5
Horário - 04:45
        
Par c/ Ordem: 
        
AUDJPY- CALL
AUDJPY- CALL
        
‼ SEM GALE‼`;

        const message: Message = {id: 12, text: signalWithoutGale, channelId: 123}
        const signalData = SignalValidator.validate(message);
        expect(signalData.type).toBe('withoutGale');
        expect(signalData.data).toStrictEqual(['Sinal Flash', '04:45', 'AUDJPY- CALL', 'AUDJPY- CALL'])
    })

    it('validates Filtering Signal', () => {
        const signalWithGale = `📜 Filtragem da Lista 📜

        💰 Par - USDJPY
        🎯 Ordem - CALL
        ⏰ Horário: 03:55
        Expiração: M5
        
        ⚠ Se perder fazer no máximo 1 gale`;

        const message: Message = {id: 12, text: signalWithGale, channelId: 123}
        const signalData = SignalValidator.validate(message);
        expect(signalData.type).toBe('filtering');
    })
});