namespace Web.Areas.Admin.Controllers
{
    using System;
    using System.Collections.Generic;
    using System.IO;
    using System.Linq;
    using System.Text;
    using System.Web.Mvc;
    using Data;
    using iTextSharp.text;
    using Models;
    using Web.Controllers;
    using Webdiyer.WebControls.Mvc;
    using Web.Models;
    using Web.App_GlobalResources;

    /// <summary>
    /// admin Email Controller
    /// </summary>
    /// <seealso cref="Web.Controllers.BaseController" />
    public class AdminEmailController : BaseController
    {
        /// <summary>
        /// Changes the email template.
        /// </summary>
        /// <param name="id">The identifier.</param>
        /// <param name="type">The type.</param>
        /// <param name="act">The act.</param>
        /// <param name="ctrl">The control.</param>
        /// <param name="type_act">The type act.</param>
        /// <param name="lang">The language.</param>
        /// <returns>
        /// change email template
        /// </returns>
        [ChildActionOnly]
        [AcceptVerbs(HttpVerbs.Get)]
        public ActionResult Change_emailtemplate(int? id, string type, string act, string ctrl, string type_act, string lang)
        {
            EmailTemplateModels emailTemplateModels = new EmailTemplateModels();
            C_EmailTemplate objEmailTemplate = new C_EmailTemplate();
            var email_template_view = new Web.Areas.Admin.ViewModels.Email_template_view();
            StringBuilder sb = new StringBuilder();
            if (string.IsNullOrEmpty(type))
            {
                type = Request.QueryString["type"] != null ? Request.QueryString["type"].ToString() : CommonGlobal.CateNews;
            }

            if (string.IsNullOrEmpty(act))
            {
                act = Request.QueryString["act"] != null ? Request.QueryString["act"].ToString() : "change_post";
            }

            if (string.IsNullOrEmpty(ctrl))
            {
                ctrl = Request.QueryString["ctrl"] != null ? Request.QueryString["ctrl"].ToString() : "adminPost";
            }

            if (id == null)
            {
                id = RouteData.Values["id"] != null ? Convert.ToInt32(RouteData.Values["id"].ToString()) : 0;
            }

            if (string.IsNullOrEmpty(lang))
            {
                lang = LanguageModels.ActiveLanguage().LangCultureName;
            }

            if (string.IsNullOrEmpty(type_act))
            {
                type_act = Request.QueryString["type_act"] != null ? Request.QueryString["type_act"].ToString() : CommonGlobal.Add;
                if (id == 0)
                {
                    type_act = CommonGlobal.Add;
                }
                else
                {
                    type_act = CommonGlobal.Edit;
                }
            }

            if (type_act == CommonGlobal.Edit)
            {
                objEmailTemplate = emailTemplateModels.GetEmailTemplateById((int)id);
                email_template_view.Id = objEmailTemplate.id;
                email_template_view.Name = objEmailTemplate.name;
                email_template_view.Template = objEmailTemplate.template;

                ////Link tab
                sb.Append("<li><a class=\"active\" href=\"" + Url.Action("index", "dashboard", new { act = "list_emailtemplate", ctrl = "adminEmail", page = "1" }) + "\"><span><span>Danh sách email template</span></span></a></li>");
                sb.Append("<li class=\"active\"><a href=\"#\"><span><span>Cập nhật</span></span></a></li>");
            }
            else
            {
                ////Link tab
                sb.Append("<li><a class=\"active\" href=\"" + Url.Action("index", "dashboard", new { act = "list_emailtemplate", ctrl = "adminEmail", page = "1", lang = lang }) + "\"><span><span>Danh sách email template</span></span></a></li>");
                sb.Append("<li class=\"active\"><a href=\"#\"><span><span>Thêm mới</span></span></a></li>");
            }

            email_template_view.Type = type;
            email_template_view.Type_act = type_act;
            email_template_view.Html_link_tab = sb.ToString();
            ////action
            email_template_view.Act = act;
            email_template_view.Ctrl = ctrl;
            email_template_view.Parent_action = HttpContext.Request.RequestContext.RouteData.Values["action"].ToString();
            email_template_view.Parent_controller = HttpContext.Request.RequestContext.RouteData.Values["controller"].ToString();
            ////end action

            return this.PartialView("../control/change_emailtemplate", email_template_view);
        }

