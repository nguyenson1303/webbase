import { Component, OnInit } from '@angular/core';
import { Router, ActivatedRoute } from '@angular/router';
import { NgbModal } from '@ng-bootstrap/ng-bootstrap';
import { AccountService } from '../../../@core/data/account.service';
import { AppConstant } from '../../../config/appconstant';
import { ModalComponent } from '../../ui-features/modals/modal/modal.component';

@Component({
  selector: 'edit',
  templateUrl: './edit.component.html',
  styleUrls: ['./edit.component.scss']
})
export class EditComponent implements OnInit {

  userDetail = {
    username: "",
    password: "",
    confirmPassword: "",
    role: 0,
    online: true,
    lastLogin: "",
    ip: "",
    token: "",
    expire: ""
  };

  userProfile = {
    inforId: 0,
    fname: "",
    lname: "",
    phone: "",
    address: "",
    email: "",
    eventId: null,
    birthday: null,
    location: "",
    note: "",
    dateJoin: null,
    dateRegister: null,
    avatar: "",
    fullName: ""
  }

  pathInfor = {
    path: "",
    typeAct: "",
    type: ""
  };

  public isCreate: boolean = true;
  private username: string = "";
  private type: string = "";

  constructor(private activatedRoute: ActivatedRoute,
    private router: Router,
    private accountService: AccountService,
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
    if (this.isCreate == false) {
      this.accountService.getUserDetail(this.username).subscribe(result => {
        if (result) {
          this.showModal(AppConstant.errorTitle, result.value.message);
        }
        else {
          this.userDetail = result;
        }
      }),
        error => {
          this.showModal(AppConstant.errorTitle, error.message);
        };

      this.accountService.getUserProfile().subscribe(result => {
        if (result) {
          this.showModal(AppConstant.errorTitle, result.value.message);
        }
        else {
          this.userProfile = result;
        }
      }),
        error => {
          this.showModal(AppConstant.errorTitle, error.message);
        };
    }
  }

  backclick() {
    this.router.navigate(['/pages/account/list', this.type]);
  }

  nextclick() {
    // validate
    let isValid = true;
    let mess = "";
    let createUserObj = {
      username: this.userDetail.username,
      password: this.userDetail.password,
      confirmPassword: this.userDetail.confirmPassword,
      ip: "",
      online: this.userDetail.online,
      role: this.type,
      fname: this.userProfile.fname,
      lname: this.userProfile.lname,
      phone: this.userProfile.phone,
      address: this.userProfile.address,
      birthday: this.userProfile.birthday,
      avatar: this.userProfile.avatar
    }

    // call api validate user
    this.accountService.validateUser(createUserObj).subscribe(result => {
      if (result) {
        if (result.code === AppConstant.successCode) {
          // save obj to locate
          localStorage.setItem(AppConstant.objectUser, JSON.stringify(createUserObj));
          if (this.isCreate) {
            this.router.navigate(['/pages/account/confirm', this.type]);
          }
          else{
            this.router.navigate(['/pages/account/confirm', this.type, this.username]);
          }
        }
        else {
          // focus to field error and show message
          let field = document.getElementById(result.value.field)
          if (field) {
            field.focus();
          }
          this.showModal(AppConstant.errorTitle, result.value.message + ":" + result.value.field);
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
