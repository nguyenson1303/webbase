import { NgModule } from '@angular/core';
import { CommonModule } from '@angular/common';
import { TableModule } from 'ngx-easy-table';
import { ThemeModule } from '../../@theme/theme.module';

import { CatalogRoutingModule } from './catalog-routing.module';
import { CatalogComponent } from './catalog.component';
import { ListComponent } from './list/list.component';
import { DetailComponent } from './detail/detail.component';
import { EditComponent } from './edit/edit.component';
import { ConfirmComponent } from './confirm/confirm.component';

@NgModule({
  imports: [
    CommonModule,
    CatalogRoutingModule,
    ThemeModule,
    TableModule
  ],
  declarations: [
    CatalogComponent,
    ListComponent,
    DetailComponent,
    EditComponent,
    ConfirmComponent
  ]
})
export class CatalogModule { }