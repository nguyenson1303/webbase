import { NgModule } from '@angular/core';
import { Routes, RouterModule } from '@angular/router';

import { AuthGuard } from '../../auth.guard';

import { AdminpageComponent } from '../adminpage/adminpage.component';
import { ListComponent } from '../adminpage/list/list.component';

const routes: Routes = [{
  path: '',
  component: AdminpageComponent, canActivate: [AuthGuard],
  children: [
    {
      path: 'list',
      component: ListComponent, canActivate: [AuthGuard]
    },

  ],
}];

@NgModule({
  imports: [RouterModule.forChild(routes)],
  exports: [RouterModule]
})
export class AdminpageRoutingModule { }
