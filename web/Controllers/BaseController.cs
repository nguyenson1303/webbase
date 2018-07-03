namespace Web.Controllers
{
    using System;
    using System.Collections.Generic;
    using System.IO;
    using System.Security.Cryptography;
    using System.Text;
    using System.Text.RegularExpressions;
    using System.Web;
    using System.Web.Mvc;
    using System.Web.Routing;

    using Web.Data;
    using Web.Models;

    /// <summary>
    /// base Controller
    /// </summary>
    public class BaseController : Controller
    {
        /// <summary>
        /// Gets or sets the language.
        /// </summary>
        /// <value>
        /// The language.
        /// </value>
        public string Lang
        {
            get;
            set;
        }

        /// <summary>
        /// Gets the unique key.
        /// </summary>
        /// <param name="maxSize">The maximum size.</param>
        /// <returns>Get Unique Key</returns>
        public static string GetCodeUniqueKey(int maxSize)
        {
            char[] chars = new char[62];
            chars =
                "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ1234567890".ToCharArray();
            byte[] data = new byte[1];
            using (RNGCryptoServiceProvider crypto = new RNGCryptoServiceProvider())
            {
                crypto.GetNonZeroBytes(data);
                data = new byte[maxSize];
                crypto.GetNonZeroBytes(data);
            }

            StringBuilder result = new StringBuilder(maxSize);
            foreach (byte b in data)
            {
                result.Append(chars[b % chars.Length]);
            }

            return result.ToString();
        }

        /// <summary>
        /// Adds the meta.
        /// </summary>
        /// <param name="name">The name.</param>
        /// <param name="value">The value.</param>
        public void AddMeta(string name, string value)
        {
            string meta = "<meta name=\"" + name + "\" content=\"" + value + "\" />";
            ViewBag.meta += meta;
        }

        /// <summary>
        /// Checks the admin login.
        /// </summary>
        /// <returns>Check Admin login</returns>
        public bool CheckAdminlogin()
        {
            string mem = string.Empty;
            string role = string.Empty;

            if (this.Session["mem"] != null)
            {
                mem = this.Session["mem"].ToString();
            }

            if (this.Session["role"] != null)
            {
                role = this.Session["role"].ToString();
            }

            ////if session null get from cookies and set session
            if (mem == string.Empty || role == string.Empty)
            {
                HttpCookie cookie = Request.Cookies["mem"];
                if (cookie != null)
                {
                    HttpCookie decodedCookie = HttpSecureCookie.Decode(cookie);
                    if (decodedCookie != null && decodedCookie.Value != null)
                    {
                        UserModels sv = new UserModels();
                        C_User it = new C_User();
                        it = sv.GetUserbyUserName(decodedCookie.Value);
                        if (it != null) {
                            if (it.Role == 1)
                            {
                                this.Session["mem"] = it.Username;
                                this.Session["role"] = it.Role.ToString();
                                this.Session["acc"] = it.Username;
                            }
                            else
                            {
                                mem = string.Empty;
                                role = string.Empty;
                            }
                        }
                        else
                        {                            
                            mem = string.Empty;
                            role = string.Empty;
                        }
                    }
                    else
                    {
                        mem = string.Empty;
                        role = string.Empty;
                    }
                }
            }

            if (mem != string.Empty && role == "1")
            {
                return true;
            }
            else
            {
                return false;
            }
        }

        /// <summary>
        /// Checks the member login.
        /// </summary>
        /// <returns>Check Member login</returns>
        public bool CheckMemberlogin()
        {
            string mem = string.Empty;
            string role = string.Empty;
            ////get session
            if (this.Session["mem"] != null)
            {
                mem = this.Session["mem"].ToString();
            }

            if (this.Session["role"] != null)
            {
                role = this.Session["role"].ToString();
            }

            ////if session null get from cookies and set session
            if (mem == string.Empty || role == string.Empty)
            {
                HttpCookie cookie = this.Request.Cookies["mem"];
                if (cookie != null)
                {
                    HttpCookie decodedCookie = HttpSecureCookie.Decode(cookie);
                    if (decodedCookie != null && decodedCookie.Value != null)
                    {
                        UserModels sv = new UserModels();
                        C_User it = new C_User();
                        C_UserInfo iit = new C_UserInfo();
                        it = sv.GetUserbyUserName(decodedCookie.Value);
                        if (it != null && it.Role == 2)
                        {
                            iit = sv.GetUserInforByEmail(it.Username);
                            this.Session["mem"] = iit.FName;
                            this.Session["role"] = it.Role.ToString();
                            this.Session["acc"] = it.Username;
                        }
                    }
                    else
                    {
                        mem = string.Empty;
                        role = string.Empty;
                    }
                }
            }

            ////HttpCookie cookie = new HttpCookie("UserName", "Terminator");
            ////cookie.Expires = DateTime.Now.AddDays(1);
            ////HttpCookie encodedCookie = HttpSecureCookie.Encode(cookie);
            ////Response.Cookies.Add(encodedCookie);

            ////HttpCookie cookie = Request.Cookies["UserName"];
            ////lblDisplayBefore.Text = cookie.Value;
            ////HttpCookie decodedCookie = HttpSecureCookie.Decode(cookie);

            if (mem != string.Empty && role == "2")
            {
                return true;
            }
            else
            {
                return false;
            }
        }

        /// <summary>
        /// Clears the HTML.
        /// </summary>
        /// <param name="value">The value.</param>
        /// <returns>Clear Html</returns>
        public string ClearHtml(string value)
        {
            string noHTML = Regex.Replace(value, @"<[^>]+>|&nbsp;", string.Empty).Trim();
            string noHTMLNormalised = Regex.Replace(noHTML, @"\s{2,}", " ");
            return noHTMLNormalised;
        }

        /// <summary>
        /// Gets the order process select.
        /// </summary>
        /// <param name="selectedValue">The selected value.</param>
        /// <returns>Get Order Process Select</returns>
        public List<SelectListItem> GetOrderProcessSelect(int selectedValue)
        {
            List<SelectListItem> sizeDrop = new List<SelectListItem>();
            sizeDrop.AddRange(new SelectListItem[]
            {
                new SelectListItem { Selected = selectedValue == CommonGlobal.OrderProcessAll ? true : false, Text = CommonGlobal.OrderAll, Value = CommonGlobal.OrderProcessAll.ToString() },
                new SelectListItem { Selected = selectedValue == CommonGlobal.OrderProcessStart ? true : false, Text = CommonGlobal.OrderStart, Value = CommonGlobal.OrderProcessStart.ToString() },
                new SelectListItem { Selected = selectedValue == CommonGlobal.OrderProcessComplete ? true : false, Text = CommonGlobal.OrderComplete, Value = CommonGlobal.OrderProcessComplete.ToString() },
                new SelectListItem { Selected = selectedValue == CommonGlobal.OrderProcessCancel ? true : false, Text = CommonGlobal.OrderCancel, Value = CommonGlobal.OrderProcessCancel.ToString() },
                new SelectListItem { Selected = selectedValue == CommonGlobal.OrderProcessFail ? true : false, Text = CommonGlobal.OrderFail, Value = CommonGlobal.OrderProcessFail.ToString() },
                new SelectListItem { Selected = selectedValue == CommonGlobal.OrderProcessError ? true : false, Text = CommonGlobal.OrderNull, Value = CommonGlobal.OrderProcessError.ToString() }
            });
            return sizeDrop;
        }

        /// <summary>
        /// Gets the payment status select.
        /// </summary>
        /// <param name="selectedValue">The selected value.</param>
        /// <returns>Get Payment Status Select</returns>
        public List<SelectListItem> GetPaymentStatusSelect(int selectedValue)
        {
            List<SelectListItem> sizeDrop = new List<SelectListItem>();
            sizeDrop.AddRange(new SelectListItem[]
            {
                new SelectListItem { Selected = selectedValue == CommonGlobal.PaymentAll ? true : false, Text = CommonGlobal.PaymentAllText, Value = CommonGlobal.PaymentAll.ToString() }, 
                new SelectListItem { Selected = selectedValue == CommonGlobal.PaymentStart ? true : false, Text = CommonGlobal.PaymentStartText, Value = CommonGlobal.PaymentStart.ToString() }, 
                new SelectListItem { Selected = selectedValue == CommonGlobal.PaymentFull ? true : false, Text = CommonGlobal.PaymentFullText, Value = CommonGlobal.PaymentFull.ToString() }, 
                new SelectListItem { Selected = selectedValue == CommonGlobal.PaymentCancel ? true : false, Text = CommonGlobal.PaymentCancelText, Value = CommonGlobal.PaymentCancel.ToString() }, 
                new SelectListItem { Selected = selectedValue == CommonGlobal.PaymentFail ? true : false, Text = CommonGlobal.PaymentFailText, Value = CommonGlobal.PaymentFail.ToString() }, 
                new SelectListItem { Selected = selectedValue == CommonGlobal.PaymentRefund ? true : false, Text = CommonGlobal.PaymentRefundText, Value = CommonGlobal.PaymentRefund.ToString() }
            });
            return sizeDrop;
        }

        /// <summary>
        /// Gets the size paging public.
        /// </summary>
        /// <param name="selectedValue">The selected value.</param>
        /// <returns>Get Size Paging Public</returns>
        public List<SelectListItem> GetSizePagingPublic(int selectedValue)
        {
            List<SelectListItem> sizeDrop = new List<SelectListItem>();
            sizeDrop.AddRange(new SelectListItem[]
            {
                new SelectListItem { Selected = selectedValue == 9 ? true : false, Text = "9", Value = "9" },
                new SelectListItem { Selected = selectedValue == 18 ? true : false, Text = "18", Value = "18" },
                new SelectListItem { Selected = selectedValue == 36 ? true : false, Text = "36", Value = "36" },
                new SelectListItem { Selected = selectedValue == 99 ? true : false, Text = "99", Value = "99" }
            });
            return sizeDrop;
        }

        /// <summary>
        /// Determines whether the specified action name is active.
        /// </summary>
        /// <param name="actionName">Name of the action.</param>
        /// <param name="controllerName">Name of the controller.</param>
        /// <param name="current_actionName">Name of the current action.</param>
        /// <param name="current_controllerName">Name of the current controller.</param>
        /// <param name="activeClass">The active class.</param>
        /// <returns> Is Active</returns>
        public string IsActive(string actionName, string controllerName, string current_actionName, string current_controllerName, string activeClass)
        {
            var returnActive = actionName == current_actionName && controllerName == current_controllerName;
            return returnActive ? activeClass : string.Empty;
        }

        /// <summary>
        /// Determines whether the specified action name is active.
        /// </summary>
        /// <param name="actionName">Name of the action.</param>
        /// <param name="controllerName">Name of the controller.</param>
        /// <param name="current_actionName">Name of the current action.</param>
        /// <param name="current_controllerName">Name of the current controller.</param>
        /// <param name="id">The identifier.</param>
        /// <param name="current_id">The current identifier.</param>
        /// <param name="activeClass">The active class.</param>
        /// <returns>Is Active</returns>
        public string IsActive(string actionName, string controllerName, string current_actionName, string current_controllerName, string id, string current_id, string activeClass)
        {
            var returnActive = actionName == current_actionName && controllerName == current_controllerName && id == current_id;
            return returnActive ? activeClass : string.Empty;
        }

        /// <summary>
        /// Determines whether [is active brand] [the specified action name].
        /// </summary>
        /// <param name="actionName">Name of the action.</param>
        /// <param name="controllerName">Name of the controller.</param>
        /// <param name="current_actionName">Name of the current action.</param>
        /// <param name="current_controllerName">Name of the current controller.</param>
        /// <param name="manufacture">The manufacture.</param>
        /// <param name="current">The current.</param>
        /// <param name="activeClass">The active class.</param>
        /// <returns>Is Active Brand</returns>
        public string IsActiveBrand(string actionName, string controllerName, string current_actionName, string current_controllerName, string manufacture, string current, string activeClass)
        {
            var returnActive = actionName == current_actionName && controllerName == current_controllerName && manufacture == current;
            return returnActive ? activeClass : string.Empty;
        }

        /// <summary>
        /// Lists the select language.
        /// </summary>
        /// <param name="selected">The selected.</param>
        /// <returns>list select language</returns>
        public List<SelectListItem> List_select_language(string selected)
        {
            var list_lang = LanguageModels.AvailableLanguages;
            var list_item_lang = new List<SelectListItem>();

            foreach (Languages it in list_lang)
            {
                list_item_lang.Add(new SelectListItem { Selected = selected == it.LangCultureName ? true : false, Text = it.LangFullName.ToString(), Value = it.LangCultureName.ToString() });
            }

            return list_item_lang;
        }

        /// <summary>
        /// Save photo the specified old image.
        /// </summary>
        /// <param name="old_img">The old image.</param>
        /// <param name="control">The control.</param>
        /// <param name="imgPathTemp">The image path temporary.</param>
        /// <param name="imagePath">The image path.</param>
        /// <param name="imageFullPath">The image full path.</param>
        public void Savephoto(string old_img, HttpPostedFileBase control, string imgPathTemp, string imagePath, string imageFullPath)
        {
            ImagesLibrary imglib = new ImagesLibrary();
            var thumb_type = Util.GetConfigValue("ThumbType", "both");
            var thumb_width = int.Parse(Util.GetConfigValue("WidthImageThumb", "270"));
            var thumb_height = int.Parse(Util.GetConfigValue("HeightImageThumb", "400"));
            var larger_width = int.Parse(Util.GetConfigValue("WidthImageLarger", "540"));
            var larger_height = int.Parse(Util.GetConfigValue("HeightImageLarger", "800"));

            if (!string.IsNullOrEmpty(old_img))
            {
                string strImg = old_img;
                strImg = "~" + strImg;
                string fileDelete = Server.MapPath(strImg);
                if (System.IO.File.Exists(fileDelete))
                {
                    System.IO.File.Delete(fileDelete);
                }

                string fileDelete2 = Server.MapPath(strImg.Replace("sc_small_", "sc_full_"));
                if (System.IO.File.Exists(fileDelete2))
                {
                    System.IO.File.Delete(fileDelete2);
                }
            }

            string imageGoc = imgPathTemp + control.FileName;
            string realFile = Request.PhysicalApplicationPath + imageGoc.Replace("/", "\\");
            string virtualFolder = "~/" + imageGoc.Substring(0, imageGoc.LastIndexOf('/') + 1);
            string folder = Server.MapPath(virtualFolder);
            if (!Directory.Exists(folder))
            {
                Directory.CreateDirectory(folder);
            }

            ////nén ảnh thành 2 ảnh kích thước khác nhau
            System.Drawing.Image img1 = System.Drawing.Image.FromStream(control.InputStream);
            ////thumb1
            if (thumb_type == "width")
            {
                img1 = imglib.ConstrainProportions(img1, thumb_width, ImagesLibrary.Dimensions.Width);
            }
            else if (thumb_type == "height")
            {
                img1 = imglib.ConstrainProportions(img1, thumb_height, ImagesLibrary.Dimensions.Height);
            }
            else if (thumb_type == "both")
            {
                img1 = imglib.FixedSize(img1, thumb_width, thumb_height);
            }
            ////watermark1
            img1 = imglib.ImagesWatermark(img1, System.Drawing.Image.FromFile(Server.MapPath("~" + Util.GetConfigValue("ImagesWatermark", "/images/logo2.png"))));
            ////save thumb images
            string realFile1 = Request.PhysicalApplicationPath + imagePath.Replace("/", "\\");
            img1.Save(realFile1, System.Drawing.Imaging.ImageFormat.Jpeg);

            System.Drawing.Image img2 = System.Drawing.Image.FromStream(control.InputStream);
            ////thumb2
            if (thumb_type == "width")
            {
                img2 = imglib.ConstrainProportions(img2, larger_width, ImagesLibrary.Dimensions.Width);
            }
            else if (thumb_type == "height")
            {
                img2 = imglib.ConstrainProportions(img2, larger_height, ImagesLibrary.Dimensions.Height);
            }
            else if (thumb_type == "both")
            {
                img2 = imglib.FixedSize(img2, larger_width, larger_height);
            }
            ////watermark1
            img2 = imglib.ImagesWatermark(img2, System.Drawing.Image.FromFile(Server.MapPath("~" + Util.GetConfigValue("ImagesWatermark", "/images/logo2.png"))));
            ////save larger images
            string realFile2 = Request.PhysicalApplicationPath + imageFullPath.Replace("/", "\\");
            if (control.FileName.Contains(".png"))
            {
                img2.Save(realFile2, System.Drawing.Imaging.ImageFormat.Png);
            }
            else if (control.FileName.Contains(".gif"))
            {
                img2.Save(realFile2, System.Drawing.Imaging.ImageFormat.Gif);
            }
            else
            {
                img2.Save(realFile2, System.Drawing.Imaging.ImageFormat.Jpeg);
            }
        }

        /// <summary>
        /// Save photo the original.
        /// </summary>
        /// <param name="old_img">The old image.</param>
        /// <param name="control">The control.</param>
        /// <param name="imgPathTemp">The image path temporary.</param>
        /// <param name="imagePath">The image path.</param>
        public void SavephotoOriginal(string old_img, HttpPostedFileBase control, string imgPathTemp, string imagePath)
        {
            ImagesLibrary imglib = new ImagesLibrary();

            if (!string.IsNullOrEmpty(old_img))
            {
                string strImg = old_img;
                strImg = "~" + strImg;
                string fileDelete = Server.MapPath(strImg);
                if (System.IO.File.Exists(fileDelete))
                {
                    System.IO.File.Delete(fileDelete);
                }

                string fileDelete2 = Server.MapPath(strImg.Replace("sc_small_", "sc_full_"));
                if (System.IO.File.Exists(fileDelete2))
                {
                    System.IO.File.Delete(fileDelete2);
                }
            }

            string imageGoc = imgPathTemp + control.FileName;
            string realFile = Request.PhysicalApplicationPath + imageGoc.Replace("/", "\\");
            string virtualFolder = "~/" + imageGoc.Substring(0, imageGoc.LastIndexOf('/') + 1);
            string folder = Server.MapPath(virtualFolder);
            if (!Directory.Exists(folder))
            {
                Directory.CreateDirectory(folder);
            }

            if (imagePath.EndsWith(".mp4")) {
                HttpPostedFileBase video_p = control; 
                ////save 
                string realFile1 = Request.PhysicalApplicationPath + imagePath.Replace("/", "\\");
                video_p.SaveAs(realFile1);
            }
            else
            {
                System.Drawing.Image img1 = System.Drawing.Image.FromStream(control.InputStream);

                ////save thumb images
                string realFile1 = Request.PhysicalApplicationPath + imagePath.Replace("/", "\\");

                if (control.FileName.Contains(".png"))
                {
                    img1.Save(realFile1, System.Drawing.Imaging.ImageFormat.Png);
                }
                else if (control.FileName.Contains(".gif"))
                {
                    img1.Save(realFile1, System.Drawing.Imaging.ImageFormat.Gif);
                }
                else
                {
                    img1.Save(realFile1, System.Drawing.Imaging.ImageFormat.Jpeg);
                }
            }
            
        }

        /// <summary>
        /// Save photo the specified old image.
        /// </summary>
        /// <param name="old_img">The old image.</param>
        /// <param name="control">The control.</param>
        /// <param name="imgPathTemp">The image path temporary.</param>
        /// <param name="imagePath">The image path.</param>
        /// <param name="imageFullPath">The image full path.</param>
        public void SavephotoCategory(string old_img, HttpPostedFileBase control, string imgPathTemp, string imagePath, string imageFullPath)
        {
            ImagesLibrary imglib = new ImagesLibrary();
            var thumb_type = Util.GetConfigValue("ThumbType", "both");
            var thumb_width = 400;
            var thumb_height = 330;
            var larger_width = 800;
            var larger_height = 660;

            if (!string.IsNullOrEmpty(old_img))
            {
                string strImg = old_img;
                strImg = "~" + strImg;
                string fileDelete = Server.MapPath(strImg);
                if (System.IO.File.Exists(fileDelete))
                {
                    System.IO.File.Delete(fileDelete);
                }

                string fileDelete2 = Server.MapPath(strImg.Replace("sc_small_", "sc_full_"));
                if (System.IO.File.Exists(fileDelete2))
                {
                    System.IO.File.Delete(fileDelete2);
                }
            }

            string imageGoc = imgPathTemp + control.FileName;
            string realFile = Request.PhysicalApplicationPath + imageGoc.Replace("/", "\\");
            string virtualFolder = "~/" + imageGoc.Substring(0, imageGoc.LastIndexOf('/') + 1);
            string folder = Server.MapPath(virtualFolder);
            if (!Directory.Exists(folder))
            {
                Directory.CreateDirectory(folder);
            }

            ////nén ảnh thành 2 ảnh kích thước khác nhau
            System.Drawing.Image img1 = System.Drawing.Image.FromStream(control.InputStream);
            ////thumb1
            if (thumb_type == "width")
            {
                img1 = imglib.ConstrainProportions(img1, thumb_width, ImagesLibrary.Dimensions.Width);
            }
            else if (thumb_type == "height")
            {
                img1 = imglib.ConstrainProportions(img1, thumb_height, ImagesLibrary.Dimensions.Height);
            }
            else if (thumb_type == "both")
            {
                img1 = imglib.FixedSize(img1, thumb_width, thumb_height);
            }
            ////watermark1
            img1 = imglib.ImagesWatermark(img1, System.Drawing.Image.FromFile(Server.MapPath("~" + Util.GetConfigValue("ImagesWatermark", "/images/logo2.png"))));
            ////save thumb images
            string realFile1 = Request.PhysicalApplicationPath + imagePath.Replace("/", "\\");
            img1.Save(realFile1, System.Drawing.Imaging.ImageFormat.Jpeg);

            System.Drawing.Image img2 = System.Drawing.Image.FromStream(control.InputStream);
            ////thumb2
            if (thumb_type == "width")
            {
                img2 = imglib.ConstrainProportions(img2, larger_width, ImagesLibrary.Dimensions.Width);
            }
            else if (thumb_type == "height")
            {
                img2 = imglib.ConstrainProportions(img2, larger_height, ImagesLibrary.Dimensions.Height);
            }
            else if (thumb_type == "both")
            {
                img2 = imglib.FixedSize(img2, larger_width, larger_height);
            }
            ////watermark1
            img2 = imglib.ImagesWatermark(img2, System.Drawing.Image.FromFile(Server.MapPath("~" + Util.GetConfigValue("ImagesWatermark", "/images/logo2.png"))));
            ////save larger images
            string realFile2 = Request.PhysicalApplicationPath + imageFullPath.Replace("/", "\\");
            if (control.FileName.Contains(".png"))
            {
                img2.Save(realFile2, System.Drawing.Imaging.ImageFormat.Png);
            }
            else if (control.FileName.Contains(".gif"))
            {
                img2.Save(realFile2, System.Drawing.Imaging.ImageFormat.Gif);
            }
            else
            {
                img2.Save(realFile2, System.Drawing.Imaging.ImageFormat.Jpeg);
            }
        }

        /// <summary>
        /// Save pdf the specified old pdf.
        /// </summary>
        /// <param name="old_pdf">The old image.</param>
        /// <param name="control">The control.</param>
        /// <param name="imgPathTemp">The image path temporary.</param>
        /// <param name="imagePath">The image path.</param>
        /// <param name="imageFullPath">The image full path.</param>
        public void SavePdf(string old_pdf, HttpPostedFileBase control, string imgPathTemp, string imagePath, string imageFullPath)
        {
            if (!string.IsNullOrEmpty(old_pdf))
            {
                string strImg = old_pdf;
                strImg = "~" + strImg;
                string fileDelete = Server.MapPath(strImg);
                if (System.IO.File.Exists(fileDelete))
                {
                    System.IO.File.Delete(fileDelete);
                }

                string fileDelete2 = Server.MapPath(strImg.Replace("sc_small_", "sc_full_"));
                if (System.IO.File.Exists(fileDelete2))
                {
                    System.IO.File.Delete(fileDelete2);
                }
            }

            string imageGoc = imgPathTemp + control.FileName;
            string realFile = Request.PhysicalApplicationPath + imageGoc.Replace("/", "\\");
            string virtualFolder = "~/" + imageGoc.Substring(0, imageGoc.LastIndexOf('/') + 1);
            string folder = Server.MapPath(virtualFolder);
            if (!Directory.Exists(folder))
            {
                Directory.CreateDirectory(folder);
            }

            string realFile1 = Request.PhysicalApplicationPath + imagePath.Replace("/", "\\");
            control.SaveAs(realFile1);

            string realFile2 = Request.PhysicalApplicationPath + imageFullPath.Replace("/", "\\");
            control.SaveAs(realFile2);
        }


        /// <summary>
        /// Shows the captcha image.
        /// </summary>
        /// <returns>Show Captcha Image</returns>
        public CaptchaImageResult ShowCaptchaImage()
        {
            return new CaptchaImageResult();
        }

        /// <summary>
        /// Begins to invoke the action in the current controller context.
        /// </summary>
        /// <param name="callback">The callback.</param>
        /// <param name="state">The state.</param>
        /// <returns>
        /// Returns an IAsyncController instance.
        /// </returns>
        protected override IAsyncResult BeginExecuteCore(AsyncCallback callback, object state)
        {
            string lang = null;
            if (HttpContext.Request.RequestContext.RouteData.Values.ContainsKey("lang"))
            {
                lang = HttpContext.Request.RequestContext.RouteData.Values["lang"].ToString().ToLower();
            }
            else
            {
                HttpCookie cookie = Request.Cookies["CurrentLanguage"];
                if (cookie != null)
                {
                    lang = cookie.Value;
                }
                else
                {
                    var userLanguage = Request.UserLanguages;
                    var userLang = userLanguage != null ? userLanguage[0] : string.Empty;
                    if (userLang != string.Empty)
                    {
                        lang = userLang;
                    }
                    else
                    {
                        lang = LanguageModels.GetDefaultLanguage();
                    }
                }
            }

            new LanguageModels().SetLanguage(lang);

            return base.BeginExecuteCore(callback, state);
        }

        /// <summary>
        /// Initializes data that might not be available when the constructor is called.
        /// </summary>
        /// <param name="requestContext">The HTTP context and route data.</param>
        protected override void Initialize(RequestContext requestContext)
        {
            base.Initialize(requestContext);
        }

        /// <summary>
        /// Called before the action method is invoked.
        /// </summary>
        /// <param name="filterContext">Information about the current request and action.</param>
        protected override void OnActionExecuting(ActionExecutingContext filterContext)
        {
            base.OnActionExecuting(filterContext);
        }

        /// <summary>
        /// Sets the account cookies.
        /// </summary>
        /// <param name="account">The account.</param>
        /// <param name="member">The member.</param>
        /// <param name="role">The role.</param>
        /// <param name="expires">The expires.</param>
        protected void SetAccountCookies(string account, string member, string role, int expires)
        {
            HttpCookie cookie_acc = new HttpCookie("acc", account);
            cookie_acc.Expires = DateTime.Now.AddHours(expires);
            HttpCookie encodedCookie_acc = HttpSecureCookie.Encode(cookie_acc);
            Response.Cookies.Add(encodedCookie_acc);

            HttpCookie cookie_mem = new HttpCookie("mem", member);
            cookie_mem.Expires = DateTime.Now.AddHours(expires);
            HttpCookie encodedCookie_mem = HttpSecureCookie.Encode(cookie_mem);
            Response.Cookies.Add(encodedCookie_mem);

            HttpCookie cookie_role = new HttpCookie("role", role);
            cookie_role.Expires = DateTime.Now.AddHours(expires);
            HttpCookie encodedCookie_role = HttpSecureCookie.Encode(cookie_role);
            Response.Cookies.Add(encodedCookie_role);
        }
    }    
}