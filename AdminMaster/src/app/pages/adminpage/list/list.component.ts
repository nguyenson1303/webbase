import { Component, ViewChild, AfterViewInit } from '@angular/core';
import { Router, ActivatedRoute } from '@angular/router';
import { NgbModal } from '@ng-bootstrap/ng-bootstrap';
import { AdminpageService } from '../../../@core/data/adminpage.service';
import { AccountService } from '../../../@core/data/account.service';
import { AppConstant } from '../../../config/appconstant';
import { ConfigurationService } from './configuration.service';
import { ModalComponent } from '../../ui-features/modals/modal/modal.component';
import { ConfirmModalComponent } from '../../ui-features/modals/confirm/confirm.component';
import { EventObject } from '../../../@core/interface/event-object';
declare var $: any;

@Component({
  selector: 'list-page',
  templateUrl: './list.component.html',
  styleUrls: ['./list.component.scss']
})
export class ListComponent {

  columns = [
    { key: 'title', title: 'Tiêu đề' },
    { key: 'path', title: 'Đường dẫn' },
    { key: 'tye', title: 'Kiểu' },
    { key: 'isShow', title: 'Menu' },
    { key: 'parentId', title: 'Action' }
  ];

  dataResult = [];
  data = [];
  configuration;
  pagination = {
    limit: AppConstant.pageSizeDefault,
    offset: (AppConstant.pageIndexDefault - 1),
    count: null,
  };

  pathInfor = {
    path: AppConstant.stringEmpty,
    typeAct: AppConstant.stringEmpty,
    type: AppConstant.stringEmpty
  };

  private params: string = AppConstant.paramsDefault;
  private type: string = AppConstant.stringEmpty;
  private lang: string = AppConstant.stringEmpty;
  public search: string = AppConstant.stringEmpty;
  private pageIndex: number = AppConstant.pageIndexDefault;
  private pageSize: number = AppConstant.pageSizeDefault;
  private parentId: number = AppConstant.numberZero;
  private orderBy: string = AppConstant.stringEmpty;
  private orderType: string = AppConstant.stringEmpty;
  private node: number = AppConstant.numberZero;
  private oldNode: number = AppConstant.numberZero;
  public isShowBack: boolean = false;
  public parentName: string = AppConstant.stringEmpty;

