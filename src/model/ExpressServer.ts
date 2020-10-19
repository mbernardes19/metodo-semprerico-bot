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
import ngrok from 'ngrok';

export default class ExpressServer {
    private _express: Express;
    private _server: Server;
    private _bot: TelegramBot;
    private _port: number|string;

    constructor(bot?: TelegramBot) {
        this._bot = bot ? bot : new TelegramBot();
        if (process.env.NODE_ENV === 'production') {
            this._port = process.env.PORT_METODO_SEMPRERICO_BOT_DIST_APP || process.env.PORT_APP || 3000;
        } else {
            this._port = process.env.PORT_TESTE_METODO_SEMPRERICO_BOT_DIST_APP || 6001;
        }
        this._express = ExpressApp();
        if (process.env.NODE_ENV === 'production') {
          (async () => {
            const url = await ngrok.connect({ authtoken: '1bZwtwe9g8AI8iq74rFXyC0jVMV_5DoFRUPRT76UKzvWhqV6d', addr: this._port })
            log(url)
            this._express.use(cors());
            this._express.use(bodyParser.json());
            this._express.use(this._bot.getBot().webhookCallback('/secret'))
            await this._bot.getBot().telegram.setWebhook(url + '/secret')
            const info1 = await bot.getBot().telegram.getWebhookInfo()
            log(info1)
            this._express.listen(this._port, () => log(`Servidor rodando na porta ${this._port}`));
          })()
        } else {
          (async () => {
            const url = await ngrok.connect(6001)
            log(url)
            this._express.use(this._bot.getBot().webhookCallback('/secret'))
            await this._bot.getBot().telegram.setWebhook(url + '/secret')
            this._express.use(cors());
            this._express.use(bodyParser.json());
            const info1 = await bot.getBot().telegram.getWebhookInfo()
            log(info1)
            this._express.listen(this._port, () => log(`Servidor rodando na porta ${this._port}`));    
          })()
        }
    }

    init() {
        this._express.get('/', (req, res) => {
            res.status(200).send('<h1>Olá!</h1>');
        });
        this._express.get('/App', (req, res) => {
          res.status(200).send('<h1>Olá App!</h1>');
        })
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
        this._express.post('/App/operation-result', async (req, res) => {
            const telegramClient = this._bot.getTelegramClient();
            const channelMessageId = req.body.telegramMessageId
            const channelToSend = req.body.telegramChannelId;
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
          
            console.log('MESSAGE ID',channelMessageId)
            console.log('CHANNEL TO SEND', channelToSend)
          
            const resultadoOperacao = req.body
            if (resultadoOperacao.result === 'WIN') {
              const [MENSAGEM_WIN] = await dao.pegarMensagem(channelToSend, 'win', conexaoDb);
              const [STICKER_WIN] = await dao.pegarSticker(channelToSend, 'win', conexaoDb);
              log('WIN');
              res.status(200).send({message: `Operation result sent to channel ${channelToSend}`, messageToReply: channelMessageId});
              await telegramClient.sendMessage(channelToSend, MENSAGEM_WIN.texto, Extra.inReplyTo(channelMessageId));
              await telegramClient.sendSticker(channelToSend, STICKER_WIN.texto, Extra.inReplyTo(channelMessageId));
              return;
            }
            if (resultadoOperacao.result === 'LOSS') {
              const [MENSAGEM_LOSS] = await dao.pegarMensagem(channelToSend, 'loss', conexaoDb);
              const [STICKER_LOSS] = await dao.pegarSticker(channelToSend, 'loss', conexaoDb);
              log('LOSS');
              res.status(200).send({message: `Operation result sent to channel ${channelToSend}`, messageToReply: channelMessageId});
              await telegramClient.sendMessage(channelToSend, MENSAGEM_LOSS.texto, Extra.inReplyTo(channelMessageId));
              await telegramClient.sendSticker(channelToSend, STICKER_LOSS.texto, Extra.inReplyTo(channelMessageId));
              return;
            }
            if (resultadoOperacao.result === 'DOJI') {
              const [MENSAGEM_LOSS] = await dao.pegarMensagem(channelToSend, 'loss', conexaoDb);
              const [STICKER_LOSS] = await dao.pegarSticker(channelToSend, 'loss', conexaoDb);
              const [MENSAGEM_DOJI] = await dao.pegarMensagem(channelToSend, 'doji', conexaoDb);
              log('DOJI LOSS');
              res.status(200).send({message: `Operation result sent to channel ${channelToSend}`, messageToReply: channelMessageId});
              await telegramClient.sendMessage(channelToSend, MENSAGEM_LOSS.texto, Extra.inReplyTo(channelMessageId));
              await telegramClient.sendSticker(channelToSend, STICKER_LOSS.texto, Extra.inReplyTo(channelMessageId));
              await telegramClient.sendMessage(channelToSend, MENSAGEM_DOJI.texto, Extra.inReplyTo(channelMessageId));
              return;
            }
          });
          
          this._express.post('/App/signal-failed', async (req, res) => {
            await this._bot.getTelegramClient().sendMessage(721557882, req.body.message)
            await this._bot.getTelegramClient().sendMessage(923769783, req.body.message)
            res.status(200).send();
          });
    }

