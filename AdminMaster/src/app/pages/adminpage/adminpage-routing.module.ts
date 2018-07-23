import { NgModule } from '@angular/core';
import { Routes, RouterModule } from '@angular/router';

import { AuthGuard } from '../../auth.guard';

import { AdminpageComponent } from '../adminpage/adminpage.component';
import { ListComponent } from '../adminpage/list/list.component';
import { DetailComponent } from './detail/detail.component';
import { EditComponent } from './edit/edit.component';
import { ConfirmComponent } from './confirm/confirm.component';


const routes: Routes = [{
  path: '',
  component: AdminpageComponent, canActivate: [AuthGuard],
  children: [
    {
      path: 'list/:type/:parentId',
      data: { breadcrumb: 'Danh sách AdminPage' },
      component: ListComponent, canActivate: [AuthGuard]
    },
    {
      path: 'list/:type',
      data: { breadcrumb: 'Danh sách AdminPage' },
      component: ListComponent, canActivate: [AuthGuard]
    },
    {
      path: 'detail/:type/:id',
      data: { breadcrumb: 'Chi tiết AdminPage' },
      component: DetailComponent, canActivate: [AuthGuard]
    },
    {
      path: 'edit/:type/:parentId/:id',
      data: { breadcrumb: 'Chỉnh sửa AdminPage' },
      component: EditComponent, canActivate: [AuthGuard]
    },
    {
      path: 'confirm/:type/:parentId/:id',
      data: { breadcrumb: 'Xác nhận sửa AdminPage' },
      component: ConfirmComponent, canActivate: [AuthGuard]
    },
    {
      path: 'add/:type/:parentId',
      data: { breadcrumb: 'Tạo mới AdminPage' },
      component: EditComponent, canActivate: [AuthGuard]
    },
    {
      path: 'confirm/:type/:parentId',
      data: { breadcrumb: 'Xác nhận tạo AdminPage' },
      component: ConfirmComponent, canActivate: [AuthGuard]
    },
  ],
}];

@NgModule({
  imports: [RouterModule.forChild(routes)],
  exports: [RouterModule]
})
export class AdminpageRoutingModule { }
