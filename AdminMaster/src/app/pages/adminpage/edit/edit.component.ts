import { Component, OnInit } from '@angular/core';
import { Router, ActivatedRoute } from '@angular/router';
import { NgbModal } from '@ng-bootstrap/ng-bootstrap';
import { AdminpageService } from '../../../@core/data/adminpage.service';
import { AccountService } from '../../../@core/data/account.service';
import { AppConstant } from '../../../config/appconstant';
import { ModalComponent } from '../../ui-features/modals/modal/modal.component';
import { ConfirmModalComponent } from '../../ui-features/modals/confirm/confirm.component';
import * as $ from 'jquery';

@Component({
  selector: 'edit',
  templateUrl: './edit.component.html',
  styleUrls: ['./edit.component.scss']
})
export class EditComponent implements OnInit {

  adminPageActions: any;

  adminPageDetail = {
    id: 0,
    act: "",
    ctrl: "",
    title: "",
    isShow: true,
    tye: "",
    parentId: 0,
    orderDisplay: 0,
    icon: "",
    path: "",
    breadcrumb: "",
    typeActionId: 0,
    modifyDate: "",
    createDate: ""
  }

  //adminPageAction = {
  //  id: 0,
  //  actionName: "",
  //  actionDescription: "",
  //  actionStatus: 0,
  //  createDate: "",
  //  modifyDate: "",
  //  actionPage: ""
  //}

  pathInfor = {
    path: "",
    typeAct: "",
    type: ""
  };

  public isCreate: boolean = true;
  private id: number;
  private parentId: string = "";
  private type: string = "";
  private errorMessage: string = "";
  private params: string = "?";
  private objectAdminPage: any;

  constructor(private activatedRoute: ActivatedRoute,
    private router: Router,
    private adminPageService: AdminpageService,
    private accountService: AccountService,
    private modalService: NgbModal) {

    // set breadcrumd
    $(document).ready(() => {
      let breadcrumb = $("#main_breadcrumb");
      let child_breadcrumb = $("#child_breadcrumb");

      if (breadcrumb.html() != null && breadcrumb.html() != undefined) {
        child_breadcrumb.html(breadcrumb.html());
      }
    });

    // get param from router ex: /:username
    this.activatedRoute.params.forEach(params => {
      this.id = params['id'];
      this.type = params['type'];
      this.parentId = params['parentId'];
    });

    if (this.id != null && this.id != undefined) {
      this.isCreate = false;
    }

    if (this.type == null || this.type == "") {
      this.type = "";
    }

    // check user is permission for view page
    let lastPath = activatedRoute.snapshot.url[0].path;
    this.pathInfor.path = this.router.url.split('/' + lastPath)[0] + '/' + lastPath;
    this.pathInfor.type = this.type;
    this.pathInfor.typeAct = this.isCreate == true ? AppConstant.addAction : AppConstant.editAction;

    this.accountService.checkPermission(this.pathInfor).subscribe(result => {
      if (result) {
        if (result.code === AppConstant.permissionDeniedCode) {
          this.router.navigate(['/pages/miscellaneous/404']);
        }
      }
    }),
      error => {
        this.showModal(AppConstant.errorTitle, error.message);
      };
  }

  ngOnInit() {

    // create dropdown list AdminPageAction
    if (this.type != undefined && this.type.length > 0) {
      if (this.params.length > 1) {
        this.params = this.params + "&type=" + this.type;
      }
      else {
        this.params = this.params + "type=" + this.type;
      }
    }

    if (this.id != undefined && this.id > 0) {
      if (this.params.length > 1) {
        this.params = this.params + "&pageId=" + this.id;
      }
      else {
        this.params = this.params + "pageId=" + this.id;
      }
    }

    this.adminPageService.getListAdminPageAction(this.params).subscribe(result => {
      if (result) {
        this.adminPageActions = result;
      }
      else {
        this.showModal(AppConstant.errorTitle, result.message);
      }
    }),
      error => {
        this.showModal(AppConstant.errorTitle, error.message);
      };

    // check localStorage exist
    if (localStorage.getItem(AppConstant.objectAdminPage) != null) {
      this.objectAdminPage = JSON.parse(localStorage.getItem(AppConstant.objectAdminPage));
      this.adminPageDetail.id = this.objectAdminPage.id;
      this.adminPageDetail.act = this.objectAdminPage.act;
      this.adminPageDetail.ctrl = this.objectAdminPage.ctrl;
      this.adminPageDetail.title = this.objectAdminPage.title;
      this.adminPageDetail.isShow = this.objectAdminPage.isShow;
      this.adminPageDetail.tye = this.objectAdminPage.tye;
      this.adminPageDetail.parentId = this.objectAdminPage.parentId;
      this.adminPageDetail.orderDisplay = this.objectAdminPage.orderDisplay;
      this.adminPageDetail.icon = this.objectAdminPage.icon;
      this.adminPageDetail.path = this.objectAdminPage.path;
      this.adminPageDetail.breadcrumb = this.objectAdminPage.breadcrumb;
      this.adminPageDetail.typeActionId = this.objectAdminPage.typeActionId;
      this.adminPageDetail.modifyDate = this.objectAdminPage.modifyDate;
      this.adminPageDetail.createDate = this.objectAdminPage.createDate;
    }
    else {
      if (this.isCreate == false) {
        this.adminPageService.getAdminPageDetail(this.id).subscribe(result => {
          if (result) {
            this.adminPageDetail = result;
          }
          else {
            this.showModal(AppConstant.errorTitle, result.message);
          }
        }),
          error => {
            this.showModal(AppConstant.errorTitle, error.message);
          };
      }
    }
  }

  backclick() {
    this.router.navigate(['/pages/adminpage/list', this.type, this.parentId]);
  }

  showModal(title: string, mess: string) {
    const activeModal = this.modalService.open(ModalComponent, { size: 'lg', container: 'nb-layout' });
    activeModal.componentInstance.modalHeader = title;
    activeModal.componentInstance.modalContent = mess;
  }

}


