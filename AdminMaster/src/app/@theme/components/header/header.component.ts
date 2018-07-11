import { Component, Input, OnInit } from '@angular/core';

import { NbMenuService, NbSidebarService } from '@nebular/theme';
import { UserService } from '../../../@core/data/users.service';
import { AnalyticsService } from '../../../@core/utils/analytics.service';

import { AuthService } from '../../../@core/data/auth.service';
import { AppConstant } from '../../../config/appconstant';

@Component({
  selector: 'ngx-header',
  styleUrls: ['./header.component.scss'],
  templateUrl: './header.component.html',
})
export class HeaderComponent implements OnInit {


  @Input() position = 'normal';

  user: any;

  userMenu = [
    { title: AppConstant.profileLabel, icon: 'ion-clipboard' },
    { title: AppConstant.settingLabel, icon: 'ion-gear-a' },
    { title: AppConstant.logoutLabel, icon: 'ion-log-out' }
  ];

  private currentProfile = AppConstant.currentProfile;

  constructor(private sidebarService: NbSidebarService,
    private menuService: NbMenuService,
    private userService: UserService,
    private analyticsService: AnalyticsService,
    private authenService: AuthService) {

    this.menuService.onItemClick()
      .subscribe((event) => {
        this.onContecxtItemSelection(event.item.title);
      });

  }

  ngOnInit() {
    let profile = localStorage.getItem(this.currentProfile);
    if (!profile) {
      this.authenService.getProfile().subscribe(data => {
        if (data) {
          this.user = JSON.parse(data);
          localStorage.setItem(this.currentProfile, JSON.stringify(data));
        }
      });
    }
    else {
      this.user = JSON.parse(profile);
    }
  }

  toggleSidebar(): boolean {
    this.sidebarService.toggle(true, 'menu-sidebar');
    return false;
  }

  toggleSettings(): boolean {
    this.sidebarService.toggle(false, 'settings-sidebar');
    return false;
  }

  goToHome() {
    this.menuService.navigateHome();
  }

  startSearch() {
    this.analyticsService.trackEvent('startSearch');
  }

  logout() {
    this.authenService.logout();
  }

  onContecxtItemSelection(title) {
    if (title === AppConstant.logoutLabel) {
      this.logout();
    }
  }
}
