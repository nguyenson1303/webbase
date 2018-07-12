import { NgModule } from '@angular/core';
import { Routes, RouterModule } from '@angular/router';

import { AuthGuard } from '../../auth.guard';

import { AccountComponent } from '../account/account.component';
import { ListComponent } from '../account/list/list.component';

const routes: Routes = [{
  path: '',
  component: AccountComponent, canActivate: [AuthGuard],
  children: [{
    path: 'list',
    component: ListComponent, canActivate: [AuthGuard]
  }],
}];

@NgModule({
  imports: [RouterModule.forChild(routes)],
  exports: [RouterModule]
})
export class AccountRoutingModule { }
