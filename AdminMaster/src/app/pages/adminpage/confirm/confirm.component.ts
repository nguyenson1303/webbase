import { Component, OnInit } from '@angular/core';
import { Router, ActivatedRoute } from '@angular/router';
import { NgbModal } from '@ng-bootstrap/ng-bootstrap';
import { AdminpageService } from '../../../@core/data/adminpage.service';
import { AccountService } from '../../../@core/data/account.service';
import { AppConstant } from '../../../config/appconstant';
import { ModalComponent } from '../../ui-features/modals/modal/modal.component';
import { ConfirmModalComponent } from '../../ui-features/modals/confirm/confirm.component';
import { ToasterService, ToasterConfig, Toast, BodyOutputType } from 'angular2-toaster';
import 'style-loader!angular2-toaster/toaster.css';
declare var $: any;

@Component({
  selector: 'confirm',
  templateUrl: './confirm.component.html',
  styleUrls: ['./confirm.component.scss']
})
export class ConfirmComponent implements OnInit {

  objectAdminPageActions: any;

  adminPageDetail = {
    id: AppConstant.numberZero,
    act: AppConstant.stringEmpty,
    ctrl: AppConstant.stringEmpty,
    title: AppConstant.stringEmpty,
    isShow: AppConstant.trueDefault,
    tye: AppConstant.stringEmpty,
    parentId: AppConstant.numberZero,
    orderDisplay: AppConstant.numberZero,
    icon: AppConstant.stringEmpty,
    path: AppConstant.stringEmpty,
    breadcrumb: AppConstant.stringEmpty
  }

  config: ToasterConfig;

  public isCreate: boolean = AppConstant.trueDefault;
  private id: number = AppConstant.numberZero;
  private objectAdminPage: any;
  private type: string = AppConstant.stringEmpty;
  private parentId: number = AppConstant.numberZero;

  constructor(private activatedRoute: ActivatedRoute,
    private adminPageService: AdminpageService,
    private accountService: AccountService,
    private router: Router,
    private modalService: NgbModal,
    private toasterService: ToasterService) {

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
      if (params['parentId'] === null || params['parentId'] === undefined) {
        this.parentId = AppConstant.numberZero;
      }
      else {
        this.parentId = params['parentId'];
      }
    });

    if (this.id !== null && this.id > AppConstant.numberZero) {
      this.isCreate = AppConstant.falseDefault;
    }

    if (this.type === null || this.type === AppConstant.stringEmpty) {
      this.type = AppConstant.stringEmpty;
    }
  }

  ngOnInit() {
    // check localStorage exist
    this.objectAdminPage = localStorage.getItem(AppConstant.objectAdminPage);
    if (this.objectAdminPage !== null && this.objectAdminPage !== undefined) {
      this.adminPageDetail = JSON.parse(this.objectAdminPage);
      let paramGetTree: string = AppConstant.paramsDefault;

      if (this.type != undefined && this.type.length > 0) {
        if (paramGetTree.length > AppConstant.numberOne) {
          paramGetTree = paramGetTree + "&type=" + this.type;
        }
        else {
          paramGetTree = paramGetTree + "type=" + this.type;
        }
      }

      if (this.adminPageDetail.parentId !== undefined && this.adminPageDetail.parentId > AppConstant.numberZero) {
        if (paramGetTree.length > AppConstant.numberZero) {
          paramGetTree = paramGetTree + "&parentId=" + this.adminPageDetail.parentId;
        }
        else {
          paramGetTree = paramGetTree + "parentId=" + this.adminPageDetail.parentId;
        }
      }

      this.adminPageService.getListAdminPageTree(paramGetTree).subscribe(result => {
        if (result) {
          $('#jstree').jstree({
            'core': {
              'data': result
            }
          });

          $('#jstree li').each(function () {
            $("#jstree").jstree().disable_node(this.id);
          })
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
      this.router.navigate(['/pages/miscellaneous/404']);
    }
  }

  nextclick() {

    let createAdminPageObj = {
      title: this.adminPageDetail.title,
      isShow: this.adminPageDetail.isShow,
      tye: this.adminPageDetail.tye,
      parentId: this.adminPageDetail.parentId,
      orderDisplay: this.adminPageDetail.orderDisplay,
      icon: this.adminPageDetail.icon,
      path: this.adminPageDetail.path,
      breadcrumb: this.adminPageDetail.breadcrumb
    }

    if (this.isCreate) {
      // call api create adminpage
      this.adminPageService.createAdminPage(createAdminPageObj).subscribe(result => {
        if (result) {
          if (result.code === AppConstant.successCode) {
            localStorage.removeItem(AppConstant.objectAdminPage);
            localStorage.removeItem(AppConstant.isInProcess);
            this.showToast(AppConstant.toastrTypeSuccess, AppConstant.successTitle, AppConstant.messcreateSuccess);
            this.router.navigate(['/pages/adminpage/list', this.type]);
          }
          else {
            this.showToast(AppConstant.toastrTypeError, AppConstant.failTitle, AppConstant.messCreateFail);
          }
        }
      }),
        error => {
          this.showToast(AppConstant.toastrTypeError, AppConstant.errorTitle, error.message);
        };
    }
    else {
      // call api update adminpage
      this.adminPageService.updateAdminPage(this.id, createAdminPageObj).subscribe(result => {
        if (result) {
          if (result.code === AppConstant.successCode) {
            localStorage.removeItem(AppConstant.objectAdminPage);
            localStorage.removeItem(AppConstant.isInProcess);
            this.showToast(AppConstant.toastrTypeSuccess, AppConstant.successTitle, AppConstant.messcreateSuccess);
            this.router.navigate(['/pages/adminpage/list', this.type]);
          }
          else {
            this.showToast(AppConstant.toastrTypeError, AppConstant.failTitle, AppConstant.messCreateFail);
          }
        }
      }),
        error => {
          this.showToast(AppConstant.toastrTypeError, AppConstant.errorTitle, error.message);
        };
    }
  }

  backclick() {
    localStorage.setItem(AppConstant.isInProcess, AppConstant.trueDefault.toString())
    localStorage.setItem(AppConstant.objectAdminPage, JSON.stringify(this.adminPageDetail))

    if (this.isCreate) {
      this.router.navigate(['/pages/adminpage/add', this.type, this.parentId]);
    }
    else {
      this.router.navigate(['/pages/adminpage/edit', this.type, this.parentId, this.id]);
    }
  }

  showModal(title: string, mess: string) {
    const activeModal = this.modalService.open(ModalComponent, { size: 'lg', container: 'nb-layout' });

    activeModal.componentInstance.modalHeader = title;
    activeModal.componentInstance.modalContent = mess;
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
