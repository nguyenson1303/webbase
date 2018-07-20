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

    // get param from router ex: /:username
    this.activatedRoute.params.forEach(params => {
      this.id = params['id'];
      this.type = params['type'];
      if (params['parentId'] == null || params['parentId'] == undefined)
      {
        this.parentId = 0;
      }
      else
      {
        this.parentId = params['parentId'];
      }
    });

    if (this.id != null && this.id > 0) {
      this.isCreate = false;
    }

    if (this.type == null || this.type == "") {
      this.type = "";
    }

    // check localStorage exist
    this.objectAdminPage = localStorage.getItem(AppConstant.objectAdminPage);
    if (this.objectAdminPage != null && this.objectAdminPage != undefined) {
      this.adminPageDetail = JSON.parse(this.objectAdminPage);
      this.objectAdminPageActions = localStorage.getItem(AppConstant.objectAdminPageAction);
      if (this.objectAdminPageActions != null && this.objectAdminPageActions != undefined) {
        this.objectAdminPageActions = JSON.parse(this.objectAdminPageActions);

      }
    }
    else {
      this.router.navigate(['/pages/miscellaneous/404']);
    }
  }

  ngOnInit() {
  }

  backclick() {
    if (this.isCreate) {
      this.router.navigate(['/pages/adminpage/add', this.type]);
    }
    else {
      this.router.navigate(['/pages/adminpage/edit', this.type, this.parentId, this.id]);
    }
  }

}
