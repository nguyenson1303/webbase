import { NgModule } from '@angular/core';
import { CommonModule } from '@angular/common';
import { ThemeModule } from '../../@theme/theme.module';
import { Ng2SmartTableModule } from 'ng2-smart-table';
import { TableModule } from 'ngx-easy-table';
import { AdminpageactionService } from '../../@core/data/adminpageaction.service';
import { ConfigurationService } from '../adminpage/list/configuration.service';
import { AdminpageactionRoutingModule } from './adminpageaction-routing.module';
import { AdminpageactionComponent } from './adminpageaction.component';
import { EditComponent } from './edit/edit.component';
import { ConfirmComponent } from './confirm/confirm.component';
import { ToasterService } from 'angular2-toaster';

@NgModule({
  imports: [
    CommonModule,
    ThemeModule,
    AdminpageactionRoutingModule,
    Ng2SmartTableModule,
    TableModule,
  ],
  declarations: [AdminpageactionComponent, EditComponent, ConfirmComponent]
  ,
  providers: [
    AdminpageactionService,
    ConfigurationService,
    ToasterService
  ],
})
export class AdminpageactionModule { }
