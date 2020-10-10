import ExpressApp, { Express } from 'express';
import { log } from '../servicos/logger';
import bodyParser from 'body-parser';
import cors from 'cors';
import TelegramBot from './TelegramBot';
import Extra from 'telegraf/extra';
import { conexaoDb } from '../db';
import dao from '../dao';
import { enviarEmailDeRelatorioDeErro } from '../email'
import { Server } from 'http';

export default class ExpressServer {
    private _express: Express;
    private _server: Server;
    private _bot: TelegramBot;
    private _port: number|string;

    constructor(bot?: TelegramBot) {
        this._bot = bot ? bot : new TelegramBot();
        if (process.env.NODE_ENV === 'production') {
            this._port = process.env.PORT_METODO_SEMPRERICO_BOT_SRC_APP || process.env.PORT_APP || 3000;
        } else {
            this._port = process.env.PORT_TESTE_METODO_SEMPRERICO_BOT_SRC_APP || 6001;
        }
        this._express = ExpressApp();
        this._express.use(cors());
        this._express.use(bodyParser.json());
        this._server = this._express.listen(this._port, () => log(`Servidor rodando na porta ${this._port}`));         
    }

    init() {
        this._express.get('/', (req, res) => {
            res.status(200).send('<h1>Olá!</h1>');
        });
        this.startTradingApiEndpoints()
        this.startMessageEditingEndpointsRicoVidente();
        this.startMessageEditingEndpointsSinaisRicos();
    }

    getExpressServer() {
        return this._express;
    }

    getServer() {
      return this._server;
  }
    
    private startTradingApiEndpoints() {
        this._express.post('/operation-result', async (req, res) => {
            const telegramClient = this._bot.getTelegramClient();
            const channelMessageId = req.body.telegramMessageId
            const channelToSend = process.env.CANAL_SINAIS;
            const hasGale = req.body.gale;
          
            if (!hasGale) {
              log('NO GALE')
              const winMessage = '⚡💰⚡';
              const lossMessage = '⚡❌⚡';
          
              console.log('MESSAGE ID', channelMessageId)
              console.log('CHANNEL TO SEND', channelToSend)
            
              const resultadoOperacao = req.body
              if (resultadoOperacao.result === 'WIN') {
                log('WIN');
                res.status(200).send({message: `Operation result sent to channel ${channelToSend}`, messageToReply: channelMessageId});
                await telegramClient.sendMessage(channelToSend, winMessage, Extra.inReplyTo(channelMessageId));
                return;
              }
              if (resultadoOperacao.result === 'LOSS') {
                log('LOSS');
                res.status(200).send({message: `Operation result sent to channel ${channelToSend}`, messageToReply: channelMessageId});
                await telegramClient.sendMessage(channelToSend, lossMessage, Extra.inReplyTo(channelMessageId));
                return;
              }
              if (resultadoOperacao.result === 'DOJI') {
                log('DOJI LOSS');
                res.status(200).send({message: `Operation result sent to channel ${channelToSend}`, messageToReply: channelMessageId});
                await telegramClient.sendMessage(channelToSend, lossMessage, Extra.inReplyTo(channelMessageId));
                return;
              }
            }

            log('GALE')
          
            const [MENSAGEM_WIN] = await dao.pegarMensagem('win', conexaoDb);
            const [STICKER_WIN] = await dao.pegarSticker('win', conexaoDb);
            const [MENSAGEM_LOSS] = await dao.pegarMensagem('loss', conexaoDb);
            const [STICKER_LOSS] = await dao.pegarSticker('loss', conexaoDb);
            const [MENSAGEM_DOJI] = await dao.pegarMensagem('doji', conexaoDb);
          
            console.log('MESSAGE ID',channelMessageId)
            console.log('CHANNEL TO SEND', channelToSend)
          
            const resultadoOperacao = req.body
            if (resultadoOperacao.result === 'WIN') {
              log('WIN');
              res.status(200).send({message: `Operation result sent to channel ${channelToSend}`, messageToReply: channelMessageId});
              await telegramClient.sendMessage(channelToSend, MENSAGEM_WIN.texto, Extra.inReplyTo(channelMessageId));
              await telegramClient.sendSticker(channelToSend, STICKER_WIN.texto, Extra.inReplyTo(channelMessageId));
              return;
            }
            if (resultadoOperacao.result === 'LOSS') {
              log('LOSS');
              res.status(200).send({message: `Operation result sent to channel ${channelToSend}`, messageToReply: channelMessageId});
              await telegramClient.sendMessage(channelToSend, MENSAGEM_LOSS.texto, Extra.inReplyTo(channelMessageId));
              await telegramClient.sendSticker(channelToSend, STICKER_LOSS.texto, Extra.inReplyTo(channelMessageId));
              return;
            }
            if (resultadoOperacao.result === 'DOJI') {
              log('DOJI LOSS');
              res.status(200).send({message: `Operation result sent to channel ${channelToSend}`, messageToReply: channelMessageId});
              await telegramClient.sendMessage(channelToSend, MENSAGEM_LOSS.texto, Extra.inReplyTo(channelMessageId));
              await telegramClient.sendSticker(channelToSend, STICKER_LOSS.texto, Extra.inReplyTo(channelMessageId));
              await telegramClient.sendMessage(channelToSend, MENSAGEM_DOJI.texto, Extra.inReplyTo(channelMessageId));
              return;
            }
          });
          
          this._express.post('/signal-failed', async (req, res) => {
            await this._bot.getTelegramClient().sendMessage(721557882, req.body.message)
            await this._bot.getTelegramClient().sendMessage(923769783, req.body.message)
            res.status(200).send();
          });
    }