        /// <summary>
        /// Changes the email template.
        /// </summary>
        /// <param name="collection">The collection.</param>
        /// <returns>
        /// change email template
        /// </returns>
        [ChildActionOnly]
        [ValidateInput(false)]
        [AcceptVerbs(HttpVerbs.Post)]
        public ActionResult Change_emailtemplate(FormCollection collection)
        {
            EmailTemplateModels emailTemplateModels = new EmailTemplateModels();
            C_EmailTemplate objEmailTemplate = new C_EmailTemplate();
            StringBuilder sb = new StringBuilder();
            int rt = 0;
            bool is_valid = true;
            var email_template_view = new Web.Areas.Admin.ViewModels.Email_template_view();
            this.TryUpdateModel(email_template_view);

            if (email_template_view.Id > 0)
            {
                objEmailTemplate = emailTemplateModels.GetEmailTemplateById(email_template_view.Id);
            }

            ////validation server
            if (string.IsNullOrEmpty(email_template_view.Name))
            {
                is_valid = false;
                email_template_view.Message = "Bạn cần nhập tên email template";
            }
            ////validation server
            if (string.IsNullOrEmpty(email_template_view.Template))
            {
                is_valid = false;
                email_template_view.Message = "Bạn cần nhập nội dung email";
            }
            ////action
            ////post_view.act = "change_post";
            ////post_view.ctrl = "adminPost";
            email_template_view.Parent_action = HttpContext.Request.RequestContext.RouteData.Values["action"].ToString();
            email_template_view.Parent_controller = HttpContext.Request.RequestContext.RouteData.Values["controller"].ToString();

            if (email_template_view.Id != 0 && email_template_view.Type_act == CommonGlobal.Edit)
            {
                ////Link tab

                sb.Append("<li><a class=\"active\" href=\"" + Url.Action("index", "dashboard", new { act = "list_emailtemplate", ctrl = "adminEmail", type = email_template_view.Type, page = "1" }) + "\"><span>Danh sách email template</span></a></li>");
                sb.Append("<li class=\"active\"><a href=\"#\"><span><span>Cập nhật</span></span></a></li>");
            }
            else
            {
                ////Link tab

                sb.Append("<li><a class=\"active\" href=\"" + Url.Action("index", "dashboard", new { act = "list_emailtemplate", ctrl = "adminEmail", type = email_template_view.Type, page = "1" }) + "\"><span>Danh sách email template</span></a></li>");
                sb.Append("<li class=\"active\"><a href=\"#\"><span><span>Thêm mới</span></span></a></li>");
            }

            email_template_view.Html_link_tab = sb.ToString();

            if (!is_valid)
            {
                return this.PartialView("../control/change_emailtemplate", email_template_view);
            }

            ////Post info
            objEmailTemplate.name = email_template_view.Name;
            objEmailTemplate.template = email_template_view.Template;

            if (email_template_view.Id != 0 && email_template_view.Type_act == CommonGlobal.Edit)
            {
                rt = emailTemplateModels.Edit(objEmailTemplate);
            }
            else
            {
                objEmailTemplate.createdate = DateTime.Now;
                rt = emailTemplateModels.Add(objEmailTemplate);
            }

            if (rt > 0)
            {
                email_template_view.Message = "Cập nhật thành công!";
                email_template_view.Id = rt;
                email_template_view.Type_act = CommonGlobal.Edit;
            }
            else
            {
                email_template_view.Message = "Cập nhật không thành công!";
            }

            return this.PartialView("../control/change_emailtemplate", email_template_view);
        }

        /// <summary>
        /// Emails the marketing template.
        /// </summary>
        /// <param name="id">The identifier.</param>
        /// <returns>
        /// Email marketing template
        /// </returns>
        public ActionResult Email_marketing_template(string id)
        {
            EmailTemplateModels emailModels = new EmailTemplateModels();
            C_EmailTemplate objEmailTemplate = emailModels.GetEmailTemplateById(int.Parse(id));
            return this.Json(objEmailTemplate.template);
        }

