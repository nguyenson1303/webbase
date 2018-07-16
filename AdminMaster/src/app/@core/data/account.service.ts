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
export class AccountService {

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

  getListUser(params: string) {
    let url = AppConfig.serverAPI + AppConstant.listUserApiUrl + params;
    this.options = new RequestOptions({ headers: this.headers });
    return this.http.get(url, this.options).map(this.extractData);
  }

  checkPermission(data): Observable<any> {
    let url = AppConfig.serverAPI + AppConstant.checkPermissionApiUrl;
    this.options = new RequestOptions({ headers: this.headers });
    let body = JSON.stringify(data);
    return this.http.post(url, body, this.options).map(this.extractData);
  }

  deleteUser(userName): Observable<any> {
    let url = AppConfig.serverAPI + AppConstant.deleteUserApiUrl + "/" + userName;
    this.options = new RequestOptions({ headers: this.headers });
    return this.http.delete(url, this.options).map(this.extractData);
  }

  private extractData(res: Response) {
    let body = res.json();
    return body || {};
  }
}
