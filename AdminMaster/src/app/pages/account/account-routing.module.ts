import { NgModule } from '@angular/core';
import { Routes, RouterModule } from '@angular/router';

import { AuthGuard } from '../../auth.guard';

import { AccountComponent } from '../account/account.component';
import { ListComponent } from '../account/list/list.component';
import { DetailComponent } from './detail/detail.component';
import { EditComponent } from './edit/edit.component';
import { ConfirmComponent } from './confirm/confirm.component';

const routes: Routes = [{
  path: '',
  data: { breadcrumb: 'account' },
  component: AccountComponent, canActivate: [AuthGuard],
  children: [
    {
      path: 'list/:type',
      data: { breadcrumb: 'list' },
      component: ListComponent, canActivate: [AuthGuard]
    },
    {
      path: 'detail/:type/:username',
      data: { breadcrumb: 'detail' },
      component: DetailComponent, canActivate: [AuthGuard]
    },
    {
      path: 'edit/:type/:username',
      data: { breadcrumb: 'edit' },
      component: EditComponent, canActivate: [AuthGuard]
    },
    {
      path: 'confirm/:type/:username',
      data: { breadcrumb: 'confirm' },
      component: ConfirmComponent, canActivate: [AuthGuard]
    },
    {
      path: 'add/:type',
      data: { breadcrumb: 'add' },
      component: EditComponent, canActivate: [AuthGuard]
    },
    {
      path: 'confirm/:type',
      data: { breadcrumb: 'confirm' },
      component: ConfirmComponent, canActivate: [AuthGuard]
    },
  ],
}];

@NgModule({
  imports: [RouterModule.forChild(routes)],
  exports: [RouterModule]
})
export class AccountRoutingModule { }