        /// <summary>
        /// Exports the email.
        /// </summary>
        /// <param name="act">The act.</param>
        /// <param name="ctrl">The control.</param>
        /// <param name="type_act">The type act.</param>
        /// <returns>
        /// export email
        /// </returns>
        public ActionResult Export_email(string act, string ctrl, string type_act)
        {
            EmailModels emailModels = new EmailModels();
            StringBuilder sb = new StringBuilder();
            var list_email_view = new Web.Areas.Admin.ViewModels.List_email_view();
            string file_name = string.Empty;

            if (string.IsNullOrEmpty(act))
            {
                act = Request.QueryString["act"] != null ? Request.QueryString["act"].ToString() : "list_order";
            }

            if (string.IsNullOrEmpty(ctrl))
            {
                ctrl = Request.QueryString["ctrl"] != null ? Request.QueryString["ctrl"].ToString() : "adminOrder";
            }

            var ms = new MemoryStream();
            Document document = new Document(PageSize.A4, 40, 40, 40, 40);
            ////PagedList<order> arrAll = orderModels.getAllOrderByAdmin((DateTime)from_date, (DateTime)to_date, Payment, (int)Process, search, (int)page, (int)page_size, order_by, order_type, out total_record);
            List<C_Email> lstEmail = emailModels.AllEmail();
            Response.Buffer = true;
            Response.Clear();

            ////export to excel
            Response.AddHeader("Content-Disposition", "attachment; filename=Danh_sach_email_" + DateTime.Now.ToString("yyyyMMdd") + ".xls");
            Response.ContentType = "application/ms-excel";
            file_name = "Danh_sach_email_" + DateTime.Now.ToString("yyyyMMdd") + ".xls";

            Response.Charset = string.Empty;
            Response.ContentEncoding = Encoding.Unicode;
            Response.BinaryWrite(Encoding.Unicode.GetPreamble());

            sb.Append("<table border=\"0\" cellspacing=\"0\" cellpadding=\"0\" style=\"padding:0px;margin:0px;width:27.7cm\" >");
            sb.Append("<tr>");
            sb.Append("<td colspan=\"5\" style=\"text-align:left;font-weight:bold;padding-bottom:10px;\">");
            sb.Append(Util.GetConfigValue("Domain", Request.UserHostAddress));
            sb.Append("</td>");
            sb.Append("</tr>");
            sb.Append("<tr>");
            sb.Append("<td colspan=\"5\" style=\"text-align:center;text-transform: uppercase;font-weight:bold;\" >Danh sách đăng ký</td>");
            sb.Append("</tr>");

            sb.Append("<tr style=\"background:#555555;color:#FFFFFF;font-weight: bold\">");
            sb.Append("<td style=\"border-right:1px dotted #ccc;border-bottom:1px dotted #ccc;border-top:1px dotted #ccc;border-left:1px dotted #ccc;text-align:center;width:80px;\">STT<br/></td>");
            sb.Append("<td style=\"border-right:1px dotted #ccc;border-bottom:1px dotted #ccc;text-align:center;border-top:1px dotted #ccc;width:100px;\">"+ App_GlobalResources.Lang.strName +"</td>");
            sb.Append("<td style=\"border-right:1px dotted #ccc;border-bottom:1px dotted #ccc;text-align:center;border-top:1px dotted #ccc;width:100px;\">" + App_GlobalResources.Lang.strPhone + "</td>");
            sb.Append("<td style=\"border-right:1px dotted #ccc;border-bottom:1px dotted #ccc;text-align:center;border-top:1px dotted #ccc;width:100px;\">Email</td>");
            sb.Append("<td style=\"border-right:1px dotted #ccc;border-bottom:1px dotted #ccc;text-align:center;border-top:1px dotted #ccc;width:100px;\">" + App_GlobalResources.Lang.strAddress + "</td>");
            sb.Append("</tr>");
            int i = 0;
            foreach (C_Email objEmail in lstEmail)
            {
                i++;
                sb.Append("<tr>");
                sb.Append("<td style=\"border-right:1px dotted #ccc;border-bottom:1px dotted #ccc;text-align:center;border-left:1px dotted #ccc;\">" + i + "</td>");
                sb.Append("<td style=\"border-right:1px dotted #ccc;border-bottom:1px dotted #ccc;text-align:center;\">" + objEmail.name + "</td>");
                sb.Append("<td style=\"border-right:1px dotted #ccc;border-bottom:1px dotted #ccc;text-align:center;\">" + objEmail.phone + "</td>");
                sb.Append("<td style=\"border-right:1px dotted #ccc;border-bottom:1px dotted #ccc;text-align:center;\">" + objEmail.email + "</td>");
                sb.Append("<td style=\"border-right:1px dotted #ccc;border-bottom:1px dotted #ccc;text-align:center;\">" + objEmail.address + "</td>");
                sb.Append("</tr>");
            }

            string test = sb.ToString();
            sb.Append("<tr><td colspan=\"5\" style=\"text-transform:uppercase;padding-top:20px;padding-left:20px;text-align:left;\">Nhân viên thống kê</td></tr>");
            sb.Append("<tr><td colspan=\"5\" style=\"text-transform:uppercase;padding-top:-20px;position: relative;text-align:right;padding-right:20px;\">" + this.Session["mem"] + "</td></tr>");
            sb.Append("</table>");
            Response.Write(sb.ToString());

            Response.End();
            return this.Json("ok");
        }

