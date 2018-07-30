import { Component, OnInit, AfterViewInit } from '@angular/core';
import { Router, ActivatedRoute } from '@angular/router';
import { NgbModal } from '@ng-bootstrap/ng-bootstrap';
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

  adminPages: any;

  adminPageDetail = {
    id: AppConstant.numberZero,
    act: AppConstant.stringEmpty,
    ctrl: AppConstant.stringEmpty,
    title: AppConstant.stringEmpty,
    isShow: AppConstant.falseDefault,
    tye: AppConstant.stringEmpty,
    parentId: AppConstant.numberZero,
    orderDisplay: AppConstant.numberZero,
    icon: AppConstant.stringEmpty,
    path: AppConstant.stringEmpty,
    breadcrumb: AppConstant.stringEmpty
  }

  pathInfor = {
    path: AppConstant.stringEmpty,
    typeAct: AppConstant.stringEmpty,
    type: AppConstant.stringEmpty
  };

  config: ToasterConfig;

  public isCreate: boolean = AppConstant.trueDefault;
  private id: number = AppConstant.numberZero;
  private parentId: number = AppConstant.numberZero;
  private type: string = AppConstant.stringEmpty;
  private errorMessage: string = AppConstant.stringEmpty;
  private params: string = AppConstant.paramsDefault;
  private objectAdminPage: any;
  private node: number = AppConstant.numberZero;


  constructor(private activatedRoute: ActivatedRoute,
    private router: Router,
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
      localStorage.removeItem(AppConstant.objectAdminPage);
    }

    // get param from router ex: /:username
    this.activatedRoute.params.forEach(params => {
      this.id = params['id'];
      this.type = params['type'];
      this.parentId = params['parentId'];
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
    this.pathInfor.typeAct = this.isCreate == AppConstant.trueDefault ? AppConstant.addAction : AppConstant.editAction;

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

    if (this.parentId !== null && this.parentId > AppConstant.numberZero && this.parentId !== undefined) {
      this.adminPageService.getAdminPageDetail(this.parentId).subscribe(result => {
        if (result) {
          this.node = result.parentId;
        }
      }),
        error => {
          this.showToast(AppConstant.toastrTypeError, AppConstant.errorTitle, error.message);
        };
    }

    let parentIdTree: number;

    // check localStorage exist
    if (localStorage.getItem(AppConstant.objectAdminPage) !== null) {
      this.objectAdminPage = JSON.parse(localStorage.getItem(AppConstant.objectAdminPage));
      this.adminPageDetail.id = this.objectAdminPage.id;
      this.adminPageDetail.act = this.objectAdminPage.act;
      this.adminPageDetail.ctrl = this.objectAdminPage.ctrl;
      this.adminPageDetail.title = this.objectAdminPage.title;
      this.adminPageDetail.isShow = this.objectAdminPage.isShow;
      this.adminPageDetail.tye = this.objectAdminPage.tye;
      this.adminPageDetail.parentId = this.parentId;
      parentIdTree = this.objectAdminPage.parentId;
      this.adminPageDetail.orderDisplay = this.objectAdminPage.orderDisplay;
      this.adminPageDetail.icon = this.objectAdminPage.icon;
      this.adminPageDetail.path = this.objectAdminPage.path;
      this.adminPageDetail.breadcrumb = this.objectAdminPage.breadcrumb;
    }
    else {
      parentIdTree = this.parentId
      if (this.isCreate === false) {
        this.adminPageService.getAdminPageDetail(this.id).subscribe(result => {
          if (result) {
            this.adminPageDetail = result;
          }
          else {
            this.showToast(AppConstant.toastrTypeError, AppConstant.errorTitle, result.message);
          }
        }),
          error => {
            this.showToast(AppConstant.toastrTypeError, AppConstant.errorTitle, error.message);
          };
      }
    }

    let paramGetTree: string = "?";
    // create tree list AdminPage
    if (this.type !== undefined && this.type.length > AppConstant.numberZero) {
      if (paramGetTree.length > AppConstant.numberOne) {
        paramGetTree = paramGetTree + "&type=" + this.type;
      }
      else {
        paramGetTree = paramGetTree + "type=" + this.type;
      }
    }

    if (parentIdTree !== undefined && parentIdTree > AppConstant.numberZero) {
      if (paramGetTree.length > AppConstant.numberOne) {
        paramGetTree = paramGetTree + "&parentId=" + parentIdTree;
      }
      else {
        paramGetTree = paramGetTree + "parentId=" + parentIdTree;
      }
    }

    if (this.id !== undefined && this.id > AppConstant.numberZero) {
      if (paramGetTree.length > AppConstant.numberOne) {
        paramGetTree = paramGetTree + "&id=" + this.id;
      }
      else {
        paramGetTree = paramGetTree + "id=" + this.id;
      }
    }

    this.adminPageService.getListAdminPageTree(paramGetTree).subscribe(result => {
      if (result) {

        if (result) {
          $('#jstree').jstree({
            'core': {
              'data': result
            }
          });
        }
        else {
          console.log(result);
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

  nextclick() {
    // validate
    let isValid = AppConstant.trueDefault;
    let mess = AppConstant.stringEmpty;
    let treeParentId: string = $(".jstree-clicked").attr('id').replace("_anchor", "");
    let validateAdminPageObj = {
      title: this.adminPageDetail.title,
      isShow: this.adminPageDetail.isShow,
      tye: this.adminPageDetail.tye,
      parentId: treeParentId,
      orderDisplay: this.adminPageDetail.orderDisplay,
      icon: this.adminPageDetail.icon,
      path: this.adminPageDetail.path,
      breadcrumb: this.adminPageDetail.breadcrumb
    }

    let createAdminPageObj = {
      id: this.adminPageDetail.id,
      act: this.adminPageDetail.act,
      ctrl: this.adminPageDetail.ctrl,
      title: this.adminPageDetail.title,
      isShow: this.adminPageDetail.isShow,
      tye: this.adminPageDetail.tye,
      parentId: treeParentId,
      orderDisplay: this.adminPageDetail.orderDisplay,
      icon: this.adminPageDetail.icon,
      path: this.adminPageDetail.path,
      breadcrumb: this.adminPageDetail.breadcrumb
    }

    // call api validate adminpage
    this.adminPageService.validateAdminPage(validateAdminPageObj).subscribe(result => {
      if (result) {
        if (result.code === AppConstant.successCode) {

          // save obj to locate
          localStorage.setItem(AppConstant.objectAdminPage, JSON.stringify(createAdminPageObj));

          localStorage.setItem(AppConstant.isInProcess, AppConstant.trueDefault.toString());
          if (this.isCreate) {
            this.router.navigate(['/pages/adminpage/confirm', this.type, this.parentId]);
          }
          else {
            this.router.navigate(['/pages/adminpage/confirm', this.type, this.parentId, this.id]);
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
    if (this.parentId === AppConstant.numberZero) {
      this.router.navigate(['/pages/adminpage/list', this.type]);
    }
    else {
      this.router.navigate(['/pages/adminpage/list', this.type, this.node, this.parentId]);
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
