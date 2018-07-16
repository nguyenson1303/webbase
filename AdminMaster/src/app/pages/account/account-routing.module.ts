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
  component: AccountComponent, canActivate: [AuthGuard],
  children: [
    {
      path: 'list/:type',
      component: ListComponent, canActivate: [AuthGuard]
    },
    {
      path: 'detail/:type/:username',
      component: DetailComponent, canActivate: [AuthGuard]
    },
    {
      path: 'edit/:type/:username',
      component: EditComponent, canActivate: [AuthGuard]
    },
    {
      path: 'confirm/:type',
      component: ConfirmComponent, canActivate: [AuthGuard]
    },
    {
      path: 'add/:type',
      component: EditComponent, canActivate: [AuthGuard]
    },
  ],
}];

@NgModule({
  imports: [RouterModule.forChild(routes)],
  exports: [RouterModule]
})
export class AccountRoutingModule { }
