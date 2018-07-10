import { Injectable } from '@angular/core';
import { CanActivate, ActivatedRouteSnapshot, RouterStateSnapshot, Router } from '@angular/router';
import { Observable } from 'rxjs';
import { AuthService } from './service/auth.service';

@Injectable()
export class AuthGuard implements CanActivate {

  constructor(private router: Router, private authenService: AuthService) { }

  canActivate(
    next: ActivatedRouteSnapshot,
    state: RouterStateSnapshot): Observable<boolean> | Promise<boolean> | boolean {
    return this.authenService.isLogIn().map(success => {
      if (success) {
        this.authenService.getProfile().subscribe(data => {
            var currentUrl = window.location;
            var currentHost = window.location.host;
            var currentHostName = window.location.hostname;
            var currentOrigin = window.location.origin;
            var currentPathname = window.location.pathname;

            window.location.href = currentOrigin + currentPathname;
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
