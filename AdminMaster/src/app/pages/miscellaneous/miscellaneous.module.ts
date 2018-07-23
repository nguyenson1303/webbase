import { NgModule } from '@angular/core';
import { ThemeModule } from '../../@theme/theme.module';
import { MiscellaneousRoutingModule, routedComponents } from './miscellaneous-routing.module';
import { PermissionDeniedComponent } from './permission-denied/permission-denied.component';

@NgModule({
  imports: [
    ThemeModule,
    MiscellaneousRoutingModule,
  ],
  declarations: [
    ...routedComponents,
    PermissionDeniedComponent,
  ],
})
export class MiscellaneousModule { }
