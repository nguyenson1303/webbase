import { Component, OnInit } from '@angular/core';
import { Router, ActivatedRoute } from '@angular/router';
import { NgbModal } from '@ng-bootstrap/ng-bootstrap';
import { AdminpageService } from '../../../@core/data/adminpage.service';
import { AccountService } from '../../../@core/data/account.service';
import { AppConstant } from '../../../config/appconstant';
import { ModalComponent } from '../../ui-features/modals/modal/modal.component';
import { ConfirmModalComponent } from '../../ui-features/modals/confirm/confirm.component';
declare var $: any;

@Component({
  selector: 'confirm',
  templateUrl: './confirm.component.html',
  styleUrls: ['./confirm.component.scss']
})
export class ConfirmComponent implements OnInit {

  objectAdminPageActions: any;

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

  public isCreate: boolean = true;
  private id: number = 0;
  private objectAdminPage: any;
  private type: string = "";
  private parentId: number = 0;

  constructor(private activatedRoute: ActivatedRoute,
    private adminPageService: AdminpageService,
    private accountService: AccountService,
    private router: Router,
    private modalService: NgbModal) {

    $(document).ready(() => {
      let breadcrumb = $("#main_breadcrumb");
      let child_breadcrumb = $("#child_breadcrumb");

      if (breadcrumb.html() != null && breadcrumb.html() != undefined) {
        child_breadcrumb.html(breadcrumb.html());
      }
    });

    // check reload from browser or move from process
    let isInProcess = localStorage.getItem(AppConstant.isInProcess)
    if (isInProcess != null && isInProcess != undefined) {
      localStorage.removeItem(AppConstant.isInProcess);
    }
    else {
      localStorage.removeItem(AppConstant.objectAdminPage);
    }

    // get param from router ex: /:username
    this.activatedRoute.params.forEach(params => {
      this.id = params['id'];
      this.type = params['type'];
      if (params['parentId'] == null || params['parentId'] == undefined) {
        this.parentId = 0;
      }
      else {
        this.parentId = params['parentId'];
      }
    });

    if (this.id != null && this.id > 0) {
      this.isCreate = false;
    }

    if (this.type == null || this.type == "") {
      this.type = "";
    }
  }

  ngOnInit() {
    // check localStorage exist
    this.objectAdminPage = localStorage.getItem(AppConstant.objectAdminPage);
    if (this.objectAdminPage != null && this.objectAdminPage != undefined) {
      this.adminPageDetail = JSON.parse(this.objectAdminPage);
      let paramGetTree: string = "?";
      if (this.type != undefined && this.type.length > 0) {
        if (paramGetTree.length > 1) {
          paramGetTree = paramGetTree + "&type=" + this.type;
        }
        else {
          paramGetTree = paramGetTree + "type=" + this.type;
        }
      }

      if (this.adminPageDetail.parentId != undefined && this.adminPageDetail.parentId > 0) {
        if (paramGetTree.length > 1) {
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
          this.showModal(AppConstant.errorTitle, result.message);
        }
      }),
        error => {
          this.showModal(AppConstant.errorTitle, error.message);
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
      breadcrumb: this.adminPageDetail.breadcrumb,
      typeActionId: this.adminPageDetail.typeActionId,
      modifyDate: this.adminPageDetail.modifyDate,
      createDate: this.adminPageDetail.createDate
    }

    if (this.isCreate) {
      // call api create adminpage
      this.adminPageService.createAdminPage(createAdminPageObj).subscribe(result => {
        if (result) {
          if (result.code === AppConstant.successCode) {
            localStorage.removeItem(AppConstant.objectAdminPage);
            localStorage.removeItem(AppConstant.isInProcess);
            this.showModal(AppConstant.successTitle, AppConstant.messcreateSuccess);
            this.router.navigate(['/pages/adminpage/list', this.type]);
          }
          else {
            this.showModal(AppConstant.failTitle, AppConstant.messCreateFail);
          }
        }
      }),
        error => {
          this.showModal(AppConstant.errorTitle, error.message);
        };
    }
    else {
      // call api update adminpage
      this.adminPageService.updateAdminPage(this.id, createAdminPageObj).subscribe(result => {
        if (result) {
          if (result.code === AppConstant.successCode) {
            localStorage.removeItem(AppConstant.objectAdminPage);
            localStorage.removeItem(AppConstant.isInProcess);
            this.showModal(AppConstant.successTitle, AppConstant.messcreateSuccess);
            this.router.navigate(['/pages/adminpage/list', this.type]);
          }
          else {
            this.showModal(AppConstant.failTitle, AppConstant.messCreateFail);
          }
        }
      }),
        error => {
          this.showModal(AppConstant.errorTitle, error.message);
        };
    }
  }

  backclick() {
    localStorage.setItem(AppConstant.isInProcess, "true")
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

}
