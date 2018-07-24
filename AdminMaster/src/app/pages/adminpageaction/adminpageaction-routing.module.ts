import { NgModule } from '@angular/core';
import { Routes, RouterModule } from '@angular/router';

import { AuthGuard } from '../../auth.guard';

import { AdminpageactionComponent } from '../adminpageaction/adminpageaction.component';
import { DetailComponent } from './detail/detail.component';
import { EditComponent } from './edit/edit.component';
import { ConfirmComponent } from './confirm/confirm.component';

const routes: Routes = [
  {
    path: '',
    // data: { breadcrumb: 'Account' },
    component: AdminpageactionComponent, canActivate: [AuthGuard],
    children: [
      {
        path: 'detail/:type/:pageId/id',
        data: { breadcrumb: 'Chi tiết action' },
        component: DetailComponent, canActivate: [AuthGuard]
      },
      {
        path: 'edit/:type/:pageId/:id',
        data: { breadcrumb: 'Cập nhật action' },
        component: EditComponent, canActivate: [AuthGuard]
      },
      {
        path: 'confirm/:type/:pageId/:id',
        data: { breadcrumb: 'Xác nhận sửa action' },
        component: ConfirmComponent, canActivate: [AuthGuard]
      },
      {
        path: 'add/:type/:pageId',
        data: { breadcrumb: 'Tạo action' },
        component: EditComponent, canActivate: [AuthGuard]
      },
      {
        path: 'confirm/:type/:pageId',
        data: { breadcrumb: 'Xác nhận tạo action' },
        component: ConfirmComponent, canActivate: [AuthGuard]
      }
    ],
  }
];

@NgModule({
  imports: [RouterModule.forChild(routes)],
  exports: [RouterModule]
})
export class AdminpageactionRoutingModule { }
