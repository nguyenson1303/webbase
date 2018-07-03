namespace Web
{
    using System;
    using System.Collections.Generic;
    using System.Data;
    using System.Linq;
    using System.Web;
    using System.Web.Http;
    using System.Web.Mvc;
    using System.Web.Optimization;
    using System.Web.Routing;

    using NLog.Common;

    using Web.Data;
    using Web.Models;

    //// Note: For instructions on enabling IIS6 or IIS7 classic mode,
    //// visit http://go.microsoft.com/?LinkId=9394801

    /// <summary>
    /// the Application
    /// </summary>
    /// <seealso cref="System.Web.HttpApplication" />
    public class MvcApplication : System.Web.HttpApplication
    {
        /// <summary>
        /// Applications the start.
        /// </summary>
        protected void Application_Start()
        {
            AreaRegistration.RegisterAllAreas();

            WebApiConfig.Register(GlobalConfiguration.Configuration);
            FilterConfig.RegisterGlobalFilters(GlobalFilters.Filters);
            RouteConfig.RegisterRoutes(RouteTable.Routes);
            BundleConfig.RegisterBundles(BundleTable.Bundles);

            ////Nlog
            string nlogPath = Server.MapPath("nlog-web.log");
            InternalLogger.LogFile = nlogPath;
            InternalLogger.LogLevel = NLog.LogLevel.Trace;

            //// Code that runs on application startup
            this.Application["HomNay"] = 0;
            this.Application["HomQua"] = 0;
            this.Application["TuanNay"] = 0;
            this.Application["TuanTruoc"] = 0;
            this.Application["ThangNay"] = 0;
            this.Application["ThangTruoc"] = 0;
            this.Application["TatCa"] = 0;
            this.Application["visitors_online"] = 0;
        }

        /// <summary>
        /// Handles the End event of the Session control.
        /// </summary>
        /// <param name="sender">The source of the event.</param>
        /// <param name="e">The <see cref="EventArgs"/> instance containing the event data.</param>
        protected void Session_End(object sender, EventArgs e)
        {
            this.Application.Lock();
            this.Application["visitors_online"] = Convert.ToUInt32(this.Application["visitors_online"]) - 1;
            this.Application.UnLock();
        }

        /// <summary>
        /// Handles the Start event of the Session control.
        /// </summary>
        /// <param name="sender">The source of the event.</param>
        /// <param name="e">The <see cref="EventArgs"/> instance containing the event data.</param>
        protected void Session_Start(object sender, EventArgs e)
        {
            Session.Timeout = 200;
            this.Application.Lock();
            this.Application["visitors_online"] = Convert.ToInt32(this.Application["visitors_online"]) + 1;
            this.Application.UnLock();
            try
            {
                StatisticModels statisticModels = new StatisticModels();
                DataTable dtb = statisticModels.StatisticTable();
                if (dtb.Rows.Count > 0)
                {
                    this.Application["HomNay"] = long.Parse("0" + dtb.Rows[0]["HomNay"]).ToString("#,###");
                    this.Application["HomQua"] = long.Parse("0" + dtb.Rows[0]["HomQua"]).ToString("#,###");
                    this.Application["TuanNay"] = long.Parse("0" + dtb.Rows[0]["TuanNay"]).ToString("#,###");
                    this.Application["TuanTruoc"] = long.Parse("0" + dtb.Rows[0]["TuanTruoc"]).ToString("#,###");
                    this.Application["ThangNay"] = long.Parse("0" + dtb.Rows[0]["ThangNay"]).ToString("#,###");
                    this.Application["ThangTruoc"] = long.Parse("0" + dtb.Rows[0]["ThangTruoc"]).ToString("#,###");
                    this.Application["TatCa"] = long.Parse("0" + dtb.Rows[0]["TatCa"]).ToString("#,###");
                }

                dtb.Dispose();
                statisticModels = null;
            }
            catch
            {
            }
        }
    }
}