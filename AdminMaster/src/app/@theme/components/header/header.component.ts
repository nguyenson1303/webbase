import { Component, Input, OnInit } from '@angular/core';
import { Router, ActivatedRoute } from '@angular/router';
import { NbMenuService, NbSidebarService } from '@nebular/theme';
import { UserService } from '../../../@core/data/users.service';
import { AnalyticsService } from '../../../@core/utils/analytics.service';

import { AuthService } from '../../../@core/data/auth.service';
import { AppConstant } from '../../../config/appconstant';
import { BaseService } from '../../../@core/data/base.service';

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

  avatarUrl: string = "";

  private currentProfile = AppConstant.currentProfile;

  constructor(private sidebarService: NbSidebarService,
    private router: Router,
    private menuService: NbMenuService,
    private userService: UserService,
    private analyticsService: AnalyticsService,
    private authenService: AuthService,
    private baseService: BaseService) {

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

          if (this.user.avatar !== null
            && this.user.avatar !== undefined
            && this.user.avatar !== "") {
            this.baseService.downloadFile(this.user.avatar).subscribe(result => {
              let fileName = result.url.split('/').pop().toString();
              let fileType = result.blob().type;

              var blob = new Blob([result.blob()], { type: fileType });
              let file = this.baseService.blobToFile(blob, fileName);

              let fr = new FileReader();
              fr.onload = (event: any) => {
                let base64 = event.target.result;
                this.avatarUrl = base64;
              }
              fr.readAsDataURL(file);

            })
          }
          else {
            this.avatarUrl = AppConstant.avatarDefault;
          }
        }
      });
    }
    else {
      this.user = JSON.parse(profile);

      if (this.user.avatar !== null
        && this.user.avatar !== undefined
        && this.user.avatar !== "") {
        this.baseService.downloadFile(this.user.avatar).subscribe(result => {
          let fileName = result.url.split('/').pop().toString();
          let fileType = result.blob().type;

          var blob = new Blob([result.blob()], { type: fileType });
          let file = this.baseService.blobToFile(blob, fileName);

          let fr = new FileReader();
          fr.onload = (event: any) => {
            let base64 = event.target.result;
            this.avatarUrl = base64;
          }
          fr.readAsDataURL(file);

        })
      }
      else {
        this.avatarUrl = AppConstant.avatarDefault;
      }
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
    if (title === AppConstant.profileLabel) {
      this.router.navigate(['/pages/account/profile', this.user.email]);
    }
  }
}