    private startMessageEditingEndpointsRicoVidente() {
        this._express.post('/App/RV-mensagem-win', async (req, res) => {
            log(req.body);
            const { mensagemWin } = req.body;
            try {
              await dao.atualizarMensagem(process.env.ID_CANAL_RICO_VIDENTE, 'win', mensagemWin, conexaoDb);
              res.set('Access-Control-Allow-Origin', '*');
              res.sendStatus(200);
            } catch (err) {
              await enviarEmailDeRelatorioDeErro(err);
              log(err);
              res.sendStatus(500);
            }
          });
          
          this._express.post('/App/RV-sticker-win', async (req, res) => {
            const { stickerWin } = req.body;
            try {
              await dao.atualizarSticker(process.env.ID_CANAL_RICO_VIDENTE, 'win', stickerWin, conexaoDb);
              res.set('Access-Control-Allow-Origin', '*');
              res.sendStatus(200);
            } catch (err) {
              await enviarEmailDeRelatorioDeErro(err);
              log(err);
              res.sendStatus(500);
            }
          });
          
          this._express.post('/App/RV-mensagem-loss', async (req, res) => {
            const { mensagemLoss } = req.body;
            try {
              await dao.atualizarMensagem(process.env.ID_CANAL_RICO_VIDENTE, 'loss', mensagemLoss, conexaoDb);
              res.set('Access-Control-Allow-Origin', '*');
              res.sendStatus(200);
            } catch (err) {
              await enviarEmailDeRelatorioDeErro(err);
              log(err);
              res.sendStatus(500);
            }
          });
          
          this._express.post('/App/RV-sticker-loss', async (req, res) => {
            const { stickerLoss } = req.body;
            try {
              await dao.atualizarSticker(process.env.ID_CANAL_RICO_VIDENTE, 'loss', stickerLoss, conexaoDb);
              res.set('Access-Control-Allow-Origin', '*');
              res.sendStatus(200);
            } catch (err) {
              await enviarEmailDeRelatorioDeErro(err);
              res.sendStatus(500);
            }
          });
          
          this._express.post('/App/RV-mensagem-doji', async (req, res) => {
            const { mensagemDoji } = req.body;
            try {
              await dao.atualizarMensagem(process.env.ID_CANAL_RICO_VIDENTE, 'doji', mensagemDoji, conexaoDb);
              res.set('Access-Control-Allow-Origin', '*');
              res.sendStatus(200);
            } catch (err) {
              await enviarEmailDeRelatorioDeErro(err);
              res.sendStatus(500);
            }
          });
          
          this._express.get('/App/RV-mensagem-win', async (req, res) => {
            try {
              const [mensagemWin] = await dao.pegarMensagem(process.env.ID_CANAL_RICO_VIDENTE, 'win', conexaoDb);
              res.set('Access-Control-Allow-Origin', '*');
              res.status(200).json({ id: mensagemWin.id, texto: mensagemWin.texto });
            } catch (err) {
              await enviarEmailDeRelatorioDeErro(err);
              log(err);
              res.sendStatus(500);
            }
          });
          
          this._express.get('/App/RV-sticker-win', async (req, res) => {
            try {
              const [stickerWin] = await dao.pegarSticker(process.env.ID_CANAL_RICO_VIDENTE, 'win', conexaoDb);
              res.set('Access-Control-Allow-Origin', '*');
              res.status(200).json({ id: stickerWin.id, texto: stickerWin.texto });
            } catch (err) {
              await enviarEmailDeRelatorioDeErro(err);
              log(err);
              res.sendStatus(500);
            }
          });
          
          this._express.get('/App/RV-mensagem-loss', async (req, res) => {
            try {
              const [mensagemLoss] = await dao.pegarMensagem(process.env.ID_CANAL_RICO_VIDENTE, 'loss', conexaoDb);
              res.set('Access-Control-Allow-Origin', '*');
              res.status(200).json({ id: mensagemLoss.id, texto: mensagemLoss.texto });
            } catch (err) {
              await enviarEmailDeRelatorioDeErro(err);
              log(err);
              res.sendStatus(500);
            }
          });
          
          this._express.get('/App/RV-sticker-loss', async (req, res) => {
            try {
              const [stickerLoss] = await dao.pegarSticker(process.env.ID_CANAL_RICO_VIDENTE, 'loss', conexaoDb);
              res.set('Access-Control-Allow-Origin', '*');
              res.status(200).json({ id: stickerLoss.id, texto: stickerLoss.texto });
            } catch (err) {
              await enviarEmailDeRelatorioDeErro(err);
              res.sendStatus(500);
            }
          });
          
          this._express.get('/App/RV-mensagem-doji', async (req, res) => {
            try {
              const [mensagemDoji] = await dao.pegarMensagem(process.env.ID_CANAL_RICO_VIDENTE, 'doji', conexaoDb);
              res.set('Access-Control-Allow-Origin', '*');
              res.status(200).json({ id: mensagemDoji.id, texto: mensagemDoji.texto });
            } catch (err) {
              await enviarEmailDeRelatorioDeErro(err);
              res.sendStatus(500);
            }
          });
    }

