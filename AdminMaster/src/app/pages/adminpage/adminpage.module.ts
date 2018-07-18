import { NgModule } from '@angular/core';
import { CommonModule } from '@angular/common';
import { ThemeModule } from '../../@theme/theme.module';
import { Ng2SmartTableModule } from 'ng2-smart-table';
import { TableModule } from 'ngx-easy-table';
import { AdminpageService } from '../../@core/data/adminpage.service';
import { ConfigurationService } from '../adminpage/list/configuration.service';
import { AdminpageRoutingModule } from './adminpage-routing.module';

import { AdminpageComponent } from './adminpage.component';
import { ListComponent } from './list/list.component';
import { DetailComponent } from './detail/detail.component';
import { EditComponent } from './edit/edit.component';
import { ConfirmComponent } from './confirm/confirm.component';

@NgModule({
  imports: [
    CommonModule,
    ThemeModule,
    AdminpageRoutingModule,
    Ng2SmartTableModule,
    TableModule,
  ],
  declarations: [
    AdminpageComponent,
    ListComponent,
    DetailComponent,
    EditComponent,
    ConfirmComponent,
  ],
    providers: [
      AdminpageService,
      ConfigurationService
  ],
})
export class AdminpageModule { }
