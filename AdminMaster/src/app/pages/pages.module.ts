import { NgModule } from '@angular/core';

import { PagesComponent } from './pages.component';
import { DashboardModule } from './dashboard/dashboard.module';
import { PagesRoutingModule } from './pages-routing.module';
import { ThemeModule } from '../@theme/theme.module';
import { MiscellaneousModule } from './miscellaneous/miscellaneous.module';
import { ModalComponent } from './ui-features/modals/modal/modal.component';
import { ConfirmModalComponent } from './ui-features/modals/confirm/confirm.component';
import { BreadcrumbComponent } from './ui-features/breadcrumb/breadcrumb.component';

const PAGES_COMPONENTS = [
  PagesComponent,
  ModalComponent,
  ConfirmModalComponent,
  BreadcrumbComponent
];

@NgModule({
  imports: [
    PagesRoutingModule,
    ThemeModule,
    DashboardModule,
    MiscellaneousModule,
  ],
  declarations: [
    ...PAGES_COMPONENTS,
  ],
  entryComponents: [
    ModalComponent,
    ConfirmModalComponent,
    BreadcrumbComponent
  ],
})
export class PagesModule {
}