  constructor(private activatedRoute: ActivatedRoute,
    private router: Router,
    private adminpageService: AdminpageService,
    private accountService: AccountService,
    private modalService: NgbModal) {

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
        if (result && result.code) {
          if (result.code === AppConstant.permissionDeniedCode) {
            this.router.navigate(['/pages/miscellaneous/denied']);
          }
        }
      }
    }),
      error => {
        this.showModal(AppConstant.errorTitle, error.message);
      };

    if (this.pageIndex === undefined || this.pageIndex === null) {
      this.pageIndex = AppConstant.pageIndexDefault;
    }

    if (this.pageSize === undefined || this.pageSize === null) {
      this.pageSize = AppConstant.pageSizeDefault;
    }

    // get param from router ex: /:type
    this.activatedRoute.params.forEach(params => {
      this.type = params['type'];

      if (params['node'] != null && params['node'] != undefined) {
        this.node = params['node'];
      }
      else {
        this.node = 0;
      }

      if (params['parentId'] != null && params['parentId'] != undefined) {
        this.parentId = params['parentId'];
        this.isShowBack = true;
      }
      else {
        this.parentId = 0;  // get all page parent root
        this.isShowBack = false;
      }

      this.filter(null);
    })
  }

  ngAfterViewInit() {

  }

  // function filter data
  filter(obj: EventObject) {
    this.params = AppConstant.paramsDefault;

    if (obj !== null) {
      this.pagination.limit = obj.value.limit ? obj.value.limit : this.pagination.limit;
      this.pagination.offset = obj.value.page ? obj.value.page : this.pagination.offset;
      this.pagination = { ...this.pagination };

      this.pageIndex = this.pagination.offset;
      this.pageSize = this.pagination.limit;

      if (this.pageIndex == AppConstant.numberZero) {
        this.pageIndex = AppConstant.numberOne;
      }

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

    if (this.lang !== undefined && this.lang.length > AppConstant.numberZero) {
      if (this.params.length > AppConstant.numberOne) {
        this.params = this.params + "&lang=" + this.lang;
      }
      else {
        this.params = this.params + "lang=" + this.lang;
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

    if (this.parentId !== undefined && this.parentId !== null) {
      if (this.params.length > AppConstant.numberOne) {
        this.params = this.params + "&parentId=" + this.parentId;
      }
      else {
        this.params = this.params + "parentId=" + this.parentId;
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

    this.adminpageService.getListAdminPage(params).subscribe(result => {
      if (result) {
        if (result && result.code) {
          this.data = [];
          this.configuration.isLoading = AppConstant.falseDefault;
        }
        else {
          this.data = [];
          this.data = result.listUserPage;
          this.pagination.count = this.pagination.count ? this.pagination.count : result.totalRecord;
          this.pagination.limit = this.pageSize;
          this.pagination = { ...this.pagination };
          this.configuration.isLoading = AppConstant.falseDefault;
        }
      }
    }),
      error => {
        console.error('ERROR: ', error.message);
      };

    if (this.parentId !== null && this.parentId > AppConstant.numberZero && this.parentId !== undefined) {
      this.adminpageService.getAdminPageDetail(this.parentId).subscribe(result => {
        if (result) {
          this.parentName = "con của " + result.title;
        }
      }),
        error => {
          this.showModal(AppConstant.errorTitle, error.message);
        };
    }

    if (this.node !== null && this.node > AppConstant.numberZero && this.node !== undefined) {
      this.adminpageService.getAdminPageDetail(this.node).subscribe(result => {
        if (result) {
          this.oldNode = result.parentId;
        }
      }),
        error => {
          this.showModal(AppConstant.errorTitle, error.message);
        };
    }
  }

  eventEmitted($event) {
    this.filter($event);
  }

  viewClick(id: number) {
    this.router.navigate(['/pages/adminpage/detail', this.type, this.parentId, id]);
  }

  addClick() {
    this.router.navigate(['/pages/adminpage/add', this.type, this.parentId]);
  }

  listChildClick(node: number, parentId: number) {
    // redirect to list child admin page
    if (parentId === AppConstant.numberZero) {
      this.router.navigate(['/pages/adminpage/list', this.type]);
    }
    else {
      this.router.navigate(['pages/adminpage/list', this.type, node, parentId]);
      this.router.navigate(['/pages/adminpage/list', this.type, node, parentId]);
      this.node = node;
      this.parentId = parentId;

      this.filter(null);
    }
  }

  // search by title
  onTitleSearch(value): void {
    this.parentId = AppConstant.numberNegativeOne; // search on all page
    this.search = value;
    this.filter(null);
  }

  // resest search
  reset(): void {
    this.search = AppConstant.stringEmpty;
    this.filter(null);
  }

  // show modal confirm delete
  showDeleteConfirm(id: number, title: string) {
    const activeModal = this.modalService.open(ConfirmModalComponent, { size: 'lg', container: 'nb-layout' });

    activeModal.componentInstance.confirmationBoxTitle = AppConstant.confirmTitle;
    activeModal.componentInstance.confirmationMessage = AppConstant.confirmDeleteContent + ": " + title;

    activeModal.result.then((userResponse) => {
      if (userResponse === true) {
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
            this.showModal(AppConstant.permissionDeniedTitle, result.message);
          }
          else if (result.code === AppConstant.permissionAccessCode) {
            // call api delete user
            this.adminpageService.deleteAdminPage(id).subscribe(result => {
              if (result) {
                if (result && result.code) {
                  if (result.code === AppConstant.successCode) {
                    this.showModal(AppConstant.successTitle, result.message);
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

  // show modal confirm active
  showChangeActiveConfirm(id: number, value: boolean, title: string) {
    let newStatus = AppConstant.falseDefault;
    if (value) {
      newStatus = AppConstant.falseDefault;
    }
    else {
      newStatus = AppConstant.trueDefault;
    }
    const activeModal = this.modalService.open(ConfirmModalComponent, { size: 'lg', container: 'nb-layout' });

    activeModal.componentInstance.confirmationBoxTitle = AppConstant.confirmTitle;
    activeModal.componentInstance.confirmationMessage =
      AppConstant.confirmChangeContent + ": " + title +
      AppConstant.spaceDefault + (newStatus == AppConstant.trueDefault ? "On" : "Off");

    activeModal.result.then((userResponse) => {
      if (userResponse) {
        this.changeActive(id, newStatus);
      }
    });
  }

  // change adminpage active
  changeActive(id: number, newStatus: boolean) {
    // check user is permission for change status account (edit)
    let lastPath = this.activatedRoute.snapshot.url[0].path;
    this.pathInfor.path = this.router.url.split('/' + lastPath)[0] + '/' + lastPath;
    this.pathInfor.type = this.type;
    this.pathInfor.typeAct = AppConstant.editAction;

    this.accountService.checkPermission(this.pathInfor).subscribe(result => {
      if (result) {
        if (result && result.code) {
          if (result.code === AppConstant.permissionDeniedCode) {
            this.showModal(AppConstant.permissionDeniedTitle, result.message);
          }
          else if (result.code === AppConstant.permissionAccessCode) {
            // call api change status user
            this.adminpageService.updateStatusAdminPage(id, newStatus).subscribe(result => {
              if (result) {
                if (result && result.code) {
                  if (result.code === AppConstant.successCode) {
                    this.showModal(AppConstant.successTitle, result.message);
                  }
                }
              }
            }),
              error => {
                this.showModal(AppConstant.errorTitle, error.message);
              };
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
