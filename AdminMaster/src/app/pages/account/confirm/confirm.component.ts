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
    avatar: "",
    avatarFile: null
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
        let file = this.createUserObj.avatarFile;
        let fr = new FileReader();
        fr.onload = (event: any) => {
          let base64 = event.target.result;

          this.createUserObj.avatar = base64;
        }
        fr.readAsDataURL(file);
      }
      else {
        if ((this.createUserObj.avatar === null || this.createUserObj.avatar === "")) {
          this.createUserObj.avatar = AppConstant.avatarDefault;
        }
      }
    }
    else {
      this.router.navigate(['/pages/miscellaneous/404']);
    }
  }

  backclick() {
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
      this.accountService.createUser(this.createUserObj).subscribe(result => {
        if (result) {
          if (result.code === AppConstant.successCode) {
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

            let userInfor = {
              fname: this.createUserObj.fname,
              lname: this.createUserObj.lname,
              phone: this.createUserObj.phone,
              address: this.createUserObj.address,
              birthday: this.createUserObj.birthday,
              avatar: this.createUserObj.avatar,
              avatarFile: this.createUserObj.avatarFile,
              fullName: this.createUserObj.fname + " " + this.createUserObj.lname
            };

            this.accountService.updateUserInfor(this.username, userInfor).subscribe(result => {
              if (result) {
                if (result.code === AppConstant.successCode) {
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