    private startMessageEditingEndpointsSinaisRicos() {
      this._express.post('/App/SR-mensagem-win', async (req, res) => {
          log(req.body);
          const { mensagemWin } = req.body;
          try {
            await dao.atualizarMensagem(process.env.ID_CANAL_SINAIS_RICOS, 'win', mensagemWin, conexaoDb);
            res.set('Access-Control-Allow-Origin', '*');
            res.sendStatus(200);
          } catch (err) {
            await enviarEmailDeRelatorioDeErro(err);
            log(err);
            res.sendStatus(500);
          }
        });
        
        this._express.post('/App/SR-sticker-win', async (req, res) => {
          const { stickerWin } = req.body;
          try {
            await dao.atualizarSticker(process.env.ID_CANAL_SINAIS_RICOS, 'win', stickerWin, conexaoDb);
            res.set('Access-Control-Allow-Origin', '*');
            res.sendStatus(200);
          } catch (err) {
            await enviarEmailDeRelatorioDeErro(err);
            log(err);
            res.sendStatus(500);
          }
        });
        
        this._express.post('/App/SR-mensagem-loss', async (req, res) => {
          const { mensagemLoss } = req.body;
          try {
            await dao.atualizarMensagem(process.env.ID_CANAL_SINAIS_RICOS, 'loss', mensagemLoss, conexaoDb);
            res.set('Access-Control-Allow-Origin', '*');
            res.sendStatus(200);
          } catch (err) {
            await enviarEmailDeRelatorioDeErro(err);
            log(err);
            res.sendStatus(500);
          }
        });
        
        this._express.post('/App/SR-sticker-loss', async (req, res) => {
          const { stickerLoss } = req.body;
          try {
            await dao.atualizarSticker(process.env.ID_CANAL_SINAIS_RICOS, 'loss', stickerLoss, conexaoDb);
            res.set('Access-Control-Allow-Origin', '*');
            res.sendStatus(200);
          } catch (err) {
            await enviarEmailDeRelatorioDeErro(err);
            res.sendStatus(500);
          }
        });
        
        this._express.post('/App/SR-mensagem-doji', async (req, res) => {
          const { mensagemDoji } = req.body;
          try {
            await dao.atualizarMensagem(process.env.ID_CANAL_SINAIS_RICOS, 'doji', mensagemDoji, conexaoDb);
            res.set('Access-Control-Allow-Origin', '*');
            res.sendStatus(200);
          } catch (err) {
            await enviarEmailDeRelatorioDeErro(err);
            res.sendStatus(500);
          }
        });

        this._express.post('/App/SR-mensagem-automatica', async (req, res) => {
          const { mensagemAutomatica } = req.body;
          try {
            await dao.atualizarMensagem(process.env.ID_CANAL_SINAIS_RICOS, 'automatica', mensagemAutomatica, conexaoDb);
            res.set('Access-Control-Allow-Origin', '*');
            res.sendStatus(200);
          } catch (err) {
            await enviarEmailDeRelatorioDeErro(err);
            res.sendStatus(500);
          }
        });

        this._express.post('/App/SR-sticker-automatico', async (req, res) => {
          const { stickerAutomatico } = req.body;
          try {
            await dao.atualizarSticker(process.env.ID_CANAL_SINAIS_RICOS, 'automatico', stickerAutomatico, conexaoDb);
            res.set('Access-Control-Allow-Origin', '*');
            res.sendStatus(200);
          } catch (err) {
            await enviarEmailDeRelatorioDeErro(err);
            res.sendStatus(500);
          }
        });
        
        this._express.get('/App/SR-mensagem-win', async (req, res) => {
          try {
            const [mensagemWin] = await dao.pegarMensagem(process.env.ID_CANAL_SINAIS_RICOS, 'win', conexaoDb);
            res.set('Access-Control-Allow-Origin', '*');
            res.status(200).json({ id: mensagemWin.id, texto: mensagemWin.texto });
          } catch (err) {
            await enviarEmailDeRelatorioDeErro(err);
            log(err);
            res.sendStatus(500);
          }
        });
        
        this._express.get('/App/SR-sticker-win', async (req, res) => {
          try {
            const [stickerWin] = await dao.pegarSticker(process.env.ID_CANAL_SINAIS_RICOS, 'win', conexaoDb);
            res.set('Access-Control-Allow-Origin', '*');
            res.status(200).json({ id: stickerWin.id, texto: stickerWin.texto });
          } catch (err) {
            await enviarEmailDeRelatorioDeErro(err);
            log(err);
            res.sendStatus(500);
          }
        });
        
        this._express.get('/App/SR-mensagem-loss', async (req, res) => {
          try {
            const [mensagemLoss] = await dao.pegarMensagem(process.env.ID_CANAL_SINAIS_RICOS, 'loss', conexaoDb);
            res.set('Access-Control-Allow-Origin', '*');
            res.status(200).json({ id: mensagemLoss.id, texto: mensagemLoss.texto });
          } catch (err) {
            await enviarEmailDeRelatorioDeErro(err);
            log(err);
            res.sendStatus(500);
          }
        });
        
        this._express.get('/App/SR-sticker-loss', async (req, res) => {
          try {
            const [stickerLoss] = await dao.pegarSticker(process.env.ID_CANAL_SINAIS_RICOS, 'loss', conexaoDb);
            res.set('Access-Control-Allow-Origin', '*');
            res.status(200).json({ id: stickerLoss.id, texto: stickerLoss.texto });
          } catch (err) {
            await enviarEmailDeRelatorioDeErro(err);
            res.sendStatus(500);
          }
        });
        
        this._express.get('/App/SR-mensagem-doji', async (req, res) => {
          try {
            const [mensagemDoji] = await dao.pegarMensagem(process.env.ID_CANAL_SINAIS_RICOS, 'doji', conexaoDb);
            res.set('Access-Control-Allow-Origin', '*');
            res.status(200).json({ id: mensagemDoji.id, texto: mensagemDoji.texto });
          } catch (err) {
            await enviarEmailDeRelatorioDeErro(err);
            res.sendStatus(500);
          }
        });

        this._express.get('/App/SR-mensagem-automatica', async (req, res) => {
          try {
            const [mensagemAutomatica] = await dao.pegarMensagem(process.env.ID_CANAL_SINAIS_RICOS, 'automatica', conexaoDb);
            res.set('Access-Control-Allow-Origin', '*');
            res.status(200).json({ id: mensagemAutomatica.id, texto: mensagemAutomatica.texto });
          } catch (err) {
            await enviarEmailDeRelatorioDeErro(err);
            res.sendStatus(500);
          }
        });

        this._express.get('/App/SR-sticker-automatico', async (req, res) => {
          try {
            const [stickerAutomatico] = await dao.pegarSticker(process.env.ID_CANAL_SINAIS_RICOS, 'automatico', conexaoDb);
            res.set('Access-Control-Allow-Origin', '*');
            res.status(200).json({ id: stickerAutomatico.id, texto: stickerAutomatico.texto });
          } catch (err) {
            await enviarEmailDeRelatorioDeErro(err);
            res.sendStatus(500);
          }
        });
  }
}