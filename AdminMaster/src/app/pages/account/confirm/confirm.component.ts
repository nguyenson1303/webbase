import { Component, OnInit } from '@angular/core';
import { HttpClient, HttpRequest, HttpEventType, HttpResponse, HttpHeaders } from '@angular/common/http';
import { Router, ActivatedRoute } from '@angular/router';
import { BaseService } from '../../../@core/data/base.service';
import { AppConfig } from '../../../config/appconfig';
import { AppConstant } from '../../../config/appconstant';
import { AccountService } from '../../../@core/data/account.service';
import { NgbModal } from '@ng-bootstrap/ng-bootstrap';
import { ModalComponent } from "../../ui-features/modals/modal/modal.component";
import { ConfigurationService } from './configuration.service';

declare var $: any;

@Component({
  selector: 'confirm',
  templateUrl: './confirm.component.html',
  styleUrls: ['./confirm.component.scss']
})
export class ConfirmComponent implements OnInit {

  columns = [
    { key: 'Title', title: 'Tên trang' },
    { key: 'role', title: 'Danh sách quyền' },
  ];
  data;
  rows;
  configuration;

  createUserObj = {
    username: AppConstant.stringEmpty,
    password: AppConstant.stringEmpty,
    confirmPassword: AppConstant.stringEmpty,
    ip: AppConstant.stringEmpty,
    online: AppConstant.stringEmpty,
    role: AppConstant.numberOne,
    fname: AppConstant.stringEmpty,
    lname: AppConstant.stringEmpty,
    phone: AppConstant.stringEmpty,
    address: AppConstant.stringEmpty,
    birthday: AppConstant.stringEmpty,
    avatar: null,
    avatarOld: AppConstant.stringEmpty,
    avatarFile: AppConstant.stringEmpty,
    avatarFileType: AppConstant.stringEmpty,
    avatarFileName: AppConstant.stringEmpty
  }

  userPermission = {
    orderDisplay: 0,
    pageId: 0,
    parentId: 0,
    title: "",
    userName: "",
    level: 0,
    classLevel: "",
    isCheckAll: false,
    listUserPageAction: [
      {
        id: 0,
        actionName: "",
        actionDescription: "",
        actionPage: 0,
        active: false,
      }
    ]
  };

  public progress: number = AppConstant.numberZero;
  public isCreate: boolean = AppConstant.trueDefault;
  private username: string = AppConstant.stringEmpty;
  private objectUser: any;
  private type: string = AppConstant.stringEmpty;

  constructor(private activatedRoute: ActivatedRoute,
    private accountService: AccountService,
    private router: Router,
    private modalService: NgbModal,
    private baseService: BaseService) {

    $(document).ready(() => {
      let breadcrumb = $("#main_breadcrumb");
      let child_breadcrumb = $("#child_breadcrumb");

      if (breadcrumb.html() != null && breadcrumb.html() != undefined) {
        child_breadcrumb.html(breadcrumb.html());
      }
    });

    // check reload from browser or move from process
    let isInProcess = localStorage.getItem(AppConstant.isInProcess)
    if (isInProcess != null && isInProcess != undefined) {
      localStorage.removeItem(AppConstant.isInProcess);
    }
    else {
      localStorage.removeItem(AppConstant.objectUser);
      localStorage.removeItem(AppConstant.objectUserPermission);
    }

    // get param from router ex: /:username
    this.activatedRoute.params.forEach(params => {
      this.username = params['username'];
      this.type = params['type'];
    });

    if (this.username !== null && this.username !== AppConstant.stringEmpty) {
      this.isCreate = false;
    }

    if (this.type === null || this.type === AppConstant.stringEmpty) {
      this.type = "";
    }

    // check localStorage exist
    this.objectUser = localStorage.getItem(AppConstant.objectUser);
    if (this.objectUser !== null && this.objectUser !== undefined) {
      this.createUserObj = JSON.parse(this.objectUser);

      if (this.createUserObj.avatarFile !== null && this.createUserObj.avatarFile !== undefined) {
      }
      else {
        if ((this.createUserObj.avatar === null || this.createUserObj.avatar === AppConstant.stringEmpty)) {
          this.createUserObj.avatarFile = AppConstant.avatarDefault;
        }
        else {
          this.createUserObj.avatarFile = this.createUserObj.avatar;
        }
      }
    }
    else {
      this.router.navigate(['/pages/miscellaneous/404']);
    }

    this.userPermission = JSON.parse(localStorage.getItem(AppConstant.objectUserPermission));
    if (this.userPermission !== null && this.userPermission !== undefined) {
      this.configuration = ConfigurationService.config;
      this.configuration.isLoading = true;
      this.data = this.userPermission;
      this.rows = this.data;
      this.configuration.isLoading = false;
    }
    else {
      this.router.navigate(['/pages/miscellaneous/404']);
    }
  }

