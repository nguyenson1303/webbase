import { Injectable } from '@angular/core';
import { Http, Headers, Response, URLSearchParams, QueryEncoder } from '@angular/http';
import { Observable } from 'rxjs/Rx';
import { Router } from '@angular/router';
import { AppConfig } from '../../config/appconfig';
import { AppConstant } from '../../config/appconstant';

@Injectable({
  providedIn: 'root'
})
export class AuthService {

  private headers = new Headers();
  private loginObject: any;
  private authUrl = AppConfig.serverAPI + AppConstant.tokenApiUrl;
  private currentStorage = AppConstant.currentStorage;

  constructor(private http: Http, private Router: Router) {
    this.headers = new Headers({ 'Content-Type': AppConstant.applicationJsonType });
  }

  login(userName: string, password: string, save: boolean): Observable<boolean> {
    this.loginObject = { Username: userName, Password: password }
    return this.http.post(this.authUrl, JSON.stringify(this.loginObject), { headers: this.headers })
      .map((response: Response) => {
        if (response.json() && response.json().code) {
          return false;
        }
        else {
          let token = response.json() && response.json().token;
          let expires = response.json() && response.json().expiry;
          let currentUser = { token: token, expires: expires, userName: userName, password: password, save: save };
          localStorage.setItem(this.currentStorage, JSON.stringify(currentUser));
          return true;
        }
      }).catch((error: any) => Observable.throw(error.json() || { error_description: AppConstant.messErrorCommon }));
  }

  autoLogin(): Observable<boolean> {
    var userName = this.getUserName();
    var password = this.getPassword();
    this.loginObject = { Username: userName, Password: password }

    return this.http.post(this.authUrl, JSON.stringify(this.loginObject), { headers: this.headers })
      .map((response: Response) => {
        let token = response.json() && response.json().token;
        let expires = response.json() && response.json().expiry;
        let currentUser = { token: token, expires: expires, userName: userName, password: password, save: true };
        localStorage.setItem(this.currentStorage, JSON.stringify(currentUser));
        return true;
      }).catch((err: any) => {
        return Observable.of(false);
      });
  }

  getToken(): String {
    var currentUser = JSON.parse(localStorage.getItem(this.currentStorage));
    var token = currentUser && currentUser.token;
    return token ? token : "";
  }

  getExp(): Date {
    var currentUser = JSON.parse(localStorage.getItem(this.currentStorage));
    var exp = currentUser && currentUser.expires;
    return exp ? new Date(exp) : null;
  }

  clearStorage(): void {
    localStorage.removeItem(this.currentStorage);
  }

  logout(): void {
    this.clearStorage();
    this.Router.navigate(['/auth/login']);
    // setTimeout(function () {
    //  window.location.reload();
    // });
  }

  checkLogin(): boolean {
    var exp: Date = this.getExp();
    if (exp != null && exp < new Date()) return false;
    var token: String = this.getToken();
    return token && token.length > 0;
  }

  isLogIn(): Observable<boolean> {
    if (this.currentStorage != "") {
      return Observable.of(this.checkLogin());
    }
    else {
      return Observable.of(false);
    }
  }

  getProfile(): Observable<any> {
    let url = AppConfig.serverAPI + AppConstant.profileApiUrl;
    let headers = new Headers(
      {
        'Content-Type': AppConstant.applicationJsonType,
        'Authorization': AppConstant.headerBearer + this.getToken()
      });
    return this.http.get(url, { headers: headers }).map(response => response.json());
  }

  getUserName(): string {
    var currentUser = JSON.parse(localStorage.getItem(this.currentStorage));
    var userName = currentUser && currentUser.userName;
    return userName ? userName : "";
  }

  getPassword(): string {
    var currentUser = JSON.parse(localStorage.getItem(this.currentStorage));
    var password = currentUser && currentUser.password;
    return password ? password : "";
  }

  getSave(): boolean {
    var currentUser = JSON.parse(localStorage.getItem(this.currentStorage));
    var save = currentUser && currentUser.save;
    return save == true ? true : false;
  }
}
