import axios, { AxiosInstance, AxiosStatic } from 'axios';

export default class HttpService {
    private _axios: AxiosInstance;
    private static _axiosStatic: AxiosStatic = axios;
    private _baseUrl: string;

    constructor(baseUrl: string) {
        this._baseUrl = baseUrl;
        this._axios = axios.create({
            baseURL: this._baseUrl
        });
    }

    static async get(url: string, headers?: any ) {
        const response = await this._axiosStatic.get(url, { headers });
        return response.data;
     }
 
    static async post(url: string, data:any, headers?: any ) {
        const response = await this._axiosStatic.post(url, data, { headers: {...headers, 'Content-Type': 'application/json'} });
        return response.data;
     }

    async get(path: string, headers?: any ) {
       const response = await this._axios.get(this._baseUrl+path, { headers });
       return response.data;
    }

    async post(path: string, data: any, headers?: any ) {
        const response = await this._axios.post(this._baseUrl+path, data, { headers: {...headers, 'Content-Type': 'application/json'} });
        return response.data;
    }
}