        /// <summary>
        /// Lists the email.
        /// </summary>
        /// <param name="type">The type.</param>
        /// <param name="act">The act.</param>
        /// <param name="ctrl">The control.</param>
        /// <param name="type_act">The type act.</param>
        /// <param name="page">The page.</param>
        /// <param name="page_size">The page size.</param>
        /// <returns>
        /// List email
        /// </returns>
        [ChildActionOnly]
        [AcceptVerbs(HttpVerbs.Get)]
        public ActionResult List_email(string type, string act, string ctrl, string type_act, int? page, int? page_size)
        {
            EmailModels emailModel = new EmailModels();
            EmailTemplateModels emailTemplateModels = new EmailTemplateModels();
            var list_email = new Web.Areas.Admin.ViewModels.List_email_view();

            List<SelectListItem> list_select_template = new List<SelectListItem>();
            emailTemplateModels.List_email_template(0, ref list_select_template);
            StringBuilder sb = new StringBuilder();

            int total_record = 0;

            if (string.IsNullOrEmpty(type))
            {
                type = Request.QueryString["type"] != null ? Request.QueryString["type"].ToString() : CommonGlobal.RoleAdmin;
            }

            if (string.IsNullOrEmpty(act))
            {
                act = Request.QueryString["act"] != null ? Request.QueryString["act"].ToString() : "list_email";
            }

            if (string.IsNullOrEmpty(ctrl))
            {
                ctrl = Request.QueryString["ctrl"] != null ? Request.QueryString["ctrl"].ToString() : "dminEmail";
            }

            if (page == null || page == 0)
            {
                page = Request.QueryString["page"] != null ? Convert.ToInt32(Request.QueryString["page"].ToString()) : 1;
            }

            if (page_size == null)
            {
                page_size = int.Parse(Util.GetConfigValue("NumberPageSizeAdmin", "30"));
            }

            list_email.Page = (int)page;
            list_email.Page_size = (int)page_size;
            ////tab
            sb.Append("<li class=\"active\"><a href=\"#\"><span>Email Marketing</span></a></li>");
            list_email.Html_link_tab = sb.ToString();

            ////list post
            PagedList<C_Email> lstEmail = emailModel.GetListEmail((int)page, (int)page_size, out total_record);
            list_email.ListPageSize = this.GetSizePagingPublic((int)page_size);
            list_email.ListEmail = lstEmail;
            list_email.Total_record = total_record;
            list_email.Total_record_on_page = lstEmail.Count();
            list_email.Type_act = type_act;
            list_email.ListTemplate = list_select_template;
            ////action
            list_email.Act = act;
            list_email.Ctrl = ctrl;
            list_email.Parent_action = HttpContext.Request.RequestContext.RouteData.Values["action"].ToString();
            list_email.Parent_controller = HttpContext.Request.RequestContext.RouteData.Values["controller"].ToString();
            ////end action

            return this.PartialView("../control/list_email", list_email);
        }

