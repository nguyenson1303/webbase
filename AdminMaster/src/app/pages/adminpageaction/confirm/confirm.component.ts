import { Component, OnInit, AfterViewInit } from '@angular/core';
import { Router, ActivatedRoute } from '@angular/router';
import { NgbModal } from '@ng-bootstrap/ng-bootstrap';
import { AdminpageactionService } from '../../../@core/data/adminpageaction.service';
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

  adminPageActionDetail = {
    id: 0,
    actionName: "",
    actionDescription: "",
    actionStatus: 0,
    actionPage: "",
    isCreate: false,
  }

  pathInfor = {
    path: "",
    typeAct: "",
    type: ""
  };

  public isCreate: boolean = true;
  private id: number;
  private pageId: number;
  private type: string = "";
  private errorMessage: string = "";
  private params: string = "?";
  private objectAdminPageAction: any;

  constructor(private activatedRoute: ActivatedRoute,
    private router: Router,
    private adminPageActionService: AdminpageactionService,
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

    // check reload from browser or move from process
    let isInProcess = localStorage.getItem(AppConstant.isInProcess)
    if (isInProcess != null && isInProcess != undefined) {
      localStorage.removeItem(AppConstant.isInProcess);
    }
    else {
      localStorage.removeItem(AppConstant.objectAdminPageAction);
    }

    // get param from router ex: /:username
    this.activatedRoute.params.forEach(params => {
      this.id = params['id'];
      this.type = params['type'];
      if (params['pageId'] == null || params['pageId'] == undefined) {
        this.pageId = 0;
      }
      else {
        this.pageId = params['pageId'];
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
    this.objectAdminPageAction = localStorage.getItem(AppConstant.objectAdminPageAction);
    if (this.objectAdminPageAction != null && this.objectAdminPageAction != undefined) {
      this.adminPageActionDetail = JSON.parse(this.objectAdminPageAction);
    }
    else {
      this.router.navigate(['/pages/miscellaneous/404']);
    }
  }

  nextclick() {

    let createAdminPageActionObj = {
      actionName: this.adminPageActionDetail.actionName,
      actionDescription: this.adminPageActionDetail.actionDescription,
      actionPage: this.adminPageActionDetail.actionPage,
      actionStatus: this.adminPageActionDetail.actionStatus,
      isCreate : this.adminPageActionDetail.isCreate,
    }

    if (this.isCreate) {
      // call api create adminpage
      this.adminPageActionService.createAdminPageAction(createAdminPageActionObj).subscribe(result => {
        if (result) {
          if (result.code === AppConstant.successCode) {
            localStorage.removeItem(AppConstant.objectAdminPageAction);
            localStorage.removeItem(AppConstant.isInProcess);
            this.showModal(AppConstant.successTitle, AppConstant.messcreateSuccess);

            // navigate
            let node: number = 0;
            if (this.pageId != null && this.pageId > 0 && this.pageId != undefined) {
              this.adminPageService.getAdminPageDetail(this.pageId).subscribe(result => {
                if (result) {
                  this.adminPageService.getAdminPageDetail(result.parentId).subscribe(result2 => {
                    if (result2) {
                      node = result.Id;
                    }
                  }),
                    error => {
                      this.showModal(AppConstant.errorTitle, error.message);
                    };
                }
              }),
                error => {
                  this.showModal(AppConstant.errorTitle, error.message);
                };
            }
            this.router.navigate(['/pages/adminpage/detail', this.type, node, this.pageId]);
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
      this.adminPageActionService.updateAdminPageAction(this.id, createAdminPageActionObj).subscribe(result => {
        if (result) {
          if (result.code === AppConstant.successCode) {
            localStorage.removeItem(AppConstant.objectAdminPageAction);
            localStorage.removeItem(AppConstant.isInProcess);
            this.showModal(AppConstant.successTitle, AppConstant.messupdateSuccess);
            // navigate
            let node: number = 0;
            if (this.pageId != null && this.pageId > 0 && this.pageId != undefined) {
              this.adminPageService.getAdminPageDetail(this.pageId).subscribe(result => {
                if (result) {
                  this.adminPageService.getAdminPageDetail(result.parentId).subscribe(result2 => {
                    if (result2) {
                      node = result.Id;
                    }
                  }),
                    error => {
                      this.showModal(AppConstant.errorTitle, error.message);
                    };
                }
              }),
                error => {
                  this.showModal(AppConstant.errorTitle, error.message);
                };
            }
            this.router.navigate(['/pages/adminpage/detail', this.type, node, this.pageId]);
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
    localStorage.setItem(AppConstant.objectAdminPage, JSON.stringify(this.adminPageActionDetail))

    if (this.isCreate) {
      this.router.navigate(['/pages/adminpageaction/add', this.type, this.pageId]);
    }
    else {
      this.router.navigate(['/pages/adminpageaction/edit', this.type, this.pageId, this.id]);
    }
  }

  showModal(title: string, mess: string) {
    const activeModal = this.modalService.open(ModalComponent, { size: 'lg', container: 'nb-layout' });

    activeModal.componentInstance.modalHeader = title;
    activeModal.componentInstance.modalContent = mess;
  }
}
