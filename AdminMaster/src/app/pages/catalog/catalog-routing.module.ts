import { NgModule } from '@angular/core';
import { Routes, RouterModule } from '@angular/router';

import { AuthGuard } from '../../auth.guard';

import { CatalogComponent } from './catalog.component';
import { ListComponent } from './list/list.component';
import { DetailComponent } from './detail/detail.component';
import { EditComponent } from './edit/edit.component';
import { ConfirmComponent } from './confirm/confirm.component';

const routes: Routes = [
  {
    path: '',
    component: CatalogComponent, canActivate: [AuthGuard],
    children: [
      {
        path: 'list/:type',
        data: { breadcrumb: 'Danh sách catalog' },
        component: ListComponent, canActivate: [AuthGuard]
      },
      {
        path: 'detail/:type/:id',
        data: { breadcrumb: 'Chi tiết catalog' },
        component: DetailComponent, canActivate: [AuthGuard]
      },
      {
        path: 'edit/:type/:id',
        data: { breadcrumb: 'Cập nhật catalog' },
        component: EditComponent, canActivate: [AuthGuard]
      },
      {
        path: 'confirm/:type/:id',
        data: { breadcrumb: 'Xác nhận sửa catalog' },
        component: ConfirmComponent, canActivate: [AuthGuard]
      },
      {
        path: 'add/:type',
        data: { breadcrumb: 'Tạo catalog' },
        component: EditComponent, canActivate: [AuthGuard]
      },
      {
        path: 'confirm/:type',
        data: { breadcrumb: 'Xác nhận tạo catalog' },
        component: ConfirmComponent, canActivate: [AuthGuard]
      },
      { path: '', redirectTo: 'list/:type', pathMatch: 'full' },
      { path: '**', redirectTo: 'list/:type' },
    ],
  }
];

@NgModule({
  imports: [RouterModule.forChild(routes)],
  exports: [RouterModule]
})
export class CatalogRoutingModule { }
