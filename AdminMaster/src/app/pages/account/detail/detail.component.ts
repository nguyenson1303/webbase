import { Component, OnInit } from '@angular/core';
import { Router, ActivatedRoute } from '@angular/router';
import { NgbModal } from '@ng-bootstrap/ng-bootstrap';
import { AppConfig } from '../../../config/appconfig';
import { AppConstant } from '../../../config/appconstant';
import { AccountService } from '../../../@core/data/account.service';
import { BaseService } from '../../../@core/data/base.service';
import { ToasterService, ToasterConfig, Toast, BodyOutputType } from 'angular2-toaster';
import 'style-loader!angular2-toaster/toaster.css';

declare var $: any;

@Component({
  selector: 'detail',
  templateUrl: './detail.component.html',
  styleUrls: ['./detail.component.scss']
})
export class DetailComponent implements OnInit {

  private username: string = AppConstant.stringEmpty;
  private type: string = AppConstant.stringEmpty;

  userDetail = {
    username: AppConstant.stringEmpty,
    password: AppConstant.stringEmpty,
    confirmPassword: AppConstant.stringEmpty,
    role: AppConstant.numberOne,
    online: AppConstant.trueDefault,
    lastLogin: AppConstant.stringEmpty,
    ip: AppConstant.stringEmpty,
    token: AppConstant.stringEmpty,
    expire: AppConstant.stringEmpty
  };

  userProfile = {
    inforId: AppConstant.numberZero,
    fname: AppConstant.stringEmpty,
    lname: AppConstant.stringEmpty,
    phone: AppConstant.stringEmpty,
    address: AppConstant.stringEmpty,
    email: AppConstant.stringEmpty,
    eventId: null,
    birthday: null,
    location: AppConstant.stringEmpty,
    note: AppConstant.stringEmpty,
    dateJoin: null,
    dateRegister: null,
    avatar: AppConstant.stringEmpty,
    fullName: AppConstant.stringEmpty
  }

  pathInfor = {
    path: AppConstant.stringEmpty,
    typeAct: AppConstant.stringEmpty,
    type: AppConstant.stringEmpty
  };

  avatarUrl: string = AppConstant.stringEmpty;

  config: ToasterConfig;

  constructor(
    private activatedRoute: ActivatedRoute,
    private router: Router,
    private accountService: AccountService,
    private modalService: NgbModal,
    private baseService: BaseService,
    private toasterService: ToasterService) {

    $(document).ready(() => {
      let breadcrumb = $("#main_breadcrumb");
      let child_breadcrumb = $("#child_breadcrumb");

      if (breadcrumb.html() != null && breadcrumb.html() != undefined) {
        child_breadcrumb.html(breadcrumb.html());
      }
    });

    // get param from router ex: /:username
    this.activatedRoute.params.forEach(params => {
      this.username = params['username'];
      this.type = params['type'];
    });

    if (this.type === null || this.type === AppConstant.stringEmpty) {
      this.type = AppConstant.stringEmpty;
    }

    // check user is permission for view page
    let lastPath = activatedRoute.snapshot.url[0].path;
    this.pathInfor.path = this.router.url.split('/' + lastPath)[0] + '/' + lastPath;
    this.pathInfor.type = this.type;
    this.pathInfor.typeAct = AppConstant.viewAction

    this.accountService.checkPermission(this.pathInfor).subscribe(result => {
      if (result) {
        if (result.code === AppConstant.permissionDeniedCode) {
          this.router.navigate(['/pages/miscellaneous/denied']);
        }
      }
    }),
      error => {
        this.showToast(AppConstant.toastrTypeError, AppConstant.errorTitle, error.message);
      };
  }

  // call Api get user infomation
  ngOnInit() {
    this.accountService.getUserDetail(this.username).subscribe(result => {
      if (result) {
        this.userDetail = result;
      }
      else {
        this.showToast(AppConstant.toastrTypeError, AppConstant.errorTitle, result.message);
      }
    }),
      error => {
        this.showToast(AppConstant.toastrTypeError, AppConstant.errorTitle, error.message);
      };

    this.accountService.getUserInforDetail(this.username).subscribe(result => {
      if (result) {
        this.userProfile = result;

        if (this.userProfile.avatar !== null
          && this.userProfile.avatar !== undefined
          && this.userProfile.avatar !== AppConstant.stringEmpty) {
          this.baseService.downloadFile(this.userProfile.avatar).subscribe(result => {
            let fileName = result.url.split('/').pop().toString();
            let fileType = result.blob().type;

            var blob = new Blob([result.blob()], { type: fileType });
            let file = this.baseService.blobToFile(blob, fileName);

            let fr = new FileReader();
            fr.onload = (event: any) => {
              let base64 = event.target.result;
              this.userProfile.avatar = base64;
              this.avatarUrl = base64;
            }
            fr.readAsDataURL(file);

          })
        }
        else {
          this.avatarUrl = AppConstant.avatarDefault;
        }
      }
      else {
        this.showToast(AppConstant.toastrTypeError, AppConstant.errorTitle, result.message);
      }
    }),
      error => {
        this.showToast(AppConstant.toastrTypeError, AppConstant.errorTitle, error.message);
      };
  }

  // navigate to list user
  backclick() {
    this.router.navigate(['/pages/account/list', this.type]);
  }

  // navigate to edit user
  editclick() {
    this.router.navigate(['/pages/account/edit', this.type, this.username]);
  }

  private showToast(type: string, title: string, body: string) {
    this.config = new ToasterConfig({
      positionClass: AppConstant.toastrPositions,
      timeout: AppConstant.toastrTimeout,
      newestOnTop: AppConstant.toastrIsNewestOnTop,
      tapToDismiss: AppConstant.toastrIsHideOnClick,
      preventDuplicates: AppConstant.toastrIsDuplicatesPrevented,
      animation: AppConstant.toastrAnimationType,
      limit: AppConstant.toastrLimit,
    });
    const toast: Toast = {
      type: type,
      title: title,
      body: body,
      timeout: AppConstant.toastrTimeout,
      showCloseButton: AppConstant.toastrIsCloseButton,
      bodyOutputType: BodyOutputType.TrustedHtml,
    };
    this.toasterService.popAsync(toast);
  }
}
