[assembly: OwinStartup(typeof(web.App_Start.Startup))]

namespace web.App_Start
{
    using System;
    using System.Threading.Tasks;

    using Microsoft.Owin;
    using Microsoft.Owin.Host.SystemWeb;
    using Microsoft.Owin.Security;
    using Microsoft.Owin.Security.Cookies;
    using Microsoft.Owin.Security.Google;

    using Owin;

    using web.Models;

    public class Startup
    {
        public void Configuration(IAppBuilder app)
        {
            ConfigureAuth(app);
            // For more information on how to configure your application, visit http://go.microsoft.com/fwlink/?LinkID=316888
        }

        private void ConfigureAuth(IAppBuilder app)
        {
            var cookieOptions = new CookieAuthenticationOptions
            {
                LoginPath = new PathString("/account/Google")
            };

            app.UseCookieAuthentication(cookieOptions);

            app.SetDefaultSignInAsAuthenticationType(cookieOptions.AuthenticationType);

            app.UseGoogleAuthentication(new GoogleOAuth2AuthenticationOptions
            {
                ClientId = Util.getConfigValue("AppGoogleID", ""),
                ClientSecret = Util.getConfigValue("AppGoogleSecret", "")
            });
        }
    }
}