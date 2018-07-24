import { NgModule } from '@angular/core';
import { CommonModule } from '@angular/common';

import { AdminpageactionRoutingModule } from './adminpageaction-routing.module';
import { AdminpageactionComponent } from './adminpageaction.component';
import { DetailComponent } from './detail/detail.component';
import { EditComponent } from './edit/edit.component';
import { ConfirmComponent } from './confirm/confirm.component';

@NgModule({
  imports: [
    CommonModule,
    AdminpageactionRoutingModule
  ],
  declarations: [AdminpageactionComponent, DetailComponent, EditComponent, ConfirmComponent]
})
export class AdminpageactionModule { }
