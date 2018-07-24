import { NgModule } from '@angular/core';
import { CommonModule } from '@angular/common';

import { AdminpageactionRoutingModule } from './adminpageaction-routing.module';
import { AdminpageactionComponent } from './adminpageaction.component';
import { EditComponent } from './edit/edit.component';
import { ConfirmComponent } from './confirm/confirm.component';

@NgModule({
  imports: [
    CommonModule,
    AdminpageactionRoutingModule
  ],
  declarations: [AdminpageactionComponent, EditComponent, ConfirmComponent]
})
export class AdminpageactionModule { }
