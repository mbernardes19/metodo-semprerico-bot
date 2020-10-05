import MessageMapper from '../../src/mappers/MessageMapper';

describe('Signal Message Mapper', () => {
    it('should return a new Signal with gale from post message', () => {
        const message = `🌘 Rico Baladeiro 🌘

        💱 Par - GBPCAD
        
        💗 Ordem - PUT
        
        ⏳ Horário - 06:50
        
        Expiração: M5
        Se perder fazer no máximo 1 gale`;
        const signal = MessageMapper.toSignal({ texto: message, id: 123 });

        expect(signal.action).toBe('PUT');
        expect(signal.asset).toBe('GBPCAD');
        expect(signal.time).toBe('06:50');
        expect(signal.expiration).toBe(5);
        expect(signal.gale).toBe(true);
        expect(signal.telegramMessageId).toBe(123);
    })

    it('should return a new Signal without gale from post message', () => {
        const message = 
`⚡Sinal Flash⚡
Expiração - 5 Min
Horário - 12:00
        
Par c/ Ordem:
GBPUSD - CALL
        
⚠️ ATENÇÃO: Só entrar se a vela encerrar de PUT.
        
‼️SEM GALE ‼️`;
        const signal = MessageMapper.toSignal({ texto: message, id: 123 });

        expect(signal.action).toBe('CALL');
        expect(signal.asset).toBe('GBPUSD');
        expect(signal.time).toBe('12:00');
        expect(signal.expiration).toBe(5);
        expect(signal.gale).toBe(false);
        expect(signal.telegramMessageId).toBe(123);
    })
});