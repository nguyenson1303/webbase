import { Component, OnInit } from '@angular/core';
import { Router, ActivatedRoute } from '@angular/router';
import { AuthService } from '../../service/auth.service';
import { AppConfig } from '../../config/appconfig';
import { AppConstant } from '../../config/appconstant';
declare var $: any;

@Component({
  selector: 'login',
  templateUrl: './login.component.html',
  styleUrls: ['./login.component.scss']
})
export class LoginComponent implements OnInit {

  model: any = {};
  modelCurrentStorage: any = {};
  returnUrl: string;
  errors: string = "";
  private currentStorage = AppConstant.currentStorage;

  constructor(private router: Router,
            private route: ActivatedRoute,
            private authenService: AuthService) { }

  ngOnInit() {
    this.returnUrl = this.route.snapshot.queryParams['returnUrl'] || '';
    this.modelCurrentStorage = JSON.parse(localStorage.getItem(this.currentStorage));
    if (this.modelCurrentStorage && this.modelCurrentStorage.save) {
      this.model = this.modelCurrentStorage;
    }
  }

  login() {
    this.authenService.login(
      this.model.userName,
      this.model.password,
      this.model.save)
      .subscribe(result => {
        if (result === true) {
          if (this.returnUrl != '') {
            this.router.navigate([this.returnUrl]);
          } else {
            this.router.navigate(['dashboard']);
          }
        }
      }, error => {
        this.errors = error.error_description;
      });
  }
}
