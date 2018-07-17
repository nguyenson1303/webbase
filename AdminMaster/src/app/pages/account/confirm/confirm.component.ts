import { Component, OnInit } from '@angular/core';
import { Router, ActivatedRoute } from '@angular/router';
import { AppConstant } from '../../../config/appconstant';
import { AccountService } from '../../../@core/data/account.service';
import { NgbModal } from '@ng-bootstrap/ng-bootstrap';
import { ModalComponent } from "../../ui-features/modals/modal/modal.component";

@Component({
  selector: 'confirm',
  templateUrl: './confirm.component.html',
  styleUrls: ['./confirm.component.scss']
})
export class ConfirmComponent implements OnInit {

  createUserObj = {
    username: "",
    password: "",
    confirmPassword: "",
    ip: "",
    online: "",
    role: "",
    fname: "",
    lname: "",
    phone: "",
    address: "",
    birthday: "",
    avatar: ""
  }

  public isCreate: boolean = true;
  private username: string = "";
  private objectUser: any;
  private type: string = "";

  constructor(private activatedRoute: ActivatedRoute,
    private accountService: AccountService,
    private router: Router,
    private modalService: NgbModal) {

    // get param from router ex: /:username
    this.activatedRoute.params.forEach(params => {
      this.username = params['username'];
      this.type = params['type'];
    });

    if (this.username != null && this.username != "") {
      this.isCreate = false;
    }

    if (this.type == null || this.type == "") {
      this.type = "";
    }

    // check localStorage exist
    this.objectUser = localStorage.getItem(AppConstant.objectUser);
    if (this.objectUser != null && this.objectUser != undefined) {
      this.createUserObj = JSON.parse(this.objectUser);
    }
    else {
      this.router.navigate(['/pages/miscellaneous/404']);
    }
  }

  backclick() {
    this.router.navigate(['/pages/account/add', this.type]);
  }

  nextclick() {
    if (this.isCreate)
    {
      // call api create user
      this.accountService.createUser(JSON.parse(this.objectUser)).subscribe(result => {
        if (result) {
          if (result.code === AppConstant.successCode) {
            this.showModal(AppConstant.successTitle, AppConstant.messcreateSuccess);
            this.router.navigate(['/pages/account/list', this.type]);
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
    else
    {
      // call api edit user
      this.accountService.updateUser(this.username, JSON.parse(this.objectUser)).subscribe(result => {
        if (result) {
          if (result.code === AppConstant.successCode) {
            this.showModal(AppConstant.successTitle, AppConstant.messUpdateFail);
            this.router.navigate(['/pages/account/list', this.type]);
          }
          else {
            this.showModal(AppConstant.failTitle, AppConstant.messUpdateFail);
          }
        }
      }),
        error => {
          this.showModal(AppConstant.errorTitle, error.message);
        };
    }
  }

  ngOnInit() {
  }
  showModal(title: string, mess: string) {
    const activeModal = this.modalService.open(ModalComponent, { size: 'lg', container: 'nb-layout' });

    activeModal.componentInstance.modalHeader = title;
    activeModal.componentInstance.modalContent = mess;
  }


}
