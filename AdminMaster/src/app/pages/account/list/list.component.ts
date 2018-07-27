import { Component, ViewChild } from '@angular/core';
import { Router, ActivatedRoute } from '@angular/router';
import { NgbModal } from '@ng-bootstrap/ng-bootstrap';
import { AccountService } from '../../../@core/data/account.service';
import { AppConstant } from '../../../config/appconstant';
import { ConfigurationService } from './configuration.service';
import { ModalComponent } from '../../ui-features/modals/modal/modal.component';
import { ConfirmModalComponent } from '../../ui-features/modals/confirm/confirm.component';
declare var $: any;

@Component({
  selector: 'list-account',
  templateUrl: './list.component.html',
  styleUrls: ['./list.component.scss']
})

export class ListComponent {

  // use for setting column table
  columns = [
    { key: 'username', title: 'Action' },
    { key: 'username', title: 'Email' },
    { key: 'online', title: 'Active' },
  ];
  data;
  configuration;

  // use for setting paging
  pagination = {
    limit: AppConstant.pageSizeDefault,
    offset: (AppConstant.pageIndexDefault - 1),
    count: null,
  };

  listUser = {
    username: "",
    password: "",
    role: 0,
    online: true,
    lastLogin: "",
    ip: "",
    token: "",
    expire: ""
  };

  pathInfor = {
    path: "",
    typeAct: "",
    type: ""
  };

  private params: string = "?";
  private type: string = "";
  private lang: string = "";
  public search: string = "";
  private pageIndex: number = AppConstant.pageIndexDefault;
  private pageSize: number = AppConstant.pageSizeDefault;
  private orderBy: string = "";
  private orderType: string = "";

