import { Component, OnInit } from '@angular/core';
import { Router, ActivatedRoute } from '@angular/router';
import { AppConstant } from '../../../config/appconstant';

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

  private objectUser: any;

  constructor(private activatedRoute: ActivatedRoute,
    private router: Router) {
    // check localStorage exist
    this.objectUser = localStorage.getItem(AppConstant.objectUser);
    if (this.objectUser != null && this.objectUser != undefined) {
      this.createUserObj = JSON.parse(this.objectUser);
    }
    else {
      this.router.navigate(['/pages/miscellaneous/404']);
    }
  }

  ngOnInit() {
  }

}
