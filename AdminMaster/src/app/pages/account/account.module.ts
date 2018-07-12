import { NgModule } from '@angular/core';
import { CommonModule } from '@angular/common';
import { ThemeModule } from '../../@theme/theme.module';
import { Ng2SmartTableModule } from 'ng2-smart-table';

import { AccountRoutingModule } from './account-routing.module';
import { AccountComponent } from './account.component';
import { ListComponent } from './list/list.component';
import { DetailComponent } from './detail/detail.component';
import { EditComponent } from './edit/edit.component';
import { ConfirmComponent } from './confirm/confirm.component';


import { AccountService } from '../../@core/data/account.service';

@NgModule({
  imports: [
    CommonModule,
    ThemeModule,
    AccountRoutingModule,
    Ng2SmartTableModule
  ],
  declarations: [AccountComponent, ListComponent, DetailComponent, EditComponent, ConfirmComponent],
  providers: [
    AccountService,
  ],
})
export class AccountModule { }