  constructor(
    private activatedRoute: ActivatedRoute,
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
      this.filter(null);
    });
  }

  // function filter data
  filter(obj: EventObject) {
    this.params = "?";

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

    if (this.type != undefined && this.type.length > 0) {
      if (this.params.length > 1) {
        this.params = this.params + "&type=" + this.type;
      }
      else {
        this.params = this.params + "type=" + this.type;
      }
    }

    if (this.lang != undefined && this.lang.length > 0) {
      if (this.params.length > 1) {
        this.params = this.params + "&lang=" + this.lang;
      }
      else {
        this.params = this.params + "lang=" + this.lang;
      }
    }

    if (this.search != undefined && this.search.length > 0) {
      if (this.params.length > 1) {
        this.params = this.params + "&search=" + this.search;
      }
      else {
        this.params = this.params + "search=" + this.search;
      }
    }

    if (this.pageIndex != undefined && this.pageIndex > 0) {
      if (this.params.length > 1) {
        this.params = this.params + "&pageIndex=" + this.pageIndex;
      }
      else {
        this.params = this.params + "pageIndex=" + this.pageIndex;
      }
    }

    if (this.pageSize != undefined && this.pageSize > 0) {
      if (this.params.length > 1) {
        this.params = this.params + "&pageSize=" + this.pageSize;
      }
      else {
        this.params = this.params + "pageSize=" + this.pageSize;
      }
    }

    if (this.orderBy != undefined && this.orderBy.length > 0) {
      if (this.params.length > 1) {
        this.params = this.params + "&orderBy=" + this.orderBy;
      }
      else {
        this.params = this.params + "orderBy=" + this.orderBy;
      }
    }

    if (this.orderType != undefined && this.orderType.length > 0) {
      if (this.params.length > 1) {
        this.params = this.params + "&orderType=" + this.orderType;
      }
      else {
        this.params = this.params + "orderType=" + this.orderType;
      }
    }

    this.getData(this.params);
  }

  // call Api get list user
  getData(params: string) {
    this.configuration = ConfigurationService.config;
    this.configuration.isLoading = true;

    this.accountService.getListUser(params).subscribe(result => {
      if (result) {
        if (result && result.code) {
          this.data = this.listUser;
          this.configuration.isLoading = false;
        }
        else {
          this.data = result.listUser;
          this.pagination.count = this.pagination.count ? this.pagination.count : result.totalRecord;
          this.pagination.limit = this.pageSize;
          this.pagination = { ...this.pagination };
          this.configuration.isLoading = false;
        }
      }
    }),
      error => {
        this.showModal(AppConstant.errorTitle, error.message);
      };
  }

  eventEmitted($event) {
    this.filter($event);
  }

  // redirect to add account page
  addUser() {
    this.router.navigate(['/pages/account/add', this.type]);
  }

  // redirect to edit account page
  editClick(userName: string) {
    this.router.navigate(['/pages/account/edit', this.type, userName]);
  }

  // redirect to detail account page
  viewClick(userName: string) {
    this.router.navigate(['/pages/account/detail', this.type, userName]);
  }

  // delete user
  deleteClick(userName: string) {
    // check user is permission for view page
    let lastPath = this.activatedRoute.snapshot.url[0].path;
    this.pathInfor.path = this.router.url.split('/' + lastPath)[0] + '/' + lastPath;
    this.pathInfor.type = this.type;
    this.pathInfor.typeAct = AppConstant.deleteAction;

    this.accountService.checkPermission(this.pathInfor).subscribe(result => {
      if (result) {
        if (result && result.code) {
          if (result.code === AppConstant.permissionDeniedCode) {
            this.showModal(AppConstant.permissionDeniedTitle, result.value.message);
          }
          else if (result.code === AppConstant.permissionAccessCode) {
            // call api delete user
            this.accountService.deleteUser(userName).subscribe(result => {
              if (result) {
                if (result && result.code) {
                  if (result.code === AppConstant.successCode) {
                    this.showModal(AppConstant.successTitle, result.message);
                    // reload data
                    this.filter(null);
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
        console.error('ERROR: ', error.message);
      };
  }

  // change user active
  changeActive(username: string, role: number, newStatus: boolean) {
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
            let userObj = {
              ip: "",
              online: newStatus,
              role: role
            };
            this.accountService.updateUser(username, userObj).subscribe(result => {
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

  // search by email
  onEmailSearch(value): void {
    this.search = value;
    this.filter(null);
  }

  // resest search
  reset(): void {
    this.search = "";
    this.filter(null);
  }

  // show modal by title and message
  showModal(title: string, mess: string) {
    const activeModal = this.modalService.open(ModalComponent, { size: 'lg', container: 'nb-layout' });

    activeModal.componentInstance.modalHeader = title;
    activeModal.componentInstance.modalContent = mess;
  }

  // show modal confirm delete
  showDeleteConfirm(userName: string) {
    const activeModal = this.modalService.open(ConfirmModalComponent, { size: 'lg', container: 'nb-layout' });

    activeModal.componentInstance.confirmationBoxTitle = AppConstant.confirmTitle;
    activeModal.componentInstance.confirmationMessage = AppConstant.confirmDeleteContent + ": " + userName;

    activeModal.result.then((userResponse) => {
      if (userResponse === true) {
        this.deleteClick(userName);
      }
    });
  }

  // show modal confirm active
  showChangeActiveConfirm(username: string, role: number, value: boolean) {
    let newStatus = false;
    if (value) {
      newStatus = false;
    }
    else {
      newStatus = true;
    }
    const activeModal = this.modalService.open(ConfirmModalComponent, { size: 'lg', container: 'nb-layout' });

    activeModal.componentInstance.confirmationBoxTitle = AppConstant.confirmTitle;
    activeModal.componentInstance.confirmationMessage =
      AppConstant.confirmChangeContent + ": " + username + " " + (newStatus == true ? "On" : "Off");

    activeModal.result.then((userResponse) => {
      if (userResponse === true) {
        this.changeActive(username, role, newStatus);
      }
    });
  }
}

interface EventObject {
  event: string;
  value: any;
}
