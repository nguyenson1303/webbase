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

  public isCreate: boolean = true;
  private username: string = "";
  private objectUser: any;
  private type: string = "";

  constructor(private activatedRoute: ActivatedRoute,
    private router: Router) {

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

    }
    else
    {

    }
  }

  ngOnInit() {
  }

}
