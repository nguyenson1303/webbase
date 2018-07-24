import { NbMenuService } from '@nebular/theme';
import { Component, OnInit } from '@angular/core';
import { AppConstant } from '../../../config/appconstant';

@Component({
  selector: 'permission-denied',
  templateUrl: './permission-denied.component.html',
  styleUrls: ['./permission-denied.component.scss']
})
export class PermissionDeniedComponent implements OnInit {

  image: string;

  constructor(private menuService: NbMenuService) {
    this.image = AppConstant.avatarDefault;
  }

  ngOnInit() {
  }

  goToHome() {
    this.menuService.navigateHome();
  }
}
