import { Component, OnInit, AfterViewInit } from '@angular/core';
import { Router, ActivatedRoute } from '@angular/router';
import { NgbModal } from '@ng-bootstrap/ng-bootstrap';
import { AdminpageService } from '../../../@core/data/adminpage.service';
import { AdminpageactionService } from '../../../@core/data/adminpageaction.service';
import { AccountService } from '../../../@core/data/account.service';
import { AppConstant } from '../../../config/appconstant';
import { ConfirmModalComponent } from '../../ui-features/modals/confirm/confirm.component';
import { ConfigurationService } from './configuration.service';
import { EventObject } from '../../../@core/interface/event-object';
import { ToasterService, ToasterConfig, Toast, BodyOutputType } from 'angular2-toaster';
import 'style-loader!angular2-toaster/toaster.css';
declare var $: any;

@Component({
  selector: 'detail',
  templateUrl: './detail.component.html',
  styleUrls: ['./detail.component.scss']
})
export class DetailComponent implements OnInit {

  adminPages: any;
  data;
  rows;
  configuration;
  pagination = {
    limit: AppConstant.pageSizeDefault,
    offset: (AppConstant.pageIndexDefault - 1),
    count: null,
  };

  columns = [
    { key: '', title: 'Action' },
    { key: 'actionName', title: 'Tên action' },
    { key: 'actionDescription', title: 'Mô tả' },
    // { key: 'actionStatus', title: 'Active' },
  ];

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

  pathInfor = {
    path: AppConstant.stringEmpty,
    typeAct: AppConstant.stringEmpty,
    type: AppConstant.stringEmpty
  };

  config: ToasterConfig;

  private id: number = AppConstant.numberZero;
  private parentId: number = AppConstant.numberZero;
  private type: string = AppConstant.stringEmpty;
  private errorMessage: string = AppConstant.stringEmpty;
  private objectAdminPage: any;
  private node: number = AppConstant.numberZero;

  private params: string = AppConstant.paramsDefault;
  private lang: string = AppConstant.stringEmpty;
  public search: string = AppConstant.stringEmpty;
  private pageId: number = AppConstant.numberZero;
  private pageIndex: number = AppConstant.pageIndexDefault;
  private pageSize: number = AppConstant.pageSizeDefault;
  private orderBy: string = AppConstant.stringEmpty;
  private orderType: string = AppConstant.stringEmpty;

  constructor(private activatedRoute: ActivatedRoute,
    private router: Router,
    private adminPageService: AdminpageService,
    private adminPageActionService: AdminpageactionService,
    private accountService: AccountService,
    private modalService: NgbModal,
    private toasterService: ToasterService) {

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
    this.pathInfor.type = this.type;
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

    // get param from router ex: /:username
    this.activatedRoute.params.forEach(params => {
      this.id = params['id'];
      this.type = params['type'];
      this.parentId = params['parentId'];
    });

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

    if (this.type === null || this.type === AppConstant.stringEmpty) {
      this.type = AppConstant.stringEmpty;
    }
  }

  ngOnInit() {
    this.adminPageService.getAdminPageDetail(this.id).subscribe(result => {
      if (result) {
        this.adminPageDetail = result;
      }
    }),
      error => {
        this.showToast(AppConstant.toastrTypeError, AppConstant.errorTitle, error.message);
      };

    let paramGetTree: string = AppConstant.paramsDefault;

    // create tree list AdminPage
    if (this.type !== undefined && this.type.length > AppConstant.numberZero) {
      if (paramGetTree.length > AppConstant.numberOne) {
        paramGetTree = paramGetTree + "&type=" + this.type;
      }
      else {
        paramGetTree = paramGetTree + "type=" + this.type;
      }
    }

    if (this.parentId !== undefined && this.parentId > AppConstant.numberZero) {
      if (paramGetTree.length > AppConstant.numberOne) {
        paramGetTree = paramGetTree + "&parentId=" + this.parentId;
      }
      else {
        paramGetTree = paramGetTree + "parentId=" + this.parentId;
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
        $('#jstree').jstree({
          'core': {
            'data': result
          }
        });
      }
      else {
        this.showToast(AppConstant.toastrTypeError, AppConstant.errorTitle, result.message);
      }
    }),
      error => {
        this.showToast(AppConstant.toastrTypeError, AppConstant.errorTitle, error.message);
      };

