import { Component, OnInit, AfterViewInit } from '@angular/core';
import { HttpClient, HttpRequest, HttpEventType, HttpResponse, HttpHeaders } from '@angular/common/http';
import { Router, ActivatedRoute } from '@angular/router';
import { NgbModal } from '@ng-bootstrap/ng-bootstrap';
import { AuthService } from '../../../@core/data/auth.service';
import { AccountService } from '../../../@core/data/account.service';
import { BaseService } from '../../../@core/data/base.service';
import { AppConfig } from '../../../config/appconfig';
import { AppConstant } from '../../../config/appconstant';
import { ConfirmModalComponent } from '../../ui-features/modals/confirm/confirm.component';
import { DatepickerOptions } from 'ng2-datepicker';
import * as enLocale from 'date-fns/locale/en';
import { ToasterService, ToasterConfig, Toast, BodyOutputType } from 'angular2-toaster';
import 'style-loader!angular2-toaster/toaster.css';

declare var $: any;

@Component({
  selector: 'profile',
  templateUrl: './profile.component.html',
  styleUrls: ['./profile.component.scss']
})
export class ProfileComponent implements OnInit {

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
    avatarFile: null,
    avatarFileType: AppConstant.stringEmpty,
    avatarFileName: AppConstant.stringEmpty,
    fullName: AppConstant.stringEmpty
  }

  pathInfor = {
    path: AppConstant.stringEmpty,
    typeAct: AppConstant.stringEmpty,
    type: AppConstant.stringEmpty
  };

  options: DatepickerOptions = {
    minYear: 1970,
    maxYear: 9999,
    displayFormat: 'YYYY/MM/DD',
    barTitleFormat: 'MMMM YYYY',
    dayNamesFormat: 'dd',
    firstCalendarDay: 0, // 0 - Sunday, 1 - Monday
    locale: enLocale,
    // minDate: new Date(Date.now()), // Minimal selectable date
    // maxDate: new Date(Date.now()),  // Maximal selectable date
    barTitleIfEmpty: 'Click to select a Birthday',
    placeholder: 'Birthday',
    addClass: 'form-control',
    addStyle: {},
    fieldId: 'birthday',
    useEmptyBarTitle: false,
  };

  avatarUrl: string = AppConstant.stringEmpty;

  config: ToasterConfig;

  private currentProfile = AppConstant.currentProfile;
  public progress: number = AppConstant.numberZero;
  private username: string = AppConstant.stringEmpty;
  private errorMessage: string = AppConstant.stringEmpty;
  private objectUser: any;

  constructor(
    private activatedRoute: ActivatedRoute,
    private router: Router,
    private accountService: AccountService,
    private modalService: NgbModal,
    private baseService: BaseService,
    private authenService: AuthService,
    private toasterService: ToasterService) {

    // copy main_breadcrumb to child_breadcrumb
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
    });

    // check user is permission for view page
    let lastPath = activatedRoute.snapshot.url[0].path;
    this.pathInfor.path = this.router.url.split('/' + lastPath)[0] + '/' + lastPath;
    this.pathInfor.type = AppConstant.stringEmpty;
    this.pathInfor.typeAct = AppConstant.viewAction;

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

  ngOnInit() {
    let profile = localStorage.getItem(this.currentProfile);
    if (!profile) {
      this.authenService.getProfile().subscribe(data => {
        if (data) {
          this.userProfile = JSON.parse(data);
          localStorage.setItem(this.currentProfile, JSON.stringify(data));

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
                this.avatarUrl = base64;
              }
              fr.readAsDataURL(file);

            })
          }
          else {
            this.avatarUrl = AppConstant.avatarDefault;
          }
        }
      });
    }
    else {
      this.userProfile = JSON.parse(profile);

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
            this.avatarUrl = base64;
          }
          fr.readAsDataURL(file);

        })
      }
      else {
        this.avatarUrl = AppConstant.avatarDefault;
      }
    }
  }

  ngAfterViewInit() {
    $(document).ready(() => {
      let avatarImage = $('#avatarImage').attr('src');
      if (avatarImage === null
        || avatarImage === undefined
        || avatarImage === AppConstant.stringEmpty
        || avatarImage === AppConstant.avatarDefault) {
        $('#avatarDelete').hide();
      }
      else {
        $('#avatarDelete').show();
      }
    });
  }

  backclick() {
    this.router.navigate(['/dashboard']);
  }

  nextclick() {
    let userInfor = {
      fname: this.userProfile.fname,
      lname: this.userProfile.lname,
      phone: this.userProfile.phone,
      address: this.userProfile.address,
      birthday: this.userProfile.birthday,
      avatar: AppConstant.stringEmpty,
      fullName: this.userProfile.fname + AppConstant.spaceDefault + this.userProfile.lname
    }

    // process upload file avatar
    if ((this.userProfile.avatarFileName !== null
      && this.userProfile.avatarFileName !== undefined
      && this.userProfile.avatarFileName !== AppConstant.stringEmpty) && (
        this.userProfile.avatarFile !== null
        && this.userProfile.avatarFile !== undefined
        && this.userProfile.avatarFile !== AppConstant.stringEmpty)) {

      // upload new avatar and update infor
      var formData = new FormData();
      var blob = this.baseService.dataURItoBlob(this.userProfile.avatarFile);
      formData.append(AppConstant.fileKey, blob, this.userProfile.avatarFileName);
      formData.append(AppConstant.filePath, AppConstant.avatarUploadFolder);
      formData.append(AppConstant.fileOld, this.userProfile.avatar);
      formData.append(AppConstant.thumbnailSizeKey, AppConstant.thumbnailSizeValue.toString());

      this.baseService.uploadFile(formData).subscribe(event => {
        if (event.type === HttpEventType.UploadProgress) {
          this.progress = Math.round(100 * event.loaded / event.total);
        }
        else if (event.type === HttpEventType.Response) {
          userInfor.avatar = event.body.toString();
          $('#avatarDelete').hide();

          this.accountService.updateUserInfor(this.username, userInfor).subscribe(result => {
            if (result) {
              if (result.code === AppConstant.successCode) {
                localStorage.removeItem(AppConstant.objectUser);
                this.showToast(AppConstant.toastrTypeSuccess, AppConstant.successTitle, AppConstant.messupdateSuccess);
                window.location.reload();
              }
              else {
                this.showToast(AppConstant.toastrTypeError, AppConstant.failTitle, AppConstant.messUpdateFail);
              }
            }
          }),
            error => {
              this.showToast(AppConstant.toastrTypeError, AppConstant.errorTitle, error.message);
            };
        }
      });
    }
    else {
      // only update infor
      this.accountService.updateUserInfor(this.username, userInfor).subscribe(result => {
        if (result) {
          if (result.code === AppConstant.successCode) {
            localStorage.removeItem(AppConstant.objectUser);
            this.showToast(AppConstant.toastrTypeSuccess, AppConstant.successTitle, AppConstant.messupdateSuccess);
          }
          else {
            this.showToast(AppConstant.toastrTypeError, AppConstant.failTitle, AppConstant.messUpdateFail);
          }
        }
      }),
        error => {
          this.showToast(AppConstant.toastrTypeError, AppConstant.errorTitle, error.message);
        };
    }
    // end process upload file
  }

  // show modal confirm delete
  showDeleteAvatarConfirm() {
    const activeModal = this.modalService.open(ConfirmModalComponent, { size: 'lg', container: 'nb-layout' });

    activeModal.componentInstance.confirmationBoxTitle = AppConstant.confirmTitle;
    activeModal.componentInstance.confirmationMessage = AppConstant.confirmDeleteAvatarContent;

    activeModal.result.then((userResponse) => {
      if (userResponse === true) {
        this.avatarUrl = this.userProfile.avatar;

        this.userProfile.avatarFile = null;
        this.userProfile.avatarFileType = null;
        this.userProfile.avatarFileName = null;

        $('#avatarImage').attr('src', this.avatarUrl);
        $('#avatarDelete').hide();
      }
    });
  }

  onFileChanged(event) {
    let preview = $('#avatarImage');
    let inputHiden = $('#avatar');
    let deleteAvatar = $('#avatarDelete');

    if (event.target.files && event.target.files[0]) {
      let file = event.target.files[0];
      let fr = new FileReader();
      fr.onload = (event: any) => {
        let base64 = event.target.result;
        this.userProfile.avatarFile = base64;
        preview.attr('src', base64);
        deleteAvatar.show();
      }
      fr.readAsDataURL(file);

      this.userProfile.avatarFileType = file.type;
      this.userProfile.avatarFileName = file.name;
    }
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
