import { Component } from '@angular/core';
import { NbMenuItem } from '@nebular/theme';

import { MENU_ITEMS } from './pages-menu';
import { MenuService } from './../@core/data/menu.service';
import { AppConstant } from './../config/appconstant';
import { forEach } from '@angular/router/src/utils/collection';

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
    this.menu = MENU_ITEMS;
    let allMenu = JSON.parse(menuAdmin);
    allMenu.forEach(element => {
      this.menu.push(element);
    });

    this.menuService.getMenu().subscribe(data => {
      if (data) {
        console.log('get menu lastest: ' + JSON.stringify(data));
        this.menu = MENU_ITEMS;
        let allMenu = JSON.parse(menuAdmin);
        allMenu.forEach(element => {
          this.menu.push(element);
        });
      }
    });
  }

}
