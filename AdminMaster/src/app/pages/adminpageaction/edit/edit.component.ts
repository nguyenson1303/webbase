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
  selector: 'edit',
  templateUrl: './edit.component.html',
  styleUrls: ['./edit.component.scss']
})
export class EditComponent implements OnInit {

  adminPageActionDetail = {
    id: 0,
    actionName: "",
    actionDescription: "",
    actionStatus: 0,
    createDate: "",
    modifyDate: "",
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
      this.pageId = params['pageId'];
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
          this.router.navigate(['/pages/miscellaneous/denied']);
        }
      }
    }),
      error => {
        this.showModal(AppConstant.errorTitle, error.message);
      };
  }

  ngOnInit() {

    // check localStorage exist
    if (localStorage.getItem(AppConstant.objectAdminPageAction) != null) {
      this.objectAdminPageAction = JSON.parse(localStorage.getItem(AppConstant.objectAdminPageAction));
      this.adminPageActionDetail.id = this.objectAdminPageAction.id;
      this.adminPageActionDetail.actionName = this.objectAdminPageAction.actionName;
      this.adminPageActionDetail.actionDescription = this.objectAdminPageAction.actionDescription;
      this.adminPageActionDetail.actionPage = this.objectAdminPageAction.actionPage;
      this.adminPageActionDetail.actionStatus = this.objectAdminPageAction.actionStatus;
      this.adminPageActionDetail.modifyDate = this.objectAdminPageAction.modifyDate;
      this.adminPageActionDetail.createDate = this.objectAdminPageAction.createDate;
      this.adminPageActionDetail.isCreate = this.objectAdminPageAction.isCreate;
    }
    else {
      if (this.isCreate == false) {
        this.adminPageActionService.getAdminPageActionDetail(this.id).subscribe(result => {
          if (result) {
            this.adminPageActionDetail = result;
            this.adminPageActionDetail.isCreate = this.isCreate;
          }
          else {
            this.showModal(AppConstant.errorTitle, result.message);
          }
        }),
          error => {
            this.showModal(AppConstant.errorTitle, error.message);
          };
      }
      else
      {
        this.adminPageActionDetail.actionPage = this.pageId.toString();
      }
    }
  }

  nextclick() {
    // validate
    let isValid = true;
    let mess = "";
    let validateAdminPageActionObj = {
      actionName: this.adminPageActionDetail.actionName,
      actionDescription: this.adminPageActionDetail.actionDescription,
      actionPage: this.pageId,
      actionStatus: 1,
      modifyDate: "",
      createDate: "",
      isCreate : this.adminPageActionDetail.isCreate
    }

    let createAdminPageActionObj = {
      id: this.adminPageActionDetail.id,
      actionName: this.adminPageActionDetail.actionName,
      actionDescription: this.adminPageActionDetail.actionDescription,
      actionPage: this.adminPageActionDetail.actionPage,
      actionStatus: this.adminPageActionDetail.actionStatus,
      modifyDate: this.adminPageActionDetail.modifyDate,
      createDate: this.adminPageActionDetail.createDate,
      isCreate: this.adminPageActionDetail.isCreate,
    }

    // call api validate adminpage
    this.adminPageActionService.validateAdminPageAction(validateAdminPageActionObj).subscribe(result => {
      if (result) {
        if (result.code === AppConstant.successCode) {

          // save obj to locate
          localStorage.setItem(AppConstant.objectAdminPageAction, JSON.stringify(createAdminPageActionObj));

          localStorage.setItem(AppConstant.isInProcess, "true");
          if (this.isCreate) {
            this.router.navigate(['/pages/adminpageaction/confirm', this.type, this.pageId]);
          }
          else {
            this.router.navigate(['/pages/adminpageaction/confirm', this.type, this.pageId, this.id]);
          }
        }
        else {
          // focus to field error and show message
          let field = document.getElementById(result.field);
          let fieldValidate = document.getElementById(result.field + "-validate");
          var validateField = document.querySelectorAll(".validateServer");
          var i;
          for (i = 0; i < validateField.length; i++) {
            validateField[i].textContent = "";
          }
          if (field) {
            field.focus();
          }
          if (fieldValidate) {
            fieldValidate.textContent = result.message;
          }
        }
      }
    }),
      error => {
        this.showModal(AppConstant.errorTitle, error.message);
      };
  }

  backclick() {
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

  showModal(title: string, mess: string) {
    const activeModal = this.modalService.open(ModalComponent, { size: 'lg', container: 'nb-layout' });
    activeModal.componentInstance.modalHeader = title;
    activeModal.componentInstance.modalContent = mess;
  }
}