  backclick() {
    localStorage.setItem(AppConstant.isInProcess, AppConstant.trueDefault.toString())
    localStorage.setItem(AppConstant.objectUser, JSON.stringify(this.createUserObj))
    localStorage.setItem(AppConstant.objectUserPermission, JSON.stringify(this.userPermission))

    if (this.isCreate) {
      this.router.navigate(['/pages/account/add', this.type]);
    }
    else {
      this.router.navigate(['/pages/account/edit', this.type, this.username]);
    }
  }

  nextclick() {
    if (this.isCreate) {
      // call api create user
      let createUserObjNew = {
        username: this.createUserObj.username,
        password: this.createUserObj.password,
        confirmPassword: this.createUserObj.confirmPassword,
        ip: "",
        online: this.createUserObj.online,
        role: this.createUserObj.role,
        fname: this.createUserObj.fname,
        lname: this.createUserObj.lname,
        phone: this.createUserObj.phone,
        address: this.createUserObj.address,
        birthday: this.createUserObj.birthday,
        avatar: "",
        IsCreate: true
      }

      // process upload file avatar
      if ((this.createUserObj.avatarFileName !== null
        && this.createUserObj.avatarFileName !== undefined
        && this.createUserObj.avatarFileName !== AppConstant.stringEmpty) && (
          this.createUserObj.avatarFile !== null
          && this.createUserObj.avatarFile !== undefined
        && this.createUserObj.avatarFile !== AppConstant.stringEmpty)) {

        // upload new avatar and create account
        var formData = new FormData();
        var blob = this.baseService.dataURItoBlob(this.createUserObj.avatarFile);
        formData.append(AppConstant.fileKey, blob, this.createUserObj.avatarFileName);
        formData.append(AppConstant.filePath, AppConstant.avatarUploadFolder);
        formData.append(AppConstant.fileOld, this.createUserObj.avatar);
        formData.append(AppConstant.thumbnailSizeKey, AppConstant.thumbnailSizeValue.toString());

        this.baseService.uploadFile(formData).subscribe(event => {
          if (event.type === HttpEventType.UploadProgress) {
            this.progress = Math.round(100 * event.loaded / event.total);
          }
          else if (event.type === HttpEventType.Response) {
            createUserObjNew.avatar = event.body.toString();

            this.accountService.createUser(createUserObjNew).subscribe(result => {
              if (result) {
                if (result.code === AppConstant.successCode) {
                  localStorage.removeItem(AppConstant.objectUser);
                  this.showModal(AppConstant.successTitle, AppConstant.messcreateSuccess);
                  this.router.navigate(['/pages/account/list', this.type]);
                }
                else {
                  this.showModal(AppConstant.failTitle, AppConstant.messCreateFail);
                }
              }
            }),
              error => {
                this.showModal(AppConstant.errorTitle, error.message);
              };
          }
        });
      }
      else {
        // create new account without avatar
        this.accountService.createUser(createUserObjNew).subscribe(result => {
          if (result) {
            if (result.code === AppConstant.successCode) {
              localStorage.removeItem(AppConstant.objectUser);
              this.showModal(AppConstant.successTitle, AppConstant.messcreateSuccess);
              this.router.navigate(['/pages/account/list', this.type]);
            }
            else {
              this.showModal(AppConstant.failTitle, AppConstant.messCreateFail);
            }
          }
        }),
          error => {
            this.showModal(AppConstant.errorTitle, error.message);
          };
      }

    }
    else {
      let userAccount = {
        ip: AppConstant.stringEmpty,
        online: this.createUserObj.online,
        role: this.createUserObj.role
      };

      // call api edit user
      this.accountService.updateUser(this.username, userAccount).subscribe(result => {
        if (result) {
          if (result.code === AppConstant.successCode) {

            let userInfor = {
              fname: this.createUserObj.fname,
              lname: this.createUserObj.lname,
              phone: this.createUserObj.phone,
              address: this.createUserObj.address,
              birthday: this.createUserObj.birthday,
              avatar: AppConstant.stringEmpty,
              fullName: this.createUserObj.fname + AppConstant.spaceDefault + this.createUserObj.lname
            }

            // process upload file avatar
            if ((this.createUserObj.avatarFileName !== null
              && this.createUserObj.avatarFileName !== undefined
              && this.createUserObj.avatarFileName !== AppConstant.stringEmpty) && (
                this.createUserObj.avatarFile !== null
                && this.createUserObj.avatarFile !== undefined
              && this.createUserObj.avatarFile !== AppConstant.stringEmpty)) {

              // upload new avatar and update infor
              var formData = new FormData();
              var blob = this.baseService.dataURItoBlob(this.createUserObj.avatarFile);
              formData.append(AppConstant.fileKey, blob, this.createUserObj.avatarFileName);
              formData.append(AppConstant.filePath, AppConstant.avatarUploadFolder);
              formData.append(AppConstant.fileOld, this.createUserObj.avatarOld);
              formData.append(AppConstant.thumbnailSizeKey, AppConstant.thumbnailSizeValue.toString());

              this.baseService.uploadFile(formData).subscribe(event => {
                if (event.type === HttpEventType.UploadProgress) {
                  this.progress = Math.round(100 * event.loaded / event.total);
                }
                else if (event.type === HttpEventType.Response) {
                  userInfor.avatar = event.body.toString();

                  this.accountService.updateUserInfor(this.username, userInfor).subscribe(result => {
                    if (result) {
                      if (result.code === AppConstant.successCode) {
                        localStorage.removeItem(AppConstant.objectUser);
                        this.showModal(AppConstant.successTitle, AppConstant.messupdateSuccess);
                        this.router.navigate(['/pages/account/list', this.type]);
                      }
                      else {
                        this.showModal(AppConstant.failTitle, AppConstant.messUpdateFail);
                      }
                    }
                  }),
                    error => {
                      this.showModal(AppConstant.errorTitle, error.message);
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
                    this.showModal(AppConstant.successTitle, AppConstant.messupdateSuccess);
                    this.router.navigate(['/pages/account/list', this.type]);
                  }
                  else {
                    this.showModal(AppConstant.failTitle, AppConstant.messUpdateFail);
                  }
                }
              }),
                error => {
                  this.showModal(AppConstant.errorTitle, error.message);
                };
            }
            // end process upload file
          }
          else {
            this.showModal(AppConstant.failTitle, AppConstant.messUpdateFail);
          }
        }
      }),
        error => {
          this.showModal(AppConstant.errorTitle, error.message);
        };
    }
  }

  ngOnInit() {
  }

  showModal(title: string, mess: string) {
    const activeModal = this.modalService.open(ModalComponent, { size: 'lg', container: 'nb-layout' });

    activeModal.componentInstance.modalHeader = title;
    activeModal.componentInstance.modalContent = mess;
  }
}