    private startMessageEditingEndpointsRicoVidente() {
        this._express.post('/RV-mensagem-win', async (req, res) => {
            log(req.body);
            const { mensagemWin } = req.body;
            try {
              await dao.atualizarMensagem('RV', 'win', mensagemWin, conexaoDb);
              res.set('Access-Control-Allow-Origin', '*');
              res.sendStatus(200);
            } catch (err) {
              await enviarEmailDeRelatorioDeErro(err);
              log(err);
              res.sendStatus(500);
            }
          });
          
          this._express.post('/RV-sticker-win', async (req, res) => {
            const { stickerWin } = req.body;
            try {
              await dao.atualizarSticker('RV', 'win', stickerWin, conexaoDb);
              res.set('Access-Control-Allow-Origin', '*');
              res.sendStatus(200);
            } catch (err) {
              await enviarEmailDeRelatorioDeErro(err);
              log(err);
              res.sendStatus(500);
            }
          });
          
          this._express.post('/RV-mensagem-loss', async (req, res) => {
            const { mensagemLoss } = req.body;
            try {
              await dao.atualizarMensagem('RV', 'loss', mensagemLoss, conexaoDb);
              res.set('Access-Control-Allow-Origin', '*');
              res.sendStatus(200);
            } catch (err) {
              await enviarEmailDeRelatorioDeErro(err);
              log(err);
              res.sendStatus(500);
            }
          });
          
          this._express.post('/RV-sticker-loss', async (req, res) => {
            const { stickerLoss } = req.body;
            try {
              await dao.atualizarSticker('RV', 'loss', stickerLoss, conexaoDb);
              res.set('Access-Control-Allow-Origin', '*');
              res.sendStatus(200);
            } catch (err) {
              await enviarEmailDeRelatorioDeErro(err);
              res.sendStatus(500);
            }
          });
          
          this._express.post('/RV-mensagem-doji', async (req, res) => {
            const { mensagemDoji } = req.body;
            try {
              await dao.atualizarMensagem('RV', 'doji', mensagemDoji, conexaoDb);
              res.set('Access-Control-Allow-Origin', '*');
              res.sendStatus(200);
            } catch (err) {
              await enviarEmailDeRelatorioDeErro(err);
              res.sendStatus(500);
            }
          });
          
          this._express.get('/RV-mensagem-win', async (req, res) => {
            try {
              const [mensagemWin] = await dao.pegarMensagem('RV', 'win', conexaoDb);
              res.set('Access-Control-Allow-Origin', '*');
              res.status(200).json({ id: mensagemWin.id, texto: mensagemWin.texto });
            } catch (err) {
              await enviarEmailDeRelatorioDeErro(err);
              log(err);
              res.sendStatus(500);
            }
          });
          
          this._express.get('/RV-sticker-win', async (req, res) => {
            try {
              const [stickerWin] = await dao.pegarSticker('RV', 'win', conexaoDb);
              res.set('Access-Control-Allow-Origin', '*');
              res.status(200).json({ id: stickerWin.id, texto: stickerWin.texto });
            } catch (err) {
              await enviarEmailDeRelatorioDeErro(err);
              log(err);
              res.sendStatus(500);
            }
          });
          
          this._express.get('/RV-mensagem-loss', async (req, res) => {
            try {
              const [mensagemLoss] = await dao.pegarMensagem('RV', 'loss', conexaoDb);
              res.set('Access-Control-Allow-Origin', '*');
              res.status(200).json({ id: mensagemLoss.id, texto: mensagemLoss.texto });
            } catch (err) {
              await enviarEmailDeRelatorioDeErro(err);
              log(err);
              res.sendStatus(500);
            }
          });
          
          this._express.get('/RV-sticker-loss', async (req, res) => {
            try {
              const [stickerLoss] = await dao.pegarSticker('RV', 'loss', conexaoDb);
              res.set('Access-Control-Allow-Origin', '*');
              res.status(200).json({ id: stickerLoss.id, texto: stickerLoss.texto });
            } catch (err) {
              await enviarEmailDeRelatorioDeErro(err);
              res.sendStatus(500);
            }
          });
          
          this._express.get('/RV-mensagem-doji', async (req, res) => {
            try {
              const [mensagemDoji] = await dao.pegarMensagem('RV', 'doji', conexaoDb);
              res.set('Access-Control-Allow-Origin', '*');
              res.status(200).json({ id: mensagemDoji.id, texto: mensagemDoji.texto });
            } catch (err) {
              await enviarEmailDeRelatorioDeErro(err);
              res.sendStatus(500);
            }
          });
    }

