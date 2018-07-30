import { Component, OnInit, AfterViewInit } from '@angular/core';
import { Router, ActivatedRoute } from '@angular/router';
import { NgbModal } from '@ng-bootstrap/ng-bootstrap';
import { AccountService } from '../../../@core/data/account.service';
import { BaseService } from '../../../@core/data/base.service';
import { AppConfig } from '../../../config/appconfig';
import { AppConstant } from '../../../config/appconstant';
import { ModalComponent } from '../../ui-features/modals/modal/modal.component';
import { ConfirmModalComponent } from '../../ui-features/modals/confirm/confirm.component';
import { DatepickerOptions } from 'ng2-datepicker';
import { ConfigurationService } from './configuration.service';
import * as enLocale from 'date-fns/locale/en';
import { ToasterService, ToasterConfig, Toast, BodyOutputType } from 'angular2-toaster';
import 'style-loader!angular2-toaster/toaster.css';

declare var $: any;

@Component({
  selector: 'edit',
  templateUrl: './edit.component.html',
  styleUrls: ['./edit.component.scss']
})
export class EditComponent implements OnInit {

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
    avatarOld: AppConstant.stringEmpty,
    avatarFile: null,
    avatarFileType: AppConstant.stringEmpty,
    avatarFileName: AppConstant.stringEmpty,
    fullName: AppConstant.stringEmpty
  }

  // use for setting column table
  columns = [
    { key: 'Title', title: 'Tên trang' },
    { key: 'check', title: 'Check' },
    { key: 'role', title: 'Danh sách quyền' },
  ];
  data;
  configuration;

  userPermission = {
    orderDisplay: AppConstant.numberZero,
    pageId: AppConstant.numberZero,
    parentId: AppConstant.numberZero,
    title: AppConstant.stringEmpty,
    userName: AppConstant.stringEmpty,
    level: AppConstant.numberZero,
    classLevel: AppConstant.stringEmpty,
    isCheckAll: AppConstant.falseDefault,
    listUserPageAction: [
      {
        id: AppConstant.numberZero,
        actionName: AppConstant.stringEmpty,
        actionDescription: AppConstant.stringEmpty,
        actionPage: AppConstant.numberZero,
        active: AppConstant.falseDefault,
      }
    ]
  };

  pathInfor = {
    path: AppConstant.stringEmpty,
    typeAct: AppConstant.stringEmpty,
    type: AppConstant.stringEmpty
  };

  config: ToasterConfig;

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
  public isCreate: boolean = AppConstant.trueDefault;
  private username: string = AppConstant.stringEmpty;
  private type: string = AppConstant.stringEmpty;
  private errorMessage: string = AppConstant.stringEmpty;
  private objectUser: any;
  private countCheck: number = AppConstant.numberZero;
  private countList: number = AppConstant.numberZero;
  private isCheckAll: boolean = AppConstant.trueDefault;

  constructor(
    private activatedRoute: ActivatedRoute,
    private router: Router,
    private accountService: AccountService,
    private modalService: NgbModal,
    private baseService: BaseService,
    private toasterService: ToasterService) {

    // copy main_breadcrumb to child_breadcrumb
    $(document).ready(() => {
      let breadcrumb = $("#main_breadcrumb");
      let child_breadcrumb = $("#child_breadcrumb");

      if (breadcrumb.html() != null && breadcrumb.html() != undefined) {
        child_breadcrumb.html(breadcrumb.html());
      }
    });

    // check reload from browser or move from process
    let isInProcess = localStorage.getItem(AppConstant.isInProcess)
    if (isInProcess !== null && isInProcess !== undefined) {
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
      this.isCreate = AppConstant.falseDefault;
    }

    if (this.type === null || this.type === AppConstant.stringEmpty) {
      this.type = AppConstant.stringEmpty;
    }

    // check user is permission for view page
    let lastPath = activatedRoute.snapshot.url[0].path;
    this.pathInfor.path = this.router.url.split('/' + lastPath)[0] + '/' + lastPath;
    this.pathInfor.type = this.type;
    this.pathInfor.typeAct = this.isCreate === true ? AppConstant.addAction : AppConstant.editAction;

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
    // check localStorage exist
    if (localStorage.getItem(AppConstant.objectUser) != null) {
      this.objectUser = JSON.parse(localStorage.getItem(AppConstant.objectUser));
      this.userDetail.username = this.objectUser.username;
      this.userDetail.online = this.objectUser.online;
      this.userDetail.role = this.objectUser.role;
      this.userDetail.password = "******";
      this.userDetail.confirmPassword = "******";

      this.userProfile.fname = this.objectUser.fname;
      this.userProfile.lname = this.objectUser.lname;
      this.userProfile.address = this.objectUser.address;
      this.userProfile.phone = this.objectUser.phone;
      this.userProfile.birthday = this.objectUser.birthday;
      this.userProfile.avatar = this.objectUser.avatar;
      this.userProfile.avatarFile = this.objectUser.avatarFile;

      if (this.userProfile.avatarFile !== null && this.userProfile.avatarFile !== undefined) {
        this.userProfile.avatar = this.userProfile.avatarFile;
      }
      else {
        if ((this.userProfile.avatar === null || this.userProfile.avatar === AppConstant.stringEmpty)) {
          this.userProfile.avatar = AppConstant.avatarDefault;
        }
      }

      this.avatarUrl = this.userProfile.avatar;
    }
    else {
      if (this.isCreate == false) {
        this.accountService.getUserDetail(this.username).subscribe(result => {
          if (result) {
            this.userDetail = result;

            this.userDetail.password = "******";
            this.userDetail.confirmPassword = "******";
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

              this.userProfile.avatarOld = this.userProfile.avatar;

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

            if (this.userProfile.avatarFile !== null && this.userProfile.avatarFile !== undefined) {
            }
            else {
              if ((this.userProfile.avatar === null || this.userProfile.avatar === AppConstant.stringEmpty)) {
                this.userProfile.avatar = AppConstant.avatarDefault;
              }
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
      else {
        this.avatarUrl = AppConstant.avatarDefault;
      }
    }

    this.configuration = ConfigurationService.config;
    this.configuration.isLoading = true;

    if (localStorage.getItem(AppConstant.objectUserPermission) != null) {
      this.userPermission = JSON.parse(localStorage.getItem(AppConstant.objectUserPermission));
      this.data = this.userPermission;
      let lst: any = this.userPermission;
      lst.forEach((item, index) => {
        this.isCheckAll = true;
        this.isAllCheck(item);
        item.isCheckAll = this.isCheckAll;
      });
      this.userPermission = lst;

      this.configuration.isLoading = false;
    }
    else {
      this.accountService.getListUserPermission(this.username).subscribe(result => {
        if (result) {
          this.userPermission = result;
          this.data = this.userPermission;

          let lst: any = this.userPermission;
          lst.forEach((item, index) => {
            this.isCheckAll = true;
            this.isAllCheck(item);
            item.isCheckAll = this.isCheckAll;
          });
          this.userPermission = lst;
          this.configuration.isLoading = false;
        }
      }),
        error => {
          this.showToast(AppConstant.toastrTypeError, AppConstant.errorTitle, error.message);
        };
    }
  }

  isAllCheck(item: any) {
    let count = 0;
    let countCheck = 0;
    let lstPer: any = this.userPermission;

    if (item.parentId != 0) {
      item.listUserPageAction.forEach((item2, index2) => {
        if (item2.active == true) {
          countCheck++;
        }
        count++;
      });

      if (count != countCheck) {
        this.isCheckAll = false;
      }
    }

    lstPer.forEach((object, index) => {
      if (object.parentId == item.pageId) {
        this.isAllCheck(object)
      }
    });
  }

  backclick() {
    this.router.navigate(['/pages/account/list', this.type]);
  }

  nextclick() {
    // validate
    let isValid = AppConstant.trueDefault;
    let mess = AppConstant.stringEmpty;
    let createUserValidateObj = {
      username: this.userDetail.username,
      password: this.userDetail.password,
      confirmPassword: this.userDetail.confirmPassword,
      ip: AppConstant.stringEmpty,
      online: this.userDetail.online,
      role: this.userDetail.role,
      fname: this.userProfile.fname,
      lname: this.userProfile.lname,
      phone: this.userProfile.phone,
      address: this.userProfile.address,
      birthday: this.userProfile.birthday,
      avatar: this.userProfile.avatar !== AppConstant.avatarDefault ? this.userProfile.avatar : AppConstant.stringEmpty,
      isCreate: this.isCreate
    }

    // call api validate user
    this.accountService.validateUser(createUserValidateObj).subscribe(result => {
      if (result) {
        if (result.code === AppConstant.successCode) {
          // save obj to locate
          let createUserObj = {
            username: this.userDetail.username,
            password: this.userDetail.password,
            confirmPassword: this.userDetail.confirmPassword,
            ip: AppConstant.stringEmpty,
            online: this.userDetail.online,
            role: this.userDetail.role,
            fname: this.userProfile.fname,
            lname: this.userProfile.lname,
            phone: this.userProfile.phone,
            address: this.userProfile.address,
            birthday: this.userProfile.birthday,
            avatar: this.userProfile.avatar !== AppConstant.avatarDefault
              ? this.userProfile.avatar : AppConstant.stringEmpty,
            avatarOld: this.userProfile.avatarOld,
            avatarFile: this.userProfile.avatarFile,
            avatarFileType: this.userProfile.avatarFileType,
            avatarFileName: this.userProfile.avatarFileName,
            isCreate: this.isCreate
          }

          // set localStorage to confirm page
          localStorage.setItem(AppConstant.objectUser, JSON.stringify(createUserObj));
          localStorage.setItem(AppConstant.objectUserPermission, JSON.stringify(this.userPermission));
          localStorage.setItem(AppConstant.isInProcess, "true");

          if (this.isCreate) {
            this.router.navigate(['/pages/account/confirm', this.type]);
          }
          else {
            this.router.navigate(['/pages/account/confirm', this.type, this.username]);
          }
        }
        else {
          // focus to field error and show message
          let field = document.getElementById(result.field);
          let fieldValidate = document.getElementById(result.field + "-validate");
          var validateField = document.querySelectorAll(".validateServer");
          var i;
          for (i = 0; i < validateField.length; i++) {
            validateField[i].textContent = AppConstant.stringEmpty;
          }
          if (field) {
            field.focus();
          }
          if (fieldValidate) {
            fieldValidate.textContent = result.message;
          }
        }
      }
    }),
      error => {
        this.showToast(AppConstant.toastrTypeError, AppConstant.errorTitle, error.message);
      };
  }

  updatePermission() {
    let a: any = this.userPermission;
  }

  showModal(title: string, mess: string) {
    const activeModal = this.modalService.open(ModalComponent, { size: 'lg', container: 'nb-layout' });

    activeModal.componentInstance.modalHeader = title;
    activeModal.componentInstance.modalContent = mess;
  }

  // show modal confirm delete
  showDeleteAvatarConfirm() {
    const activeModal = this.modalService.open(ConfirmModalComponent, { size: 'lg', container: 'nb-layout' });

    activeModal.componentInstance.confirmationBoxTitle = AppConstant.confirmTitle;
    activeModal.componentInstance.confirmationMessage = AppConstant.confirmDeleteAvatarContent;

    activeModal.result.then((userResponse) => {
      if (userResponse === true) {
        if (this.isCreate) {
          this.avatarUrl = AppConstant.avatarDefault;
        }
        else {
          this.avatarUrl = this.userProfile.avatar;
        }

        this.userProfile.avatarFile = null;
        this.userProfile.avatarFileType = null;
        this.userProfile.avatarFileName = null;

        $('#avatarImage').attr('src', this.avatarUrl);
        $('#avatarDelete').hide();
      }
    });
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

  changePermission(pageId: number) {

    let lstPer: any = this.userPermission;
    let check: boolean = $("#" + pageId).is(":checked")
    let item: any;
    lstPer.forEach((object, index) => {
      if (object.pageId == pageId) {
        item = object;
      }
    });

    lstPer.forEach((object, index) => {
      if (object.pageId == pageId) {
        item = object;
      }
    });

    this.setChecChild(item, check);
    this.setChekAllChild(item, check);
    this.setChekAllParent(item, check);

    // this.setCheckAll(pageId);
  }

  changePermissionChild(pageId: number, check: boolean) {
    let lstPer: any = this.userPermission;
    lstPer.forEach((object, index) => {
      if (object.pageId == pageId) {
        let count = 0;
        let countTrueCheck = 0;

        object.listUserPageAction.forEach((item2, index2) => {
          if (item2.active == true) {
            countTrueCheck++;
          }
          count++;
        });

        if (count === countTrueCheck && check === true) {
          $("#" + object.pageId).prop('checked', false);
          this.setChekAllParent(object, false);
        }

        if (countTrueCheck === count - 1 && check === false) {
          $("#" + object.pageId).prop('checked', true);
          this.setChekAllParent(object, true);
        }
      }
    });
  }

  setChecChild(item: any, check: boolean) {
    let lstPer: any = this.userPermission;

    item.listUserPageAction.forEach((item2, index2) => {
      item2.active = check;
    });

    lstPer.forEach((object, index) => {
      if (object.parentId == item.pageId) {
        this.setChecChild(object, check);
      }
    });
  }

  setChekAllChild(item: any, check: boolean) {
    let lstPer: any = this.userPermission;

    $("#" + item.pageId).prop('checked', check);
    lstPer.forEach((object, index) => {
      if (object.parentId == item.pageId) {
        this.setChekAllChild(object, check);
      }
    });
  }

  setChekAllParent(item: any, check: boolean) {
    let lstPer: any = this.userPermission;
    let parent: any;

    lstPer.forEach((object, index) => {
      if (object.pageId == item.parentId) {
        parent = object
      }
    });

    if (parent != null && parent != undefined) {
      if (check == false) {
        $("#" + parent.pageId).prop('checked', check);
        this.setChekAllParent(parent, check);
      }
      else {
        let count = AppConstant.numberZero;
        let countCheck = AppConstant.numberZero;
        parent.listUserPageAction.forEach((item2, index2) => {
          if (item2.active === true) {
            countCheck++;
          }
          count++;
        });
        if (count == countCheck) {
          $("#" + parent.pageId).prop('checked', check);
          this.setChekAllParent(parent, check);
        }
      }
    }
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
