namespace Web.Controllers
{
    using System;
    using System.Web.Mvc;
    using Web.Models;
    using Web.ViewModels;

    /// <summary>
    /// home Controller
    /// </summary>
    /// <seealso cref="Web.Controllers.BaseController" />
    public class HomeController : BaseController
    {
        /// <summary>
        /// About this instance.
        /// </summary>
        /// <returns>About this instance</returns>
        public ActionResult About()
        {
            string about_content;
            string strBread;
            ViewBag.Title = App_GlobalResources.Lang.mnuAbout + " | " + GeneralModels.GetContent(CommonGlobal.PageName, this.Lang);
            strBread = "<li>" + App_GlobalResources.Lang.mnuAbout + "</li>";
            ViewBag.heading = App_GlobalResources.Lang.mnuAbout;
            ViewBag.str_breadcrumbs = strBread;
            this.AddMeta(CommonGlobal.Keyword, App_GlobalResources.Lang.mnuAbout);
            this.AddMeta(CommonGlobal.Description, App_GlobalResources.Lang.mnuAbout);

            about_content = GeneralModels.GetContent(CommonGlobal.AboutContent, this.Lang);
            ViewBag.short_content = GeneralModels.GetContent(CommonGlobal.AcountShort, this.Lang);

            return this.PartialView("../page/about", about_content);
        }

        /// <summary>
        /// the Contacts this instance.
        /// </summary>
        /// <returns>the Contact</returns>
        public ActionResult Contact()
        {
            string contact_content;
            string strBread;
            ViewBag.Title = App_GlobalResources.Lang.mnuContact + " | " + GeneralModels.GetContent(CommonGlobal.PageName, this.Lang);
            strBread = "<li>" + App_GlobalResources.Lang.mnuContact + "</li>";
            ViewBag.heading = App_GlobalResources.Lang.mnuContact;
            ViewBag.str_breadcrumbs = strBread;
            this.AddMeta(CommonGlobal.Keyword, App_GlobalResources.Lang.mnuContact);
            this.AddMeta(CommonGlobal.Description, App_GlobalResources.Lang.mnuContact);

            contact_content = GeneralModels.GetContent(CommonGlobal.Contact, this.Lang);

            return this.PartialView("../page/contact");
        }

        /// <summary>
        /// Contents the specified identifier.
        /// </summary>
        /// <param name="id">The identifier.</param>
        /// <returns>the content</returns>
        public ActionResult Content(int id)
        {
            PageModels pageModels = new PageModels();
            var page_view = new Page_static_view();

            id = Convert.ToInt16(RouteData.Values["id"].ToString());
            page_view.C_pages = pageModels.GetbyID(id);

            string strBread;
            if (page_view.C_pages.Title != string.Empty)
            {
                ViewBag.Title = page_view.C_pages.Title + " | " + GeneralModels.GetContent(CommonGlobal.PageName, this.Lang);
                strBread = "<li>" + page_view.C_pages.Title + "</li>";
            }
            else
            {
                ViewBag.Title = page_view.C_pages.PageName + " | " + GeneralModels.GetContent(CommonGlobal.PageName, this.Lang);
                strBread = "<li>" + page_view.C_pages.PageName + "</li>";
            }

            this.AddMeta(CommonGlobal.Keyword, page_view.C_pages.Keyword);
            this.AddMeta(CommonGlobal.Description, page_view.C_pages.Description);
            page_view.Str_breadcrumbs = strBread;

            return this.PartialView("../page/content", page_view);
        }

        /// <summary>
        /// Indexes this instance.
        /// </summary>
        /// <returns>the index</returns>
        public ActionResult Index()
        {
            ViewBag.Title = GeneralModels.GetContent(CommonGlobal.PageName, this.Lang);
            this.AddMeta(CommonGlobal.Keyword, GeneralModels.GetContent(CommonGlobal.Keyword, this.Lang));
            this.AddMeta(CommonGlobal.Description, GeneralModels.GetContent(CommonGlobal.Description, this.Lang));
            WebInfoModels web_infor = new Models.WebInfoModels();
            ViewBag.slogan = GeneralModels.GetContent(CommonGlobal.Slogan, this.Lang);

            return this.PartialView("../page/index");
        }
    }
}