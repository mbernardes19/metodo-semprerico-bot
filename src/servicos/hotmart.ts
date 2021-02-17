import HttpService from "./http"
import dao from "../dao";
import { conexaoDb } from "../db";
import { log } from "./logger";

type HotmartCredential = {
    accessToken: string,
    jti: string,
}

type HotmartGetSubscriptionsOptions = {
    max_results?: number,
    page_token?: string,
    product_id?: number,
    plan?: string[],
    accession_date?: number,
    end_accession_date?: number,
    status?: string,
    subscriber_code?: string,
    subscriber_email?: string,
    transaction?: string,
    trial?: boolean,
    cancelation_date?: number,
    end_cancelation_date?: number,
}

export enum HotmartSubscriptionStatus {
    ACTIVE ='ACTIVE',
    INACTIVE = 'INACTIVE',
    DELAYED = 'DELAYED',
    CANCELLED_BY_CUSTOMER = 'CANCELLED_BY_CUSTOMER',
    CANCELLED_BY_SELLER = 'CANCELLED_BY_SELLER',
    CANCELLED_BY_ADMIN = 'CANCELLED_BY_ADMIN',
    STARTED = 'STARTED',
    OVERDUE = 'OVERDUE',
}

export default class HotmartService {
    private _httpService: HttpService;
    private _credential: HotmartCredential = {
        accessToken: 'xyz',
        jti: '123',
    };
    private _clientId: string;
    private _clientSecret: string;
    private _basic: string;

    constructor(isProd?: boolean) {
        if (isProd) {
            this._clientId = process.env.HOTMART_CLIENT_ID;
            this._clientSecret = process.env.HOTMART_CLIENT_SECRET;
            this._basic = process.env.HOTMART_BASIC;
            this._httpService = new HttpService('https://developers.hotmart.com');
        } else {
            this._clientId = process.env.HOTMART_SANDBOX_CLIENT_ID;
            this._clientSecret = process.env.HOTMART_SANDBOX_CLIENT_SECRET;
            this._basic = process.env.HOTMART_SANDBOX_BASIC;
            this._httpService = new HttpService('https://sandbox.hotmart.com');
        }
    }

    async authenticate() {
        const response = await HttpService.post(
            `https://api-sec-vlc.hotmart.com/security/oauth/token?grant_type=client_credentials&client_id=${this._clientId}&client_secret=${this._clientSecret}`,
            [],
            {
                'Content-Type': 'application/json',
                'Authorization': `Basic ${this._basic}`
            }
        )
        console.log(response);
        this.setCredential(response);
    }

    private setCredential(authenticationResponse) {
        this._credential.accessToken = authenticationResponse.access_token;
        this._credential.jti = authenticationResponse.jti;
    }

    async getSubscriptions(options: HotmartGetSubscriptionsOptions) {
        const qs = this._queryStringFromOptions(options);
        try {
            return await this._httpService.get(`/payments/api/v1/subscriptions?${qs}`, {'Content-Type': 'application/json', 'Authorization': `Bearer ${this._credential.accessToken}`});
        } catch (err) {
            console.log(err);
            if (err.response.status === 401) {
                await this.authenticate();
                return await this.getSubscriptions(options);
            }
        }
    }

    private _queryStringFromOptions(options: HotmartGetSubscriptionsOptions) {
        return Object.keys(options)
        .map(key => `${encodeURIComponent(key)}=${encodeURIComponent(options[key])}`)
        .join('&')
    }

    async verifyUserPurchase(userEmail: string): Promise<boolean> {
        const response = await this.getSubscriptions({subscriber_email: userEmail});
        if (response.page_info.total_results === 0) {
            return false;
        }

        const subscriptionStatus = response.items[0].status;
        return subscriptionStatus === HotmartSubscriptionStatus.ACTIVE ||
                subscriptionStatus === HotmartSubscriptionStatus.DELAYED ?
                    true : false;
    }

    async wasPurchasedByBoleto(userEmail: string): Promise<boolean> {
        const response = await this.getSubscriptions({subscriber_email: userEmail});
        if (response.page_info.total_results === 0) {
            return false;
        }
        const subscriptionStatus = response.items[0].status;
        return subscriptionStatus === HotmartSubscriptionStatus.STARTED ? true : false;
    }

