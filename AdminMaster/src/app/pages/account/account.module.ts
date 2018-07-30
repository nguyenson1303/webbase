import { NgModule } from '@angular/core';
import { CommonModule } from '@angular/common';
import { ThemeModule } from '../../@theme/theme.module';
import { TableModule } from 'ngx-easy-table';
import { ToasterModule } from 'angular2-toaster';

import { AccountRoutingModule } from './account-routing.module';
import { AccountComponent } from './account.component';
import { ListComponent } from './list/list.component';
import { DetailComponent } from './detail/detail.component';
import { EditComponent } from './edit/edit.component';
import { ConfirmComponent } from './confirm/confirm.component';

import { AccountService } from '../../@core/data/account.service';
import { ConfigurationService } from '../account/list/configuration.service';
import { NgDatepickerModule } from 'ng2-datepicker';
import { ProfileComponent } from './profile/profile.component';
import { SettingComponent } from './setting/setting.component';
import { ToasterService } from 'angular2-toaster';

@NgModule({
  imports: [
    CommonModule,
    ThemeModule,
    AccountRoutingModule,
    TableModule,
    NgDatepickerModule,
    ToasterModule.forRoot(),
  ],
  declarations: [
    AccountComponent,
    ListComponent,
    DetailComponent,
    EditComponent,
    ConfirmComponent,
    ProfileComponent,
    SettingComponent,
  ],
  providers: [
    AccountService,
    ConfigurationService,
    ToasterService
  ],
})
export class AccountModule { }
