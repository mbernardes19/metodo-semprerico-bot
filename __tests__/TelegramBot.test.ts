import TelegramBot from '../src/model/TelegramBot';
import Telegraf from 'telegraf';
import dotenv from 'dotenv';
import path from 'path';
import { TelegrafContext } from 'telegraf/typings/context';
dotenv.config({ path: path.join(__dirname, '..', '.env.test')})
import MessageMapper from '../src/mappers/MessageMapper';
import { SceneContextMessageUpdate } from 'telegraf/typings/stage';
import { log } from 'console';
import { differenceInMilliseconds, parseISO } from 'date-fns';
import { enviarSinalParaCompra } from '../src/app';
import { enviarEmailDeRelatorioDeErro } from '../src/email';
import Telegram from 'telegraf/telegram';

describe('TelegramBot', () => {
    let telegramBot: TelegramBot
    let mockedBotClient = new Telegraf(process.env.BOT_TOKEN) as jest.Mocked<Telegraf<TelegrafContext>>;

    beforeEach(() => {
        telegramBot = new TelegramBot(mockedBotClient);
    })

    it('should run ActionFunction ', async () => {
        const channelPostSpy = jest.spyOn(mockedBotClient, 'on');
        const actionFunction = async ctx => {
            console.log('hello world');
        }
        telegramBot.onChannelPost(actionFunction)
        expect(channelPostSpy).toHaveBeenCalledWith('channel_post', actionFunction);
    });

    it('should run ActionFunction 2', async () => {
        const spy = jest.spyOn(MessageMapper, 'toSignal');
        process.env.SINAIS_SINAIS_RICOS = 'true'
        process.env.SINAIS_RICO_VIDENTE = 'true'
        const actionFunction = async (ctx: TelegrafContext) => {
            if (ctx.channelPost.chat.id === parseInt(process.env.ID_CANAL_RICO_VIDENTE, 10)) {
              log('CANAL RICO VIDENTE');
            }
            if (ctx.channelPost.chat.id === parseInt(process.env.ID_CANAL_SINAIS_RICOS, 10)) {
              log('CANAL SINAIS RICOS');
            }
            log(`CTX MESSAGE, ${ctx.channelPost.text}`);
            let condition;
            if(process.env.SINAIS_SINAIS_RICOS === 'true' && process.env.SINAIS_RICO_VIDENTE === 'true') {
              condition = (ctx.channelPost.chat.id === parseInt(process.env.ID_CANAL_SINAIS_RICOS, 10) || ctx.channelPost.chat.id === parseInt(process.env.ID_CANAL_RICO_VIDENTE, 10)) && ctx.channelPost.text && (ctx.channelPost.text.includes('Sinal Flash') || ctx.channelPost.text.includes('Par - '));
            } else {
              if (process.env.SINAIS_SINAIS_RICOS === 'true') {
                condition = ctx.channelPost.chat.id === parseInt(process.env.ID_CANAL_SINAIS_RICOS, 10) && ctx.channelPost.text && ctx.channelPost.text.includes('Sinal Flash');
              }
              if (process.env.SINAIS_RICO_VIDENTE === 'true') {
                condition = ctx.channelPost.chat.id === parseInt(process.env.ID_CANAL_RICO_VIDENTE, 10) && ctx.channelPost.text && ctx.channelPost.text.includes('Par - ')
              }
            }
            if (condition) {
              try {
                const sinal = MessageMapper.toSignal({texto: ctx.channelPost.text, id: ctx.channelPost.message_id, channelId: ctx.channelPost.chat.id});
                const horaSinal = parseInt(sinal.time.substring(0, 2));
                const minutoSinal = parseInt(sinal.time.substring(3, 5));
                process.env.TZ = 'America/Sao_Paulo';
                const agora = new Date();
                const agoraStr = new Date().toISOString();
                console.log(horaSinal);
                console.log(minutoSinal);
                const sinalAgora = new Date(agora.getFullYear(), agora.getMonth(), agora.getDate(), horaSinal, minutoSinal, 0);
                const sinalAgoraStr = sinalAgora.toISOString();
          
                console.log('AGORA', agoraStr);
                console.log('SINALAGORA', sinalAgoraStr);
                const diff = Math.abs(differenceInMilliseconds(parseISO(agoraStr), parseISO(sinalAgoraStr)));
          
                console.log('DIFF', diff);
          
                let response;
          
                setTimeout(async () => {
                  response = await enviarSinalParaCompra(sinal);
                  if (response.status === 400) {
                    log('Par indisponível no momento');
                    return;
                  }
                  log(`Sinal enviado!`);
                }, diff);
              } catch (err) {
                await enviarEmailDeRelatorioDeErro(ctx.channelPost.text, ctx.chat.id.toString());
                log(err);
              }
            }
          }
          const context = new TelegrafContext({update_id: 123}, new Telegram());
        await actionFunction(context)
        expect(spy).toHaveBeenCalled()
    });
});