    async updateUsersSubscriptionStatus(usuarios) {
        const novosStatusAsync = [];
        usuarios.forEach((usuario) => novosStatusAsync.push(this._getNewSubscriptionStatusForUser(usuario)));
        try {
            const novosStatus = await Promise.all(novosStatusAsync);
            await dao.atualizarStatusDeAssinaturaDeUsuarios(usuarios, novosStatus, conexaoDb);
            log(usuarios.map((usuario) => usuario.nome_completo));
            log('Status de assinatura de todos os usuários Hotmart atualizado');
        } catch (err) {
            throw err;
        }
    };
      
    async _getNewSubscriptionStatusForUser(usuario) {
        const { email, status_assinatura } = usuario;
        try {
            const response = await this.getSubscriptions({subscriber_email: email});
            if (response.page_info.total_results > 0) {
                return response.items[0].status.toLowerCase();
            }
            return status_assinatura;
        } catch (err) {
            throw err;
        }
    };

    async _sendBanNotice(usuario, telegramClient) {
        await dao.aumentarAvisoDeBanimento(usuario, conexaoDb);
        const usuarioAtualizado = await dao.pegarUsuarioPeloId(usuario.id, conexaoDb);
        if (usuarioAtualizado.aviso_banimento === 1) {
            return telegramClient.sendMessage(usuario.id, 'A sua assinatura no curso da Monetizze não está como ativa. Procure realizar o pagamento do curso para evitar seu banimento dos nossos canais em 2 dias. Caso já tenha realizado o pagamento desse mês, favor ignorar esta mensagem');
        }
        if (usuarioAtualizado.aviso_banimento === 2) {
            return telegramClient.sendMessage(usuario.id, 'A sua assinatura no curso da Monetizze não está como ativa há 1 dia. Procure realizar o pagamento do curso para evitar seu banimento dos nossos canais amanhã. Caso já tenha realizado o pagamento desse mês, favor ignorar esta mensagem');
        }
    };
      
    async banUserIfStatusIsNotActive(usuarios, telegramClient) {
        const usuariosASeremBanidos = [];
        const usuariosASeremAvisados = [];
        const usuariosATeremAvisosZerados = [];
        const dadosUsuariosASeremBanidos = [];
        const dadosUsuariosAvisados = [];
        const dadosUsuariosComAvisosZerados = [];
        
        usuarios.forEach((usuario) => {
            if (usuario.status_assinatura !== 'active' && usuario.status_assinatura !== 'delayed') {
            if (usuario.aviso_banimento > 2) { 
                if (process.env.NODE_ENV === 'development') {
                usuariosASeremBanidos.push(telegramClient.kickChatMember(process.env.ID_CANAL_TESTE, usuario.id));
                usuariosASeremBanidos.push(telegramClient.kickChatMember(process.env.ID_CANAL_TESTE, usuario.id));
                } else {
                usuariosASeremBanidos.push(telegramClient.kickChatMember(process.env.ID_CANAL_RICO_VIDENTE, usuario.id));
                usuariosASeremBanidos.push(telegramClient.kickChatMember(process.env.ID_CANAL_SINAIS_RICOS, usuario.id));
                }
                dadosUsuariosASeremBanidos.push(usuario.nome_completo);
                return;
            }
            usuariosASeremAvisados.push(this._sendBanNotice(usuario, telegramClient));
            dadosUsuariosAvisados.push(usuario.nome_completo);
            } else if (usuario.aviso_banimento > 0) {
            usuariosATeremAvisosZerados.push(dao.zerarAvisoDeBanimento(usuario, conexaoDb));
            dadosUsuariosComAvisosZerados.push(usuario.nome_completo);
            }
        });
        
        try {
            await Promise.all(usuariosASeremBanidos);
            log(`Usuários ${dadosUsuariosASeremBanidos} foram banidos`);
            await Promise.all(usuariosASeremAvisados);
            log(`Usuários ${dadosUsuariosAvisados} avisados sobre banimento`);
            await Promise.all(usuariosATeremAvisosZerados);
            log(`Usuários ${dadosUsuariosComAvisosZerados} tiveram aviso de banimento zerado`);
        } catch (err) {
            throw err;
        }
    };
}