        /// <summary>
        /// Lists the email.
        /// </summary>
        /// <param name="collection">The collection.</param>
        /// <param name="email_id">The email identifier.</param>
        /// <param name="type">The type.</param>
        /// <param name="act">The act.</param>
        /// <param name="ctrl">The control.</param>
        /// <param name="type_act">The type act.</param>
        /// <param name="page">The page.</param>
        /// <param name="page_size">The page size.</param>
        /// <returns>
        /// List email
        /// </returns>
        [ChildActionOnly]
        [ValidateInput(false)]
        [AcceptVerbs(HttpVerbs.Post)]
        public ActionResult List_email(FormCollection collection, int? email_id, string type, string act, string ctrl, string type_act, int? page, int? page_size)
        {
            EmailModels emailModel = new EmailModels();
            EmailTemplateModels emailTemplateModels = new EmailTemplateModels();
            var list_email = new Web.Areas.Admin.ViewModels.List_email_view();
            this.TryUpdateModel(list_email);

            List<SelectListItem> list_select_tempate = new List<SelectListItem>();
            emailTemplateModels.List_email_template(0, ref list_select_tempate);
            StringBuilder sb = new StringBuilder();

            int total_record = 0;

            if (string.IsNullOrEmpty(type))
            {
                type = Request.QueryString["type"] != null ? Request.QueryString["type"].ToString() : CommonGlobal.RoleAdmin;
            }

            if (string.IsNullOrEmpty(act))
            {
                act = Request.QueryString["act"] != null ? Request.QueryString["act"].ToString() : "list_email";
            }

            if (string.IsNullOrEmpty(ctrl))
            {
                ctrl = Request.QueryString["ctrl"] != null ? Request.QueryString["ctrl"].ToString() : "dminEmail";
            }

            if (page == null || page == 0)
            {
                page = Request.QueryString["page"] != null ? Convert.ToInt32(Request.QueryString["page"].ToString()) : 1;
            }

            if (page_size == null)
            {
                page_size = int.Parse(Util.GetConfigValue("NumberPageSizeAdmin", "30"));
            }

            string email_address = collection["email_address"].ToString();

            if (email_id > 0 && type_act != null && type_act == CommonGlobal.Delete)
            {
                if (UserModels.CheckPermission(this.Session["mem"] != null ? this.Session["mem"].ToString() : string.Empty, act, ctrl, type_act, type)) 
                {
                    bool rt = emailModel.Delete((int)email_id);
                    if (rt)
                    {
                        list_email.Message = "Bạn đã xóa email: " + email_address;
                    }
                    else
                    {
                        list_email.Message = "Xóa không thành công";
                    }
                }
            }

            int totalRecord = 0;
            if (!string.IsNullOrEmpty(collection["total_record_on_page"]))
            {
                totalRecord = int.Parse(collection["total_record_on_page"]);
            }

            string subject = collection["emailSubject"];
            string body = collection["emailBody"];
            bool flag_SendMail = false;
            if (list_email.IsSendAll)
            {
                list_email.IsSendAll = true;
                list_email.IsSendAllText = "checked='checked'";
                List<C_Email> lstEmailSend = emailModel.AllEmail();
                if (lstEmailSend.Any())
                {
                    foreach (C_Email objEmail in lstEmailSend)
                    {
                        CommonGlobal.SendMail(objEmail.email, subject, body);
                    }

                    flag_SendMail = true;
                }
            }
            else
            {
                list_email.IsSendAll = false;
                list_email.IsSendAllText = string.Empty;
                for (int i = 1; i <= totalRecord; ++i)
                {
                    string email = string.Empty;
                    string chkBox = collection["chk_" + i];
                    if (!string.IsNullOrEmpty(chkBox))
                    {
                        if (chkBox.Contains("true"))
                        {
                            email = collection["email_" + i];
                            CommonGlobal.SendMail(email, subject, body);
                            flag_SendMail = true;
                        }
                    }
                }
            }

            if (flag_SendMail)
            {
                ////Message
                list_email.Message = "Đã gửi mail thành công.";
            }

            //////tab
            sb.Append("<li class=\"active\"><a href=\"#\"><span>Email Marketing</span></a></li>");
            list_email.Html_link_tab = sb.ToString();

            //////list post
            PagedList<C_Email> lstEmail = emailModel.GetListEmail((int)page, (int)page_size, out total_record);
            list_email.ListEmail = lstEmail;
            list_email.Total_record = total_record;
            list_email.Total_record_on_page = lstEmail.Count();
            list_email.Type_act = type_act;
            list_email.ListTemplate = list_select_tempate;
            //////action
            list_email.Act = act;
            list_email.Ctrl = ctrl;
            list_email.SubjectEmail = subject;
            list_email.BodyEmail = body;

            list_email.Parent_action = HttpContext.Request.RequestContext.RouteData.Values["action"].ToString();
            list_email.Parent_controller = HttpContext.Request.RequestContext.RouteData.Values["controller"].ToString();
            //////end action

            return this.PartialView("../control/list_email", list_email);
        }

