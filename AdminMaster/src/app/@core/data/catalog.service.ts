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
export class CatalogService {

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

  getListCatalog(params: string) {
    let url = AppConfig.serverAPI + AppConstant.listCatalogApiUrl + params;
    this.options = new RequestOptions({ headers: this.headers });
    return this.http.get(url, this.options).map(this.extractData);
  }

  getCatalogDetail(id: number) {
    let url = AppConfig.serverAPI + AppConstant.getCatalogDetailApiUrl + "/" + id;
    this.options = new RequestOptions({ headers: this.headers });
    return this.http.get(url, this.options).map(this.extractData);
  }

  deleteCatalog(id: number): Observable<any> {
    let url = AppConfig.serverAPI + AppConstant.deleteCatalogApiUrl + "/" + id;
    this.options = new RequestOptions({ headers: this.headers });
    return this.http.delete(url, this.options).map(this.extractData);
  }

  updateStatusCatalog(id: number, isShow: Boolean): Observable<any> {
    let url = AppConfig.serverAPI + AppConstant.updateStatusCatalogApiUrl + "/" + id + "/" + isShow;
    this.options = new RequestOptions({ headers: this.headers });
    let body = JSON.stringify("");
    return this.http.put(url, body, this.options).map(this.extractData);
  }


  private extractData(res: Response) {
    let body = res.json();
    return body || {};
  }
}
