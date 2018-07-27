import { NgModule } from '@angular/core';
import { Routes, RouterModule } from '@angular/router';

import { AuthGuard } from '../../auth.guard';

import { AccountComponent } from '../account/account.component';
import { ListComponent } from '../account/list/list.component';
import { DetailComponent } from './detail/detail.component';
import { EditComponent } from './edit/edit.component';
import { ConfirmComponent } from './confirm/confirm.component';
import { ProfileComponent } from './profile/profile.component';
import { SettingComponent } from './setting/setting.component';

const routes: Routes = [
  {
  path: '',
  // data: { breadcrumb: 'Account' },
  component: AccountComponent, canActivate: [AuthGuard],
  children: [
    {
      path: 'list/:type',
      data: { breadcrumb: 'Danh sách account' },
      component: ListComponent, canActivate: [AuthGuard]
    },
    {
      path: 'detail/:type/:username',
      data: { breadcrumb: 'Chi tiết account' },
      component: DetailComponent, canActivate: [AuthGuard]
    },
    {
      path: 'edit/:type/:username',
      data: { breadcrumb: 'Cập nhật account' },
      component: EditComponent, canActivate: [AuthGuard]
    },
    {
      path: 'confirm/:type/:username',
      data: { breadcrumb: 'Xác nhận sửa account' },
      component: ConfirmComponent, canActivate: [AuthGuard]
    },
    {
      path: 'add/:type',
      data: { breadcrumb: 'Tạo account' },
      component: EditComponent, canActivate: [AuthGuard]
    },
    {
      path: 'confirm/:type',
      data: { breadcrumb: 'Xác nhận tạo account' },
      component: ConfirmComponent, canActivate: [AuthGuard]
    },
    {
      path: 'profile/:username',
      data: { breadcrumb: 'Hồ sơ' },
      component: ProfileComponent, canActivate: [AuthGuard]
    },
    {
      path: 'setting/:username',
      data: { breadcrumb: 'Setting' },
      component: SettingComponent, canActivate: [AuthGuard]
    },
    { path: '', redirectTo: 'list', pathMatch: 'full' },
    { path: '**', redirectTo: 'list' },
  ],
  }
];

@NgModule({
  imports: [RouterModule.forChild(routes)],
  exports: [RouterModule]
})
export class AccountRoutingModule { }
