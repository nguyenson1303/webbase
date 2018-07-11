import { Injectable } from '@angular/core';
import { Http, Headers, Response, URLSearchParams, QueryEncoder } from '@angular/http';
import { Observable } from 'rxjs/Rx';
import { Router } from '@angular/router';
import { AppConfig } from '../../config/appconfig';
import { AppConstant } from '../../config/appconstant';
import { AuthService } from '../../@core/data/auth.service';
import { NbMenuItem } from '@nebular/theme';

@Injectable({
  providedIn: 'root'
})
export class MenuService {

  public MENU_ITEMS: NbMenuItem[];
  private headers = new Headers();
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

  getMenu(): Observable<any> {
    let url = AppConfig.serverAPI + AppConstant.menuApiUrl;
    return this.http.get(url, { headers: this.headers }).map(response => response.json());
  }
}