        /// <summary>
        /// Lists the email template.
        /// </summary>
        /// <param name="email_id">The email identifier.</param>
        /// <param name="type">The type.</param>
        /// <param name="act">The act.</param>
        /// <param name="ctrl">The control.</param>
        /// <param name="type_act">The type act.</param>
        /// <param name="lang">The language.</param>
        /// <param name="page">The page.</param>
        /// <param name="page_size">Size of the page.</param>
        /// <returns>
        /// List email template
        /// </returns>
        [ChildActionOnly]
        public ActionResult List_emailtemplate(int? email_id, string type, string act, string ctrl, string type_act, string lang, int? page, int? page_size)
        {
            EmailTemplateModels emailModels = new EmailTemplateModels();
            var list_emailtemplate_view = new Web.Areas.Admin.ViewModels.List_emailtemplate_view();
            StringBuilder sb = new StringBuilder();

            int total_record = 0;
            if (string.IsNullOrEmpty(type))
            {
                type = Request.QueryString["type"] != null ? Request.QueryString["type"].ToString() : CommonGlobal.RoleAdmin;
            }

            if (string.IsNullOrEmpty(act))
            {
                act = Request.QueryString["act"] != null ? Request.QueryString["act"].ToString() : "list_post";
            }

            if (string.IsNullOrEmpty(ctrl))
            {
                ctrl = Request.QueryString["ctrl"] != null ? Request.QueryString["ctrl"].ToString() : "adminPost";
            }

            if (page == null || page == 0)
            {
                page = Request.QueryString["page"] != null ? Convert.ToInt32(Request.QueryString["page"].ToString()) : 1;
            }

            if (string.IsNullOrEmpty(lang))
            {
                lang = LanguageModels.ActiveLanguage().LangCultureName;
            }

            if (page_size == null)
            {
                page_size = int.Parse(Util.GetConfigValue("NumberPageSizeAdmin", "30"));
            }

            list_emailtemplate_view.Page = (int)page;
            list_emailtemplate_view.Page_size = (int)page_size;

            ////tab
            sb.Append("<li class=\"active\"><a class=\"active\" href=\"" + Url.Action("index", "dashboard", new { act = "list_emailtemplate", ctrl = "adminEmail", type = type, page = "1" }) + "\"><span><span>Danh sách email template</span></a></li>");
            sb.Append("<li><a href=\"" + Url.Action("index", "dashboard", new { act = "change_emailtemplate", ctrl = "adminEmail", type_act = "add", lang = lang }) + "\"><span><span>Thêm mới</span></span></a></li>");
            list_emailtemplate_view.Html_link_tab = sb.ToString();

            if (email_id != null && email_id != 0 && type_act != null && type_act == CommonGlobal.Delete)
            {
                if (UserModels.CheckPermission(this.Session["mem"] != null ? this.Session["mem"].ToString() : string.Empty, act, ctrl, type_act, type))
                {
                    C_EmailTemplate objEmailTempate = new C_EmailTemplate();
                    objEmailTempate = emailModels.GetEmailTemplateById((int)email_id);
                    if (objEmailTempate != null)
                    {
                        ////delete post
                        bool rt = emailModels.Delete((int)email_id);
                        if (rt)
                        {
                            list_emailtemplate_view.Message = "Bạn đã xóa email template: " + objEmailTempate.name;
                        }
                        else
                        {
                            list_emailtemplate_view.Message = "Xóa không thành công";
                        }
                    }
                    else
                    {
                        list_emailtemplate_view.Message = "Không tìm thấy email template : " + objEmailTempate.name;
                    }
                }
                else
                {
                    list_emailtemplate_view.Message = " Bạn không có quyền thực thi hành động xóa.";
                }
            }
            ////list post
            list_emailtemplate_view.List_page_size = this.GetSizePagingPublic((int)page_size);
            list_emailtemplate_view.Page_list_email_template = emailModels.GetListEmailTemplateAll((int)page, (int)page_size, out total_record);
            list_emailtemplate_view.Total_record = total_record;
            list_emailtemplate_view.Type_act = type_act;
            ////action
            list_emailtemplate_view.Act = act;
            list_emailtemplate_view.Ctrl = ctrl;
            list_emailtemplate_view.Parent_action = HttpContext.Request.RequestContext.RouteData.Values["action"].ToString();
            list_emailtemplate_view.Parent_controller = HttpContext.Request.RequestContext.RouteData.Values["controller"].ToString();
            ////end action

            return this.PartialView("../control/list_emailtemplate", list_emailtemplate_view);
        }
    }
}