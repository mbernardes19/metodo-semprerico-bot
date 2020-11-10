import Signal, { Asset } from "../model/Signal";
import { SIGNAL_WITH_GALE, SIGNAL_WITHOUT_GALE, FILTERING_SIGNAL } from "../utils/regex";

export default class MessageMapper {
    private static getAssetList(message: string[]): Asset[] {
      const assetsAndActions = message.slice(2);
      return assetsAndActions.map(assetAndAction => ({pair: assetAndAction.slice(0, 6), action: assetAndAction.match(/put|call/gmi)[0], inStrategy: true}))
    }

    static toSignal(message: {texto: string, id: number, channelId: number}): Signal {
        try {
            const mensagemWithoutGale = message.texto.match(SIGNAL_WITHOUT_GALE);
            const mensagemWithGale = message.texto.match(SIGNAL_WITH_GALE);
            const mensagemFiltering = message.texto.match(FILTERING_SIGNAL);
            if (mensagemWithoutGale[0].toLowerCase() === 'sinal flash' || mensagemWithoutGale[0].toLowerCase() === 'sinalflash') {
              if (process.env.SINAIS_SEM_GALE === 'true') {
                console.log('MENSAGEM PARSEADA', mensagemWithoutGale);
                const assetList = this.getAssetList(mensagemWithoutGale);
                const time = mensagemWithoutGale[1];
                const expiration = 5;
                const telegramMessageId = message.id
                const telegramChannelId = message.channelId
                const gale = false;
                return {assetList, time, type: 'withoutGale', expiration, telegramMessageId, telegramChannelId, gale}
              }
              return;
            } else if (mensagemFiltering[0].toLowerCase().includes('filtragem')) {
              console.log('MENSAGEM PARSEADA', mensagemFiltering);
              const pair = mensagemFiltering[1];
              const action = mensagemFiltering[2];
              const time = mensagemFiltering[3];
              const expiration = 5;
              const telegramMessageId = message.id
              const telegramChannelId = message.channelId
              const gale = true;
              return {assetList: [{pair, action, inStrategy: true}], time, type: 'filtering', expiration, telegramMessageId, telegramChannelId, gale}
            } else {
              console.log('MENSAGEM PARSEADA', mensagemWithGale);
              const pair = mensagemWithGale[0];
              const action = mensagemWithGale[1];
              const time = mensagemWithGale[2];
              const expiration = 5;
              const telegramMessageId = message.id
              const telegramChannelId = message.channelId
              const gale = true;
              return {assetList: [{pair, action, inStrategy: true}], time, type: 'withGale', expiration, telegramMessageId, telegramChannelId, gale}
            }
          } catch (err) {
            throw new Error(`Mensagem não tem padrão de sinal: ${message.texto}`);
          }
    }
}