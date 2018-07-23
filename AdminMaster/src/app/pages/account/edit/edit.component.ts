import { Component, OnInit, AfterViewInit } from '@angular/core';
import { Router, ActivatedRoute } from '@angular/router';
import { NgbModal } from '@ng-bootstrap/ng-bootstrap';
import { AccountService } from '../../../@core/data/account.service';
import { AppConstant } from '../../../config/appconstant';
import { ModalComponent } from '../../ui-features/modals/modal/modal.component';
import { ConfirmModalComponent } from '../../ui-features/modals/confirm/confirm.component';
import { DatepickerOptions } from 'ng2-datepicker';
import * as enLocale from 'date-fns/locale/en';

import * as $ from 'jquery';

@Component({
  selector: 'edit',
  templateUrl: './edit.component.html',
  styleUrls: ['./edit.component.scss']
})
export class EditComponent implements OnInit {

  userDetail = {
    username: "",
    password: "",
    confirmPassword: "",
    role: 0,
    online: true,
    lastLogin: "",
    ip: "",
    token: "",
    expire: ""
  };

  userProfile = {
    inforId: 0,
    fname: "",
    lname: "",
    phone: "",
    address: "",
    email: "",
    eventId: null,
    birthday: null,
    location: "",
    note: "",
    dateJoin: null,
    dateRegister: null,
    avatar: "",
    avatarFile: null,
    avatarFileType: "",
    avatarFileName: "",
    fullName: ""
  }

  pathInfor = {
    path: "",
    typeAct: "",
    type: ""
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
    barTitleIfEmpty: 'Click to select a date',
    placeholder: 'Click to select a date', // HTML input placeholder attribute (default: '')
    addClass: 'form-control', // Optional, value to pass on to [ngClass] on the input field
    addStyle: {}, // Optional, value to pass to [ngStyle] on the input field
    fieldId: 'birthday', // ID to assign to the input field. Defaults to datepicker-<counter>
    useEmptyBarTitle: false,
    // Defaults to true. If set to false then barTitleIfEmpty will be disregarded and a date will always be shown
  };

  public isCreate: boolean = true;
  private username: string = "";
  private type: string = "";
  private errorMessage: string = "";
  private objectUser: any;

  constructor(private activatedRoute: ActivatedRoute,
    private router: Router,
    private accountService: AccountService,
    private modalService: NgbModal) {

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
    if (isInProcess != null && isInProcess != undefined) {
      localStorage.removeItem(AppConstant.isInProcess);
    }
    else {
      localStorage.removeItem(AppConstant.objectUser);
    }

    // get param from router ex: /:username
     this.activatedRoute.params.forEach(params => {
       this.username = params['username'];
       this.type = params['type'];
     });

    if (this.username != null && this.username != "") {
      this.isCreate = false;
    }

    if (this.type == null || this.type == "") {
      this.type = "";
    }

    // check user is permission for view page
    let lastPath = activatedRoute.snapshot.url[0].path;
    this.pathInfor.path = this.router.url.split('/' + lastPath)[0] + '/' + lastPath;
    this.pathInfor.type = this.type;
    this.pathInfor.typeAct = this.isCreate == true ? AppConstant.addAction : AppConstant.editAction;

    this.accountService.checkPermission(this.pathInfor).subscribe(result => {
      if (result) {
        if (result.code === AppConstant.permissionDeniedCode) {
          this.router.navigate(['/pages/miscellaneous/404']);
        }
      }
    }),
      error => {
        this.showModal(AppConstant.errorTitle, error.message);
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

      if (this.userProfile.avatarFile != null && this.userProfile.avatarFile != undefined) {
        this.userProfile.avatar = this.userProfile.avatarFile;
      }
      else {
        if ((this.userProfile.avatar === null || this.userProfile.avatar === "")) {
          this.userProfile.avatar = AppConstant.avatarDefault;
        }
      }
    }
    else
    {
      if (this.isCreate == false) {
        this.accountService.getUserDetail(this.username).subscribe(result => {
          if (result) {
            this.userDetail = result;

            this.userDetail.password = "******";
            this.userDetail.confirmPassword = "******";
          }
          else {
            this.showModal(AppConstant.errorTitle, result.message);
          }
        }),
          error => {
            this.showModal(AppConstant.errorTitle, error.message);
          };

        this.accountService.getUserInforDetail(this.username).subscribe(result => {
          if (result) {
            this.userProfile = result;

            if (this.userProfile.avatarFile != null && this.userProfile.avatarFile != undefined) {
              this.userProfile.avatar = this.userProfile.avatarFile;
            }
            else {
              if ((this.userProfile.avatar === null || this.userProfile.avatar === "")) {
                 this.userProfile.avatar = AppConstant.avatarDefault;
              }
            }
          }
          else {
            this.showModal(AppConstant.errorTitle, result.message);
          }
        }),
          error => {
            this.showModal(AppConstant.errorTitle, error.message);
          };
      }
    }
  }

  backclick() {
    this.router.navigate(['/pages/account/list', this.type]);
  }

  nextclick() {
    // validate
    let isValid = true;
    let mess = "";
    let createUserValidateObj = {
      username: this.userDetail.username,
      password: this.userDetail.password,
      confirmPassword: this.userDetail.confirmPassword,
      ip: "",
      online: this.userDetail.online,
      role: this.userDetail.role,
      fname: this.userProfile.fname,
      lname: this.userProfile.lname,
      phone: this.userProfile.phone,
      address: this.userProfile.address,
      birthday: this.userProfile.birthday,
      avatar: this.userProfile.avatar != AppConstant.avatarDefault ? this.userProfile.avatar : "",
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
            ip: "",
            online: this.userDetail.online,
            role: this.userDetail.role,
            fname: this.userProfile.fname,
            lname: this.userProfile.lname,
            phone: this.userProfile.phone,
            address: this.userProfile.address,
            birthday: this.userProfile.birthday,
            avatar: this.userProfile.avatar != AppConstant.avatarDefault ? this.userProfile.avatar : "",
            avatarFile: this.userProfile.avatarFile,
            avatarFileType: this.userProfile.avatarFileType,
            avatarFileName: this.userProfile.avatarFileName,
            isCreate: this.isCreate
          }

          // set localStorage to confirm page
          localStorage.setItem(AppConstant.objectUser, JSON.stringify(createUserObj));
          localStorage.setItem(AppConstant.isInProcess, "true");

          if (this.isCreate) {
            this.router.navigate(['/pages/account/confirm', this.type]);
          }
          else{
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
            validateField[i].textContent = "";
          }
          if (field) {
            field.focus();
          }
          if (fieldValidate)
          {
            fieldValidate.textContent = result.message;
          }
        }
      }
    }),
      error => {
        this.showModal(AppConstant.errorTitle, error.message);
      };
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
        // this.deleteClick(userName);

      }
    });
  }

  ngAfterViewInit() {
    $(document).ready(() => {
      let avatarImage = $('#avatarImage').attr('src');
      if (avatarImage === null
        || avatarImage === undefined
        || avatarImage === ""
        || avatarImage === AppConstant.avatarDefault) {
        $('#avatarDelete').hide();
      }
      else {
        $('#avatarDelete').show();
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
      console.log(file);

      this.userProfile.avatarFileType = file.type;
      this.userProfile.avatarFileName = file.name;
    }
  }
}