    private startMessageEditingEndpointsSinaisRicos() {
      this._express.post('/SR-mensagem-win', async (req, res) => {
          log(req.body);
          const { mensagemWin } = req.body;
          try {
            await dao.atualizarMensagem('SR', 'win', mensagemWin, conexaoDb);
            res.set('Access-Control-Allow-Origin', '*');
            res.sendStatus(200);
          } catch (err) {
            await enviarEmailDeRelatorioDeErro(err);
            log(err);
            res.sendStatus(500);
          }
        });
        
        this._express.post('/SR-sticker-win', async (req, res) => {
          const { stickerWin } = req.body;
          try {
            await dao.atualizarSticker('SR', 'win', stickerWin, conexaoDb);
            res.set('Access-Control-Allow-Origin', '*');
            res.sendStatus(200);
          } catch (err) {
            await enviarEmailDeRelatorioDeErro(err);
            log(err);
            res.sendStatus(500);
          }
        });
        
        this._express.post('/SR-mensagem-loss', async (req, res) => {
          const { mensagemLoss } = req.body;
          try {
            await dao.atualizarMensagem('SR', 'loss', mensagemLoss, conexaoDb);
            res.set('Access-Control-Allow-Origin', '*');
            res.sendStatus(200);
          } catch (err) {
            await enviarEmailDeRelatorioDeErro(err);
            log(err);
            res.sendStatus(500);
          }
        });
        
        this._express.post('/SR-sticker-loss', async (req, res) => {
          const { stickerLoss } = req.body;
          try {
            await dao.atualizarSticker('SR', 'loss', stickerLoss, conexaoDb);
            res.set('Access-Control-Allow-Origin', '*');
            res.sendStatus(200);
          } catch (err) {
            await enviarEmailDeRelatorioDeErro(err);
            res.sendStatus(500);
          }
        });
        
        this._express.post('/SR-mensagem-doji', async (req, res) => {
          const { mensagemDoji } = req.body;
          try {
            await dao.atualizarMensagem('SR', 'doji', mensagemDoji, conexaoDb);
            res.set('Access-Control-Allow-Origin', '*');
            res.sendStatus(200);
          } catch (err) {
            await enviarEmailDeRelatorioDeErro(err);
            res.sendStatus(500);
          }
        });
        
        this._express.get('/SR-mensagem-win', async (req, res) => {
          try {
            const [mensagemWin] = await dao.pegarMensagem('SR', 'win', conexaoDb);
            res.set('Access-Control-Allow-Origin', '*');
            res.status(200).json({ id: mensagemWin.id, texto: mensagemWin.texto });
          } catch (err) {
            await enviarEmailDeRelatorioDeErro(err);
            log(err);
            res.sendStatus(500);
          }
        });
        
        this._express.get('/SR-sticker-win', async (req, res) => {
          try {
            const [stickerWin] = await dao.pegarSticker('SR', 'win', conexaoDb);
            res.set('Access-Control-Allow-Origin', '*');
            res.status(200).json({ id: stickerWin.id, texto: stickerWin.texto });
          } catch (err) {
            await enviarEmailDeRelatorioDeErro(err);
            log(err);
            res.sendStatus(500);
          }
        });
        
        this._express.get('/SR-mensagem-loss', async (req, res) => {
          try {
            const [mensagemLoss] = await dao.pegarMensagem('SR', 'loss', conexaoDb);
            res.set('Access-Control-Allow-Origin', '*');
            res.status(200).json({ id: mensagemLoss.id, texto: mensagemLoss.texto });
          } catch (err) {
            await enviarEmailDeRelatorioDeErro(err);
            log(err);
            res.sendStatus(500);
          }
        });
        
        this._express.get('/SR-sticker-loss', async (req, res) => {
          try {
            const [stickerLoss] = await dao.pegarSticker('SR', 'loss', conexaoDb);
            res.set('Access-Control-Allow-Origin', '*');
            res.status(200).json({ id: stickerLoss.id, texto: stickerLoss.texto });
          } catch (err) {
            await enviarEmailDeRelatorioDeErro(err);
            res.sendStatus(500);
          }
        });
        
        this._express.get('/SR-mensagem-doji', async (req, res) => {
          try {
            const [mensagemDoji] = await dao.pegarMensagem('SR', 'doji', conexaoDb);
            res.set('Access-Control-Allow-Origin', '*');
            res.status(200).json({ id: mensagemDoji.id, texto: mensagemDoji.texto });
          } catch (err) {
            await enviarEmailDeRelatorioDeErro(err);
            res.sendStatus(500);
          }
        });
  }
}