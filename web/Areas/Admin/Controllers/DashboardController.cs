namespace Web.Areas.Admin.Controllers
{
    using System;
    using System.Collections.Generic;
    using System.Linq;
    using System.Text;
    using System.Web;
    using System.Web.Mvc;

    using NLog;
    using Web.Areas.Admin.ViewModels;
    using Web.Controllers;
    using Web.Data;
    using Web.Models;

    /// <summary>
    /// dashboard Controller
    /// </summary>
    /// <seealso cref="Web.Controllers.BaseController" />
    public class DashboardController : BaseController
    {
        /// <summary>
        /// The logger
        /// </summary>
        private static Logger logger = LogManager.GetCurrentClassLogger();

        /// <summary>
        /// Accesses the denied.
        /// </summary>
        /// <returns>access denied</returns>
        [ChildActionOnly]
        public ActionResult Access_denied()
        {
            return this.PartialView("../control/access_denied");
        }

        /// <summary>
        /// Admins the menu.
        /// </summary>
        /// <returns>admin menu</returns>
        [ChildActionOnly]
        public ActionResult Admin_menu()
        {
            StringBuilder strData = new StringBuilder();
            UserModels objUserModels = new UserModels();
            var admin_menu_view = new Admin_menu_view();
            using (var data = new Entities())
            {
                List<C_UserPage> lstParent = objUserModels.GetListParentPage();
                if (lstParent.Any())
                {
                    strData.Append(" <ul class=\"nav nav-list\">");
                    foreach (var parent in lstParent)
                    {
                        List<C_UserPage> lstChild = objUserModels.GetListUserPageByParrentID(parent.id);
                        bool isAdd = false;
                        StringBuilder menuChild = new StringBuilder();
                        if (lstChild.Any())
                        {
                            menuChild.Append("<ul class=\"submenu\">");
                            foreach (var child in lstChild)
                            {
                                string url = Url.RouteUrl("admin_default", new { controller = "dashboard", action = "index", act = child.act, ctrl = child.ctrl, type_act = child.TypeAction, type = child.Tye, page = "1", parent = "0" });
                                if (UserModels.CheckPermission(this.Session["mem"] != null ? this.Session["mem"].ToString() : string.Empty, child.act, child.ctrl, child.TypeAction, child.Tye))
                                {
                                    menuChild.Append("<li><a href=\"" + url + "\">" + child.Icon + "</i>" + child.Title + "</a></li>");
                                    isAdd = true;
                                }
                            }

                            menuChild.Append("</ul>");
                        }

                        if (isAdd)
                        {
                            strData.Append("<li>");
                            strData.Append(" <a href=\"#\" class=\"dropdown-toggle\">" + parent.Icon + "<span class=\"menu-text\">" + parent.Title + "</span><b class=\"arrow icon-angle-down\"></b></a>");
                            strData.Append(menuChild);
                            strData.Append("</li>");
                        }
                    }

                    strData.Append("</ul>");
                }
            }

            admin_menu_view.Menu = strData.ToString();

            return this.PartialView("../control/admin_menu", admin_menu_view);
        }

        /// <summary>
        /// Changes the password.
        /// </summary>
        /// <param name="cfcode">The code.</param>
        /// <returns>change password</returns>
        [AcceptVerbs(HttpVerbs.Get)]
        public ActionResult Change_password(string cfcode)
        {
            var login_view = new Login_view();
            login_view.Parent_action = HttpContext.Request.RequestContext.RouteData.Values["action"].ToString();
            login_view.Parent_controller = HttpContext.Request.RequestContext.RouteData.Values["controller"].ToString();
            login_view.Return_url = Url.Action("login", "dashboard", new { area = "admin" });

            if (Request.QueryString["cfcode"] != null && Request.QueryString["cfcode"].ToString() != string.Empty)
            {
                ////client reset pasword
                login_view.Message = App_GlobalResources.Lang.strMessageClientResetPassword;
                login_view.Is_change = 0;
                login_view.Confirm_code = Request.QueryString["cfcode"].ToString();
                return this.PartialView("../page/change_password", login_view);
            }
            else
            {
                ////user change password
                if (!this.CheckAdminlogin())
                {
                    return this.RedirectToAction("login", "dashboard", new { area = "admin" });
                }
                else
                {
                    login_view.Message = App_GlobalResources.Lang.strMessageUserChangePassword;
                    login_view.Is_change = 1;
                    login_view.Confirm_code = string.Empty;
                    return this.PartialView("../page/change_password", login_view);
                }
            }
        }

        /// <summary>
        /// Changes the password.
        /// </summary>
        /// <param name="collection">The collection.</param>
        /// <returns>change password</returns>
        [AcceptVerbs(HttpVerbs.Post)]
        public ActionResult Change_password(FormCollection collection)
        {
            UserModels sv = new UserModels();
            C_User it = new C_User();

            var login_view = new Login_view();
            this.TryUpdateModel(login_view);
            login_view.Parent_action = HttpContext.Request.RequestContext.RouteData.Values["action"].ToString();
            login_view.Parent_controller = HttpContext.Request.RequestContext.RouteData.Values["controller"].ToString();

            if (login_view.Is_change == 1 && string.IsNullOrEmpty(login_view.Confirm_code))
            {
                ////user change password
                it = sv.GetUserbyUserName(login_view.User_name);
                if (it != null && MD5Extend.EncodePassword(login_view.Old_password) == it.Password)
                {
                    if (login_view.Password == login_view.Confirm_password)
                    {
                        it.Password = MD5Extend.EncodePassword(login_view.Password);
                        sv.Update_User(it);
                        login_view.Message = App_GlobalResources.Lang.strMessageChangePasswordSuccess;
                    }
                    else
                    {
                        login_view.Message = App_GlobalResources.Lang.strMessageConfirmPassword;
                    }
                }

                return this.Redirect(login_view.Return_url);
            }
            else if (login_view.Is_change == 0 && (!string.IsNullOrEmpty(login_view.Confirm_code)))
            {
                ////client reset pasword
                if (MD5Extend.EncodePassword(login_view.Code + " " + login_view.User_name) == login_view.Confirm_code)
                {
                    if (login_view.Password == login_view.Confirm_password)
                    {
                        it = sv.GetUserbyUserName(login_view.User_name);
                        it.Password = MD5Extend.EncodePassword(login_view.Password);
                        sv.Update_User(it);
                        login_view.Message = App_GlobalResources.Lang.strMessageChangePasswordSuccess;
                    }
                    else
                    {
                        login_view.Message = App_GlobalResources.Lang.strMessageConfirmPassword;
                    }
                }
                else
                {
                    login_view.Message = App_GlobalResources.Lang.strMessageErrorConfirmCode;
                }

                return this.PartialView("../page/change_password", login_view);
            }
            else
            {
                return this.PartialView("../page/change_password", login_view);
            }
        }

        /// <summary>
        /// Forgot the password.
        /// </summary>
        /// <returns>forgot password</returns>
        [AcceptVerbs(HttpVerbs.Get)]
        public ActionResult Forgot_password()
        {
            if (this.CheckAdminlogin())
            {
                return this.RedirectToAction("index", "dashboard", new { area = "admin" });
            }
            else
            {
                var login_view = new Login_view();
                login_view.Message = App_GlobalResources.Lang.strMessageForgotPassword;
                login_view.Parent_action = HttpContext.Request.RequestContext.RouteData.Values["action"].ToString();
                login_view.Parent_controller = HttpContext.Request.RequestContext.RouteData.Values["controller"].ToString();
                login_view.Return_url = Url.Action("login", "dashboard", new { area = "admin" });
                return this.PartialView("../page/forgot_password", login_view);
            }
        }

        /// <summary>
        /// Forgot the password.
        /// </summary>
        /// <param name="collection">The collection.</param>
        /// <returns>forgot password</returns>
        [AcceptVerbs(HttpVerbs.Post)]
        public ActionResult Forgot_password(FormCollection collection)
        {
            OrderModels orderModels = new OrderModels();
            WebInfoModels web_infor = new WebInfoModels();
            UserModels sv = new UserModels();
            C_User it = new C_User();
            var login_view = new Login_view();
            this.TryUpdateModel(login_view);

            login_view.Parent_action = HttpContext.Request.RequestContext.RouteData.Values["action"].ToString();
            login_view.Parent_controller = HttpContext.Request.RequestContext.RouteData.Values["controller"].ToString();
            login_view.Return_url = Url.Action("login", "dashboard", new { area = "admin" });

            ////check user_name or email
            it = sv.GetUserbyUserName(login_view.User_name);
            if (it != null)
            {
                login_view.Message = App_GlobalResources.Lang.strMessageSendNewPassword;
                string code = GetCodeUniqueKey(8); ////orderModels.getOrderCodeUnique();
                string link = Url.Action("change_password", "dashboard", new { cfcode = MD5Extend.EncodePassword(code + " " + login_view.User_name), area = "admin" });
                //// send email to client
                var strBody_email_client = GeneralModels.GetContent(CommonGlobal.EmailConfirmForgotPassword, Lang).ToString(); ////get from email template
                strBody_email_client = strBody_email_client.Replace("{domain}", Util.GetConfigValue("Domain", Request.UserHostName).ToString());
                strBody_email_client = strBody_email_client.Replace("{store_name}", GeneralModels.GetContent(CommonGlobal.PageName, Lang).ToString());
                strBody_email_client = strBody_email_client.Replace("{email}", web_infor.GetContent(CommonGlobal.Email).ToString());
                strBody_email_client = strBody_email_client.Replace("{email_client}", login_view.User_name);
                strBody_email_client = strBody_email_client.Replace("{code}", code);
                strBody_email_client = strBody_email_client.Replace("{link}", Util.GetConfigValue("Domain", Request.UserHostName).ToString() + link);
                ////send email to email system
                if (login_view.User_name == "Admin")
                {
                    CommonGlobal.SendMail(web_infor.GetContent(CommonGlobal.Email), App_GlobalResources.Lang.strSubjectConfirmForgotPassword + "- " + Util.GetConfigValue("Domain", Request.UserHostName).ToString(), strBody_email_client);
                }
                else
                {
                    CommonGlobal.SendMail(login_view.User_name, App_GlobalResources.Lang.strSubjectConfirmForgotPassword + "- " + Util.GetConfigValue("Domain", Request.UserHostName).ToString(), strBody_email_client);
                }
            }
            else
            {
                login_view.Message = App_GlobalResources.Lang.strMessageForgotPassword;
            }

            return this.PartialView("../page/forgot_password", login_view);
        }

        /// <summary>
        /// Heads this instance.
        /// </summary>
        /// <returns>the head</returns>
        [ChildActionOnly]
        public ActionResult Head()
        {
            int time_hour;
            int time_munite;
            time_hour = DateTime.Now.Hour;
            time_munite = DateTime.Now.Minute;
            string hour, minute;
            hour = time_hour.ToString();
            minute = time_munite.ToString();
            if (time_hour < 10)
            {
                hour = "0" + hour;
            }

            if (time_munite < 10)
            {
                minute = "0" + minute;
            }

            var management_head_view = new Management_head_view();
            management_head_view.User_name = this.Session["mem"] != null ? this.Session["mem"].ToString() : string.Empty;
            management_head_view.Server_time = hour + "h:" + minute;
            management_head_view.Ip_address = HttpContext.Request.ServerVariables["REMOTE_ADDR"].ToString();
            management_head_view.Message = string.Empty;

            return this.PartialView("../control/head", management_head_view);
        }

        /// <summary>
        /// Indexes this instance.
        /// </summary>
        /// <returns>the index</returns>
        [AcceptVerbs(HttpVerbs.Get)]
        public ActionResult Index()
        {
            if (!this.CheckAdminlogin())
            {
                return this.RedirectToAction("login", "dashboard", new { area = "admin" });
            }
            else
            {
                var return_url = Request.Url.ToString();
                var index_view = new Index_view();
                int count = Request.QueryString.Count;
                if (count > 0)
                {
                    string act, ctrl, type_act, type;
                    act = Request.QueryString["act"] != null ? Request.QueryString["act"].ToString() : string.Empty;
                    ctrl = Request.QueryString["ctrl"] != null ? Request.QueryString["ctrl"].ToString() : string.Empty;
                    type_act = Request.QueryString["type_act"] != null ? Request.QueryString["type_act"].ToString() : CommonGlobal.View;
                    type = Request.QueryString["type"] != null ? Request.QueryString["type"].ToString() : string.Empty;
                    if (act != string.Empty && ctrl != string.Empty)
                    {
                        bool isOk = false;
                        UserModels sv = new UserModels();
                        RoleModels roleM = new RoleModels();
                        C_Role itR = new C_Role();
                        C_User itU = new C_User();

                        itU = sv.GetUserbyUserName(Session["mem"].ToString());
                        itR = roleM.GetRoleItem(itU.Role);
                        ////check permission view/add/edit
                        if (ctrl == "adminProduct" && (act == "image_product" || act == "property_product" || act == "list_Rating"))
                        {
                            ////Chỉ được phép thay đổi thuộc tính của sản phẩm nếu có quyền edit product
                            if (UserModels.CheckPermission(this.Session["mem"] != null ? this.Session["mem"].ToString() : string.Empty, "change_product", ctrl, type_act, type) && itR.Role == "Admin")
                            {
                                isOk = true;
                            }
                            else
                            {
                                isOk = false;
                            }
                        }
                        else
                        {
                            if (UserModels.CheckPermission(this.Session["mem"] != null ? this.Session["mem"].ToString() : string.Empty, act, ctrl, type_act, type) && itR.Role == "Admin")
                            {
                                isOk = true;
                            }
                            else
                            {
                                isOk = false;
                            }
                        }

                        if (isOk == true)
                        {
                            index_view.Act = act;
                            index_view.Ctrl = ctrl;
                            index_view.Type_act = type_act;
                            index_view.Type = type;
                        }
                        else
                        {
                            logger.Error(Session["mem"].ToString() + " đã truy cập khu vực không hợp lệ:act = " + act + ",ctrl = " + ctrl + ",type_act= " + type_act + ",type= " + type);
                            index_view.Act = "access_denied";
                            index_view.Ctrl = "dashboard";
                        }
                    }
                    else
                    {
                        logger.Error(Session["mem"].ToString() + " đã truy cập khu vực không hợp lệ:act = " + act + ",ctrl = " + ctrl + ",type_act= " + type_act + ",type= " + type);
                        index_view.Act = "access_denied";
                        index_view.Ctrl = "dashboard";
                    }
                }
                else
                {
                    index_view.Act = "statistic";
                    index_view.Ctrl = "dashboard";
                    index_view.Type_act = CommonGlobal.View;
                    index_view.Type = string.Empty;
                }

                index_view.Return_url = return_url;

                return this.PartialView("../page/index", index_view);
            }
        }

        /// <summary>
        /// Indexes the specified collection.
        /// </summary>
        /// <param name="collection">The collection.</param>
        /// <returns>the index</returns>
        [ValidateInput(false)]
        [AcceptVerbs(HttpVerbs.Post)]
        public ActionResult Index(FormCollection collection)
        {
            var index_view = new Index_view();
            this.TryUpdateModel(index_view);

            if (!this.CheckAdminlogin())
            {
                return this.RedirectToAction("login", "dashboard", new { area = "admin", return_url = index_view.Return_url });
            }
            else
            {
                if (index_view.Act == string.Empty || index_view.Ctrl == string.Empty)
                {
                    index_view.Act = "access_denied";
                    index_view.Ctrl = "dashboard";
                }

                return this.PartialView("../page/index", index_view);
            }
        }

        /// <summary>
        /// Logins the specified return URL.
        /// </summary>
        /// <param name="return_url">The return URL.</param>
        /// <returns>the login</returns>
        [AcceptVerbs(HttpVerbs.Get)]
        public ActionResult Login(string return_url)
        {
            if (this.CheckAdminlogin())
            {
                return this.RedirectToAction("index", "dashboard", new { area = "admin" });
            }
            else
            {
                var login_view = new Login_view();
                login_view.Message = App_GlobalResources.Lang.strMessageLogin;
                login_view.Parent_action = HttpContext.Request.RequestContext.RouteData.Values["action"].ToString();
                login_view.Parent_controller = HttpContext.Request.RequestContext.RouteData.Values["controller"].ToString();
                if (Request.Cookies["UserName"] != null && Request.Cookies["Password"] != null)
                {
                    login_view.User_name = Request.Cookies["UserName"].Value;
                    login_view.Password = Request.Cookies["Password"].Value;
                }

                if (string.IsNullOrEmpty(return_url))
                {
                    login_view.Return_url = Request.UrlReferrer != null ? Request.UrlReferrer.ToString() : string.Empty;
                }
                else
                {
                    login_view.Return_url = return_url;
                }

                return this.PartialView("../page/login", login_view);
            }
        }

        /// <summary>
        /// Logins the specified user name.
        /// </summary>
        /// <param name="user_name">Name of the user.</param>
        /// <param name="password">The password.</param>
        /// <param name="return_url">The return URL.</param>
        /// <param name="remember_me">The remember me.</param>
        /// <returns>the login</returns>
        [AcceptVerbs(HttpVerbs.Post)]
        public ActionResult Login(string user_name, string password, string return_url, bool? remember_me)
        {
            var login_view = new Login_view();
            UserModels sv = new UserModels();
            C_User it = new C_User();
            login_view.Parent_action = HttpContext.Request.RequestContext.RouteData.Values["action"].ToString();
            login_view.Parent_controller = HttpContext.Request.RequestContext.RouteData.Values["controller"].ToString();
            it = sv.GetUserbyUserName(user_name);
            if (remember_me == null)
            {
                remember_me = false;
            }

            if (it != null && MD5Extend.EncodePassword(password) == it.Password)
            {
                this.Session["mem"] = user_name;
                this.Session["role"] = it.Role.ToString();
                it.IP = HttpContext.Request.ServerVariables["REMOTE_ADDR"].ToString();
                it.LastLogin = DateTime.Now;

                ////Client only : If Online = true is client online else is offline
                if (it.Role.ToString() == "2") 
                {
                    login_view.Message = App_GlobalResources.Lang.mess403;
                    login_view.Return_url = return_url;

                    return this.PartialView("../page/login", login_view);
                }
                else if (it.Role.ToString() == "1" && it.Online == true) 
                {
                    ////Admin only : If Online = true is active else is disable login
                    sv.Update_User(it);
                    this.Session["acc"] = user_name;
                    this.SetAccountCookies(user_name, user_name, it.Role.ToString(), 12);

                    return this.RedirectToAction("index", "dashboard", new { area = "admin" });
                }
                else
                {
                    login_view.Message = App_GlobalResources.Lang.mess403;
                    login_view.Return_url = return_url;
                    return this.PartialView("../page/login", login_view);
                }
            }
            else
            {
                login_view.Message = App_GlobalResources.Lang.messLoginFail;
                login_view.Return_url = return_url;
                return this.PartialView("../page/login", login_view);
            }
        }

        /// <summary>
        /// Logouts this instance.
        /// </summary>
        /// <returns>the logout</returns>
        public ActionResult Logout()
        {
            if (this.CheckAdminlogin())
            {
                UserModels sv = new UserModels();
                C_User it = new C_User();
                it.Username = Session["mem"].ToString();
                it = sv.GetUserbyUserName(it.Username);
                it.IP = HttpContext.Request.ServerVariables["REMOTE_ADDR"].ToString();
                sv.Update_User(it);
                this.Session["acc"] = string.Empty;
                this.Session["mem"] = string.Empty;
                this.Session["role"] = string.Empty;
                string[] myCookies = Request.Cookies.AllKeys;
                foreach (string ck in myCookies)
                {
                    var check = Request.Cookies[ck].Expires;
                    Response.Cookies[ck].Expires = DateTime.Now.AddDays(-1);
                }

                return this.RedirectToAction("login", "dashboard");
            }
            else
            {
                return this.RedirectToAction("login", "dashboard");
            }
        }

        /// <summary>
        /// Statistics this instance.
        /// </summary>
        /// <returns>the statistic</returns>
        [ChildActionOnly]
        public ActionResult Statistic()
        {
            RatingModels ratingModels = new RatingModels();
            ContactModels contactModels = new ContactModels();
            var statistic_view = new Statistic_view();
            ////Thống kê truy cập theo tháng trong năm (lấy 12 tháng gần nhất)
            List<C_Statistic> arrAll = new List<C_Statistic>();
            arrAll = StatisticModels.ListAll();

            StringBuilder sb = new StringBuilder();
            for (int j = 0; j < arrAll.Count; j++)
            {
                if (j < arrAll.Count - 1)
                {
                    sb.Append("[gd(" + arrAll[j].year + ", " + arrAll[j].month + ",1), " + arrAll[j].SoTruyCap + "],");
                }
                else
                {
                    sb.Append("[gd(" + arrAll[j].year + ", " + arrAll[j].month + ",1), " + arrAll[j].SoTruyCap + "]");
                }
            }

            statistic_view.Chart_text = HttpUtility.HtmlEncode(sb.ToString());

            ////Danh sách review và bình luận mới sản phẩm mới nhất
            statistic_view.List_rating_last = ratingModels.GetListRatingLast();
            statistic_view.List_contact_last = contactModels.GetListContactLast();

            return this.PartialView("../control/statistic", statistic_view);
        }
    }
}