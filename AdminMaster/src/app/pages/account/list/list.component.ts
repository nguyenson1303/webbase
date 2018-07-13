import { Component, OnInit } from '@angular/core';
import { Router, ActivatedRoute } from '@angular/router';
import { AccountService } from '../../../@core/data/account.service';
import { AppConstant } from '../../../config/appconstant';
import { ConfigurationService } from './configuration.service';
import { Jsonp } from '@angular/http';

@Component({
  selector: 'list-account',
  templateUrl: './list.component.html',
  styleUrls: ['./list.component.scss']
})

export class ListComponent implements OnInit {

  columns = [
    { key: 'username', title: 'Email' },
    { key: 'role', title: 'Role' },
    { key: 'online', title: 'Active' }
    { key: 'username', title: 'Action' }
  ];
  data;
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

  private params: string = "?";
  private type: string = "";
  private lang: string = "";
  private search: string = "";
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
  }

  ngOnInit() {
    this.filter();
  }

  filter() {

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

    console.log(this.params);
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
          this.configuration.isLoading = false;
        }
        else {
          this.data = result.listUser;
          console.log('data: ' + JSON.stringify(this.data));
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
    this.parseEvent($event);
  }

  editClick(userName: string) {
    alert('Edit: ' + userName);
  }

  private parseEvent(obj: EventObject) {
    this.pagination.limit = obj.value.limit ? obj.value.limit : this.pagination.limit;
    this.pagination.offset = obj.value.page ? obj.value.page : this.pagination.offset;
    this.pagination = { ...this.pagination };

    this.pageIndex = this.pagination.offset / this.pagination.limit - 1;
    this.pageSize = this.pagination.limit;

    if (obj.event === 'onOrder') {
      this.orderBy = obj.value.key;
      this.orderType = obj.value.order;
    }

    this.filter();
  }
}

interface EventObject {
  event: string;
  value: any;
}
