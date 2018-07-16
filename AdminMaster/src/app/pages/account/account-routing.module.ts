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
      path: 'list',
      component: ListComponent, canActivate: [AuthGuard]
    },
    {
      path: 'detail/:username',
      component: DetailComponent, canActivate: [AuthGuard]
    },
    {
      path: 'edit/:username',
      component: EditComponent, canActivate: [AuthGuard]
    },
    {
      path: 'confirm',
      component: ConfirmComponent, canActivate: [AuthGuard]
    },

  ],
}];

@NgModule({
  imports: [RouterModule.forChild(routes)],
  exports: [RouterModule]
})
export class AccountRoutingModule { }
