import { Component, OnInit, AfterViewInit } from '@angular/core';
import { Router, ActivatedRoute } from '@angular/router';
import { NgbModal } from '@ng-bootstrap/ng-bootstrap';
import { AdminpageactionService } from '../../../@core/data/adminpageaction.service';
import { AdminpageService } from '../../../@core/data/adminpage.service';
import { AccountService } from '../../../@core/data/account.service';
import { AppConstant } from '../../../config/appconstant';
import { ConfirmModalComponent } from '../../ui-features/modals/confirm/confirm.component';
import { ToasterService, ToasterConfig, Toast, BodyOutputType } from 'angular2-toaster';
import 'style-loader!angular2-toaster/toaster.css';
declare var $: any;

@Component({
  selector: 'edit',
  templateUrl: './edit.component.html',
  styleUrls: ['./edit.component.scss']
})
export class EditComponent implements OnInit {

  adminPageActionDetail = {
    id: AppConstant.numberZero,
    actionName: AppConstant.stringEmpty,
    actionDescription: AppConstant.stringEmpty,
    actionStatus: AppConstant.numberZero,
    actionPage: AppConstant.numberZero,
    isCreate: AppConstant.falseDefault,
  }

  pathInfor = {
    path: AppConstant.stringEmpty,
    typeAct: AppConstant.stringEmpty,
    type: AppConstant.stringEmpty
  };

  config: ToasterConfig;

  public isCreate: boolean = AppConstant.trueDefault;
  private id: number;
  private pageId: number;
  private type: string = AppConstant.stringEmpty;
  private errorMessage: string = AppConstant.stringEmpty;
  private params: string = AppConstant.paramsDefault;
  private objectAdminPageAction: any;

  constructor(private activatedRoute: ActivatedRoute,
    private router: Router,
    private adminPageActionService: AdminpageactionService,
    private adminPageService: AdminpageService,
    private accountService: AccountService,
    private modalService: NgbModal,
    private toasterService: ToasterService) {

    // set breadcrumd
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
      localStorage.removeItem(AppConstant.objectAdminPageAction);
    }

    // get param from router ex: /:username
    this.activatedRoute.params.forEach(params => {
      this.id = params['id'];
      this.type = params['type'];
      this.pageId = params['pageId'];
    });

    if (this.id !== null && this.id !== undefined) {
      this.isCreate = AppConstant.falseDefault;
    }

    if (this.type === null || this.type === AppConstant.stringEmpty) {
      this.type = AppConstant.stringEmpty;
    }

    // check user is permission for view page
    let lastPath = activatedRoute.snapshot.url[0].path;
    this.pathInfor.path = this.router.url.split('/' + lastPath)[0] + '/' + lastPath;
    this.pathInfor.type = this.type;
    this.pathInfor.typeAct = this.isCreate == true ? AppConstant.addAction : AppConstant.editAction;

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
    if (localStorage.getItem(AppConstant.objectAdminPageAction) != null) {
      this.objectAdminPageAction = JSON.parse(localStorage.getItem(AppConstant.objectAdminPageAction));
      this.adminPageActionDetail.id = this.objectAdminPageAction.id;
      this.adminPageActionDetail.actionName = this.objectAdminPageAction.actionName;
      this.adminPageActionDetail.actionDescription = this.objectAdminPageAction.actionDescription;
      this.adminPageActionDetail.actionPage = this.objectAdminPageAction.actionPage;
      this.adminPageActionDetail.actionStatus = this.objectAdminPageAction.actionStatus;
      this.adminPageActionDetail.isCreate = this.objectAdminPageAction.isCreate;
    }
    else {
      if (this.isCreate == false) {
        this.adminPageActionService.getAdminPageActionDetail(this.id).subscribe(result => {
          if (result) {
            this.adminPageActionDetail = result;
            this.adminPageActionDetail.isCreate = this.isCreate;
          }
          else {
            this.showToast(AppConstant.toastrTypeError, AppConstant.errorTitle, result.message);
          }
        }),
          error => {
            this.showToast(AppConstant.toastrTypeError, AppConstant.errorTitle, error.message);
          };
      }
      else
      {
        this.adminPageActionDetail.actionPage = this.pageId;
      }
    }
  }

  nextclick() {
    // validate
    let isValid = AppConstant.trueDefault;
    let mess = AppConstant.stringEmpty;
    let validateAdminPageActionObj = {
      actionName: this.adminPageActionDetail.actionName,
      actionDescription: this.adminPageActionDetail.actionDescription,
      actionPage: this.pageId,
      actionStatus: AppConstant.numberOne,
      modifyDate: AppConstant.stringEmpty,
      createDate: AppConstant.stringEmpty,
      isCreate : this.adminPageActionDetail.isCreate
    }

    let createAdminPageActionObj = {
      id: this.adminPageActionDetail.id,
      actionName: this.adminPageActionDetail.actionName,
      actionDescription: this.adminPageActionDetail.actionDescription,
      actionPage: this.adminPageActionDetail.actionPage,
      actionStatus: this.adminPageActionDetail.actionStatus,
      isCreate: this.adminPageActionDetail.isCreate,
    }

    // call api validate adminpage
    this.adminPageActionService.validateAdminPageAction(validateAdminPageActionObj).subscribe(result => {
      if (result) {
        if (result.code === AppConstant.successCode) {

          // save obj to locate
          localStorage.setItem(AppConstant.objectAdminPageAction, JSON.stringify(createAdminPageActionObj));

          localStorage.setItem(AppConstant.isInProcess, AppConstant.trueDefault.toString());
          if (this.isCreate) {
            this.router.navigate(['/pages/adminpageaction/confirm', this.type, this.pageId]);
          }
          else {
            this.router.navigate(['/pages/adminpageaction/confirm', this.type, this.pageId, this.id]);
          }
        }
        else {
          // focus to field error and show message
          let field = document.getElementById(result.field);
          let fieldValidate = document.getElementById(result.field + "-validate");
          var validateField = document.querySelectorAll(".validateServer");
          var i;
          for (i = AppConstant.numberZero; i < validateField.length; i++) {
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

  backclick() {
    let node: number = AppConstant.numberZero;
    if (this.pageId !== null && this.pageId > AppConstant.numberZero && this.pageId !== undefined) {
      this.adminPageService.getAdminPageDetail(this.pageId).subscribe(result => {
        if (result) {
          this.adminPageService.getAdminPageDetail(result.parentId).subscribe(result2 => {
            if (result2) {
              node = result.Id;
            }
          }),
            error => {
              this.showToast(AppConstant.toastrTypeError, AppConstant.errorTitle, error.message);
            };
        }
      }),
        error => {
          this.showToast(AppConstant.toastrTypeError, AppConstant.errorTitle, error.message);
        };
    }
    this.router.navigate(['/pages/adminpage/detail', this.type, node, this.pageId]);
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
