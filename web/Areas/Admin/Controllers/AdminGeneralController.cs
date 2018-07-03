namespace Web.Areas.Admin.Controllers
{
    using System;
    using System.Text;
    using System.Web;
    using System.Web.Mvc;
    using Data;
    using Models;
    using Web.Controllers;
    using Web.Models;

    /// <summary>
    /// admin General Controller
    /// </summary>
    /// <seealso cref="Web.Controllers.BaseController" />
    public class AdminGeneralController : BaseController
    {
        /// <summary>
        /// Changes the general.
        /// </summary>
        /// <param name="type">The type.</param>
        /// <param name="act">The act.</param>
        /// <param name="ctrl">The control.</param>
        /// <param name="type_act">The type act.</param>
        /// <returns>
        /// Change general
        /// </returns>
        [ChildActionOnly]
        [AcceptVerbs(HttpVerbs.Get)]
        public ActionResult Change_general(string type, string act, string ctrl, string type_act)
        {
            var general_content_view = new Web.Areas.Admin.ViewModels.General_content_view();
            GeneralModels generalModels = new GeneralModels();
            C_General general = new C_General();
            if (string.IsNullOrEmpty(type))
            {
                type = Request.QueryString["type"] != null ? Request.QueryString["type"].ToString() : CommonGlobal.CateProduct;
            }

            if (string.IsNullOrEmpty(act))
            {
                act = Request.QueryString["act"] != null ? Request.QueryString["act"].ToString() : "general_content";
            }

            if (string.IsNullOrEmpty(ctrl))
            {
                ctrl = Request.QueryString["ctrl"] != null ? Request.QueryString["ctrl"].ToString() : "adminGeneral";
            }

            if (string.IsNullOrEmpty(type_act))
            {
                type_act = Request.QueryString["type_act"] != null ? Request.QueryString["type_act"].ToString() : CommonGlobal.Edit;
            }

            if (string.IsNullOrEmpty(this.Lang))
            {
                this.Lang = LanguageModels.ActiveLanguage().LangCultureName;
            }

            try
            {
                general = generalModels.GetGeneral(type, this.Lang);
                general_content_view.Id = general.GeneralID;
                general_content_view.GeneralName = general.GeneralName;
                general_content_view.General_name_text = CommonGlobal.GetLinkADTypeName(type);
                general_content_view.GeneralContent = general.GeneralContent;
                general_content_view.Lang = general.Lang;
                general_content_view.Show = general.Show ?? false;
                if (general.Show == true)
                {
                    general_content_view.Show = true;
                    general_content_view.IsShow_text = "checked='checked'";
                }
                else
                {
                    general_content_view.Show = false;
                    general_content_view.IsShow_text = string.Empty;
                }
                ////list language
                general_content_view.List_language = this.List_select_language(general.Lang);
            }
            catch (Exception)
            {
                general_content_view.Message = "Đã xảy ra lỗi trong quá trình lấy dữ liệu.";
            }

            general_content_view.Type = type;
            general_content_view.Type_act = type_act;
            ////Link tab
            StringBuilder sb = new StringBuilder();
            sb.Append("<li class=\"active\"><a href=\"#\"><span>" + CommonGlobal.GetLinkADTypeName(type) + "</span></a></li>");
            general_content_view.Html_link_tab = sb.ToString();

            ////action
            general_content_view.Act = act;
            general_content_view.Ctrl = ctrl;
            general_content_view.Parent_action = HttpContext.Request.RequestContext.RouteData.Values["action"].ToString();
            general_content_view.Parent_controller = HttpContext.Request.RequestContext.RouteData.Values["controller"].ToString();
            ////end action

            return this.PartialView("../control/change_general", general_content_view);
        }

        /// <summary>
        /// Changes the general.
        /// </summary>
        /// <param name="collection">The collection.</param>
        /// <returns>Change general</returns>
        [ChildActionOnly]
        [ValidateInput(false)]
        [AcceptVerbs(HttpVerbs.Post)]
        public ActionResult Change_general(FormCollection collection)
        {
            GeneralModels generalModels = new GeneralModels();
            C_General general = new C_General();
            var general_content_view = new Web.Areas.Admin.ViewModels.General_content_view();
            this.TryUpdateModel(general_content_view);
            bool is_valid = true;
            ////action
            general_content_view.Parent_action = HttpContext.Request.RequestContext.RouteData.Values["action"].ToString();
            general_content_view.Parent_controller = HttpContext.Request.RequestContext.RouteData.Values["controller"].ToString();
            ////end action

            ////Link tab
            StringBuilder sb = new StringBuilder();
            sb.Append("<li class=\"active\"><a href=\"#\"><span>" + CommonGlobal.GetLinkADTypeName(general_content_view.Type) + "</span></a></li>");
            general_content_view.Html_link_tab = sb.ToString();
            ////list language
            general_content_view.List_language = this.List_select_language(general_content_view.Lang);

            if (string.IsNullOrEmpty(general_content_view.GeneralContent))
            {
                is_valid = false;
                general_content_view.Message = "Bạn cần nhập nội dung";
            }

            if (!is_valid)
            {
                return this.PartialView("../control/change_general", general_content_view);
            }

            try
            {
                if (!string.IsNullOrEmpty(general_content_view.GeneralName))
                {
                    general = generalModels.GetGeneral(general_content_view.GeneralName, general_content_view.Lang);
                }

                general.Lang = general_content_view.Lang;
                general.GeneralContent = general_content_view.GeneralContent;
                general.Show = general_content_view.Show;
                if (general.Show == true)
                {
                    general_content_view.Show = true;
                    general_content_view.IsShow_text = "checked='checked'";
                }
                else
                {
                    general_content_view.Show = false;
                    general_content_view.IsShow_text = string.Empty;
                }

                generalModels.Update(general);
            }
            catch (Exception)
            {
                general_content_view.Message = "Đã xảy ra lỗi cập nhật dữ liệu.";
            }

            general_content_view.Message = "Cập nhật thành công.";

            return this.PartialView("../control/change_general", general_content_view);
        }

        /// <summary>
        /// Footers the specified act.
        /// </summary>
        /// <param name="act">The act.</param>
        /// <param name="ctrl">The control.</param>
        /// <param name="type_act">The type act.</param>
        /// <param name="type">The type.</param>
        /// <param name="lang">The language.</param>
        /// <returns>
        /// the footer
        /// </returns>
        [ChildActionOnly]
        [AcceptVerbs(HttpVerbs.Get)]
        public ActionResult Footer(string act, string ctrl, string type_act, string type, string lang)
        {
            var footer_view = new Web.Areas.Admin.ViewModels.Footer_view();
            WebInfoModels webInfoModels = new WebInfoModels();
            if (string.IsNullOrEmpty(act))
            {
                act = Request.QueryString["act"] != null ? Request.QueryString["act"].ToString() : "footer";
            }

            if (string.IsNullOrEmpty(ctrl))
            {
                ctrl = Request.QueryString["ctrl"] != null ? Request.QueryString["ctrl"].ToString() : "adminGeneral";
            }

            if (string.IsNullOrEmpty(type_act))
            {
                type_act = Request.QueryString["type_act"] != null ? Request.QueryString["type_act"].ToString() : CommonGlobal.View;
            }

            if (string.IsNullOrEmpty(lang))
            {
                lang = LanguageModels.ActiveLanguage().LangCultureName;
            }

            try
            {
                footer_view.Footer = GeneralModels.GetContent(CommonGlobal.PageFooter, lang);
                footer_view.Footer1 = GeneralModels.GetContent(CommonGlobal.PageFooter1, lang);
                footer_view.Footer2 = GeneralModels.GetContent(CommonGlobal.PageFooter2, lang);
                footer_view.Footer3 = GeneralModels.GetContent(CommonGlobal.PageFooter3, lang);
                footer_view.Footer4 = GeneralModels.GetContent(CommonGlobal.PageFooter4, lang);
                footer_view.Footer5 = GeneralModels.GetContent(CommonGlobal.PageFooter5, lang);
            }
            catch (Exception)
            {
                footer_view.Message = "Đã xảy ra lỗi trong quá trình lấy dữ liệu.";
            }

            ////Link tab
            StringBuilder sb = new StringBuilder();
            sb.Append("<li><a href=\"" + Url.Action("index", "dashboard", new { act = "system_config", ctrl = "adminGeneral", type_act = CommonGlobal.Edit }) + "\"><span>Cấu hình chung</span></a></li>");
            sb.Append("<li><a href=\"" + Url.Action("index", "dashboard", new { act = "system_email", ctrl = "adminGeneral", type_act = CommonGlobal.Edit }) + "\"><span>Cấu hình email</span></a></li>");
            sb.Append("<li class=\"active\"><a href=\"#\"><span>Footer</span></a></li>");
            footer_view.Html_link_tab = sb.ToString();
            ////list language
            footer_view.List_language = this.List_select_language(lang);
            ////action
            footer_view.Type = type;
            footer_view.Type_act = type_act;
            footer_view.Act = act;
            footer_view.Ctrl = ctrl;
            footer_view.Parent_action = HttpContext.Request.RequestContext.RouteData.Values["action"].ToString();
            footer_view.Parent_controller = HttpContext.Request.RequestContext.RouteData.Values["controller"].ToString();
            ////end action

            return this.PartialView("../control/footer", footer_view);
        }

        /// <summary>
        /// Footers the specified collection.
        /// </summary>
        /// <param name="collection">The collection.</param>
        /// <returns>
        /// The Footer
        /// </returns>
        [ChildActionOnly]
        [ValidateInput(false)]
        [AcceptVerbs(HttpVerbs.Post)]
        public ActionResult Footer(FormCollection collection)
        {
            GeneralModels generalModels = new GeneralModels();
            C_General general = new C_General();
            var footer_view = new Web.Areas.Admin.ViewModels.Footer_view();
            this.TryUpdateModel(footer_view);

            ////action
            footer_view.Parent_action = HttpContext.Request.RequestContext.RouteData.Values["action"].ToString();
            footer_view.Parent_controller = HttpContext.Request.RequestContext.RouteData.Values["controller"].ToString();
            ////end action
            ////list language
            footer_view.List_language = this.List_select_language(footer_view.Lang);
            ////Link tab
            StringBuilder sb = new StringBuilder();
            sb.Append("<li><a href=\"" + Url.Action("index", "dashboard", new { act = "system_config", ctrl = "adminGeneral", type_act = CommonGlobal.Edit }) + "\"><span>Cấu hình chung</span></a></li>");
            sb.Append("<li><a href=\"" + Url.Action("index", "dashboard", new { act = "system_email", ctrl = "adminGeneral", type_act = CommonGlobal.Edit }) + "\"><span>Cấu hình email</span></a></li>");
            sb.Append("<li class=\"active\"><a href=\"#\"><span>Footer</span></a></li>");
            footer_view.Html_link_tab = sb.ToString();

            try
            {
                if (footer_view.IsUpdate > 0 && footer_view.Type_act == CommonGlobal.Edit)
                {
                    general = generalModels.GetGeneral(CommonGlobal.PageFooter, footer_view.Lang);
                    general.Lang = footer_view.Lang;
                    general.GeneralContent = footer_view.Footer != null ? footer_view.Footer : string.Empty;
                    general.Show = true;
                    generalModels.Edit(general);

                    general = generalModels.GetGeneral(CommonGlobal.PageFooter1, footer_view.Lang);
                    general.Lang = footer_view.Lang;
                    general.GeneralContent = footer_view.Footer1 != null ? footer_view.Footer1 : string.Empty;
                    general.Show = true;
                    generalModels.Edit(general);

                    general = generalModels.GetGeneral(CommonGlobal.PageFooter2, footer_view.Lang);
                    general.Lang = footer_view.Lang;
                    general.GeneralContent = footer_view.Footer2 != null ? footer_view.Footer2 : string.Empty;
                    general.Show = true;
                    generalModels.Edit(general);

                    general = generalModels.GetGeneral(CommonGlobal.PageFooter3, footer_view.Lang);
                    general.Lang = footer_view.Lang;
                    general.GeneralContent = footer_view.Footer3 != null ? footer_view.Footer3 : string.Empty;
                    general.Show = true;
                    generalModels.Edit(general);

                    general = generalModels.GetGeneral(CommonGlobal.PageFooter4, footer_view.Lang);
                    general.Lang = footer_view.Lang;
                    general.GeneralContent = footer_view.Footer4 != null ? footer_view.Footer4 : string.Empty;
                    general.Show = true;
                    generalModels.Edit(general);

                    general = generalModels.GetGeneral(CommonGlobal.PageFooter5, footer_view.Lang);
                    general.Lang = footer_view.Lang;
                    general.GeneralContent = footer_view.Footer5 != null ? footer_view.Footer5 : string.Empty;
                    general.Show = true;
                    generalModels.Edit(general);

                    footer_view.Message = "Cập nhật thành công.";
                }
            }
            catch (Exception)
            {
                footer_view.Message = "Đã xảy ra lỗi cập nhật dữ liệu.";
            }

            return this.PartialView("../control/footer", footer_view);
        }

        /// <summary>
        /// Lists the contact.
        /// </summary>
        /// <param name="id">The identifier.</param>
        /// <param name="type">The type.</param>
        /// <param name="act">The act.</param>
        /// <param name="ctrl">The control.</param>
        /// <param name="type_act">The type act.</param>
        /// <param name="lang">The language.</param>
        /// <param name="search">The search.</param>
        /// <param name="page">The page.</param>
        /// <param name="page_size">The page size.</param>
        /// <param name="order_by">The order by.</param>
        /// <param name="order_type">Type of the order.</param>
        /// <returns>
        /// List contact
        /// </returns>
        [ChildActionOnly]
        public ActionResult List_contact(int? id, string type, string act, string ctrl, string type_act, string lang, string search, int? page, int? page_size, string order_by, string order_type)
        {
            ContactModels contactModels = new ContactModels();
            C_Contact objectContact = new C_Contact();
            StringBuilder sb = new StringBuilder();
            var list_contact_view = new Web.Areas.Admin.ViewModels.List_contact_view();
            int total_record = 0;

            if (string.IsNullOrEmpty(type))
            {
                type = Request.QueryString["type"] != null ? Request.QueryString["type"].ToString() : string.Empty;
            }

            if (string.IsNullOrEmpty(act))
            {
                act = Request.QueryString["act"] != null ? Request.QueryString["act"].ToString() : "list_contact";
            }

            if (string.IsNullOrEmpty(ctrl))
            {
                ctrl = Request.QueryString["ctrl"] != null ? Request.QueryString["ctrl"].ToString() : "adminGeneral";
            }

            if (page == null || page == 0)
            {
                page = Request.QueryString["page"] != null ? Convert.ToInt32(Request.QueryString["page"].ToString()) : 1;
            }

            if (page_size == null)
            {
                page_size = int.Parse(Util.GetConfigValue("NumberPageSizeAdmin", "30"));
            }

            if (id != null && type_act != null && type_act == CommonGlobal.Delete)
            {
                if (UserModels.CheckPermission(this.Session["mem"] != null ? this.Session["mem"].ToString() : string.Empty, act, ctrl, type_act, type)) 
                {
                    objectContact = contactModels.GetByID((int)id);
                    if (objectContact != null)
                    {
                        ////delete contact
                        bool rt = contactModels.Delete((int)id);
                        if (rt)
                        {
                            list_contact_view.Message = "Bạn đã xóa " + id;
                        }
                        else
                        {
                            list_contact_view.Message = "Xóa không thành công";
                        }
                    }
                    else
                    {
                        list_contact_view.Message = "Không tìm thấy  : " + id;
                    }
                }
                else
                {
                    list_contact_view.Message = " Bạn không có quyền thực thi hành động xóa.";
                }
            }

            if (string.IsNullOrEmpty(order_by) || string.IsNullOrEmpty(order_type))
            {
                order_by = "ContactId";
                order_type = "desc";
            }

            list_contact_view.Type = type;
            list_contact_view.Cate_type = "Ý kiến khách hàng";
            list_contact_view.Type_act = type_act;
            ////tab
            sb.Append("<li class=\"active\"><a class=\"active\" href=\"#\"><span><span>Ý kiến khách hàng</span></span></a></li>");
            list_contact_view.Html_link_tab = sb.ToString();
            ////list page size and paging
            list_contact_view.List_page_size = this.GetSizePagingPublic((int)page_size);
            list_contact_view.Page = (int)page;
            list_contact_view.Page_size = (int)page_size;
            ////list catalog
            list_contact_view.Page_list_contact = contactModels.AdminGetAllContactClient(lang, search, (int)page, (int)page_size, order_by, order_type, out total_record);
            list_contact_view.Search = search;
            list_contact_view.Order_by = order_by;
            list_contact_view.Order_type = order_type;
            list_contact_view.Total_record = total_record;
            ////acton and parent action
            list_contact_view.Act = act;
            list_contact_view.Ctrl = ctrl;
            list_contact_view.Parent_action = HttpContext.Request.RequestContext.RouteData.Values["action"].ToString();
            list_contact_view.Parent_controller = HttpContext.Request.RequestContext.RouteData.Values["controller"].ToString();

            return this.PartialView("../control/list_contact", list_contact_view);
        }

        /// <summary>
        /// Systems the configuration.
        /// </summary>
        /// <param name="collection">The collection.</param>
        /// <param name="lang">The language.</param>
        /// <param name="act">The act.</param>
        /// <param name="ctrl">The control.</param>
        /// <param name="type_act">The type act.</param>
        /// <param name="type">The type.</param>
        /// <param name="file_img">The file images.</param>
        /// <returns>
        /// System config
        /// </returns>
        [ChildActionOnly]
        [ValidateInput(false)]
        public ActionResult System_config(FormCollection collection, string lang, string act, string ctrl, string type_act, string type, HttpPostedFileBase file_img)
        {
            var system_config_view = new Web.Areas.Admin.ViewModels.System_config_view();
            GeneralModels generalModel = new GeneralModels();
            WebInfoModels webInfoModels = new WebInfoModels();
            this.TryUpdateModel(system_config_view);

            if (string.IsNullOrEmpty(lang))
            {
                lang = LanguageModels.ActiveLanguage().LangCultureName;
            }

            if (string.IsNullOrEmpty(act))
            {
                act = Request.QueryString["act"] != null ? Request.QueryString["act"].ToString() : "system_config";
            }

            if (string.IsNullOrEmpty(ctrl))
            {
                ctrl = Request.QueryString["ctrl"] != null ? Request.QueryString["ctrl"].ToString() : "adminGeneral";
            }

            if (string.IsNullOrEmpty(type_act))
            {
                type_act = Request.QueryString["type_act"] != null ? Request.QueryString["type_act"].ToString() : CommonGlobal.Edit;
            }

            system_config_view.Type_act = type_act;

            ////Update data
            if (system_config_view.Is_update > 0 && system_config_view.Type_act == CommonGlobal.Edit)
            {
                ////Pagename
                C_General pagename = new C_General();
                pagename.GeneralName = CommonGlobal.PageName;
                pagename.GeneralContent = system_config_view.Page_name;
                pagename.Show = true;
                pagename.Lang = system_config_view.Lang;
                pagename.Datemodified = DateTime.Now;
                generalModel.Update(pagename);

                ////Keyword
                C_General keyword = new C_General();
                keyword.GeneralName = CommonGlobal.Keyword;
                keyword.GeneralContent = system_config_view.Keywords;
                keyword.Show = true;
                keyword.Lang = system_config_view.Lang;
                keyword.Datemodified = DateTime.Now;
                generalModel.Update(keyword);

                ////Description
                C_General description = new C_General();
                description.GeneralName = CommonGlobal.Description;
                description.GeneralContent = system_config_view.Description;
                description.Show = true;
                description.Lang = system_config_view.Lang;
                description.Datemodified = DateTime.Now;
                generalModel.Update(description);

                ////Support
                C_General support = new C_General();
                support.GeneralName = CommonGlobal.Support;
                support.GeneralContent = system_config_view.Support;
                support.Show = true;
                support.Lang = system_config_view.Lang;
                support.Datemodified = DateTime.Now;
                generalModel.Update(support);

                ////Address
                C_General address = new C_General();
                address.GeneralName = CommonGlobal.Address;
                address.GeneralContent = system_config_view.Address;
                address.Show = true;
                address.Lang = system_config_view.Lang;
                address.Datemodified = DateTime.Now;
                generalModel.Update(address);

                ////Hotline
                C_WebInfo hotline = new C_WebInfo();
                hotline.GeneralName = CommonGlobal.Hotline;
                hotline.GeneralContent = system_config_view.Hotline;
                hotline.Datemodified = DateTime.Now;
                webInfoModels.Update(hotline);

                ////Skyper
                C_WebInfo skyper = new C_WebInfo();
                skyper.GeneralName = CommonGlobal.Skyper;
                skyper.GeneralContent = system_config_view.Skype;
                skyper.Datemodified = DateTime.Now;
                webInfoModels.Update(skyper);

                ////Slogan
                C_General slogan = new C_General();
                slogan.GeneralName = CommonGlobal.Slogan;
                slogan.GeneralContent = system_config_view.Slogan;
                slogan.Show = true;
                slogan.Datemodified = DateTime.Now;
                slogan.Lang = system_config_view.Lang;
                generalModel.Update(slogan);

                ////facebook
                C_WebInfo facebook = new C_WebInfo();
                facebook.GeneralName = CommonGlobal.Facebook;
                facebook.GeneralContent = system_config_view.Facebook;
                facebook.Datemodified = DateTime.Now;
                webInfoModels.Update(facebook);

                ////Fees
                C_WebInfo fees = new C_WebInfo();
                fees.GeneralName = CommonGlobal.Fees;
                fees.GeneralContent = system_config_view.Fees;
                fees.Datemodified = DateTime.Now;
                webInfoModels.Update(fees);

                ////Fees
                C_WebInfo min_fees = new C_WebInfo();
                min_fees.GeneralName = CommonGlobal.MinFees;
                min_fees.GeneralContent = system_config_view.Min_fees;
                min_fees.Datemodified = DateTime.Now;
                webInfoModels.Update(min_fees);

                ////Fees
                C_WebInfo tax = new C_WebInfo();
                tax.GeneralName = CommonGlobal.Tax;
                tax.GeneralContent = system_config_view.Tax;
                tax.Datemodified = DateTime.Now;
                webInfoModels.Update(tax);

                ////google_analysis
                C_WebInfo google_analysis = new C_WebInfo();
                google_analysis.GeneralName = CommonGlobal.GoogleAnalysis;
                google_analysis.GeneralContent = system_config_view.Google_analysis;
                google_analysis.Datemodified = DateTime.Now;
                webInfoModels.Update(google_analysis);

                ////app_extend_one
                C_WebInfo app_extend_one = new C_WebInfo();
                app_extend_one.GeneralName = CommonGlobal.AppExtendOne;
                app_extend_one.GeneralContent = system_config_view.App_extend_one;
                app_extend_one.Datemodified = DateTime.Now;
                webInfoModels.Update(app_extend_one);

                ////app_extend_two
                C_WebInfo app_extend_two = new C_WebInfo();
                app_extend_two.GeneralName = CommonGlobal.AppExtendTwo;
                app_extend_two.GeneralContent = system_config_view.App_extend_two;
                app_extend_two.Datemodified = DateTime.Now;
                webInfoModels.Update(app_extend_two);

                ////latitude
                C_WebInfo latitude = new C_WebInfo();
                latitude.GeneralName = CommonGlobal.Latitude;
                latitude.GeneralContent = system_config_view.Latitude;
                latitude.Datemodified = DateTime.Now;
                webInfoModels.Update(latitude);

                ////latitude
                C_WebInfo longitude = new C_WebInfo();
                longitude.GeneralName = CommonGlobal.Longitude;
                longitude.GeneralContent = system_config_view.Longitude;
                longitude.Datemodified = DateTime.Now;
                webInfoModels.Update(longitude);

                ////image
                C_WebInfo imgmap = new C_WebInfo();
                imgmap.GeneralName = CommonGlobal.ImageMap;
                //// imgmap. = system_config_view.imgmap;
                imgmap.Datemodified = DateTime.Now;

                var imgPathTemp = "images/icon/"; ////+ DateTime.Now.Year.ToString() + "/" + DateTime.Now.Month.ToString() + "/";
                var name_time = DateTime.Now.Day + DateTime.Now.Month + DateTime.Now.Year + DateTime.Now.Hour + DateTime.Now.Minute + string.Empty;
                if (file_img != null && file_img.ContentLength > 0 && CommonGlobal.IsImage(file_img) == true)
                {
                    string image_name = imgPathTemp + "sc_original_" + name_time + "_" + CommonGlobal.CompleteNamefileImages(file_img.FileName);

                    ////save image and delete old file
                    this.SavephotoOriginal(imgmap.GeneralContent, file_img, imgPathTemp, image_name);

                    ////set image thumb to link catalog
                    imgmap.GeneralContent = "/" + image_name;
                    system_config_view.Image_map = "/" + image_name;
                }
                else if (string.IsNullOrEmpty(imgmap.GeneralContent))
                {
                    imgmap.GeneralContent = "0";
                }
                else
                {
                    imgmap.GeneralContent = system_config_view.Image_map;
                }

                webInfoModels.Update(imgmap);

                system_config_view.Message = "Cập nhật thành công.";
            }

            ////list language
            system_config_view.List_language = this.List_select_language(lang);
            try
            {
                ////General
                system_config_view.Page_name = GeneralModels.GetContent(CommonGlobal.PageName, lang);
                system_config_view.Keywords = GeneralModels.GetContent(CommonGlobal.Keyword, lang);
                system_config_view.Description = GeneralModels.GetContent(CommonGlobal.Description, lang);
                system_config_view.Support = GeneralModels.GetContent(CommonGlobal.Support, lang);
                system_config_view.Address = GeneralModels.GetContent(CommonGlobal.Address, lang);
                system_config_view.Slogan = GeneralModels.GetContent(CommonGlobal.Slogan, lang);
                ////webinfo
                system_config_view.Hotline = webInfoModels.GetContent(CommonGlobal.Hotline);
                system_config_view.Facebook = webInfoModels.GetContent(CommonGlobal.Facebook);
                system_config_view.Skype = webInfoModels.GetContent(CommonGlobal.Skyper);
                system_config_view.Fees = webInfoModels.GetContent(CommonGlobal.Fees);
                system_config_view.Min_fees = webInfoModels.GetContent(CommonGlobal.MinFees);
                system_config_view.Tax = webInfoModels.GetContent(CommonGlobal.Tax);
                system_config_view.Google_analysis = webInfoModels.GetContent(CommonGlobal.GoogleAnalysis);
                system_config_view.App_extend_one = webInfoModels.GetContent(CommonGlobal.AppExtendOne);
                system_config_view.App_extend_two = webInfoModels.GetContent(CommonGlobal.AppExtendTwo);
                system_config_view.Latitude = webInfoModels.GetContent(CommonGlobal.Latitude);
                system_config_view.Longitude = webInfoModels.GetContent(CommonGlobal.Longitude);
                system_config_view.Image_map = webInfoModels.GetContent(CommonGlobal.ImageMap);
            }
            catch (Exception)
            {
                system_config_view.Message = "Đã xảy ra lỗi trong quá trình lấy dữ liệu.";
            }

            ////Link tab
            StringBuilder sb = new StringBuilder();
            sb.Append("<li class=\"active\"><a href=\"#\"><span>Cấu hình chung</span></a></li>");
            sb.Append("<li><a href=\"" + Url.Action("index", "dashboard", new { act = "system_email", ctrl = "adminGeneral", type_act = CommonGlobal.Edit }) + "\"><span>Cấu hình email</span></a></li>");
            sb.Append("<li><a href=\"" + Url.Action("index", "dashboard", new { act = "footer", ctrl = "adminGeneral", type_act = CommonGlobal.Edit }) + "\"><span>Footer</span></a></li>");

            system_config_view.Html_link_tab = sb.ToString();
            system_config_view.Type_act = type_act;
            system_config_view.Type = type;
            ////action
            system_config_view.Act = act;
            system_config_view.Ctrl = ctrl;
            system_config_view.Parent_action = HttpContext.Request.RequestContext.RouteData.Values["action"].ToString();
            system_config_view.Parent_controller = HttpContext.Request.RequestContext.RouteData.Values["controller"].ToString();
            ////end action

            return this.PartialView("../control/system_config", system_config_view);
        }

        /// <summary>
        /// Systems the email.
        /// </summary>
        /// <param name="act">The act.</param>
        /// <param name="ctrl">The control.</param>
        /// <param name="type_act">The type act.</param>
        /// <param name="type">The type.</param>
        /// <returns>System email</returns>
        [ChildActionOnly]
        [AcceptVerbs(HttpVerbs.Get)]
        public ActionResult System_email(string act, string ctrl, string type_act, string type)
        {
            var email_view = new Web.Areas.Admin.ViewModels.Email_view();
            WebInfoModels webInfoModels = new WebInfoModels();
            if (string.IsNullOrEmpty(act))
            {
                act = Request.QueryString["act"] != null ? Request.QueryString["act"].ToString() : "system_email";
            }

            if (string.IsNullOrEmpty(ctrl))
            {
                ctrl = Request.QueryString["ctrl"] != null ? Request.QueryString["ctrl"].ToString() : "adminGeneral";
            }

            if (string.IsNullOrEmpty(type_act))
            {
                type_act = Request.QueryString["type_act"] != null ? Request.QueryString["type_act"].ToString() : CommonGlobal.View;
            }

            try
            {
                email_view.SmtpHost = webInfoModels.GetContent(CommonGlobal.SmtpHost);
                email_view.SmtpPort = webInfoModels.GetContent(CommonGlobal.SmtpPort);
                email_view.SmtpUser = webInfoModels.GetContent(CommonGlobal.SmtpUser);
                email_view.SmtpPass = webInfoModels.GetContent(CommonGlobal.SmtpPass);
                email_view.Email = webInfoModels.GetContent(CommonGlobal.Email);
            }
            catch (Exception)
            {
                email_view.Message = "Đã xảy ra lỗi trong quá trình lấy dữ liệu.";
            }

            ////Link tab
            StringBuilder sb = new StringBuilder();
            sb.Append("<li><a href=\"" + Url.Action("index", "dashboard", new { act = "system_config", ctrl = "adminGeneral", type_act = CommonGlobal.Edit }) + "\"><span>Cấu hình chung</span></a></li>");
            sb.Append("<li class=\"active\"><a href=\"#\"><span>Cấu hình email</span></a></li>");
            sb.Append("<li><a href=\"" + Url.Action("index", "dashboard", new { act = "footer", ctrl = "adminGeneral", type_act = CommonGlobal.Edit }) + "\"><span>Footer</span></a></li>");
            email_view.Html_link_tab = sb.ToString();

            ////action
            email_view.Type = type;
            email_view.Type_act = type_act;
            email_view.Act = act;
            email_view.Ctrl = ctrl;
            email_view.Parent_action = HttpContext.Request.RequestContext.RouteData.Values["action"].ToString();
            email_view.Parent_controller = HttpContext.Request.RequestContext.RouteData.Values["controller"].ToString();
            ////end action

            return this.PartialView("../control/system_email", email_view);
        }

        /// <summary>
        /// Systems the email.
        /// </summary>
        /// <param name="collection">The collection.</param>
        /// <returns>System email</returns>
        [ChildActionOnly]
        [AcceptVerbs(HttpVerbs.Post)]
        public ActionResult System_email(FormCollection collection)
        {
            WebInfoModels webInfoModels = new WebInfoModels();
            var email_view = new Web.Areas.Admin.ViewModels.Email_view();
            this.TryUpdateModel(email_view);

            ////action
            email_view.Parent_action = HttpContext.Request.RequestContext.RouteData.Values["action"].ToString();
            email_view.Parent_controller = HttpContext.Request.RequestContext.RouteData.Values["controller"].ToString();
            ////end action

            ////Link tab
            StringBuilder sb = new StringBuilder();

            sb.Append("<li><a href=\"" + Url.Action("index", "dashboard", new { act = "system_config", ctrl = "adminGeneral", type_act = CommonGlobal.Edit }) + "\"><span>Cấu hình chung</span></a></li>");
            sb.Append("<li class=\"active\"><a href=\"#\"><span>Cấu hình email</span></a></li>");
            sb.Append("<li><a href=\"" + Url.Action("index", "dashboard", new { act = "footer", ctrl = "adminGeneral", type_act = CommonGlobal.Edit }) + "\"><span>Footer</span></a></li>");
            email_view.Html_link_tab = sb.ToString();

            if (string.IsNullOrEmpty(email_view.SmtpHost))
            {
                email_view.Message = "Bạn cần nhập Smtp Host";
                return this.PartialView("../control/system_email", email_view);
            }

            if (string.IsNullOrEmpty(email_view.SmtpPort))
            {
                email_view.Message = "Bạn cần nhập Smtp Port";
                return this.PartialView("../control/system_email", email_view);
            }

            if (string.IsNullOrEmpty(email_view.SmtpUser))
            {
                email_view.Message = "Bạn cần nhập Smtp User";
                return this.PartialView("../control/system_email", email_view);
            }

            if (string.IsNullOrEmpty(email_view.SmtpPass))
            {
                email_view.Message = "Bạn cần nhập Smtp Pass";
                return this.PartialView("../control/system_email", email_view);
            }

            if (string.IsNullOrEmpty(email_view.Email))
            {
                email_view.Message = "Bạn cần nhập Email";
                return this.PartialView("../control/system_email", email_view);
            }

            try
            {
                if (email_view.Type_act == CommonGlobal.Edit)
                {
                    ////SMTP Host
                    C_WebInfo objSMTPHost = new C_WebInfo();
                    objSMTPHost.GeneralName = CommonGlobal.SmtpHost;
                    objSMTPHost.GeneralContent = email_view.SmtpHost;
                    objSMTPHost.Datemodified = DateTime.Now;
                    webInfoModels.Update(objSMTPHost);

                    ////SMTP Port
                    C_WebInfo objSMTPPort = new C_WebInfo();
                    objSMTPPort.GeneralName = CommonGlobal.SmtpPort;
                    objSMTPPort.GeneralContent = email_view.SmtpPort;
                    objSMTPPort.Datemodified = DateTime.Now;
                    webInfoModels.Update(objSMTPPort);

                    ////SMTP User
                    C_WebInfo objSMTPUser = new C_WebInfo();
                    objSMTPUser.GeneralName = CommonGlobal.SmtpUser;
                    objSMTPUser.GeneralContent = email_view.SmtpUser;
                    objSMTPUser.Datemodified = DateTime.Now;
                    webInfoModels.Update(objSMTPUser);

                    ////SMTP Pass
                    C_WebInfo objSMTPPass = new C_WebInfo();
                    objSMTPPass.GeneralName = CommonGlobal.SmtpPass;
                    objSMTPPass.GeneralContent = email_view.SmtpPass;
                    objSMTPPass.Datemodified = DateTime.Now;
                    webInfoModels.Update(objSMTPPass);

                    ////Email
                    C_WebInfo objEmail = new C_WebInfo();
                    objEmail.GeneralName = CommonGlobal.Email;
                    objEmail.GeneralContent = email_view.Email;
                    objEmail.Datemodified = DateTime.Now;
                    webInfoModels.Update(objEmail);
                }
            }
            catch (Exception)
            {
                email_view.Message = "Đã xảy ra lỗi cập nhật dữ liệu.";
            }

            email_view.Message = "Cập nhật thành công.";

            return this.PartialView("../control/system_email", email_view);
        }
    }
}