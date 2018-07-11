import { Component } from '@angular/core';
import { NbMenuItem } from '@nebular/theme';

import { MENU_ITEMS } from './pages-menu';
import { MenuService } from './../@core/data/menu.service';
import { AppConstant } from './../config/appconstant';

@Component({
  selector: 'ngx-pages',
  template: `
    <ngx-sample-layout>
      <nb-menu [items]="menu"></nb-menu>
      <router-outlet></router-outlet>
    </ngx-sample-layout>
  `,
})
export class PagesComponent {

  // menu = MENU_ITEMS;
  public menu: NbMenuItem[];
  private currentMenu = AppConstant.currentMenu;

  constructor(private menuService: MenuService) {
    let menuAdmin = localStorage.getItem(this.currentMenu);
    this.menu = JSON.parse(menuAdmin);
    this.menu.concat(MENU_ITEMS);
    this.menuService.getMenu().subscribe(data => {
      if (data) {
        console.log('get menu lastest: ' + JSON.stringify(data));
        this.menu = data;
        this.menu.concat(MENU_ITEMS);
      }
    });
  }

}
