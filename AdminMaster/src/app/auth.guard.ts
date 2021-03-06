import { Injectable } from '@angular/core';
import { CanActivate, ActivatedRouteSnapshot, RouterStateSnapshot, Router } from '@angular/router';
import { Observable } from 'rxjs';
import { AuthService } from './@core/data/auth.service';
import { AppConstant } from './config/appconstant';

@Injectable()
export class AuthGuard implements CanActivate {

  private currentProfile = AppConstant.currentProfile;

  constructor(private router: Router, private authenService: AuthService) { }

  canActivate(
    next: ActivatedRouteSnapshot,
    state: RouterStateSnapshot): Observable<boolean> | Promise<boolean> | boolean {
    return this.authenService.isLogIn().map(success => {
      if (success) {
        this.authenService.getProfile().subscribe(data => {
          if (data) {
            localStorage.setItem(this.currentProfile, JSON.stringify(data));
          }
        });
        return true;
      } else {
        if (this.authenService.getSave()) {
          this.authenService.autoLogin().subscribe(success => {
            if (!success) {
              this.router.navigate(['/auth/login'], { queryParams: { returnUrl: state.url } });
            } else {
              this.router.navigate([state.url]);
            }
          });
        } else {
          this.router.navigate(['/auth/login'], { queryParams: { returnUrl: state.url } });
        }
      }
    }).catch(err => {
      this.router.navigate(['/auth/login'], { queryParams: { returnUrl: state.url } });
      return Observable.of(false);
    });
  }
}
