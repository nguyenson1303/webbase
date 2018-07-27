import { Component, TemplateRef, ViewChild, AfterViewInit } from '@angular/core';
import { Router, ActivatedRoute } from '@angular/router';
import { NgbModal } from '@ng-bootstrap/ng-bootstrap';
import { AdminpageService } from '../../../@core/data/adminpage.service';
import { AccountService } from '../../../@core/data/account.service';
import { AppConstant } from '../../../config/appconstant';
import { ConfigurationService } from './configuration.service';
import { ModalComponent } from '../../ui-features/modals/modal/modal.component';
import { ConfirmModalComponent } from '../../ui-features/modals/confirm/confirm.component';
import { Jsonp } from '@angular/http';
declare var $: any;

@Component({
  selector: 'list-page',
  templateUrl: './list.component.html',
  styleUrls: ['./list.component.scss']
})
export class ListComponent {

  // @ViewChild('detailsTemplate') detailsTemplateRef: TemplateRef<any>;

  listPageAdmin = {
    id: 0,
    act: "",
    ctrl: "",
    title: "",
    isShow: false,
    tye: "",
    parentId: 0,
    orderDisplay: 0,
    icon: "",
    path: "",
    breadcrumb: "",
    typeActionId: 0,
    modifyDate: "",
    createDate: "",
    level: "",
    classLevel: "",
    children: null
  };

  columns = [
    { key: 'title', title: 'Tiêu đề' },
    { key: 'path', title: 'Đường dẫn' },
    { key: 'tye', title: 'Kiểu' },
    { key: 'parentId', title: 'Action' },
    { key: 'isShow', title: 'Menu' },
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
    path: "",
    typeAct: "",
    type: ""
  };

  private params: string = "?";
  private type: string = "";
  private lang: string = "";
  public search: string = "";
  private parentId: number = 0;
  private orderBy: string = "";
  private orderType: string = "";
  private node: number = 0;
  private oldNode: number = 0;
  public isShowBack: boolean = false;
  public parentName: string = "";

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
    this.params = "?";

    if (obj != null) {
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

    if (this.parentId != undefined && this.parentId != null) {
      if (this.params.length > 1) {
        this.params = this.params + "&parentId=" + this.parentId;
      }
      else {
        this.params = this.params + "parentId=" + this.parentId;
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

  // recursiveData(list: any) {
  //  list.forEach(element => {
  //    if (element.level) {
  //      element.classLevel = 'level' + element.level;
  //    }
  //    this.data.push(element);
  //    if (element.children.length > 0) {
  //      this.recursiveData(element.children);
  //    }
  //  });
  // }

  getData(params: string) {
    this.configuration = ConfigurationService.config;
    this.configuration.isLoading = true;

    this.adminpageService.getListAdminPage(params).subscribe(result => {
      if (result) {
        if (result && result.code) {
          this.data = [];
          this.configuration.isLoading = false;
        }
        else {
          this.data = [];
          this.data = result.listUserPage;
          this.configuration.isLoading = false;

          // this.recursiveData(this.dataResult);
        }
      }
    }),
      error => {
        console.error('ERROR: ', error.message);
      };

    if (this.parentId != null && this.parentId > 0 && this.parentId != undefined) {
      this.adminpageService.getAdminPageDetail(this.parentId).subscribe(result => {
        if (result) {
          this.parentName = "con của " + result.title;
        }
      }),
        error => {
          this.showModal(AppConstant.errorTitle, error.message);
        };
    }

    if (this.node != null && this.node > 0 && this.node != undefined) {
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

  ListChildClick(node: number, parentId: number) {
    // redirect to list child admin page
    if (parentId == 0) {
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
    this.parentId = -1; // search on all page
    this.search = value;
    this.filter(null);
  }

  // resest search
  reset(): void {
    this.search = "";
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
      AppConstant.confirmChangeContent + ": " + title + " " + (newStatus == true ? "On" : "Off");

    activeModal.result.then((userResponse) => {
      if (userResponse === true) {
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

interface EventObject {
  event: string;
  value: any;
}
