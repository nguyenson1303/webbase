import { Component, OnInit, AfterViewInit } from '@angular/core';
import { Router, ActivatedRoute } from '@angular/router';
import { NgbModal } from '@ng-bootstrap/ng-bootstrap';
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

  adminPages: any;

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

  pathInfor = {
    path: "",
    typeAct: "",
    type: ""
  };

  public isCreate: boolean = true;
  private id: number;
  private parentId: number = 0;
  private type: string = "";
  private errorMessage: string = "";
  private params: string = "?";
  private objectAdminPage: any;
  private node: number = 0;


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

    if (this.parentId != null && this.parentId > 0 && this.parentId != undefined) {
      this.adminPageService.getAdminPageDetail(this.parentId).subscribe(result => {
        if (result) {
          this.node = result.parentId;
        }
      }),
        error => {
          this.showModal(AppConstant.errorTitle, error.message);
        };
    }

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
          this.router.navigate(['/pages/miscellaneous/denied']);
        }
      }
    }),
      error => {
        this.showModal(AppConstant.errorTitle, error.message);
      };
  }

  ngOnInit() {
    let parentIdTree: number;

    // check localStorage exist
    if (localStorage.getItem(AppConstant.objectAdminPage) != null) {
      this.objectAdminPage = JSON.parse(localStorage.getItem(AppConstant.objectAdminPage));
      this.adminPageDetail.id = this.objectAdminPage.id;
      this.adminPageDetail.act = this.objectAdminPage.act;
      this.adminPageDetail.ctrl = this.objectAdminPage.ctrl;
      this.adminPageDetail.title = this.objectAdminPage.title;
      this.adminPageDetail.isShow = this.objectAdminPage.isShow;
      this.adminPageDetail.tye = this.objectAdminPage.tye;
      this.adminPageDetail.parentId = this.parentId;
      parentIdTree = this.objectAdminPage.parentId;
      this.adminPageDetail.orderDisplay = this.objectAdminPage.orderDisplay;
      this.adminPageDetail.icon = this.objectAdminPage.icon;
      this.adminPageDetail.path = this.objectAdminPage.path;
      this.adminPageDetail.breadcrumb = this.objectAdminPage.breadcrumb;
      this.adminPageDetail.typeActionId = this.objectAdminPage.typeActionId;
      this.adminPageDetail.modifyDate = this.objectAdminPage.modifyDate;
      this.adminPageDetail.createDate = this.objectAdminPage.createDate;
    }
    else {
      parentIdTree = this.parentId
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

    let paramGetTree: string = "?";
    // create tree list AdminPage
    if (this.type != undefined && this.type.length > 0) {
      if (paramGetTree.length > 1) {
        paramGetTree = paramGetTree + "&type=" + this.type;
      }
      else {
        paramGetTree = paramGetTree + "type=" + this.type;
      }
    }

    if (parentIdTree != undefined && parentIdTree > 0) {
      if (paramGetTree.length > 1) {
        paramGetTree = paramGetTree + "&parentId=" + parentIdTree;
      }
      else {
        paramGetTree = paramGetTree + "parentId=" + parentIdTree;
      }
    }

    if (this.id != undefined && this.id > 0) {
      if (paramGetTree.length > 1) {
        paramGetTree = paramGetTree + "&id=" + this.id;
      }
      else {
        paramGetTree = paramGetTree + "id=" + this.id;
      }
    }

    this.adminPageService.getListAdminPageTree(paramGetTree).subscribe(result => {
      if (result) {

        if (result) {
          $('#jstree').jstree({
            'core': {
              'data': result
            }
          });
        }
        else {
          console.log(result);
        }

      }
      else {
        this.showModal(AppConstant.errorTitle, result.message);
      }
    }),
      error => {
        this.showModal(AppConstant.errorTitle, error.message);
      };
  }


  nextclick() {
    // validate
    let isValid = true;
    let mess = "";
    let treeParentId: string = $(".jstree-clicked").attr('id').replace("_anchor", "");
    let validateAdminPageObj = {
      title: this.adminPageDetail.title,
      isShow: this.adminPageDetail.isShow,
      tye: this.adminPageDetail.tye,
      parentId: treeParentId,
      orderDisplay: this.adminPageDetail.orderDisplay,
      icon: this.adminPageDetail.icon,
      path: this.adminPageDetail.path,
      breadcrumb: this.adminPageDetail.breadcrumb,
      typeActionId: this.adminPageDetail.typeActionId,
      modifyDate: this.adminPageDetail.modifyDate,
      createDate: this.adminPageDetail.createDate
    }

    let createAdminPageObj = {
      id: this.adminPageDetail.id,
      act: this.adminPageDetail.act,
      ctrl: this.adminPageDetail.ctrl,
      title: this.adminPageDetail.title,
      isShow: this.adminPageDetail.isShow,
      tye: this.adminPageDetail.tye,
      parentId: treeParentId,
      orderDisplay: this.adminPageDetail.orderDisplay,
      icon: this.adminPageDetail.icon,
      path: this.adminPageDetail.path,
      breadcrumb: this.adminPageDetail.breadcrumb,
      typeActionId: this.adminPageDetail.typeActionId,
      modifyDate: this.adminPageDetail.modifyDate,
      createDate: this.adminPageDetail.createDate
    }

    // call api validate adminpage
    this.adminPageService.validateAdminPage(validateAdminPageObj).subscribe(result => {
      if (result) {
        if (result.code === AppConstant.successCode) {

          // save obj to locate
          localStorage.setItem(AppConstant.objectAdminPage, JSON.stringify(createAdminPageObj));

          localStorage.setItem(AppConstant.isInProcess, "true");
          if (this.isCreate) {
            this.router.navigate(['/pages/adminpage/confirm', this.type, this.parentId]);
          }
          else {
            this.router.navigate(['/pages/adminpage/confirm', this.type, this.parentId, this.id]);
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
    if (this.parentId == 0) {
      this.router.navigate(['/pages/adminpage/list', this.type]);
    }
    else {
      this.router.navigate(['/pages/adminpage/list', this.type, this.node, this.parentId]);
    }
  }

  showModal(title: string, mess: string) {
    const activeModal = this.modalService.open(ModalComponent, { size: 'lg', container: 'nb-layout' });
    activeModal.componentInstance.modalHeader = title;
    activeModal.componentInstance.modalContent = mess;
  }
}


