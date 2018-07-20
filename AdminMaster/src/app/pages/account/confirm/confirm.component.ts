import { Component, OnInit } from '@angular/core';
import { Router, ActivatedRoute } from '@angular/router';
import { AppConstant } from '../../../config/appconstant';
import { AccountService } from '../../../@core/data/account.service';
import { NgbModal } from '@ng-bootstrap/ng-bootstrap';
import { ModalComponent } from "../../ui-features/modals/modal/modal.component";
import * as $ from 'jquery';

@Component({
  selector: 'confirm',
  templateUrl: './confirm.component.html',
  styleUrls: ['./confirm.component.scss']
})
export class ConfirmComponent implements OnInit {

  createUserObj = {
    username: "",
    password: "",
    confirmPassword: "",
    ip: "",
    online: "",
    role: 0,
    fname: "",
    lname: "",
    phone: "",
    address: "",
    birthday: "",
    avatar: null,
    avatarFile: "",
    avatarFileType: "",
    avatarFileName: ""
  }

  public isCreate: boolean = true;
  private username: string = "";
  private objectUser: any;
  private type: string = "";

  constructor(private activatedRoute: ActivatedRoute,
    private accountService: AccountService,
    private router: Router,
    private modalService: NgbModal) {

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

    // check localStorage exist
    this.objectUser = localStorage.getItem(AppConstant.objectUser);
    if (this.objectUser != null && this.objectUser != undefined) {
      this.createUserObj = JSON.parse(this.objectUser);

      if (this.createUserObj.avatarFile != null && this.createUserObj.avatarFile != undefined) {
        this.createUserObj.avatar = this.accountService.urltoFile(
          this.createUserObj.avatarFile,
          this.createUserObj.avatarFileName,
          this.createUserObj.avatarFileType);
      }
      else {
        if ((this.createUserObj.avatar === null || this.createUserObj.avatar === "")) {
          this.createUserObj.avatarFile = AppConstant.avatarDefault;
        }
      }
    }
    else {
      this.router.navigate(['/pages/miscellaneous/404']);
    }
  }

  backclick() {
    localStorage.setItem(AppConstant.isInProcess, "true")
    localStorage.setItem(AppConstant.objectUser, JSON.stringify(this.createUserObj))
    if (this.isCreate) {
      this.router.navigate(['/pages/account/add', this.type]);
    }
    else {
      this.router.navigate(['/pages/account/edit', this.type, this.username]);
    }
  }

  nextclick() {
    if (this.isCreate)
    {
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
        avatar: null,
        avatarFile: this.createUserObj.avatar,
        IsCreate: true
      }
      this.accountService.createUser(this.createUserObj).subscribe(result => {
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
    else
    {
      let userAccount = {
        ip: "",
        online: this.createUserObj.online,
        role: this.createUserObj.role
      };

      // call api edit user
      this.accountService.updateUser(this.username, userAccount).subscribe(result => {
        if (result) {
          if (result.code === AppConstant.successCode) {

            let userInfor = new FormData();
            userInfor.append("fname", this.createUserObj.fname);
            userInfor.append("lname", this.createUserObj.lname);
            userInfor.append("phone", this.createUserObj.phone);
            userInfor.append("address", this.createUserObj.address);
            userInfor.append("birthday", this.createUserObj.birthday);
            userInfor.append("avatar", this.createUserObj.avatarFile != "" ? this.createUserObj.avatar : "");
            userInfor.append("fullName", this.createUserObj.fname + " " + this.createUserObj.lname);
            if (this.createUserObj.avatarFile != null && this.createUserObj.avatarFile != undefined) {
              userInfor.append("avatarFile", this.createUserObj.avatar);
            }
            else {
              userInfor.append("avatarFile", null);
            }

            // for (let i = 0; i < files.length; i++) {
            //  formData.append("files", files[i]);
            // }

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
