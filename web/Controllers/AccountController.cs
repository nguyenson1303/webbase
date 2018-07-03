namespace Web.Controllers
{
    using System;
    using System.Collections;
    using System.Collections.Specialized;
    using System.Net;
    using System.Web.Mvc;
    using System.Web.Script.Serialization;
    using ASPSnippets.GoogleAPI;
    using Newtonsoft.Json;
    using Newtonsoft.Json.Linq;
    using NLog;
    using Web.Data;
    using Web.Models;
    using Web.ViewModels;

    /// <summary>
    /// account Controller
    /// </summary>
    /// <seealso cref="Web.Controllers.BaseController" />
    public class AccountController : BaseController
    {
        /// <summary>
        /// The logger
        /// </summary>
        private static Logger logger = LogManager.GetCurrentClassLogger();

        /// <summary>
        /// Gets the redirect URI.
        /// </summary>
        /// <value>
        /// The redirect URI.
        /// </value>
        private Uri RedirectUri
        {
            get
            {
                var uriBuilder = new UriBuilder(Request.Url);
                uriBuilder.Query = null;
                uriBuilder.Fragment = null;
                uriBuilder.Path = Url.Action("FacebookCallback");
                return uriBuilder.Uri;
            }
        }

        /// <summary>
        /// Changes the password.
        /// </summary>
        /// <param name="cfcode">The order code.</param>
        /// <returns>change password</returns>
        [AcceptVerbs(HttpVerbs.Get)]
        public ActionResult Change_password(string cfcode)
        {
            string strBread;
            ViewBag.Title = App_GlobalResources.Lang.strChangePassword + " | " + GeneralModels.GetContent(CommonGlobal.PageName, this.Lang);
            strBread = "<li>" + App_GlobalResources.Lang.strChangePassword + "</li>";
            ViewBag.heading = App_GlobalResources.Lang.strChangePassword;
            ViewBag.str_breadcrumbs = strBread;

            var login_view = new Login_view();
            login_view.ParentAction = HttpContext.Request.RequestContext.RouteData.Values["action"].ToString();
            login_view.ParentController = HttpContext.Request.RequestContext.RouteData.Values["controller"].ToString();
            login_view.ReturnUrl = Url.Action("login", "account");

            if (Request.QueryString["cfcode"] != null && Request.QueryString["cfcode"].ToString() != string.Empty)
            {
                ////client reset pasword
                login_view.Message = App_GlobalResources.Lang.strMessageClientResetPassword;
                login_view.IsChange = 0;
                login_view.ConfirmCode = Request.QueryString["cfcode"].ToString();

                return this.PartialView("../page/change_password", login_view);
            }
            else
            {
                ////user change password
                if (!this.CheckMemberlogin())
                {
                    return this.RedirectToAction("index", "home");
                }
                else
                {
                    login_view.Message = App_GlobalResources.Lang.strMessageUserChangePassword;
                    login_view.IsChange = 1;
                    login_view.ConfirmCode = string.Empty;

                    return this.PartialView("../page/change_password", login_view);
                }
            }
        }

        /// <summary>
        /// Changes the password.
        /// </summary>
        /// <param name="collection">The collection.</param>
        /// <returns>Change password</returns>
        [AcceptVerbs(HttpVerbs.Post)]
        public ActionResult Change_password(FormCollection collection)
        {
            UserModels sv = new UserModels();
            C_User it = new C_User();
            string strBread;
            ViewBag.Title = App_GlobalResources.Lang.strChangePassword + " | " + GeneralModels.GetContent(CommonGlobal.PageName, this.Lang);
            strBread = "<li>" + App_GlobalResources.Lang.strChangePassword + "</li>";
            ViewBag.heading = App_GlobalResources.Lang.strChangePassword;
            ViewBag.str_breadcrumbs = strBread;

            var login_view = new Login_view();
            this.TryUpdateModel(login_view);
            login_view.ParentAction = HttpContext.Request.RequestContext.RouteData.Values["action"].ToString();
            login_view.ParentController = HttpContext.Request.RequestContext.RouteData.Values["controller"].ToString();

            if (login_view.IsChange == 1 && string.IsNullOrEmpty(login_view.ConfirmCode) && (!string.IsNullOrEmpty(login_view.Password)) && (!string.IsNullOrEmpty(login_view.ConfirmPassword)))
            {
                ////user change password
                it = sv.GetUserbyUserName(login_view.UserName);
                if (it != null && MD5Extend.EncodePassword(login_view.OldPassword) == it.Password)
                {
                    if (login_view.Password == login_view.ConfirmPassword)
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
            }
            else if (login_view.IsChange == 0 && (!string.IsNullOrEmpty(login_view.ConfirmCode)) && (!string.IsNullOrEmpty(login_view.Password)) && (!string.IsNullOrEmpty(login_view.ConfirmPassword)))
            {
                ////client reset pasword
                if (MD5Extend.EncodePassword(login_view.Code + " " + login_view.UserName) == login_view.ConfirmCode)
                {
                    if (login_view.Password == login_view.ConfirmPassword)
                    {
                        it = sv.GetUserbyUserName(login_view.UserName);
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
            }

            return this.PartialView("../page/change_password", login_view);
        }

        /// <summary>
        /// Facebooks the specified return URL.
        /// </summary>
        /// <param name="return_url">The return URL.</param>
        /// <returns>call Facebook</returns>
        [AllowAnonymous]
        public ActionResult Facebook(string return_url)
        {
            var fb = new Facebook.FacebookClient();
            var loginUrl = fb.GetLoginUrl(new
            {
                client_id = Util.GetConfigValue("AppFaceBookID", string.Empty),
                client_secret = Util.GetConfigValue("AppFacebookSecret", string.Empty),
                redirect_uri = this.RedirectUri.AbsoluteUri,
                response_type = "code",
                scope = "email" //// Add other permissions as needed
            });
            if (Url.IsLocalUrl(return_url))
            {
                this.Session["FaceBook_return"] = return_url;
            }

            return this.Redirect(loginUrl.AbsoluteUri);
        }

        /// <summary>
        /// Facebook the callback.
        /// </summary>
        /// <param name="code">The code.</param>
        /// <returns>Facebook Call back</returns>
        public ActionResult FacebookCallback(string code)
        {
            var fb = new Facebook.FacebookClient();
            dynamic result = fb.Post("oauth/access_token", new { client_id = Util.GetConfigValue("AppFaceBookID", string.Empty), client_secret = Util.GetConfigValue("AppFacebookSecret", string.Empty), redirect_uri = this.RedirectUri.AbsoluteUri, code = code });

            var accessToken = result.access_token;

            //// Store the access token in the session for farther use
            this.Session["AccessToken"] = accessToken;

            //// update the facebook client with the access token so
            //// we can make requests on behalf of the user
            fb.AccessToken = accessToken;

            //// Get the user's information
            dynamic me = fb.Get("me?fields=first_name,middle_name,last_name,id,email");
            string email = me.email;
            string firstname = me.first_name;
            string middlename = me.middle_name;
            string lastname = me.last_name;
            string ids = me.id;

            //// Set the auth cookie
            ////FormsAuthentication.SetAuthCookie(email, false);

            UserModels sv = new UserModels();
            C_User it = new C_User();
            C_UserInfo iit = new C_UserInfo();
            it = sv.GetUserbyUserName(email);
            if (it == null)
            {
                it = new C_User();
                string rt = string.Empty;
                bool infors = false;
                it.Username = email;
                it.Role = 2;
                it.Password = MD5Extend.EncodePassword("123456");
                it.Online = true;
                it.IP = HttpContext.Request.ServerVariables["REMOTE_ADDR"].ToString();
                it.LastLogin = DateTime.Now;
                rt = sv.Add_User(it);

                iit.FName = firstname;
                iit.Email = email;
                iit.LName = middlename;
                iit.DateRegister = DateTime.Now;
                iit.EventId = string.IsNullOrEmpty(ids) != false ? int.Parse(ids) : 0;
                iit.Note = "Facebook login";
                infors = sv.Add_User_Infor(iit);

                if (rt.Length > 0 && infors == true)
                {
                    ////register_view.message = Lang.strMessageLogin;
                    this.Session["acc"] = iit.FName;
                    this.Session["mem"] = rt;
                    this.Session["role"] = it.Role.ToString();
                    this.SetAccountCookies(iit.FName, rt, it.Role.ToString(), 6);
                }
            }
            else
            {
                iit = sv.GetUserInforByEmail(email);
                this.Session["acc"] = iit.FName;
                this.Session["mem"] = it.Username;
                this.Session["role"] = it.Role.ToString();
                this.SetAccountCookies(iit.FName, it.Username, it.Role.ToString(), 6);
                it.Online = true;
                it.IP = HttpContext.Request.ServerVariables["REMOTE_ADDR"].ToString();
                it.LastLogin = DateTime.Now;
                sv.Update_User(it);
            }

            if (this.Session["FaceBook_return"] != null && Url.IsLocalUrl(this.Session["FaceBook_return"].ToString()))
            {
                return this.Redirect(Session["FaceBook_return"].ToString());
            }
            else
            {
                return this.RedirectToAction("index", "home");
            }
        }

        /// <summary>
        /// Forgot the password.
        /// </summary>
        /// <returns>forgot password</returns>
        [AcceptVerbs(HttpVerbs.Get)]
        public ActionResult Forgot_password()
        {
            if (this.CheckMemberlogin())
            {
                return this.RedirectToAction("index", "home");
            }
            else
            {
                string strBread;
                ViewBag.Title = App_GlobalResources.Lang.strForgotPassword + " | " + GeneralModels.GetContent(CommonGlobal.PageName, this.Lang);
                strBread = "<li>" + App_GlobalResources.Lang.strForgotPassword + "</li>";
                ViewBag.heading = App_GlobalResources.Lang.strForgotPassword;
                ViewBag.str_breadcrumbs = strBread;

                var login_view = new Login_view();
                login_view.Message = App_GlobalResources.Lang.strMessageForgotPassword;
                login_view.ParentAction = HttpContext.Request.RequestContext.RouteData.Values["action"].ToString();
                login_view.ParentController = HttpContext.Request.RequestContext.RouteData.Values["controller"].ToString();
                login_view.ReturnUrl = Url.Action("login", "account");

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
            WebInfoModels web_infor = new Models.WebInfoModels();
            UserModels sv = new UserModels();
            C_User it = new C_User();
            var login_view = new Login_view();
            this.TryUpdateModel(login_view);
            string strBread;
            ViewBag.Title = App_GlobalResources.Lang.strForgotPassword + " | " + GeneralModels.GetContent(CommonGlobal.PageName, this.Lang);
            strBread = "<li>" + App_GlobalResources.Lang.strForgotPassword + "</li>";
            ViewBag.heading = App_GlobalResources.Lang.strForgotPassword;
            ViewBag.str_breadcrumbs = strBread;

            login_view.ParentAction = HttpContext.Request.RequestContext.RouteData.Values["action"].ToString();
            login_view.ParentController = HttpContext.Request.RequestContext.RouteData.Values["controller"].ToString();
            login_view.ReturnUrl = Url.Action("login", "account");

            ////check user_name or email
            it = sv.GetUserbyUserName(login_view.UserName);
            if (it != null)
            {
                login_view.Message = App_GlobalResources.Lang.strMessageSendNewPassword;
                string code = GetCodeUniqueKey(8); ////orderModels.getOrderCodeUnique();
                string link = Url.Action("change_password", "account", new { cfcode = MD5Extend.EncodePassword(code + " " + login_view.UserName) });
                //// send email to client
                var strBody_email_client = GeneralModels.GetContent(CommonGlobal.EmailConfirmForgotPassword, Lang).ToString(); ////get from email template
                strBody_email_client = strBody_email_client.Replace("{domain}", Util.GetConfigValue("Domain", Request.UserHostName).ToString());
                strBody_email_client = strBody_email_client.Replace("{store_name}", GeneralModels.GetContent(CommonGlobal.PageName, Lang).ToString());
                strBody_email_client = strBody_email_client.Replace("{email}", web_infor.GetContent(CommonGlobal.Email).ToString());
                strBody_email_client = strBody_email_client.Replace("{email_client}", login_view.UserName);
                strBody_email_client = strBody_email_client.Replace("{code}", code);
                strBody_email_client = strBody_email_client.Replace("{link}", Util.GetConfigValue("Domain", Request.UserHostName).ToString() + link);

                CommonGlobal.SendMail(login_view.UserName, App_GlobalResources.Lang.strSubjectConfirmForgotPassword + "- " + Util.GetConfigValue("Domain", Request.UserHostName).ToString(), strBody_email_client);
            }
            else
            {
                login_view.Message = App_GlobalResources.Lang.strMessageForgotPassword;
            }

            return this.PartialView("../page/forgot_password", login_view);
        }

        /// <summary>
        /// Google the specified return URL.
        /// </summary>
        /// <param name="return_url">The return URL.</param>
        /// <returns>call Google</returns>
        public ActionResult Google(string return_url)
        {
            GoogleConnect.ClientId = Util.GetConfigValue("AppGoogleID", string.Empty);
            GoogleConnect.ClientSecret = Util.GetConfigValue("AppGoogleSecret", string.Empty);
            GoogleConnect.RedirectUri = Util.GetConfigValue("Domain", string.Empty) + Url.Action("GoogleCallback", "account"); 
            if (Url.IsLocalUrl(return_url))
            {
                this.Session["Google_return"] = return_url;
            }

            GoogleConnect.Authorize("profile", "email");
            return null;
        }

        /// <summary>
        /// Google the callback.
        /// </summary>
        /// <returns>Google Call back</returns>
        public ActionResult GoogleCallback()
        {
            GoogleConnect.ClientId = Util.GetConfigValue("AppGoogleID", string.Empty);
            GoogleConnect.ClientSecret = Util.GetConfigValue("AppGoogleSecret", string.Empty);

            if (!string.IsNullOrEmpty(Request.QueryString["code"]))
            {
                string code = Request.QueryString["code"];
                string json = GoogleConnect.Fetch("me", code);
                GoogleProfile profile = new JavaScriptSerializer().Deserialize<GoogleProfile>(json);

                UserModels sv = new UserModels();
                C_User it = new C_User();
                C_UserInfo iit = new C_UserInfo();
                it = sv.GetUserbyUserName(profile.Emails.Find(email => email.Type == "account").Value);
                if (it == null)
                {
                    it = new C_User();
                    string rt = string.Empty;
                    bool infors = false;
                    it.Username = profile.Emails.Find(email => email.Type == "account").Value;
                    it.Role = 2;
                    it.Password = MD5Extend.EncodePassword("123456");
                    it.Online = true;
                    it.IP = HttpContext.Request.ServerVariables["REMOTE_ADDR"].ToString();
                    it.LastLogin = DateTime.Now;
                    rt = sv.Add_User(it);

                    iit.FName = profile.DisplayName;
                    iit.Email = profile.Emails.Find(email => email.Type == "account").Value;
                    ////iit.LName = middlename;
                    iit.DateRegister = DateTime.Now;
                    ////iit.EventId = string.IsNullOrEmpty(ids) != false ? int.Parse(ids) : 0;
                    iit.Note = "Google login";
                    infors = sv.Add_User_Infor(iit);

                    if (rt.Length > 0 && infors == true)
                    {
                        ////register_view.message = Lang.strMessageLogin;
                        this.Session["acc"] = iit.FName;
                        this.Session["mem"] = rt;
                        this.Session["role"] = it.Role.ToString();
                        this.SetAccountCookies(iit.FName, rt, it.Role.ToString(), 6);
                    }
                }
                else
                {
                    iit = sv.GetUserInforByEmail(profile.Emails.Find(email => email.Type == "account").Value);
                    this.Session["acc"] = iit.FName;
                    this.Session["mem"] = it.Username;
                    this.Session["role"] = it.Role.ToString();
                    this.SetAccountCookies(iit.FName, it.Username, it.Role.ToString(), 6);
                    it.Online = true;
                    it.IP = HttpContext.Request.ServerVariables["REMOTE_ADDR"].ToString();
                    it.LastLogin = DateTime.Now;
                    sv.Update_User(it);
                }

                ////lblId.Text = profile.Id;
                ////lblName.Text = profile.DisplayName;
                ////lblEmail.Text = profile.Emails.Find(email => email.Type == "account").Value;
                ////lblGender.Text = profile.Gender;
                ////lblType.Text = profile.ObjectType;
                ////ProfileImage.ImageUrl = profile.Image.Url;
                if (Request.QueryString["error"] == "access_denied")
                {
                    ////login fail
                    logger.Error("Error requesting OAuth user data from Google:" + Request.QueryString["error"]);
                }

                if (this.Session["Google_return"] != null && Url.IsLocalUrl(this.Session["Google_return"].ToString()))
                {
                    return this.Redirect(Session["Google_return"].ToString());
                }
                else
                {
                    return this.RedirectToAction("index", "home");
                }
            }
            else
            {
                return this.RedirectToAction("index", "home");
            }
        }

        /// <summary>
        /// the Instagrams the specified return URL.
        /// </summary>
        /// <param name="return_url">The return URL.</param>
        /// <returns>the Instagram</returns>
        public ActionResult Instagram(string return_url)
        {
            var client_id = Util.GetConfigValue("AppInstagramID", string.Empty);
            var redirect_uri = Util.GetConfigValue("AppIstagramReturn", string.Empty);
            if (Url.IsLocalUrl(return_url))
            {
                this.Session["Instagram_return"] = return_url;
            }

            return this.Redirect("https://api.instagram.com/oauth/authorize/?client_id=" + client_id + "&redirect_uri=" + redirect_uri + "&response_type=code");
        }

        /// <summary>
        /// Instagrams the callback.
        /// </summary>
        /// <returns>the Instagram Call back</returns>
        public ActionResult InstagramCallback()
        {
            if (!string.IsNullOrEmpty(Request.QueryString["code"]))
            {
                string code = Request.QueryString["code"];
                try
                {
                    NameValueCollection parameters = new NameValueCollection();
                    parameters.Add("client_id", Util.GetConfigValue("AppInstagramID", string.Empty));
                    parameters.Add("client_secret", Util.GetConfigValue("AppInstagramSecret", string.Empty));
                    parameters.Add("grant_type", "authorization_code");
                    parameters.Add("redirect_uri", Util.GetConfigValue("AppIstagramReturn", string.Empty));
                    parameters.Add("code", code);

                    WebClient client = new WebClient();
                    var result = client.UploadValues("https://api.instagram.com/oauth/access_token", "POST", parameters);
                    var response = System.Text.Encoding.Default.GetString(result);

                    //// deserializing nested JSON string to object
                    var javascriptResult = (JObject)JsonConvert.DeserializeObject(response);
                    string accessToken = (string)javascriptResult["access_token"];
                    string id = (string)javascriptResult["user"]["id"];
                    string username_client = (string)javascriptResult["user"]["username"];
                    string fullname_client = (string)javascriptResult["user"]["full_name"];

                    ////This code register id and access token to get on client side
                    ////Page.ClientScript.RegisterStartupScript(this.GetType(), "GetToken", "<script>var instagramaccessid=\"" + @"" + id + "" + "\"; var instagramaccesstoken=\"" + @"" + accessToken + "" + "\";</script>");
                    UserModels sv = new UserModels();
                    C_User it = new C_User();
                    C_UserInfo iit = new C_UserInfo();
                    it = sv.GetUserbyUserName(username_client);
                    if (it == null)
                    {
                        it = new C_User();
                        string rt = string.Empty;
                        bool infors = false;
                        it.Username = username_client;
                        it.Role = 2;
                        it.Password = MD5Extend.EncodePassword("123456");
                        it.Online = true;
                        it.IP = HttpContext.Request.ServerVariables["REMOTE_ADDR"].ToString();
                        it.LastLogin = DateTime.Now;
                        rt = sv.Add_User(it);

                        iit.FName = fullname_client;
                        iit.Email = username_client;
                        ////iit.LName = middlename;
                        iit.DateRegister = DateTime.Now;
                        ////iit.EventId = string.IsNullOrEmpty(ids) != false ? int.Parse(ids) : 0;
                        iit.Note = "Instagram login";
                        infors = sv.Add_User_Infor(iit);

                        if (rt.Length > 0 && infors == true)
                        {
                            ////register_view.message = Lang.strMessageLogin;
                            this.Session["acc"] = iit.FName;
                            this.Session["mem"] = rt;
                            this.Session["role"] = it.Role.ToString();
                            this.SetAccountCookies(iit.FName, rt, it.Role.ToString(), 6);
                        }
                    }
                    else
                    {
                        iit = sv.GetUserInforByEmail(username_client);
                        this.Session["acc"] = iit.FName;
                        this.Session["mem"] = it.Username;
                        this.Session["role"] = it.Role.ToString();
                        this.SetAccountCookies(iit.FName, it.Username, it.Role.ToString(), 6);
                        it.Online = true;
                        it.IP = HttpContext.Request.ServerVariables["REMOTE_ADDR"].ToString();
                        it.LastLogin = DateTime.Now;
                        sv.Update_User(it);
                    }

                    if (this.Session["Instagram_return"] != null && Url.IsLocalUrl(this.Session["Instagram_return"].ToString()))
                    {
                        return this.Redirect(this.Session["Instagram_return"].ToString());
                    }
                    else
                    {
                        return this.RedirectToAction("index", "home");
                    }
                }
                catch (Exception)
                {
                    throw;
                }
            }
            else
            {
                return this.RedirectToAction("index", "home");
            }
        }

        /// <summary>
        /// Logins the specified return URL.
        /// </summary>
        /// <param name="return_url">The return URL.</param>
        /// <returns>action login</returns>
        [AcceptVerbs(HttpVerbs.Get)]
        public ActionResult Login(string return_url)
        {
            if (this.CheckMemberlogin())
            {
                return this.RedirectToAction("index", "home");
            }
            else
            {
                string strBread;
                ViewBag.Title = App_GlobalResources.Lang.strLogin + " | " + GeneralModels.GetContent(CommonGlobal.PageName, this.Lang);
                strBread = "<li>" + App_GlobalResources.Lang.strLogin + "</li>";
                ViewBag.heading = App_GlobalResources.Lang.strLogin;
                ViewBag.str_breadcrumbs = strBread;

                var login_view = new Login_view();
                login_view.Message = App_GlobalResources.Lang.strMessageLogin;
                login_view.ParentAction = HttpContext.Request.RequestContext.RouteData.Values["action"].ToString();
                login_view.ParentController = HttpContext.Request.RequestContext.RouteData.Values["controller"].ToString();
                if (string.IsNullOrEmpty(return_url))
                {
                    login_view.ReturnUrl = Request.UrlReferrer != null ? Request.UrlReferrer.ToString() : string.Empty;
                }
                else
                {
                    login_view.ReturnUrl = return_url;
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
        /// <returns>the login</returns>
        [AcceptVerbs(HttpVerbs.Post)]
        public ActionResult Login(string user_name, string password, string return_url)
        {
            var login_view = new Login_view();
            UserModels sv = new UserModels();
            C_User it = new C_User();
            C_UserInfo iit = new C_UserInfo();
            login_view.ParentAction = HttpContext.Request.RequestContext.RouteData.Values["action"].ToString();
            login_view.ParentController = HttpContext.Request.RequestContext.RouteData.Values["controller"].ToString();
            it = sv.GetUserbyUserName(user_name);
            if (it != null && MD5Extend.EncodePassword(password) == it.Password)
            {
                iit = sv.GetUserInforByEmail(user_name);
                if (iit != null)
                {
                    this.Session["acc"] = iit.FName + ' ' + iit.LName;
                    this.Session["mem"] = user_name;
                    this.Session["role"] = it.Role.ToString();
                    this.SetAccountCookies(iit.FName, user_name, it.Role.ToString(), 6);
                    it.Online = true;
                    it.IP = HttpContext.Request.ServerVariables["REMOTE_ADDR"].ToString();
                    it.LastLogin = DateTime.Now; 
                    sv.Update_User(it);
                    if (it.Role.ToString() == "2" && it.Online == true)
                    {
                        if (this.Session["acc"] == null) {
                            this.Session["acc"] = it.Username;
                        }

                        if (Url.IsLocalUrl(return_url))
                        {
                            return this.Redirect(return_url);
                        }
                        else
                        {
                            return this.RedirectToAction("my_account", "account");
                        }
                    }
                    else if (it.Role.ToString() == "1" && it.Online == true)
                    {
                        return this.RedirectToAction("index", "dashboard", new { area = "admin" });
                    }
                    else
                    {
                        login_view.Message = App_GlobalResources.Lang.mess403;
                        login_view.ReturnUrl = return_url;
                        return this.PartialView("../page/login", login_view);
                    }
                }
                else
                {
                    login_view.Message = App_GlobalResources.Lang.mess403;
                    login_view.ReturnUrl = return_url;
                    return this.PartialView("../page/login", login_view);
                }                
            }
            else
            {
                login_view.Message = App_GlobalResources.Lang.messLoginFail;
                login_view.ReturnUrl = return_url;
                return this.PartialView("../page/login", login_view);
            }
        }

        /// <summary>
        /// Logouts this instance.
        /// </summary>
        /// <returns>the logout</returns>
        public ActionResult Logout()
        {
            try
            {
                UserModels sv = new UserModels();
                C_User it = new C_User();
                it.Username = Session["mem"].ToString();
                it = sv.GetUserbyUserName(it.Username);
                if (it.Role != 1)
                {
                    it.Online = false;
                }

                it.IP = HttpContext.Request.ServerVariables["REMOTE_ADDR"].ToString();
                sv.Update_User(it);
                this.Session["acc"] = null;
                this.Session["mem"] = null;
                this.Session["role"] = null;
                string[] myCookies = Request.Cookies.AllKeys;
                foreach (string ck in myCookies)
                {
                    var check = Request.Cookies[ck].Expires;
                    Response.Cookies[ck].Expires = DateTime.Now.AddDays(-1);
                }
            }
            catch
            {
                return this.RedirectToAction("index", "home");
            }

            return this.RedirectToAction("index", "home");
        }

        /// <summary>
        /// Menus the account head.
        /// </summary>
        /// <returns>menu account head</returns>
        [ChildActionOnly]
        public ActionResult Menu_account_head()
        {
            WebInfoModels web_infor = new Models.WebInfoModels();
            ViewBag.hotline = web_infor.GetContent(CommonGlobal.Hotline);
            ViewBag.email = web_infor.GetContent(CommonGlobal.Email);
            ViewBag.address = GeneralModels.GetContent(CommonGlobal.Address, this.Lang);
            ViewBag.slogan = GeneralModels.GetContent(CommonGlobal.Slogan, this.Lang);
            ViewBag.facebook = web_infor.GetContent(CommonGlobal.Facebook);

            return this.PartialView("../control/menu_account_head");
        }

        /// <summary>
        /// Menus my account.
        /// </summary>
        /// <returns>menu my account</returns>
        [ChildActionOnly]
        public ActionResult Menu_my_account()
        {
            return this.PartialView("../control/menu_my_account");
        }

        /// <summary>
        /// the account.
        /// </summary>
        /// <returns>my account</returns>
        [AcceptVerbs(HttpVerbs.Get)]
        public ActionResult My_account()
        {
            if (!this.CheckMemberlogin())
            {
                return this.RedirectToAction("login", "account", new { return_url = string.Empty + Url.Action("my_account", "account") });
            }
            else
            {
                UserModels sv = new UserModels();
                C_UserInfo iit = new C_UserInfo();
                string strBread;
                ViewBag.Title = App_GlobalResources.Lang.strMyAccount + " | " + GeneralModels.GetContent(CommonGlobal.PageName, this.Lang);
                strBread = "<li>" + App_GlobalResources.Lang.strMyAccount + "</li>";
                ViewBag.heading = App_GlobalResources.Lang.strMyAccount;
                ViewBag.str_breadcrumbs = strBread;
                this.AddMeta(CommonGlobal.Keyword, App_GlobalResources.Lang.strMyAccount);
                this.AddMeta(CommonGlobal.Description, App_GlobalResources.Lang.strMyAccount);

                iit = sv.GetUserInforByEmail(Session["mem"].ToString());
                var register_view = new Register_view();
                register_view.Message = string.Empty;
                register_view.Parent_action = HttpContext.Request.RequestContext.RouteData.Values["action"].ToString();
                register_view.Parent_controller = HttpContext.Request.RequestContext.RouteData.Values["controller"].ToString();
                if (iit == null)
                {
                    return this.RedirectToAction("login", "account", new { return_url = string.Empty + Url.Action("my_account", "account") });
                }
                else
                {
                    register_view.FirstName = iit.FName;
                    register_view.Address = iit.Address;
                    register_view.Phone = iit.Phone;
                }

                if (iit.Birthday != null)
                {
                    register_view.Birthday = Convert.ToDateTime(iit.Birthday).ToString("dd/M/yyyy").Replace('-', '/');
                }

                register_view.Email = iit.Email;

                return this.PartialView("../page/my_account", register_view);
            }
        }

        /// <summary>
        /// the account.
        /// </summary>
        /// <param name="collection">The collection.</param>
        /// <returns>my account</returns>
        [AcceptVerbs(HttpVerbs.Post)]
        public ActionResult My_account(FormCollection collection)
        {
            if (!this.CheckMemberlogin())
            {
                return this.RedirectToAction("login", "account", new { return_url = string.Empty + Url.Action("my_account", "account") });
            }
            else
            {
                var register_view = new Register_view();
                this.TryUpdateModel(register_view);
                UserModels sv = new UserModels();
                C_User it = new C_User();
                C_UserInfo iit = new C_UserInfo();
                register_view.Parent_action = HttpContext.Request.RequestContext.RouteData.Values["action"].ToString();
                register_view.Parent_controller = HttpContext.Request.RequestContext.RouteData.Values["controller"].ToString();
                if (HttpContext.Session["captchastring"] != null && register_view.Code == HttpContext.Session["captchastring"].ToString())
                {
                    bool infors = false;

                    iit.FName = register_view.FirstName;
                    iit.Email = register_view.Email;
                    iit.Address = register_view.Address;
                    if (!string.IsNullOrEmpty(register_view.Birthday))
                    {
                        iit.Birthday = DateTime.Parse(register_view.Birthday);
                    }

                    iit.Phone = register_view.Phone;

                    infors = sv.Add_User_Infor(iit);

                    if (infors == true)
                    {
                        register_view.Message = App_GlobalResources.Lang.strMessageUpdateInforSuccess;
                    }
                    else
                    {
                        register_view.Message = App_GlobalResources.Lang.messErrorRegister;
                    }
                }
                else
                {
                    register_view.Message = App_GlobalResources.Lang.messCaptcha;
                }

                return this.PartialView("../page/my_account", register_view);
            }
        }

        /// <summary>
        /// Orders the history.
        /// </summary>
        /// <returns>order history</returns>
        public ActionResult Order_history()
        {
            if (!this.CheckMemberlogin())
            {
                return this.RedirectToAction("login", "account", new { return_url = string.Empty + Url.Action("order_history", "account") });
            }
            else
            {
                string strBread;
                ViewBag.Title = App_GlobalResources.Lang.strOrderHistory + " | " + GeneralModels.GetContent(CommonGlobal.PageName, this.Lang);
                strBread = "<li>" + App_GlobalResources.Lang.strOrderHistory + "</li>";
                ViewBag.heading = App_GlobalResources.Lang.strOrderHistory;
                ViewBag.str_breadcrumbs = strBread;
                this.AddMeta(CommonGlobal.Keyword, App_GlobalResources.Lang.strOrderHistory);
                this.AddMeta(CommonGlobal.Description, App_GlobalResources.Lang.strOrderHistory);

                return this.PartialView("../page/order_history");
            }
        }

        /// <summary>
        /// Orders the list.
        /// </summary>
        /// <returns>order list</returns>
        [AcceptVerbs(HttpVerbs.Get)]
        public ActionResult Order_list()
        {
            if (!this.CheckMemberlogin())
            {
                return this.RedirectToAction("login", "account", new { return_url = string.Empty + Url.Action("order_history", "account") });
            }
            else
            {
                int page = 1; ////start page
                int page_size = int.Parse(Util.GetConfigValue("NumberPageSizeDefault", "9")); ////start page size
                return this.Order_list(page, page_size);
            }
        }

        /// <summary>
        /// Orders the list.
        /// </summary>
        /// <param name="page">The page.</param>
        /// <param name="page_size">Size of the page.</param>
        /// <returns>order list</returns>
        [AcceptVerbs(HttpVerbs.Post)]
        public ActionResult Order_list(int? page, int? page_size)
        {
            if (!this.CheckMemberlogin())
            {
                return this.RedirectToAction("login", "account", new { return_url = string.Empty + Url.Action("order_history", "account") });
            }
            else
            {
                var order_history_view = new Order_history_view();
                int total_record = 0;
                UserModels sv = new UserModels();
                C_UserInfo iit = new C_UserInfo();
                C_User it = new C_User();
                OrderModels orderModels = new OrderModels();
                it = sv.GetUserbyUserName(Session["mem"].ToString());
                page = Request.QueryString["page"] != null ? Convert.ToInt16(Request.QueryString["page"].ToString()) : 1;

                order_history_view.Page_list_order = orderModels.GetAllOrderByMember(it.Username, (int)page, (int)page_size, out total_record);
                order_history_view.Item_count = total_record.ToString();

                return this.PartialView("../control/order_list", order_history_view);
            }
        }

        /// <summary>
        /// Orders the status.
        /// </summary>
        /// <returns>order status</returns>
        public ActionResult Order_status()
        {
            return this.PartialView("../page/order_status");
        }

        /// <summary>
        /// Orders the view.
        /// </summary>
        /// <param name="fcode">The order code.</param>
        /// <returns>Order view</returns>
        public ActionResult Order_view(string fcode)
        {
            if (!this.CheckMemberlogin())
            {
                return this.RedirectToAction("login", "account", new { return_url = string.Empty + Url.Action("order_view", "account", new { fcode = fcode }) });
            }
            else
            {
                var order_view = new Order_register_view();
                string strBread;
                ViewBag.Title = App_GlobalResources.Lang.strOrderCode + "  " + fcode;
                strBread = string.Format("<li><a href=\"" + Url.Action("my_account", "account") + "\">" + App_GlobalResources.Lang.strPersonalInformation + "</a></li>");
                strBread = string.Format("<li><a href=\"" + Url.Action("order_history", "account") + "\">" + App_GlobalResources.Lang.strOrderHistory + "</a></li>");
                strBread += "<li>" + fcode + "</li>";
                ViewBag.heading = App_GlobalResources.Lang.strOrderCode + "  " + fcode;
                ViewBag.str_breadcrumbs = strBread;
                this.AddMeta(CommonGlobal.Keyword, App_GlobalResources.Lang.strOrderCode + "  " + fcode);
                this.AddMeta(CommonGlobal.Description, App_GlobalResources.Lang.strOrderCode + "  " + fcode);

                DetailOrderModels detailsv = new DetailOrderModels();
                OrderModels orderModels = new OrderModels();

                if (string.IsNullOrEmpty(fcode))
                {
                    return this.HttpNotFound();
                }

                C_User usr = new C_User();
                order_view.Parent_action = HttpContext.Request.RequestContext.RouteData.Values["action"].ToString();
                order_view.Parent_controller = HttpContext.Request.RequestContext.RouteData.Values["controller"].ToString();
                order_view.ContentShipping = GeneralModels.GetContent(CommonGlobal.ContentShipping, this.Lang);
                UserModels sv = new UserModels();
                usr = sv.GetUserbyUserName(Session["mem"].ToString());

                var orders = orderModels.GetOrdersbyCode(fcode, usr.Username);
                if (orders == null)
                {
                    order_view.Message = App_GlobalResources.Lang.messOrderNotFound;
                    return this.PartialView("../page/order_view", order_view);
                }

                order_view.Message = string.Empty;
                order_view.Email = orders.Email;
                order_view.Name = orders.Name;
                order_view.Phone = orders.Phone;
                order_view.Address = orders.Address;
                order_view.Gender = orders.Gender;
                order_view.Sub_total = CommonGlobal.FormatMoney(orders.Total);
                order_view.Content = orders.Note;
                order_view.Order_code = fcode;
                order_view.Payment_status_text = CommonGlobal.GetPaymentStatusString(int.Parse(orders.Payment ?? "0"));
                order_view.Process_status_text = CommonGlobal.GetOrderStatusString(orders.Process ?? 0);

                var list_order_detail = detailsv.GetAllOrderDetail(fcode);
                if (list_order_detail.Count > 0)
                {
                    order_view.ShoppingCart = new ArrayList(list_order_detail.ToArray());
                }

                return this.PartialView("../page/order_view", order_view);
            }
        }

        /// <summary>
        /// Registers this instance.
        /// </summary>
        /// <returns>the register</returns>
        [AcceptVerbs(HttpVerbs.Get)]
        public ActionResult Register(string return_url)
        {
            if (this.CheckMemberlogin())
            {
                return this.RedirectToAction("index", "home");
            }
            else
            {
                string strBread;
                ViewBag.Title = App_GlobalResources.Lang.strRegister + " | " + GeneralModels.GetContent(CommonGlobal.PageName, this.Lang);
                strBread = "<li>" + App_GlobalResources.Lang.strRegister + "</li>";
                ViewBag.heading = App_GlobalResources.Lang.strRegister;
                ViewBag.str_breadcrumbs = strBread;

                var register_view = new Register_view();
                register_view.Message = App_GlobalResources.Lang.strMessageLogin;
                register_view.Parent_action = HttpContext.Request.RequestContext.RouteData.Values["action"].ToString();
                register_view.Parent_controller = HttpContext.Request.RequestContext.RouteData.Values["controller"].ToString();
                register_view.Return_url = return_url;

                return this.PartialView("../page/register", register_view);
            }
        }

        /// <summary>
        /// Registers the specified collection.
        /// </summary>
        /// <param name="collection">The collection.</param>
        /// <returns>the register</returns>
        [AcceptVerbs(HttpVerbs.Post)]
        public ActionResult Register(FormCollection collection)
        {
            var register_view = new Register_view();
            this.TryUpdateModel(register_view);
            UserModels sv = new UserModels();
            C_User it = new C_User();
            C_UserInfo iit = new C_UserInfo();
            register_view.Parent_action = HttpContext.Request.RequestContext.RouteData.Values["action"].ToString();
            register_view.Parent_controller = HttpContext.Request.RequestContext.RouteData.Values["controller"].ToString();
            if (HttpContext.Session["captchastring"] != null && register_view.Code == HttpContext.Session["captchastring"].ToString())
            {
                if (register_view.Password != register_view.Confirm_password)
                {
                    register_view.Message = App_GlobalResources.Lang.messConfirmPassword;
                    return this.PartialView("../page/register", register_view);
                }

                if (sv.GetUserbyUserName(register_view.Email) != null)
                {
                    register_view.Message = App_GlobalResources.Lang.messExistsEmail;
                    return this.PartialView("../page/register", register_view);
                }

                string rt = string.Empty;
                bool infors = false;
                it.Username = register_view.Email;
                it.Role = 2;
                it.Password = MD5Extend.EncodePassword(register_view.Password);
                it.IP = "not login";
                it.Online = true;
                it.LastLogin = DateTime.Now;
                rt = sv.Add_User(it);

                iit.FName = register_view.FirstName;
                iit.Email = register_view.Email;
                infors = sv.Add_User_Infor(iit);

                if (rt.Length > 0 && infors == true)
                {
                    register_view.Message = App_GlobalResources.Lang.strMessageLogin;
                    this.Session["acc"] = register_view.Email;
                    this.Session["mem"] = rt;
                    this.Session["role"] = it.Role.ToString();
                    this.SetAccountCookies(register_view.Email, rt, it.Role.ToString(), 6);

                    if (!string.IsNullOrEmpty(register_view.Return_url))
                    {
                        return this.Redirect(register_view.Return_url);
                    }
                    else {
                        return this.RedirectToAction("index", "home");
                    }                    
                }
                else
                {
                    register_view.Message = App_GlobalResources.Lang.messErrorRegister;

                    return this.PartialView("../page/register", register_view);
                }
            }
            else
            {
                register_view.Message = App_GlobalResources.Lang.messCaptcha;

                return this.PartialView("../page/register", register_view);
            }
        }
    }
}