    this.filter(null);
  }

  // function filter data
  filter(obj: EventObject) {
    this.params = AppConstant.paramsDefault;

    if (obj != null) {
      this.pagination.limit = obj.value.limit ? obj.value.limit : this.pagination.limit;
      this.pagination.offset = obj.value.page ? obj.value.page : this.pagination.offset;
      this.pagination = { ...this.pagination };

      this.pageIndex = this.pagination.offset;
      this.pageSize = this.pagination.limit;

      if (obj.event === 'onOrder') {
        this.orderBy = obj.value.key;
        this.orderType = obj.value.order;
      }
    }

    if (this.type !== undefined && this.type.length > AppConstant.numberZero) {
      if (this.params.length > AppConstant.numberOne) {
        this.params = this.params + "&type=" + this.type;
      }
      else {
        this.params = this.params + "type=" + this.type;
      }
    }

    if (this.search !== undefined && this.search.length > AppConstant.numberZero) {
      if (this.params.length > AppConstant.numberOne) {
        this.params = this.params + "&search=" + this.search;
      }
      else {
        this.params = this.params + "search=" + this.search;
      }
    }

    if (this.id !== undefined && this.id >= AppConstant.numberZero) {
      if (this.params.length > AppConstant.numberOne) {
        this.params = this.params + "&pageId=" + this.id;
      }
      else {
        this.params = this.params + "pageId=" + this.id;
      }
    }

    if (this.pageIndex !== undefined && this.pageIndex > AppConstant.numberZero) {
      if (this.params.length > AppConstant.numberOne) {
        this.params = this.params + "&pageIndex=" + this.pageIndex;
      }
      else {
        this.params = this.params + "pageIndex=" + this.pageIndex;
      }
    }

    if (this.pageSize !== undefined && this.pageSize > AppConstant.numberZero) {
      if (this.params.length > AppConstant.numberOne) {
        this.params = this.params + "&pageSize=" + this.pageSize;
      }
      else {
        this.params = this.params + "pageSize=" + this.pageSize;
      }
    }

    if (this.orderBy !== undefined && this.orderBy.length > AppConstant.numberZero) {
      if (this.params.length > AppConstant.numberOne) {
        this.params = this.params + "&orderBy=" + this.orderBy;
      }
      else {
        this.params = this.params + "orderBy=" + this.orderBy;
      }
    }

    if (this.orderType !== undefined && this.orderType.length > AppConstant.numberZero) {
      if (this.params.length > AppConstant.numberOne) {
        this.params = this.params + "&orderType=" + this.orderType;
      }
      else {
        this.params = this.params + "orderType=" + this.orderType;
      }
    }

    this.getData(this.params);
  }

  getData(params: string) {
    this.configuration = ConfigurationService.config;
    this.configuration.isLoading = AppConstant.trueDefault;

    this.adminPageActionService.getListAdminPageAction(params).subscribe(result => {
      if (result) {
        if (result && result.code) {
          this.data = null;
          this.rows = this.data;
          this.configuration.isLoading = false;
        }
        else {
          this.data = result.listUserPageAction;
          this.rows = this.data;
          this.pagination.count = this.pagination.count ? this.pagination.count : result.totalRecord;
          this.pagination.limit = this.pageSize;
          this.pagination = { ...this.pagination };
          this.configuration.isLoading = false;
        }
      }
    }),
      error => {
        console.error('ERROR: ', error.message);
      };
  }

  eventEmitted($event) {
    this.filter($event);
  }

  // search by name
  onNameSearch(value): void {
    this.search = value;
    this.filter(null);
  }

  backclick() {
    if (this.parentId == AppConstant.numberZero) {
      this.router.navigate(['/pages/adminpage/list', this.type]);
    }
    else {
      this.router.navigate(['/pages/adminpage/list', this.type, this.node, this.parentId]);
    }
  }

  addClick() {
    this.router.navigate(['/pages/adminpageaction/add', this.type, this.id]);
  }

  editclick(id : number) {
    this.router.navigate(['/pages/adminpageaction/edit', this.type, this.id, id]);
  }

  // show modal confirm delete
  showDeleteConfirm(id: number, actionName: string) {
    const activeModal = this.modalService.open(ConfirmModalComponent, { size: 'lg', container: 'nb-layout' });

    activeModal.componentInstance.confirmationBoxTitle = AppConstant.confirmTitle;
    activeModal.componentInstance.confirmationMessage = AppConstant.confirmDeleteContent + ": " + actionName;

    activeModal.result.then((userResponse) => {
      if (userResponse) {
        this.deleteClick(id);
      }
    });
  }

  deleteClick(id: number) {
    // check user is permission for view page
    let lastPath = this.activatedRoute.snapshot.url[0].path;
    this.pathInfor.path = this.router.url.split('/' + lastPath)[0] + '/' + lastPath;
    this.pathInfor.type = this.type;
    this.pathInfor.typeAct = AppConstant.deleteAction;

    this.accountService.checkPermission(this.pathInfor).subscribe(result => {
      if (result) {
        if (result && result.code) {
          if (result.code === AppConstant.permissionDeniedCode) {
            this.showToast(AppConstant.toastrTypeError, AppConstant.permissionDeniedTitle, result.message);
          }
          else if (result.code === AppConstant.permissionAccessCode) {
            // call api delete user
            this.adminPageActionService.deleteAdminPageAction(id).subscribe(result => {
              if (result) {
                if (result && result.code) {
                  if (result.code === AppConstant.successCode) {
                    this.showToast(AppConstant.toastrTypeSuccess, AppConstant.successTitle, result.message);
                    // reload data
                    this.filter(null);
                  }
                }
              }
            });

          }
        }
      }
    }),
      error => {
        console.error('ERROR: ', error.message);
      };
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
