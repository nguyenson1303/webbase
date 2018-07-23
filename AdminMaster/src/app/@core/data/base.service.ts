import { Injectable } from '@angular/core';
import { Http, Headers, Response, RequestOptions, URLSearchParams, QueryEncoder, ResponseContentType } from '@angular/http';
import { Observable } from 'rxjs/Rx';
import { Router } from '@angular/router';
import { AppConfig } from '../../config/appconfig';
import { AppConstant } from '../../config/appconstant';
import { AuthService } from './auth.service';

@Injectable({
  providedIn: 'root'
})
export class BaseService {
  private headers = new Headers();
  private options: RequestOptions;
  private loginObject: any;
  private authUrl = AppConfig.serverAPI + AppConstant.tokenApiUrl;
  private currentStorage = AppConstant.currentStorage;

  constructor(
    private http: Http,
    private Router: Router,
    private authenService: AuthService) {
    this.headers = new Headers(
      {
        'Content-Type': AppConstant.applicationJsonType,
        'Authorization': AppConstant.headerBearer + authenService.getToken()
      });
  }

  urltoFile(url, filename, mimeType) {
    return (fetch(url)
      .then(function (res) { return res.arrayBuffer(); })
      .then(function (buf) { return new File([buf], filename, { type: mimeType }); })
    );
  }

  dataURItoBlob(dataURI) {
    // convert base64/URLEncoded data component to raw binary data held in a string
    var byteString;
    if (dataURI.split(',')[0].indexOf('base64') >= 0)
      byteString = atob(dataURI.split(',')[1]);
    else
      byteString = unescape(dataURI.split(',')[1]);

    // separate out the mime component
    var mimeString = dataURI.split(',')[0].split(':')[1].split(';')[0];

    // write the bytes of the string to a typed array
    var ia = new Uint8Array(byteString.length);
    for (var i = 0; i < byteString.length; i++) {
      ia[i] = byteString.charCodeAt(i);
    }

    return new Blob([ia], { type: mimeString });
  }

  blobToFile = (theBlob: Blob, fileName: string): File => {
    var b: any = theBlob;
    // A Blob() is almost a File() - it's just missing the two properties below which we will add
    b.lastModifiedDate = new Date();
    b.name = fileName;

    // Cast to a File() type
    return <File>theBlob;
  }

  downloadFile(filename: string) {
    let url = AppConfig.serverAPI + AppConstant.downloadApiUrl + "?filename=" + filename;
    this.options = new RequestOptions({ headers: this.headers, responseType: ResponseContentType.Blob });
    return this.http.get(url, this.options);
  }
}
