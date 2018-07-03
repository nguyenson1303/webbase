namespace Web.Controllers
{
    using System.Collections.Generic;
    using System.Linq;
    using System.Text;
    using System.Web;
    using System.Web.Mvc;
    using System.Web.Script.Serialization;
    using Web.Data;
    using Web.Models;
    using Web.ViewModels;
    using Web.App_GlobalResources;
    using System;

    /// <summary>
    /// control Controller
    /// </summary>
    /// <seealso cref="Web.Controllers.BaseController" />
    public class ControlController : BaseController
    {
        /// <summary>
        /// About the short.
        /// </summary>
        /// <returns>about short</returns>
        [ChildActionOnly]
        public ActionResult About_short()
        {
            GeneralModels generalModels = new GeneralModels();
            if (string.IsNullOrEmpty(this.Lang))
            {
                this.Lang = LanguageModels.ActiveLanguage().LangCultureName;
            }

            var about = generalModels.GetGeneral(CommonGlobal.AcountShort, Lang);

            return this.PartialView("../control/about_short", about.GeneralContent);
        }

        /// <summary>
        /// Adds to rating.
        /// </summary>
        /// <param name="item_id">The item identifier.</param>
        /// <param name="rating">The rating.</param>
        /// <param name="name">The name.</param>
        /// <param name="email">The email.</param>
        /// <param name="contents">The contents.</param>
        /// <param name="code">The code.</param>
        /// <returns>add to rating</returns>
        public ActionResult Add_to_rating(int item_id, int rating, string name, string email, string contents, string code)
        {
            var rate = new C_Rating();
            var lst = new List<C_Rating>();
            RatingModels ratingModels = new RatingModels();
            ProductModels proModels = new ProductModels();
            var ip = Request.UserHostAddress;
            if (HttpContext.Session["captchastring"] != null && HttpUtility.HtmlDecode(code) == HttpContext.Session["captchastring"].ToString())
            {
                if (item_id > 0 && rating > 0)
                {
                    rate.itemId = item_id;
                    rate.Rating = rating;
                    rate.ip = ip;
                    rate.name = name;
                    rate.email = email;
                    rate.contents = contents;
                }
            }

            if (rate != null)
            {
                ratingModels.Add(rate);
                ////Update rating value to item_id
                int ratingSum = ratingModels.GetRatingSumforItem(item_id);
                int ratingTotal = ratingModels.GetRatingTotalforItem(item_id);
                var start_no = ratingTotal != 0 ? (ratingSum / ratingTotal) : 0;
                proModels.UpdateRatingProduct(item_id, start_no);
            }

            lst = ratingModels.GetListRatingByItem(item_id);
            var jsonSerialiser = new JavaScriptSerializer();
            var results = jsonSerialiser.Serialize(lst);

            return this.Json(results);
        }

        /// <summary>
        /// Ad the bottom.
        /// </summary>
        /// <returns>ad bottom</returns>
        [ChildActionOnly]
        public ActionResult Ad_bottom()
        {
            var ad_bottom = GeneralModels.GetContent(CommonGlobal.AdBottom, LanguageModels.ActiveLanguage().LangCultureName);

            return this.PartialView("../control/adv_bottom", ad_bottom);
        }

        /// <summary>
        /// Ad the bottom left.
        /// </summary>
        /// <returns>ad bottom left</returns>
        [ChildActionOnly]
        public ActionResult Ad_bottom_left()
        {
            var ad_bottom = GeneralModels.GetContent(CommonGlobal.AdBottomLeft, LanguageModels.ActiveLanguage().LangCultureName);

            return this.PartialView("../control/adv_bottom_left", ad_bottom);
        }

        /// <summary>
        /// Ad the left.
        /// </summary>
        /// <returns>Ad left</returns>
        [ChildActionOnly]
        public ActionResult Ad_left()
        {
            var ad_left = GeneralModels.GetContent(CommonGlobal.AdLeft, LanguageModels.ActiveLanguage().LangCultureName);

            return this.PartialView("../control/adv_left", ad_left);
        }

        /// <summary>
        /// Ad the middle.
        /// </summary>
        /// <returns>ad middle</returns>
        [ChildActionOnly]
        public ActionResult Ad_middle()
        {
            var ad_middle = GeneralModels.GetContent(CommonGlobal.AdMiddle, LanguageModels.ActiveLanguage().LangCultureName);

            return this.PartialView("../control/adv_middle", ad_middle);
        }

        /// <summary>
        /// Ad the right.
        /// </summary>
        /// <returns>ad right</returns>
        [ChildActionOnly]
        public ActionResult Ad_right()
        {
            var ad_right = GeneralModels.GetContent(CommonGlobal.AdRight, LanguageModels.ActiveLanguage().LangCultureName);

            return this.PartialView("../control/adv_right", ad_right);
        }

        /// <summary>
        /// Ad the top.
        /// </summary>
        /// <returns>ad top</returns>
        [ChildActionOnly]
        public ActionResult Ad_top()
        {
            var ad_top = GeneralModels.GetContent(CommonGlobal.AdTop, LanguageModels.ActiveLanguage().LangCultureName);

            return this.PartialView("../control/ad_top", ad_top);
        }

        /// <summary>
        /// Brands the specified language.
        /// </summary>
        /// <param name="lang">The language.</param>
        /// <param name="manufacture">The manufacture.</param>
        /// <returns>the brand</returns>
        [ChildActionOnly]
        public ActionResult Brand(string lang, string manufacture)
        {
            LinkModels linkModel = new LinkModels();
            StringBuilder strMn = new StringBuilder();
            var class_act = "active";
            var currentAction = HttpContext.Request.RequestContext.RouteData.Values["action"].ToString();
            var currentController = HttpContext.Request.RequestContext.RouteData.Values["controller"].ToString();
            List<C_Link> list_select_brand = new List<C_Link>();

            if (string.IsNullOrEmpty(lang))
            {
                lang = LanguageModels.ActiveLanguage().LangCultureName;
            }

            list_select_brand = linkModel.List_brand_full(string.Empty, CommonGlobal.Partner, lang);

            foreach (var it in list_select_brand)
            {
                strMn.Append("<div class=\"item\">");
                strMn.Append("<a href=\"" + Url.RouteUrl("Default_Link", new { controller = "product", action = "products", manufacture = it.Title }) + "\" class=\" " + this.IsActive("products", "product", currentAction, currentController, it.Title, manufacture, class_act) + "\" >");
                strMn.Append("   <img class=\"lazyOwl\" data-src=\"" + it.ImagePath + "\" src=\"" + it.ImagePath + "\" alt=\"full\" />");
                strMn.Append("</a>");
                strMn.Append("</div>");
            }

            ViewBag.cate_type_text = App_GlobalResources.Lang.strBrand;

            return this.PartialView("../control/brand", strMn.ToString());
        }

        /// <summary>
        /// Breadcrumbs the specified string breadcrumbs.
        /// </summary>
        /// <param name="str_breadcrumbs">The string breadcrumbs.</param>
        /// <returns>the breadcrumbs</returns>
        [ChildActionOnly]
        public ActionResult Breadcrumbs(string str_breadcrumbs)
        {
            ViewBag.str_breadcrumbs = str_breadcrumbs;

            return this.PartialView("../control/breadcrumbs");
        }

        /// <summary>
        /// Changes the language.
        /// </summary>
        /// <param name="lang">The language.</param>
        /// <returns>Change Language</returns>
        public ActionResult ChangeLanguage(string lang)
        {
            new LanguageModels().SetLanguage(lang);

            return this.RedirectToAction("index", "home", new { lang = lang });
        }

        /// <summary>
        /// Chats the facebook.
        /// </summary>
        /// <returns>chat facebook</returns>
        [ChildActionOnly]
        public ActionResult Chat_facebook()
        {
            WebInfoModels web_infor = new Models.WebInfoModels();
            ViewBag.hotline = web_infor.GetContent(CommonGlobal.Hotline);
            ViewBag.email = web_infor.GetContent(CommonGlobal.Email);
            ViewBag.address = GeneralModels.GetContent(CommonGlobal.Address, this.Lang);
            ViewBag.slogan = GeneralModels.GetContent(CommonGlobal.Slogan, this.Lang);
            ViewBag.facebook = web_infor.GetContent(CommonGlobal.Facebook);
            ViewBag.ImageMap = web_infor.GetContent(CommonGlobal.ImageMap);

            return this.PartialView("../control/chat_facebook");
        }

        /// <summary>
        /// Comments the facebook.
        /// </summary>
        /// <param name="url">The URL.</param>
        /// <returns>comment facebook</returns>
        [ChildActionOnly]
        public ActionResult Comment_facebook(string url)
        {
            ViewBag.url = url;

            return this.PartialView("../control/comment_facebook");
        }

        /// <summary>
        /// Contacts the form.
        /// </summary>
        /// <returns>contact form</returns>
        [ChildActionOnly]
        [AcceptVerbs(HttpVerbs.Get)]
        public ActionResult Contact_form()
        {
            var contact_view = new Contact_register_view();
            WebInfoModels web_infor = new Models.WebInfoModels();
            ViewBag.hotline = web_infor.GetContent(CommonGlobal.Hotline);
            ViewBag.email = web_infor.GetContent(CommonGlobal.Email);
            ViewBag.address = GeneralModels.GetContent(CommonGlobal.Address, this.Lang);
            ViewBag.slogan = web_infor.GetContent(CommonGlobal.Support);

            contact_view.ParentAction = HttpContext.Request.RequestContext.RouteData.Values["action"].ToString();
            contact_view.ParentController = HttpContext.Request.RequestContext.RouteData.Values["controller"].ToString();
            contact_view.Message = App_GlobalResources.Lang.strMessageContactForm;
            contact_view.ContactContents = GeneralModels.GetContent(CommonGlobal.ContactDetail, LanguageModels.ActiveLanguage().LangCultureName);

            return this.PartialView("../control/contact_form", contact_view);
        }

        /// <summary>
        /// Contacts the form.
        /// </summary>
        /// <param name="collection">The collection.</param>
        /// <returns>contact form</returns>
        [ChildActionOnly]
        [AcceptVerbs(HttpVerbs.Post)]
        public ActionResult Contact_form(FormCollection collection)
        {
            ContactModels contactModels = new ContactModels();
            var contact_view = new Contact_register_view();
            this.TryUpdateModel(contact_view);
            contact_view.ParentAction = HttpContext.Request.RequestContext.RouteData.Values["action"].ToString();
            contact_view.ParentController = HttpContext.Request.RequestContext.RouteData.Values["controller"].ToString();
            contact_view.ContactContents = GeneralModels.GetContent(CommonGlobal.ContactDetail, LanguageModels.ActiveLanguage().LangCultureName);
            bool rt = false;

            if (HttpContext.Session["captchastring"] == null && HttpUtility.HtmlDecode(contact_view.Code) != HttpContext.Session["captchastring"].ToString())
            {
                contact_view.Message = App_GlobalResources.Lang.messCaptcha;

                return this.PartialView("../control/contact_form", contact_view);
            }
            else
            {
                if (string.IsNullOrEmpty(contact_view.Name) || string.IsNullOrEmpty(contact_view.Email) || string.IsNullOrEmpty(contact_view.Phone) || string.IsNullOrEmpty(contact_view.Contents) || string.IsNullOrEmpty(contact_view.Address))
                {
                    contact_view.Message = App_GlobalResources.Lang.strMessageContactForm;

                    return this.PartialView("../control/contact_form", contact_view);
                }
                else
                {
                    C_Contact it = new C_Contact();
                    it.name = contact_view.Name;
                    it.email = contact_view.Email;
                    it.address = contact_view.Address;
                    it.contents = contact_view.Contents;
                    it.phone = contact_view.Phone;

                    rt = contactModels.Add(it);
                    if (rt)
                    {
                        contact_view.Message = App_GlobalResources.Lang.strMessageContactSend;

                        return this.PartialView("../control/contact_form", contact_view);
                    }
                    else
                    {
                        contact_view.Message = App_GlobalResources.Lang.strMessageContactForm;

                        return this.PartialView("../control/contact_form", contact_view);
                    }
                }
            }
        }

        /// <summary>
        /// Contacts the map.
        /// </summary>
        /// <returns>contact map</returns>
        [ChildActionOnly]
        public ActionResult Contact_map()
        {
            WebInfoModels web_infor = new Models.WebInfoModels();
            var contact_map = new Contact_map_view();
            contact_map.Address = GeneralModels.GetContent(CommonGlobal.Address, this.Lang);
            contact_map.Latitude = web_infor.GetContent(CommonGlobal.Latitude);
            contact_map.Longitude = web_infor.GetContent(CommonGlobal.Longitude);
            contact_map.Images = web_infor.GetContent(CommonGlobal.ImageMap) ?? "/images/placemark.png";
            contact_map.Title = GeneralModels.GetContent(CommonGlobal.PageName, this.Lang);

            ViewBag.contactdetail = GeneralModels.GetContent(CommonGlobal.ContactDetail, this.Lang);

            return this.PartialView("../control/contact_map", contact_map);
        }

        /// <summary>
        /// Emails the marketing.
        /// </summary>
        /// <param name="email">The email.</param>
        /// <returns>email marketing</returns>
        public ActionResult Email_marketing(string email, string name, string address, string phone, string note)
        {
            EmailModels emailModels = new EmailModels();
            if (emailModels.GetEmail(name, phone) == null)
            {
                C_Email objEmail = new C_Email();
                objEmail.name = name;
                objEmail.email = email;
                objEmail.phone = phone;
                objEmail.address = address;
                objEmail.note = note;
                objEmail.createdate = DateTime.Now;
                emailModels.Add_Email(objEmail);

                return this.Json(1);
            }
            else
            {
                return this.Json(0);
            }
        }

        /// <summary>
        /// Emails the view.
        /// </summary>
        /// <param name="collection">The collection.</param>
        /// <returns>email view</returns>
        [ChildActionOnly]
        [AcceptVerbs(HttpVerbs.Post)]
        public ActionResult Email_view(FormCollection collection)
        {
            ContactModels contactModels = new ContactModels();
            var contact_view = new Contact_register_view();
            this.TryUpdateModel(contact_view);
            contact_view.ParentAction = HttpContext.Request.RequestContext.RouteData.Values["action"].ToString();
            contact_view.ParentController = HttpContext.Request.RequestContext.RouteData.Values["controller"].ToString();
            contact_view.ContactContents = GeneralModels.GetContent(CommonGlobal.ContactDetail, LanguageModels.ActiveLanguage().LangCultureName);
            bool rt = false;

            if (HttpContext.Session["captchastring"] == null && HttpUtility.HtmlDecode(contact_view.Code) != HttpContext.Session["captchastring"].ToString())
            {
                contact_view.Message = App_GlobalResources.Lang.messCaptcha;

                return this.PartialView("../control/contact_form", contact_view);
            }
            else
            {
                if (string.IsNullOrEmpty(contact_view.Name) || string.IsNullOrEmpty(contact_view.Email) || string.IsNullOrEmpty(contact_view.Phone) || string.IsNullOrEmpty(contact_view.Contents) || string.IsNullOrEmpty(contact_view.Address))
                {
                    contact_view.Message = App_GlobalResources.Lang.strMessageContactForm;

                    return this.PartialView("../control/contact_form", contact_view);
                }
                else
                {
                    C_Contact it = new C_Contact();
                    it.name = contact_view.Name;
                    it.email = contact_view.Email;
                    it.address = contact_view.Address;
                    it.contents = contact_view.Contents;
                    it.phone = contact_view.Phone;

                    rt = contactModels.Add(it);

                    if (rt)
                    {
                        contact_view.Message = App_GlobalResources.Lang.strMessageContactSend;

                        return this.PartialView("../control/contact_form", contact_view);
                    }
                    else
                    {
                        contact_view.Message = App_GlobalResources.Lang.strMessageContactForm;

                        return this.PartialView("../control/contact_form", contact_view);
                    }
                }
            }
        }

        /// <summary>
        /// Footers this instance.
        /// </summary>
        /// <returns>the footer</returns>
        [ChildActionOnly]
        public ActionResult Footer()
        {
            var footer_view = new ViewModels.Footer_view();
            footer_view.Footer = GeneralModels.GetContent(CommonGlobal.PageFooter, this.Lang);
            footer_view.Footer1 = GeneralModels.GetContent(CommonGlobal.PageFooter1, this.Lang);
            footer_view.Footer2 = GeneralModels.GetContent(CommonGlobal.PageFooter2, this.Lang);
            footer_view.Footer3 = GeneralModels.GetContent(CommonGlobal.PageFooter3, this.Lang);
            footer_view.Footer4 = GeneralModels.GetContent(CommonGlobal.PageFooter4, this.Lang);
            footer_view.Footer5 = GeneralModels.GetContent(CommonGlobal.PageFooter5, this.Lang);

            WebInfoModels web_infor = new Models.WebInfoModels();
            ViewBag.hotline = web_infor.GetContent(CommonGlobal.Hotline);
            ViewBag.email = web_infor.GetContent(CommonGlobal.Email);
            ViewBag.address = GeneralModels.GetContent(CommonGlobal.Address, this.Lang);
            ViewBag.slogan = GeneralModels.GetContent(CommonGlobal.Slogan, this.Lang);
            ViewBag.facebook = web_infor.GetContent(CommonGlobal.Facebook);

            return this.PartialView("../control/footer", footer_view);
        }

        /// <summary>
        /// Gets the showroom.
        /// </summary>
        /// <param name="districtID">The district identifier.</param>
        /// <returns>get showroom</returns>
        public ActionResult Get_showroom(int districtID)
        {
            ShowroomModels showroomModels = new ShowroomModels();
            List<Showroom> lstShowroom = showroomModels.GetShowroomByDistrictID(districtID);

            return this.Json(lstShowroom);
        }

        /// <summary>
        /// Heads this instance.
        /// </summary>
        /// <returns>the head</returns>
        [ChildActionOnly]
        public ActionResult Head()
        {
            WebInfoModels web_infor = new Models.WebInfoModels();
            ViewBag.hotline = web_infor.GetContent(CommonGlobal.Hotline);
            ViewBag.email = web_infor.GetContent(CommonGlobal.Email);
            ViewBag.address = GeneralModels.GetContent(CommonGlobal.Address, this.Lang);
            ViewBag.slogan = GeneralModels.GetContent(CommonGlobal.Slogan, this.Lang);
            ViewBag.facebook = web_infor.GetContent(CommonGlobal.Facebook);
            ViewBag.ImageMap = web_infor.GetContent(CommonGlobal.ImageMap);

            return this.PartialView("../control/head");
        }

        /// <summary>
        /// Inputs the email.
        /// </summary>
        /// <returns>input email</returns>
        [ChildActionOnly]
        public ActionResult Input_email()
        {
            return this.PartialView("../control/input_email");
        }

        /// <summary>
        /// Lists the link.
        /// </summary>
        /// <param name="lang">The language.</param>
        /// <param name="type">The type.</param>
        /// <returns>list link</returns>
        [ChildActionOnly]
        public ActionResult List_link(string lang, string type)
        {
            LinkModels linkModel = new LinkModels();
            StringBuilder strMn = new StringBuilder();
            var currentAction = HttpContext.Request.RequestContext.RouteData.Values["action"].ToString();
            var currentController = HttpContext.Request.RequestContext.RouteData.Values["controller"].ToString();
            List<C_Link> list_select = new List<C_Link>();

            if (string.IsNullOrEmpty(lang))
            {
                lang = LanguageModels.ActiveLanguage().LangCultureName;
            }

            list_select = linkModel.GetByTypeTop(type, int.Parse(Util.GetConfigValue("NumberLink", "10")), lang);

            ViewBag.cate_type_text = App_GlobalResources.Lang.strLinkConnect;

            return this.PartialView("../control/list_link", list_select);
        }

        /// <summary>
        /// Loadings this instance.
        /// </summary>
        /// <returns>the loading</returns>
        [ChildActionOnly]
        public ActionResult Loading()
        {
            var test = "Đây là loading test";
            ViewBag.test = test;

            return this.PartialView("../control/loading");
        }

        /// <summary>
        /// Loads the district by city.
        /// </summary>
        /// <param name="cityID">The city identifier.</param>
        /// <returns>load district by city</returns>
        public ActionResult Load_district_by_city(string cityID)
        {
            List<District> lstDistrict = new List<District>();
            DistrictModels districtModels = new DistrictModels();
            if (cityID == null || cityID == "0")
            {
                lstDistrict = districtModels.AllDistrict();
            }
            else
            {
                ////Your Code For Getting Physicans Goes Here
                lstDistrict = districtModels.GetListDistrictByCityID(int.Parse(cityID));
            }

            SelectList obgDistrict = new SelectList(lstDistrict, "DistrictID", "DistrictName", 0);

            return this.Json(obgDistrict);
        }

        /// <summary>
        /// Menus the brand.
        /// </summary>
        /// <param name="lang">The language.</param>
        /// <param name="manufacture">The manufacture.</param>
        /// <returns>menu brand</returns>
        [ChildActionOnly]
        public ActionResult Menu_brand(string lang, string manufacture)
        {
            LinkModels linkModel = new LinkModels();
            StringBuilder strMn = new StringBuilder();
            var class_act = "active";
            var currentAction = HttpContext.Request.RequestContext.RouteData.Values["action"].ToString();
            var currentController = HttpContext.Request.RequestContext.RouteData.Values["controller"].ToString();
            List<SelectListItem> list_select_brand = new List<SelectListItem>();

            if (string.IsNullOrEmpty(lang))
            {
                lang = LanguageModels.ActiveLanguage().LangCultureName;
            }

            linkModel.List_brand(string.Empty, CommonGlobal.Partner, lang, ref list_select_brand);

            foreach (var it in list_select_brand)
            {
                strMn.Append("<li>");
                strMn.Append("<a href=\"" + Url.RouteUrl("_products_Link", new { controller = "product", action = "products", manufacture = it.Text }) + "\" class=\" " + this.IsActive("products", "product", currentAction, currentController, it.Text, manufacture, class_act) + "\" >");
                strMn.Append("   <span class=\"pull-right\">&nbsp;</span>" + it.Text);
                strMn.Append("</a>");
                strMn.Append("</li>");
            }

            ViewBag.cate_type_text = App_GlobalResources.Lang.strBrand;

            return this.PartialView("../control/menu_brand", strMn.ToString());
        }

        /// <summary>
        /// Menus the category.
        /// </summary>
        /// <param name="lang">The language.</param>
        /// <param name="cate_type">Type of the cate.</param>
        /// <param name="cate_id">The cate identifier.</param>
        /// <returns>menu category</returns>
        [ChildActionOnly]
        public ActionResult Menu_category(string lang, string cate_type, int? cate_id)
        {
            CatalogModels cateModels = new CatalogModels();
            StringBuilder strMn = new StringBuilder();
            var class_act = "current";
            var currentAction = HttpContext.Request.RequestContext.RouteData.Values["action"].ToString();
            var currentController = HttpContext.Request.RequestContext.RouteData.Values["controller"].ToString();

            if (string.IsNullOrEmpty(lang))
            {
                lang = LanguageModels.ActiveLanguage().LangCultureName;
            }

            List<C_Catalog> lst_parent = new List<C_Catalog>();
            lst_parent = cateModels.GetbyParentID(0, cate_type, lang).Where(p => p.Show == true).ToList();

            foreach (var it in lst_parent)
            {
                var lst_child = cateModels.GetbyParentID(it.CatalogID, cate_type, lang).Where(p => p.Show == true).ToList();
                if (lst_child.Count > 0)
                {
                    strMn.Append(string.Format("<li class=\"menu-item-has-children " + this.IsActive("products", "product", currentAction, currentController, (cate_id ?? 0).ToString(), it.CatalogID.ToString(), class_act) + "\">"));

                    ////strMn.Append(string.Format("<a href=\"javascript:;\" class=\"list-group-item " + IsActive("products", "product", currentAction, currentController, (cate_id ?? 0).ToString(), it.CatalogID.ToString(), class_act) + "\" data-toggle=\"collapse\" data-target=\"#{0}\" data-parent=\"#catalog-menu\">", it.CatalogID));
                    ////strMn.Append(" " + it.CategoryName);

                    ////strMn.Append("</a>");
                    if (cate_type == CommonGlobal.CateCollection)
                    {
                        strMn.Append(string.Format("<a href=\"" + Url.RouteUrl("_products_Link", new { controller = "product", action = "collection", id = it.CatalogID, Link = it.Link }) + "\" class=\" " + this.IsActive("products", "product", currentAction, currentController, (cate_id ?? 0).ToString(), it.CatalogID.ToString(), class_act) + "\"><i class=\"fa fa-angle-right\" aria-hidden=\"true\"></i>{0} </a>", it.CategoryName));
                    }
                    else if (cate_type == CommonGlobal.CateProduct)
                    {
                        strMn.Append(string.Format("<a href=\"" + Url.RouteUrl("_products_Link", new { controller = "product", action = "products", id = it.CatalogID, Link = it.Link }) + "\" class=\" " + this.IsActive("products", "product", currentAction, currentController, (cate_id ?? 0).ToString(), it.CatalogID.ToString(), class_act) + "\"><i class=\"fa fa-angle-right\" aria-hidden=\"true\"></i>{0} </a>", it.CategoryName));
                    }
                    else if (cate_type == CommonGlobal.CateNews)
                    {
                        strMn.Append(string.Format("<a href=\"" + Url.RouteUrl("_post", new { controller = "news", action = "posts", id = it.CatalogID, Link = it.Link }) + "\" class=\" " + this.IsActive("products", "product", currentAction, currentController, (cate_id ?? 0).ToString(), it.CatalogID.ToString(), class_act) + "\"><i class=\"fa fa-angle-right\" aria-hidden=\"true\"></i>{0} </a>", it.CategoryName));
                    }

                    strMn.Append(string.Format("<ul class='submenu' id=\"{0}\">", it.CatalogID));
                    strMn.Append(this.CreateSubMenuProduct(lst_child, cate_id, class_act, cate_type));
                    strMn.Append("</ul>");
                }
                else
                {
                    strMn.Append(string.Format("<li>"));

                    if (cate_type == CommonGlobal.CateCollection)
                    {
                        strMn.Append("<a href=\"" + Url.RouteUrl("_products_Link", new { controller = "product", action = "collection", id = it.CatalogID, Link = it.Link }) + "\" class=\" " + this.IsActive("products", "product", currentAction, currentController, (cate_id ?? 0).ToString(), it.CatalogID.ToString(), class_act) + "\" >");
                    }
                    else if (cate_type == CommonGlobal.CateProduct)
                    {
                        strMn.Append("<a href=\"" + Url.RouteUrl("_products_Link", new { controller = "product", action = "products", id = it.CatalogID, Link = it.Link }) + "\" class=\" " + this.IsActive("products", "product", currentAction, currentController, (cate_id ?? 0).ToString(), it.CatalogID.ToString(), class_act) + "\" >");
                    }
                    else if (cate_type == CommonGlobal.CateNews)
                    {
                        strMn.Append("<a href=\"" + Url.RouteUrl("_post", new { controller = "news", action = "posts", id = it.CatalogID, Link = it.Link }) + "\" class=\" " + this.IsActive("products", "product", currentAction, currentController, (cate_id ?? 0).ToString(), it.CatalogID.ToString(), class_act) + "\" >");
                    }

                    strMn.Append("<i class=\"fa fa-angle-right\" aria-hidden=\"true\"></i> " + it.CategoryName);
                    strMn.Append("</a>");
                    strMn.Append("</li>");
                }
            }

            if (cate_type == CommonGlobal.CateCollection)
            {
                ViewBag.cate_type_text = App_GlobalResources.Lang.strCollection;
            }
            else if (cate_type == CommonGlobal.CateProduct)
            {
                ViewBag.cate_type_text = App_GlobalResources.Lang.strProduct;
            }
            else if (cate_type == CommonGlobal.CateNews)
            {
                ViewBag.cate_type_text = App_GlobalResources.Lang.strPost;
            }
            else
            {
                ViewBag.cate_type_text = App_GlobalResources.Lang.strProduct;
            }

            return this.PartialView("../control/menu_category", strMn.ToString());
        }

        /// <summary>
        /// Menus the main.
        /// </summary>
        /// <returns>menu main</returns>
        [ChildActionOnly]
        public ActionResult Menu_main()
        {
            PageModels pageModels = new PageModels();
            CatalogModels cateModels = new CatalogModels();

            var menu_main_view = new ViewModels.Menu_main_view();
            var class_act = "active";

            menu_main_view.CurrentAction = HttpContext.Request.RequestContext.RouteData.Values["action"].ToString();
            menu_main_view.CurrentController = HttpContext.Request.RequestContext.RouteData.Values["controller"].ToString();
            menu_main_view.CurrentId = RouteData.Values["id"] != null ? RouteData.Values["id"].ToString() : "0";

            var lst_page_static = pageModels.GetAllPageStatic(LanguageModels.ActiveLanguage().LangCultureName);
            var lst_collection_parent = cateModels.GetMenubyParentID(0, CommonGlobal.CateCollection, LanguageModels.ActiveLanguage().LangCultureName);
            var lst_product_parent = cateModels.GetMenubyParentID(0, CommonGlobal.CateProduct, LanguageModels.ActiveLanguage().LangCultureName);
            var lst_post_parent = cateModels.GetbyParentID(0, CommonGlobal.CateNews, LanguageModels.ActiveLanguage().LangCultureName);

            StringBuilder strMn1 = new StringBuilder();
            strMn1.Append("<li class=\"panel\"><a class=\"titlelv1 " + IsActive("index", "home", menu_main_view.CurrentAction, menu_main_view.CurrentController, class_act) + "\" href=\"" + Url.Action("index", "home") + "\">" + App_GlobalResources.Lang.mnuHome + "</a></li>");

            strMn1.Append("<li class=\"panel\"><a class=\"titlelv1 " + IsActive("about", "home", menu_main_view.CurrentAction, menu_main_view.CurrentController, class_act) + "\" href=\"" + Url.Action("about", "home") + "\">" + App_GlobalResources.Lang.mnuAbout + "</a><a class=\"caretlv1\" data-toggle=\"collapse\" href=\"#dropdown-lvl1\"><span class=\"caret\"></span></a>");
            strMn1.Append("<div id=\"dropdown-lvl1\" class=\"panel-collapse collapse\"><div class=\"panel-body\"><ul class=\"nav navbar-nav\">");
            if (lst_page_static != null && lst_page_static.Count > 0)
            {
                foreach (var it in lst_page_static)
                {
                    strMn1.Append("<li><a class=\"titlelv1\" href=\"" + Url.RouteUrl("_content", new { controller = "home", action = "content", id = it.PageID, Link = it.Link }) + "\">" + it.PageName + "</a></li>");
                }
            }
            strMn1.Append("</ul></div></div>");
            strMn1.Append("</li>");

            strMn1.Append("<li class=\"panel\"><a class=\"titlelv1 " + IsActive("products", "product", menu_main_view.CurrentAction, menu_main_view.CurrentController, class_act) + "\" href=\"" + Url.RouteUrl("_product_only", new { controller = "product", action = "products" }) + "\">" + App_GlobalResources.Lang.mnuProduct + "</a><a class=\"caretlv1\" data-toggle=\"collapse\" href=\"#dropdown-lvl2\"><span class=\"caret\"></span></a>");
            strMn1.Append("<div id=\"dropdown-lvl2\" class=\"panel-collapse collapse\"><div class=\"panel-body\"><ul class=\"nav navbar-nav\">");
            if (lst_product_parent != null && lst_product_parent.Count > 0)
            {
                foreach (var it in lst_product_parent)
                {
                    var lst_product_child = cateModels.GetMenubyParentID(it.CatalogID, CommonGlobal.CateProduct, LanguageModels.ActiveLanguage().LangCultureName);
                    if (lst_product_child != null && lst_product_child.Count > 0)
                    {
                        strMn1.Append("<li class=\"panel\"><a class=\"titlelv1\" href=\"" + Url.RouteUrl("_products_Link", new { controller = "product", action = "products", id = it.CatalogID, Link = it.Link }) + "\">" + it.CategoryName + "</a><a class=\"caretlv1\" data-toggle=\"collapse\" href=\"#dropdown-lvl3\"><span class=\"caret\"></span></a>");
                        strMn1.Append("<div id=\"dropdown-lvl3\" class=\"panel-collapse collapse\"><div class=\"panel-body\"><ul class=\"nav navbar-nav\">");
                        foreach (var its in lst_product_child)
                        {
                            strMn1.Append("<li><a class=\"titlelv1\" href=\"" + Url.RouteUrl("_products_Link", new { controller = "product", action = "products", id = its.CatalogID, Link = its.Link }) + "\">" + its.CategoryName + "</a></li>");
                        }
                        strMn1.Append("</ul></div></div>");
                        strMn1.Append("</li>");
                    }
                    else
                    {
                        strMn1.Append("<li><a class=\"titlelv1\" href=\"" + Url.RouteUrl("_products_Link", new { controller = "product", action = "products", id = it.CatalogID, Link = it.Link }) + "\">" + it.CategoryName + "</a></li>");
                    }

                }
            }
            strMn1.Append("</ul></div></div>");
            strMn1.Append("</li>");

            //if (lst_post_parent != null && lst_post_parent.Count > 0)
            //{
            //    if (lst_post_parent[2].CategoryName == App_GlobalResources.Lang.mnuRecruitment && lst_post_parent[2].CatalogID == int.Parse(menu_main_view.CurrentId))
            //    {
            //        strMn1.Append("<li class=\"panel\"><a class=\"titlelv1 " + IsActive("posts", "news", menu_main_view.CurrentAction, menu_main_view.CurrentController, lst_post_parent[2].CatalogID.ToString(), menu_main_view.CurrentId, class_act) + "\" href=\"" + Url.RouteUrl("_post", new { controller = "news", action = "posts", id = lst_post_parent[2].CatalogID, Link = lst_post_parent[2].Link }) + "\">" + lst_post_parent[2].CategoryName + "</a></li>");
            //        strMn1.Append("<li class=\"panel\"><a class=\"titlelv1\" href=\"" + Url.RouteUrl("_post_only", new { controller = "news", action = "posts" }) + "\">" + App_GlobalResources.Lang.mnuNews + "</a>");
            //    }
            //    else
            //    {
            //        strMn1.Append("<li class=\"panel\"><a class=\"titlelv1\" href=\"" + Url.RouteUrl("_post", new { controller = "news", action = "posts", id = lst_post_parent[2].CatalogID, Link = lst_post_parent[2].Link }) + "\">" + lst_post_parent[2].CategoryName + "</a></li>");
            //        strMn1.Append("<li class=\"panel\"><a class=\"titlelv1 " + IsActive("posts", "news", menu_main_view.CurrentAction, menu_main_view.CurrentController, class_act) + "\" href=\"" + Url.RouteUrl("_post_only", new { controller = "news", action = "posts" }) + "\">" + App_GlobalResources.Lang.mnuNews + "</a>");
            //    }
            //}
                        
            strMn1.Append("<li class=\"panel\"><a class=\"titlelv1 " + IsActive("posts", "news", menu_main_view.CurrentAction, menu_main_view.CurrentController, class_act) + "\" href=\"" + Url.RouteUrl("_post_only", new { controller = "news", action = "posts" }) + "\">" + App_GlobalResources.Lang.mnuNews + "</a>");

            //strMn1.Append("<li class=\"panel\"><a class=\"titlelv1 " + IsActive("contact", "home", menu_main_view.CurrentAction, menu_main_view.CurrentController, class_act) + "\" href=\"" + Url.Action("contact", "home") + "\">" + App_GlobalResources.Lang.mnuContact + "</a></li>");

            strMn1.Append("<li class=\"panel\"><a class=\"titlelv1 " + IsActive("lookbook", "gallery", menu_main_view.CurrentAction, menu_main_view.CurrentController, class_act) + "\" href=\"" + Url.RouteUrl("_lookbook_only", new { controller = "gallery", action = "lookbook" }) + "\">" + App_GlobalResources.Lang.mnuGallery + "</a></li>");

            menu_main_view.StringMenuFull = strMn1.ToString();

            return this.PartialView("../control/menu_main", menu_main_view);
        }

        /// <summary>
        /// Menus the main for mobile.
        /// </summary>
        /// <returns>menu main</returns>
        [ChildActionOnly]
        public ActionResult Menu_main_mobile()
        {
            PageModels pageModels = new PageModels();
            CatalogModels cateModels = new CatalogModels();

            var menu_main_view = new ViewModels.Menu_main_view();
            var class_act = "active";

            menu_main_view.CurrentAction = HttpContext.Request.RequestContext.RouteData.Values["action"].ToString();
            menu_main_view.CurrentController = HttpContext.Request.RequestContext.RouteData.Values["controller"].ToString();
            menu_main_view.CurrentId = RouteData.Values["id"] != null ? RouteData.Values["id"].ToString() : "0";

            var lst_page_static = pageModels.GetAllPageStatic(LanguageModels.ActiveLanguage().LangCultureName);
            var lst_collection_parent = cateModels.GetMenubyParentID(0, CommonGlobal.CateCollection, LanguageModels.ActiveLanguage().LangCultureName);
            var lst_product_parent = cateModels.GetMenubyParentID(0, CommonGlobal.CateProduct, LanguageModels.ActiveLanguage().LangCultureName);
            var lst_post_parent = cateModels.GetbyParentID(0, CommonGlobal.CateNews, LanguageModels.ActiveLanguage().LangCultureName);

            StringBuilder strMn1 = new StringBuilder();
            strMn1.Append("<li><a class=\"" + IsActive("index", "home", menu_main_view.CurrentAction, menu_main_view.CurrentController, class_act) + "\" href=\"" + Url.Action("index", "home") + "\">" + App_GlobalResources.Lang.mnuHome + "</a></li>");

            strMn1.Append("<li class=\"has-sub\"><a class=\" " + IsActive("about", "home", menu_main_view.CurrentAction, menu_main_view.CurrentController, class_act) + "\" href=\"" + Url.Action("about", "home") + "\">" + App_GlobalResources.Lang.mnuAbout + "</a>");
            strMn1.Append("<ul class=\"sub-menu1 animated fadeIn\">");
            if (lst_page_static != null && lst_page_static.Count > 0)
            {
                foreach (var it in lst_page_static)
                {
                    strMn1.Append("<li><a href=\"" + Url.RouteUrl("_content", new { controller = "home", action = "content", id = it.PageID, Link = it.Link }) + "\">" + it.PageName + "</a></li>");
                }
            }
            strMn1.Append("</ul>");
            strMn1.Append("</li>");

            strMn1.Append("<li class=\"has-sub\"><a class=\"" + IsActive("products", "product", menu_main_view.CurrentAction, menu_main_view.CurrentController, class_act) + "\" href=\"" + Url.RouteUrl("_product_only", new { controller = "product", action = "products" }) + "\">" + App_GlobalResources.Lang.mnuProduct + "</a>");
            strMn1.Append("<ul class=\"sub-menu1 animated fadeIn\">");
            if (lst_product_parent != null && lst_product_parent.Count > 0)
            {
                foreach (var it in lst_product_parent)
                {
                    var lst_product_child = cateModels.GetMenubyParentID(it.CatalogID, CommonGlobal.CateProduct, LanguageModels.ActiveLanguage().LangCultureName);
                    if (lst_product_child != null && lst_product_child.Count > 0)
                    {
                        strMn1.Append("<li  class=\"menu-item-has-children \"><a href=\"" + Url.RouteUrl("_products_Link", new { controller = "product", action = "products", id = it.CatalogID, Link = it.Link }) + "\">" + it.CategoryName + "</a>");
                        strMn1.Append("<ul class=\"sub-menu\">");
                        foreach (var its in lst_product_child)
                        {
                            strMn1.Append("<li><a href=\"" + Url.RouteUrl("_products_Link", new { controller = "product", action = "products", id = its.CatalogID, Link = its.Link }) + "\">" + its.CategoryName + "</a></li>");
                        }
                        strMn1.Append("</ul>");
                        strMn1.Append("</li>");
                    }
                    else
                    {
                        strMn1.Append("<li><a href=\"" + Url.RouteUrl("_products_Link", new { controller = "product", action = "products", id = it.CatalogID, Link = it.Link }) + "\">" + it.CategoryName + "</a></li>");
                    }

                }
            }
            strMn1.Append("</ul>");
            strMn1.Append("</li>");

            //if (lst_post_parent != null && lst_post_parent.Count > 0)
            //{
            //    if (lst_post_parent[2].CategoryName == App_GlobalResources.Lang.mnuRecruitment && lst_post_parent[2].CatalogID == int.Parse(menu_main_view.CurrentId))
            //    {
            //        strMn1.Append("<li><a class=\"" + IsActive("posts", "news", menu_main_view.CurrentAction, menu_main_view.CurrentController, lst_post_parent[2].CatalogID.ToString(), menu_main_view.CurrentId, class_act) + "\" href=\"" + Url.RouteUrl("_post", new { controller = "news", action = "posts", id = lst_post_parent[2].CatalogID, Link = lst_post_parent[2].Link }) + "\">" + lst_post_parent[2].CategoryName + "</a></li>");
            //        strMn1.Append("<li class=\"menu-item-has-children \"><a href=\"" + Url.RouteUrl("_post_only", new { controller = "news", action = "posts" }) + "\">" + App_GlobalResources.Lang.mnuNews + "</a>");
            //    }
            //    else
            //    {
            //        strMn1.Append("<li><a href=\"" + Url.RouteUrl("_post", new { controller = "news", action = "posts", id = lst_post_parent[2].CatalogID, Link = lst_post_parent[2].Link }) + "\">" + lst_post_parent[2].CategoryName + "</a></li>");
            //        strMn1.Append("<li class=\"menu-item-has-children \"><a class=\"" + IsActive("posts", "news", menu_main_view.CurrentAction, menu_main_view.CurrentController, class_act) + "\" href=\"" + Url.RouteUrl("_post_only", new { controller = "news", action = "posts" }) + "\">" + App_GlobalResources.Lang.mnuNews + "</a>");
            //    }
            //}
                        
            strMn1.Append("<li class=\"menu-item-has-children \"><a class=\"" + IsActive("posts", "news", menu_main_view.CurrentAction, menu_main_view.CurrentController, class_act) + "\" href=\"" + Url.RouteUrl("_post_only", new { controller = "news", action = "posts" }) + "\">" + App_GlobalResources.Lang.mnuNews + "</a>");

            //strMn1.Append("<li><a class=\" " + IsActive("contact", "home", menu_main_view.CurrentAction, menu_main_view.CurrentController, class_act) + "\" href=\"" + Url.Action("contact", "home") + "\">" + App_GlobalResources.Lang.mnuContact + "</a></li>");

            strMn1.Append("<li><a class=\" " + IsActive("lookbook", "gallery", menu_main_view.CurrentAction, menu_main_view.CurrentController, class_act) + "\" href=\"" + Url.RouteUrl("_lookbook_only", new { controller = "gallery", action = "lookbook" }) + "\">" + App_GlobalResources.Lang.mnuGallery + "</a></li>");

            menu_main_view.StringMenuFull = strMn1.ToString();

            return this.PartialView("../control/menu_main_mobile", menu_main_view);
        }

        /// <summary>
        /// Menus the page static.
        /// </summary>
        /// <returns>menu page static</returns>
        [ChildActionOnly]
        public ActionResult Menu_page_static()
        {
            PageModels pageModels = new PageModels();
            StringBuilder strMn1 = new StringBuilder();
            var lst_page_static = pageModels.GetAllPageStatic(LanguageModels.ActiveLanguage().LangCultureName);
            if (lst_page_static != null && lst_page_static.Count > 0)
            {
                foreach (var it in lst_page_static)
                {
                    strMn1.Append("<a href=\"" + Url.RouteUrl("_content", new { controller = "home", action = "content", id = it.PageID, Link = it.Link }) + "\" class=\"list-group-item\">" + it.PageName + "</a>");
                }
            }

            return this.PartialView("../control/menu_page_static", strMn1.ToString());
        }

        /// <summary>
        /// Panel tool this instance.
        /// </summary>
        /// <returns>Panel tool</returns>
        [ChildActionOnly]
        public ActionResult Paneltool()
        {
            WebInfoModels web_infor = new Models.WebInfoModels();
            ViewBag.hotline = web_infor.GetContent(CommonGlobal.Hotline);
            ViewBag.email = web_infor.GetContent(CommonGlobal.Email);
            ViewBag.address = GeneralModels.GetContent(CommonGlobal.Address, this.Lang);
            ViewBag.slogan = web_infor.GetContent(CommonGlobal.Support);
            ViewBag.facebook = web_infor.GetContent(CommonGlobal.Facebook);

            return this.PartialView("../control/paneltool");
        }

        /// <summary>
        /// Searches the box.
        /// </summary>
        /// <param name="search">The search.</param>
        /// <returns>search box</returns>
        [ChildActionOnly]
        public ActionResult Search_box(string search, string typekey)
        {
            ViewBag.key = CommonGlobal.RemoveSpecialWord(search);
            ViewBag.typekey = CommonGlobal.RemoveSpecialWord(typekey);
            ViewBag.ListTypeKey = BuildSelectFilterProduct(typekey);
            return this.PartialView("../control/search_box");
        }

        /// <summary>
        /// Gets the order process select.
        /// </summary>
        /// <param name="selectedValue">The selected value.</param>
        /// <returns>Get Order Process Select</returns>
        public List<SelectListItem> BuildSelectFilterProduct(string selectedValue)
        {
            List<SelectListItem> sizeDrop = new List<SelectListItem>();
            sizeDrop.AddRange(new SelectListItem[]
            {
                new SelectListItem { Selected = selectedValue == "ProductName" ? true : false, Text = "Nhan đề", Value = "ProductName" },
                new SelectListItem { Selected = selectedValue == "DocAuthor" ? true : false, Text = "Tác giả cá nhân", Value = "DocAuthor" },
                new SelectListItem { Selected = selectedValue == "DocAuthorGroup" ? true : false, Text = "Tác giả tập thể", Value = "DocAuthorGroup" },
                new SelectListItem { Selected = selectedValue == "DocChuBien" ? true : false, Text = "Người chủ biên", Value = "DocChuBien" },
                new SelectListItem { Selected = selectedValue == "DocBienSoan" ? true : false, Text = "Người biên soạn", Value = "DocBienSoan" },
                new SelectListItem { Selected = selectedValue == "DocNguoiDich" ? true : false, Text = "Người dịch", Value = "DocNguoiDich" },
                new SelectListItem { Selected = selectedValue == "DocHieuDinh" ? true : false, Text = "Người hiệu đính", Value = "DocHieuDinh" },
                new SelectListItem { Selected = selectedValue == "DocDiaChiXuatBan" ? true : false, Text = "Địa chỉ nơi xuất bản", Value = "DocDiaChiXuatBan" },
                new SelectListItem { Selected = selectedValue == "DocNhaXuatBan" ? true : false, Text = "Nhà xuất bản", Value = "DocNhaXuatBan" },
                new SelectListItem { Selected = selectedValue == "DocNamXuatBan" ? true : false, Text = "Năm xuất bản", Value = "DocNamXuatBan" },
                new SelectListItem { Selected = selectedValue == "DocLanXuatBan" ? true : false, Text = "Lần xuất bản", Value = "DocLanXuatBan" },
                new SelectListItem { Selected = selectedValue == "DocTenTap" ? true : false, Text = "Tên tập", Value = "DocTenTap" },
                new SelectListItem { Selected = selectedValue == "DocSoLanPhanLoai" ? true : false, Text = "Số lần phân loại", Value = "DocSoLanPhanLoai" },
                new SelectListItem { Selected = selectedValue == "DocDiaChiTaiLieu" ? true : false, Text = "Địa chỉ tài liệu", Value = "DocDiaChiTaiLieu" },
                new SelectListItem { Selected = selectedValue == "DocTomTat" ? true : false, Text = "Nội dung tóm tắt", Value = "DocTomTat" }
            });
            return sizeDrop;
        }

        /// <summary>
        /// Showrooms this instance.
        /// </summary>
        /// <returns>the showroom</returns>
        [ChildActionOnly]
        [AcceptVerbs(HttpVerbs.Get)]
        public ActionResult Showroom()
        {
            ShowroomModels showroomModels = new ShowroomModels();
            CityModels cityModels = new CityModels();
            DistrictModels districtModels = new DistrictModels();
            var showroom_view = new Showroom_view();

            List<SelectListItem> lstCity = cityModels.List_city_not_all(0);
            showroom_view.List_city = lstCity;
            showroom_view.List_district = districtModels.List_district_not_all(int.Parse(lstCity.FirstOrDefault().Value), 0);

            WebInfoModels web_infor = new Models.WebInfoModels();
            showroom_view.Address = GeneralModels.GetContent(CommonGlobal.Address, this.Lang);
            showroom_view.Latitude = web_infor.GetContent(CommonGlobal.Latitude);
            showroom_view.Longitude = web_infor.GetContent(CommonGlobal.Longitude);
            showroom_view.Images = web_infor.GetContent(CommonGlobal.ImageMap) ?? "/images/placemark.png";
            showroom_view.Title = GeneralModels.GetContent(CommonGlobal.PageName, this.Lang);

            return this.PartialView("../control/showroom", showroom_view);
        }

        /// <summary>
        /// Slides this instance.
        /// </summary>
        /// <returns>the slide</returns>
        [ChildActionOnly]
        public ActionResult Slide()
        {
            var slide_view = new ViewModels.Slide_view();
            var obj = new LinkModels();
            var lst = obj.GetByTypeTop(CommonGlobal.Slide, CommonGlobal.SlideNumber, LanguageModels.ActiveLanguage().LangCultureName);
            var lst_background = obj.GetByTypeTop(CommonGlobal.SlideBackground, CommonGlobal.SlideNumber, LanguageModels.ActiveLanguage().LangCultureName);
            ////StringBuilder str1 = new StringBuilder();
            ////StringBuilder str2 = new StringBuilder();
            ////if (lst!=null && lst.Count > 0)
            ////{
            ////    ////foreach (var it in lst)
            ////    for (int i = 0; i < lst.Count; i++)
            ////    {
            ////        var img_p = lst[i].ImagePath;
            ////        if (!string.IsNullOrEmpty(img_p))
            ////        {
            ////            if (img_p != "0")
            ////            {
            ////                img_p = img_p.Replace("sc_small_", "sc_full_");
            ////            }
            ////            else
            ////            {
            ////                img_p = "/images/noimage.jpg";
            ////            }
            ////        }
            ////        ////var img_p_bg = lst_background[i].ImagePath;
            ////        ////if (!string.IsNullOrEmpty(img_p))
            ////        ////{
            ////        ////    if (img_p_bg != "0")
            ////        ////    {
            ////        ////        img_p_bg = img_p_bg.Replace("sc_small_", "sc_full_");
            ////        ////    }
            ////        ////    else
            ////        ////    {
            ////        ////        img_p_bg = "/Content/themes/salon/wp-content/uploads/2014/10/hair_slider_full_bg.png";
            ////        ////    }
            ////        ////}

            ////        str1.Append(string.Format("<img src=\"{0}\" alt=\"full\" />", img_p));

            ////        str2.Append(string.Format(" <a data-slide-index=\"{0}\" href=\"#\"><img src=\"{1}\" alt=\"\" /></a> ",i, lst_background[i].ImagePath));

            ////    }
            ////}
            ////slide_view.slide_content1 = str1.ToString();
            ////slide_view.slide_content2 = str2.ToString();
            slide_view.List1 = lst;
            slide_view.List2 = lst_background;

            return this.PartialView("../control/slide", slide_view);
        }

        /// <summary>
        /// Slides the button.
        /// </summary>
        /// <returns>slide button</returns>
        [ChildActionOnly]
        public ActionResult Slide_button()
        {
            var slide_view = new ViewModels.Slide_view();
            var obj = new LinkModels();
            var lst_background = obj.GetByTypeTop(CommonGlobal.SlideBackground, CommonGlobal.SlideNumber, LanguageModels.ActiveLanguage().LangCultureName);

            slide_view.List2 = lst_background;

            return this.PartialView("../control/slide_button", slide_view);
        }

        /// <summary>
        /// Slides the product.
        /// </summary>
        /// <returns>slide product</returns>
        [ChildActionOnly]
        public ActionResult Slide_product()
        {
            var slide_view = new ViewModels.Slide_view();
            var obj = new LinkModels();
            var lst = obj.GetByTypeTop(CommonGlobal.AdFooter, CommonGlobal.SlideNumber, LanguageModels.ActiveLanguage().LangCultureName);
            StringBuilder str1 = new StringBuilder();
            if (lst != null && lst.Count > 0)
            {
                ////foreach (var it in lst)
                for (int i = 0; i < lst.Count; i++)
                {
                    var img_p = lst[i].ImagePath;
                    if (!string.IsNullOrEmpty(img_p))
                    {
                        if (img_p != "0")
                        {
                            img_p = img_p.Replace("sc_small_", "sc_full_");
                        }
                        else
                        {
                            img_p = "/images/noimage.jpg";
                        }
                    }

                    str1.Append(string.Format("<div class=\"item-slide\" data-background=\"{0}\" data-height=\"473\" data-tabletheight=\"473\" data-mobileheight=\"220\">", img_p));
                    str1.Append("    <div class=\"content-slide\">");
                    str1.Append(string.Format("        <span data-animate=\"fadeInDown\" class=\"caption subtitle\">{0}</span>", lst[i].Summary));
                    str1.Append(string.Format("        <h2 data-animate=\"bounceInLeft \" class=\"caption title\">{0}</h2>", lst[i].Title));
                    str1.Append(string.Format("        <a data-animate=\"fadeInDown\" class=\"caption link merriweather\" href=\"{0}\">{1}</a>", lst[i].Link, App_GlobalResources.Lang.linkDetail));
                    str1.Append("    </div>");
                    str1.Append("</div>");
                }
            }

            slide_view.Slide_content1 = str1.ToString();

            return this.PartialView("../control/slide_product", slide_view);
        }

        /// <summary>
        /// Socials this instance.
        /// </summary>
        /// <returns>the social</returns>
        [ChildActionOnly]
        public ActionResult Social()
        {
            WebInfoModels web_infor = new Models.WebInfoModels();
            ViewBag.facebook = web_infor.GetContent(CommonGlobal.Facebook);

            return this.PartialView("../control/social");
        }

        /// <summary>
        /// Testimonials this instance.
        /// </summary>
        /// <returns>the testimonials</returns>
        [ChildActionOnly]
        public ActionResult Testimonials()
        {
            string lang = LanguageModels.ActiveLanguage().LangCultureName;
            string type = CommonGlobal.Testimonials;
            LinkModels linkModel = new LinkModels();
            StringBuilder strMn = new StringBuilder();
            var currentAction = HttpContext.Request.RequestContext.RouteData.Values["action"].ToString();
            var currentController = HttpContext.Request.RequestContext.RouteData.Values["controller"].ToString();
            List<C_Link> list_select = new List<C_Link>();

            list_select = linkModel.GetByTypeTop(type, int.Parse(Util.GetConfigValue("NumberLink", "10")), lang);

            ViewBag.cate_type_text = App_GlobalResources.Lang.strLinkConnect;

            return this.PartialView("../control/testimonials", list_select);
        }

        /// <summary>
        /// You tube the chanel.
        /// </summary>
        /// <returns>you tube chanel</returns>
        [ChildActionOnly]
        public ActionResult Youtube_chanel()
        {
            return this.PartialView("../control/youtube_chanel");
        }

        /// <summary>
        /// Creates the sub menu product.
        /// </summary>
        /// <param name="lst">The LST.</param>
        /// <param name="cate_id">The cate identifier.</param>
        /// <param name="class_act">The class act.</param>
        /// <param name="cate_type">Type of the cate.</param>
        /// <returns>Create Sub Menu Product</returns>
        private string CreateSubMenuProduct(List<C_Catalog> lst, int? cate_id, string class_act, string cate_type)
        {
            StringBuilder str = new StringBuilder();
            var currentAction = HttpContext.Request.RequestContext.RouteData.Values["action"].ToString();
            var currentController = HttpContext.Request.RequestContext.RouteData.Values["controller"].ToString();
            if (lst.Count > 0)
            {
                foreach (var it in lst)
                {
                    if (cate_type == CommonGlobal.CateCollection)
                    {
                        str.Append(string.Format("<li><a href=\"" + Url.RouteUrl("_products_Link", new { controller = "product", action = "collection", id = it.CatalogID, Link = it.Link }) + "\" class=\" " + this.IsActive("products", "product", currentAction, currentController, (cate_id ?? 0).ToString(), it.CatalogID.ToString(), class_act) + "\"><i></i>{0} </a></li>", it.CategoryName));
                    }
                    else
                    {
                        str.Append(string.Format("<li><a href=\"" + Url.RouteUrl("_products_Link", new { controller = "product", action = "products", id = it.CatalogID, Link = it.Link }) + "\" class=\" " + this.IsActive("products", "product", currentAction, currentController, (cate_id ?? 0).ToString(), it.CatalogID.ToString(), class_act) + "\"><i></i>{0} </a></li>", it.CategoryName));
                    }
                }
            }

            return str.ToString();
        }
    }
}