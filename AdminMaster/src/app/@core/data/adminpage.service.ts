import { Injectable } from '@angular/core';
import { Http, Headers, Response, RequestOptions, URLSearchParams, QueryEncoder } from '@angular/http';
import { Observable } from 'rxjs/Rx';
import { Router } from '@angular/router';
import { AppConfig } from '../../config/appconfig';
import { AppConstant } from '../../config/appconstant';

import { AuthService } from '../../@core/data/auth.service';

@Injectable({
  providedIn: 'root'
})
export class AdminpageService {

  private headers = new Headers();
  private options: RequestOptions;
  private loginObject: any;
  private authUrl = AppConfig.serverAPI + AppConstant.tokenApiUrl;
  private currentStorage = AppConstant.currentStorage;

  constructor(private http: Http,
    private Router: Router,
    private authenService: AuthService) {
    this.headers = new Headers(
      {
        'Content-Type': AppConstant.applicationJsonType,
        'Authorization': AppConstant.headerBearer + authenService.getToken()
      });
  }


  getListAdminPage(params: string) {
    let url = AppConfig.serverAPI + AppConstant.listAdminPageApiUrl + params;
    this.options = new RequestOptions({ headers: this.headers });
    return this.http.get(url, this.options).map(this.extractData);
  }

  getListAdminPageTree(params: string) {
    let url = AppConfig.serverAPI + AppConstant.listAdminPageTreeApiUrl + params;
    this.options = new RequestOptions({ headers: this.headers });
    return this.http.get(url, this.options).map(this.extractData);
  }

  deleteAdminPage(id: number): Observable<any> {
    let url = AppConfig.serverAPI + AppConstant.deleteAdminPageApiUrl + "/" + id;
    this.options = new RequestOptions({ headers: this.headers });
    return this.http.delete(url, this.options).map(this.extractData);
  }

  updateAdminPage(id: number, data: any): Observable<any> {
    let url = AppConfig.serverAPI + AppConstant.updateAdminPageApiUrl + "/" + id;
    this.options = new RequestOptions({ headers: this.headers });
    let body = JSON.stringify(data);
    return this.http.put(url, body, this.options).map(this.extractData);
  }

  updateStatusAdminPage(id: number, isShow: Boolean): Observable<any> {
    let url = AppConfig.serverAPI + AppConstant.updateStatusAdminPageApiUrl + "/" + id + "/" + isShow;
    this.options = new RequestOptions({ headers: this.headers });
    let body = JSON.stringify("");
    return this.http.put(url, body, this.options).map(this.extractData);
  }

  createAdminPage(data: any): Observable<any> {
    let url = AppConfig.serverAPI + AppConstant.createAdminPageApiUrl;
    this.options = new RequestOptions({ headers: this.headers });
    let body = JSON.stringify(data);
    return this.http.post(url, body, this.options).map(this.extractData);
  }

  getAdminPageDetail(id: number) {
    let url = AppConfig.serverAPI + AppConstant.getAdminPageApiUrlDetailApiUrl + "/" + id;
    this.options = new RequestOptions({ headers: this.headers });
    return this.http.get(url, this.options).map(this.extractData);
  }

  getListAdminPageAction(params: string) {
    let url = AppConfig.serverAPI + AppConstant.listUserPageActionByPageIdApiUrl + params;
    this.options = new RequestOptions({ headers: this.headers });
    return this.http.get(url, this.options).map(this.extractData);
  }

  validateAdminPage(data): Observable<any> {
    let url = AppConfig.serverAPI + AppConstant.validateAdminPageApiUrl;
    this.options = new RequestOptions({ headers: this.headers });
    let body = JSON.stringify(data);
    return this.http.post(url, body, this.options).map(this.extractData);
  }

  private extractData(res: Response) {
    let body = res.json();
    return body || {};
  }

}
