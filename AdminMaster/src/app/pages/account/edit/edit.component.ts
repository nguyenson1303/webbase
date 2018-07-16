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

    console.log(this.router.url.split('/' + lastPath)[0] + '/' + lastPath);

    this.accountService.checkPermission(this.pathInfor).subscribe(result => {
      if (result) {
        if (result && result.code) {
          if (result.code === AppConstant.permissionDeniedCode) {
            this.router.navigate(['/pages/miscellaneous/404']);
          }
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
          if (result && result.code) {
            this.showModal(AppConstant.errorTitle, result.message);
          }
          else {
            this.userDetail = result;
          }
        }
      }),
        error => {
          this.showModal(AppConstant.errorTitle, error.message);
        };

      this.accountService.getUserProfile().subscribe(result => {
        if (result) {
          if (result && result.code) {
            this.showModal(AppConstant.errorTitle, result.message);
          }
          else {
            this.userProfile = result;
          }
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

  showModal(title: string, mess: string) {
    const activeModal = this.modalService.open(ModalComponent, { size: 'lg', container: 'nb-layout' });

    activeModal.componentInstance.modalHeader = title;
    activeModal.componentInstance.modalContent = mess;
  }
}
