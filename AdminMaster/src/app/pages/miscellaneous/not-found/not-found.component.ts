import { NbMenuService } from '@nebular/theme';
import { Component } from '@angular/core';
import { AppConstant } from '../../../config/appconstant';

@Component({
  selector: 'ngx-not-found',
  styleUrls: ['./not-found.component.scss'],
  templateUrl: './not-found.component.html',
})
export class NotFoundComponent {

  image: string;

  constructor(private menuService: NbMenuService) {
    this.image = AppConstant.avatarDefault;
  }

  goToHome() {
    this.menuService.navigateHome();
  }
}
