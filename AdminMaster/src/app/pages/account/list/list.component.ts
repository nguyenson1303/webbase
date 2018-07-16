import { Component, OnInit } from '@angular/core';
import { Router, ActivatedRoute } from '@angular/router';
import { AccountService } from '../../../@core/data/account.service';
import { AppConstant } from '../../../config/appconstant';
import { ConfigurationService } from './configuration.service';

@Component({
  selector: 'list-account',
  templateUrl: './list.component.html',
  styleUrls: ['./list.component.scss']
})

export class ListComponent implements OnInit {

  columns = [
    { key: 'username', title: 'Action' },
    { key: 'username', title: 'Email' },
    { key: 'role', title: 'Role' },
    { key: 'online', title: 'Active' }
  ];
  data;
  rows;
  configuration;
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
    private accountService: AccountService) {

    // get param from query string ex: ?type=Admin
    this.activatedRoute.queryParams.subscribe(params => {
      this.type = params['type'];
    })

    // get param from router ex: /:type
    // this.activatedRoute.params.forEach(params => {
    //  this.type = params['type'];
    // });

    if (this.pageIndex === undefined || this.pageIndex === null) {
      this.pageIndex = AppConstant.pageIndexDefault;
    }

    if (this.pageSize === undefined || this.pageSize === null) {
      this.pageSize = AppConstant.pageSizeDefault;
    }

    // check user is permission for view page
    this.pathInfor.path = this.router.url.split('?')[0];
    this.pathInfor.type = this.type;
    this.pathInfor.typeAct = AppConstant.viewAction;

    this.accountService.checkPermission(this.pathInfor).subscribe(result => {
      if (result) {
        if (result && result.code) {
          if (result.code === AppConstant.permissionDeniedCode) {
            this.router.navigate(['/pages/miscellaneous/404']);
          }
        }
      }
    }),
      error => {
        console.error('ERROR: ', error.message);
      };
  }

  ngOnInit() {
    this.filter(null);
  }

  // function filter data
  filter(obj: EventObject) {
    this.params = "?";

    if (obj != null) {
      this.pagination.limit = obj.value.limit ? obj.value.limit : this.pagination.limit;
      this.pagination.offset = obj.value.page ? obj.value.page : this.pagination.offset;
      this.pagination = { ...this.pagination };

      this.pageIndex = this.pagination.offset / this.pagination.limit - 1;
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

  getData(params: string) {
    this.configuration = ConfigurationService.config;
    this.configuration.isLoading = true;

    this.accountService.getListUser(params).subscribe(result => {
      if (result) {
        if (result && result.code) {
          console.log('error code: ' + result.code);
          console.log('error message: ' + result.message);
          this.data = this.listUser;
          this.rows = this.data;
          this.configuration.isLoading = false;
        }
        else {
          this.data = result.listUser;
          this.rows = this.data;
          this.pagination.count = this.pagination.count ? this.pagination.count : result.totalPage;
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

  editClick(userName: string) {
    alert('Edit: ' + userName);
    // redirect to edit account page
  }

  deleteClick(userName: string) {
    // check user is permission for view page
    this.pathInfor.path = this.router.url.split('?')[0];
    this.pathInfor.type = this.type;
    this.pathInfor.typeAct = AppConstant.deleteAction;

    this.accountService.checkPermission(this.pathInfor).subscribe(result => {
      if (result) {
        if (result && result.code) {
          if (result.code === AppConstant.permissionDeniedCode) {
            this.router.navigate(['/pages/miscellaneous/404']);
          }
          else if (result.code === AppConstant.permissionAccessCode) {
            // call api delete user
            alert('Delete: ' + userName);
          }
        }
      }
    }),
      error => {
        console.error('ERROR: ', error.message);
      };
  }

  changeActive(userName: string, value: boolean) {
    let newStatus = false;
    if (value) {
      newStatus = false;
    }
    else {
      newStatus = true;
    }

    // check user is permission for change status account (edit)
    this.pathInfor.path = this.router.url.split('?')[0];
    this.pathInfor.type = this.type;
    this.pathInfor.typeAct = AppConstant.editAction;

    this.accountService.checkPermission(this.pathInfor).subscribe(result => {
      if (result) {
        if (result && result.code) {
          if (result.code === AppConstant.permissionDeniedCode) {
            this.router.navigate(['/pages/miscellaneous/404']);
          }
          else if (result.code === AppConstant.permissionAccessCode) {
            // call api delete user
            alert('Active: ' + userName + '; Active old: ' + value);
          }
        }
      }
    }),
      error => {
        console.error('ERROR: ', error.message);
      };
  }

  onEmailSearch(value): void {
    this.search = value;
    this.filter(null);
  }

  reset(): void {
    this.search = "";
    this.filter(null);
  }
}

interface EventObject {
  event: string;
  value: any;
}
