import { Component, OnInit } from '@angular/core';
import { Router, ActivatedRoute } from '@angular/router';
import { NgbModal } from '@ng-bootstrap/ng-bootstrap';
import { AccountService } from '../../../@core/data/account.service';
import { AppConstant } from '../../../config/appconstant';
import { ModalComponent } from '../../ui-features/modals/modal/modal.component';


@Component({
  selector: 'detail',
  templateUrl: './detail.component.html',
  styleUrls: ['./detail.component.scss']
})
export class DetailComponent implements OnInit {

  private username: string = "";
  private type: string = "";

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

  constructor(private activatedRoute: ActivatedRoute,
    private router: Router,
    private accountService: AccountService,
    private modalService: NgbModal) {

    // get param from router ex: /:username
    this.activatedRoute.params.forEach(params => {
      this.username = params['username'];
      this.type = params['type'];
    });

    if (this.type == null || this.type == "") {
      this.type = "";
    }

    // check user is permission for view page
    let lastPath = activatedRoute.snapshot.url[0].path;
    this.pathInfor.path = this.router.url.split('/' + lastPath)[0] + '/' + lastPath;
    this.pathInfor.type = this.type;
    this.pathInfor.typeAct = AppConstant.viewAction

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

  // call Api get user infomation
  ngOnInit() {
    this.accountService.getUserDetail(this.username).subscribe(result => {
      if (result) {
        this.userDetail = result;
      }
      else {
        this.showModal(AppConstant.errorTitle, result.message);
      }
    }),
      error => {
        this.showModal(AppConstant.errorTitle, error.message);
      };

    this.accountService.getUserInforDetail(this.username).subscribe(result => {
      if (result) {
        this.userProfile = result;
      }
      else {
        this.showModal(AppConstant.errorTitle, result.message);
      }
    }),
      error => {
        this.showModal(AppConstant.errorTitle, error.message);
      };
  }

  // show modal
  showModal(title: string, mess: string) {
    const activeModal = this.modalService.open(ModalComponent, { size: 'lg', container: 'nb-layout' });

    activeModal.componentInstance.modalHeader = title;
    activeModal.componentInstance.modalContent = mess;
  }

  // navigate to list user
  backclick() {
    this.router.navigate(['/pages/account/list', this.type]);
  }

  // navigate to edit user
  editclick() {
    this.router.navigate(['/pages/account/edit', this.type, this.username]);
  }

}
