import { Component, OnInit } from '@angular/core';
import { Router, ActivatedRoute } from '@angular/router';
import { NgbModal } from '@ng-bootstrap/ng-bootstrap';
import { AccountService } from '../../../@core/data/account.service';
import { BaseService } from '../../../@core/data/base.service';
import { AppConfig } from '../../../config/appconfig';
import { AppConstant } from '../../../config/appconstant';
import { ModalComponent } from '../../ui-features/modals/modal/modal.component';
import { ConfirmModalComponent } from '../../ui-features/modals/confirm/confirm.component';

@Component({
  selector: 'setting',
  templateUrl: './setting.component.html',
  styleUrls: ['./setting.component.scss']
})
export class SettingComponent implements OnInit {

  userDetail = {
    oldPassword: "",
    password: "",
    confirmPassword: ""
  };

  pathInfor = {
    path: "",
    typeAct: "",
    type: ""
  };

  constructor(private activatedRoute: ActivatedRoute,
    private router: Router,
    private accountService: AccountService,
    private modalService: NgbModal,
    private baseService: BaseService) {

    // copy main_breadcrumb to child_breadcrumb
    $(document).ready(() => {
      let breadcrumb = $("#main_breadcrumb");
      let child_breadcrumb = $("#child_breadcrumb");

      if (breadcrumb.html() != null && breadcrumb.html() != undefined) {
        child_breadcrumb.html(breadcrumb.html());
      }
    });

    // check user is permission for view page
    let lastPath = activatedRoute.snapshot.url[0].path;
    this.pathInfor.path = this.router.url.split('/' + lastPath)[0] + '/' + lastPath;
    this.pathInfor.type = "";
    this.pathInfor.typeAct = AppConstant.viewAction;

    this.accountService.checkPermission(this.pathInfor).subscribe(result => {
      if (result) {
        if (result.code === AppConstant.permissionDeniedCode) {
          this.router.navigate(['/pages/miscellaneous/denied']);
        }
      }
    }),
      error => {
        this.showModal(AppConstant.errorTitle, error.message);
      };
  }

  ngOnInit() {
  }

  backclick() {
    this.router.navigate(['/pages/dashboard']);
  }

  nextclick() {
    // validate
    let isValid = true;
    let mess = "";

    // call api validate user
    this.accountService.validateChangePassword(this.userDetail).subscribe(result => {
      if (result) {
        if (result.code === AppConstant.successCode) {
          this.accountService.changePassword(this.userDetail).subscribe(change => {
            if (change) {
              if (change.code === AppConstant.successCode) {
                this.showModal(AppConstant.successTitle, AppConstant.messupdateSuccess);
              }
              else {
                this.showModal(AppConstant.failTitle, AppConstant.messUpdateFail);
              }
            }
            else {
              this.showModal(AppConstant.failTitle, AppConstant.messUpdateFail);
            }
          });
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
          if (fieldValidate) {
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
}
