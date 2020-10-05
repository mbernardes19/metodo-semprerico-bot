import Signal from "../model/Signal";
import { SIGNAL_WITH_GALE, SIGNAL_WITHOUT_GALE } from "../utils/regex";

export default class MessageMapper {
    static toSignal(message: {texto: string, id: number}): Signal {
        try {
            const mensagem = message.texto.match(SIGNAL_WITH_GALE);
            if (mensagem.length < 3) {
              const mensagemWithoutGale = message.texto.match(SIGNAL_WITHOUT_GALE);
              console.log('MENSAGEM PARSEADA', mensagemWithoutGale);
              const asset = mensagemWithoutGale[1];
              const action = mensagemWithoutGale[2];
              const time = mensagemWithoutGale[0];
              const expiration = 5;
              const telegramMessageId = message.id
              const gale = false;
              return {asset, action, time, expiration, telegramMessageId, gale}
            } else {
              console.log('MENSAGEM PARSEADA', mensagem);
              const asset = mensagem[0];
              const action = mensagem[1];
              const time = mensagem[2];
              const expiration = 5;
              const telegramMessageId = message.id
              const gale = true;
              return {asset, action, time, expiration, telegramMessageId, gale}
            }
          } catch (err) {
            throw new Error(`Mensagem não tem padrão de sinal: ${message.texto}`);
          }
    }
}