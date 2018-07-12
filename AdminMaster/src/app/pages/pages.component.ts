import { Component } from '@angular/core';
import { NbMenuItem } from '@nebular/theme';

import { MENU_ITEMS } from './pages-menu';
import { MenuService } from './../@core/data/menu.service';
import { AppConstant } from './../config/appconstant';
import { forEach } from '@angular/router/src/utils/collection';
import { Jsonp } from '@angular/http';

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

  public menu: NbMenuItem[];

  constructor(private menuService: MenuService) {
    this.menu = MENU_ITEMS;

    this.menuService.getMenu().subscribe(data => {
      if (data) {
        data.forEach(element => {
          element.children.forEach(child => {
            if (child.type != undefined && child.type != null && child.type != "") {
               child.queryParams = { type: child.type };
              // child.link = child.link + "/" + child.type;
            }
          });
          this.menu.push(element);
        });
      }
    });
  }

}
