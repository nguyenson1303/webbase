namespace ApiBase.Models.BusinessAccess
{
    using System;
    using System.Net.Mail;

    /// <summary>
    /// Global common
    /// </summary>
    public class CommonGlobal
    {
        /// <summary>
        /// The about content
        /// </summary>
        public const string AboutContent = "aboutcontent";

        /// <summary>
        /// The about content text
        /// </summary>
        public const string AboutContentText = "Giới thiệu";

        /// <summary>
        /// The about home
        /// </summary>
        public const string AboutHome = "abouthome";

        /// <summary>
        /// The about short
        /// </summary>
        public const string AcountShort = "aboutshort";

        /// <summary>
        /// The about short text
        /// </summary>
        public const string AboutShortText = "Giới thiệu ngắn";

        /// <summary>
        /// The add
        /// </summary>
        public const string Add = "add";

        /// <summary>
        /// The address
        /// </summary>
        public const string Address = "address";

        /// <summary>
        /// The ad bottom
        /// </summary>
        public const string AdBottom = "advsbottom";

        /// <summary>
        /// The ad bottom left
        /// </summary>
        public const string AdBottomLeft = "advsbottomleft";

        /// <summary>
        /// The ad bottom left text
        /// </summary>
        public const string AdBottomLeftText = "Quảng cáo dưới trái";

        /// <summary>
        /// The ad bottom text
        /// </summary>
        public const string AdBottomText = "Quảng cáo dưới phải";

        /// <summary>
        /// The ad footer
        /// </summary>
        public const string AdFooter = "AF";

        /// <summary>
        /// The ad footer text
        /// </summary>
        public const string AdFooterText = "Slide trang sản phẩm";

        /// <summary>
        /// The ad left
        /// </summary>
        public const string AdLeft = "advsleft";

        /// <summary>
        /// The ad left text
        /// </summary>
        public const string AdLeftText = "Quảng cáo trái";

        /// <summary>
        /// The ad middle
        /// </summary>
        public const string AdMiddle = "advsmiddle";

        /// <summary>
        /// The ad middle text
        /// </summary>
        public const string AdMiddleText = "Quảng cáo giữa";

        /// <summary>
        /// The ad right
        /// </summary>
        public const string AdRight = "advsright";

        /// <summary>
        /// The ad right text
        /// </summary>
        public const string AdRightText = "Quảng cáo phải";

        /// <summary>
        /// The ad top
        /// </summary>
        public const string AdTop = "advstop";

        /// <summary>
        /// The ad top text
        /// </summary>
        public const string AdTopText = "Quảng cáo trên";

        /// <summary>
        /// The application extend one
        /// </summary>
        public const string AppExtendOne = "app_extend_one";

        /// <summary>
        /// The application extend two
        /// </summary>
        public const string AppExtendTwo = "app_extend_two";

        /// <summary>
        /// The banner
        /// </summary>
        public const string Banner = "banner";

        /// <summary>
        /// The bread link
        /// </summary>
        public const string BreadLink = "<a href='{0}'>{1}</a>  <font><font> → </font></font> ";

        /// <summary>
        /// The bread text
        /// </summary>
        public const string BreadText = "<a href='{0}'>{1}</a>";

        /// <summary>
        /// The cate collection
        /// </summary>
        public const string CateCollection = "CL";

        /// <summary>
        /// The cate collection name
        /// </summary>
        public const string CateCollectionName = "Collection";

        /// <summary>
        /// The cate FAQ
        /// </summary>
        public const string CateFAQ = "HD";

        /// <summary>
        /// The cate gallery
        /// </summary>
        public const string CateGallery = "GL";

        /// <summary>
        /// The cate gallery name
        /// </summary>
        public const string CateGalleryName = "Gallery";

        /// <summary>
        /// The cate look book
        /// </summary>
        public const string CateLookBook = "LB";

        /// <summary>
        /// The cate look book name
        /// </summary>
        public const string CateLookBookName = "Mặt bằng";

        /// <summary>
        /// The cate news
        /// </summary>
        public const string CateNews = "TT";

        /// <summary>
        /// The cate news name
        /// </summary>
        public const string CateNewsName = "Tin tức";

        /// <summary>
        /// The cate product
        /// </summary>
        public const string CateProduct = "SP";

        /// <summary>
        /// The cate product name
        /// </summary>
        public const string CateProductName = "Sản phẩm";

        /// <summary>
        /// The cate recruiment
        /// </summary>
        public const string CateRecruiment = "TD";

        /// <summary>
        /// The cate sale off
        /// </summary>
        public const string CateSaleoff = "KM";

        /// <summary>
        /// The cate sale off name
        /// </summary>
        public const string CateSaleoffName = "Khuyến Mại";

        /// <summary>
        /// The cate service
        /// </summary>
        public const string CateService = "DV";

        /// <summary>
        /// The cate service name
        /// </summary>
        public const string CateServiceName = "Dịch vụ";

        /// <summary>
        /// The color
        /// </summary>
        public const string Color = "COL";

        /// <summary>
        /// The color text
        /// </summary>
        public const string ColorText = "Mầu sản phẩm";

        /// <summary>
        /// The contact
        /// </summary>
        public const string Contact = "contact";

        /// <summary>
        /// The contact detail
        /// </summary>
        public const string ContactDetail = "contactdetail";

        /// <summary>
        /// The contact detail text
        /// </summary>
        public const string ContactDetailText = "Liên Hệ chi tiết";

        /// <summary>
        /// The contact text
        /// </summary>
        public const string ContactText = "Liên Hệ ngắn";

        ////Shipping

        /// <summary>
        /// The content shipping
        /// </summary>
        public const string ContentShipping = "content_shipping";

        /// <summary>
        /// The content shipping text
        /// </summary>
        public const string ContentShippingText = "Nội dung shipping";

        /// <summary>
        /// The cs display date format
        /// </summary>
        public const string CsDisplayDateFormat = "dd/MM/yyyy";

        /// <summary>
        /// The cs display time
        /// </summary>
        public const string CsDisplayTime = "hh:mm";

        /// <summary>
        /// The delete
        /// </summary>
        public const string Delete = "del";

        /// <summary>
        /// The description
        /// </summary>
        public const string Description = "description";

        /// <summary>
        /// The Partner
        /// </summary>
        public const string Partner = "DT";

        /// <summary>
        /// The partner text
        /// </summary>
        public const string PartnerText = "Tác giả";

        /// <summary>
        /// The edit
        /// </summary>
        public const string Edit = "edit";

        /// <summary>
        /// The email
        /// </summary>
        public const string Email = "email";

        /// <summary>
        /// The email confirm forgot password
        /// </summary>
        public const string EmailConfirmForgotPassword = "email_confirm_forgot_password";

        /// <summary>
        /// The email confirm forgot password text
        /// </summary>
        public const string EmailConfirmForgotPasswordText = "Email xác nhận quên mật khẩu";

        ////for client

        /// <summary>
        /// The email order confirm
        /// </summary>
        public const string EmailOrderConfirm = "email_order_confirm";

        /// <summary>
        /// The email order confirm text
        /// </summary>
        public const string EmailOrderConfirmText = "Email xác nhận đơn hàng";

        ////for staff

        /// <summary>
        /// The email order payment change status
        /// </summary>
        public const string EmailOrderPaymentChangeStatus = "email_order_payment_change_status";

        /// <summary>
        /// The email order payment change status text
        /// </summary>
        public const string EmailOrderPaymentChangeStatusText = "Email thay đổi trạng thái thanh toán";

        /// <summary>
        /// The facebook
        /// </summary>
        public const string Facebook = "facebook";

        /// <summary>
        /// The fees
        /// </summary>
        public const string Fees = "fees";

        /// <summary>
        /// The google analysis
        /// </summary>
        public const string GoogleAnalysis = "google_analysis";

        /// <summary>
        /// The hotline
        /// </summary>
        public const string Hotline = "hotline";

        /// <summary>
        /// The image map
        /// </summary>
        public const string ImageMap = "imgmap";

        /// <summary>
        /// The keyword
        /// </summary>
        public const string Keyword = "keywords";

        /// <summary>
        /// The language
        /// </summary>
        public const string LANG = "vi";

        /// <summary>
        /// The latitude
        /// </summary>
        public const string Latitude = "latitude";

        /// <summary>
        /// The Link
        /// </summary>
        public const string Link = "LK";

        /// <summary>
        /// The Link text
        /// </summary>
        public const string LinkText = "Liên kết";

        /// <summary>
        /// The longitude
        /// </summary>
        public const string Longitude = "longitude";

        /// <summary>
        /// The minimum fees
        /// </summary>
        public const string MinFees = "min_fees";

        /// <summary>
        /// The news top
        /// </summary>
        public const string NewsTop = "newstop";

        /// <summary>
        /// The order all
        /// </summary>
        public const string OrderAll = "Tất cả";

        /// <summary>
        /// The order cancel
        /// </summary>
        public const string OrderCancel = "Hủy mượn";

        /// <summary>
        /// The order complete
        /// </summary>
        public const string OrderComplete = "Đã trả";

        /// <summary>
        /// The order fail
        /// </summary>
        public const string OrderFail = "Quá hạn mượn";

        /// <summary>
        /// The order null
        /// </summary>
        public const string OrderNull = "Mất sách";

        /// <summary>
        /// The order processing
        /// </summary>
        public const string OrderProcessing = "Đang xử lý";

        /// <summary>
        /// The order process all
        /// </summary>
        public const int OrderProcessAll = -1;

        /// <summary>
        /// The order process cancel
        /// </summary>
        public const int OrderProcessCancel = 3;

        /// <summary>
        /// The order process complete
        /// </summary>
        public const int OrderProcessComplete = 2;

        /// <summary>
        /// The order process error
        /// </summary>
        public const int OrderProcessError = 5;

        /// <summary>
        /// The order process fail
        /// </summary>
        public const int OrderProcessFail = 4;

        /// <summary>
        /// The order process processing
        /// </summary>
        public const int OrderProcessProcessing = 1;

        /// <summary>
        /// The order process start
        /// </summary>
        public const int OrderProcessStart = 0;

        /// <summary>
        /// The order start
        /// </summary>
        public const string OrderStart = "Đang mượn";

        /// <summary>
        /// The page footer
        /// </summary>
        public const string PageFooter = "pagefooter";

        /// <summary>
        /// The page foote r1
        /// </summary>
        public const string PageFooter1 = "pagefooter1";

        /// <summary>
        /// The page foote r2
        /// </summary>
        public const string PageFooter2 = "pagefooter2";

        /// <summary>
        /// The page foote r3
        /// </summary>
        public const string PageFooter3 = "pagefooter3";

        /// <summary>
        /// The page foote r4
        /// </summary>
        public const string PageFooter4 = "pagefooter4";

        /// <summary>
        /// The page foote r5
        /// </summary>
        public const string PageFooter5 = "pagefooter5";

        /// <summary>
        /// The page name
        /// </summary>
        public const string PageName = "pagename";

        /// <summary>
        /// The payment gate baokim
        /// </summary>
        public const string PaygateBaokim = "BAOKIM";

        /// <summary>
        /// The payment gate nganluong
        /// </summary>
        public const string PaygateNganLuong = "NGANLUONG";

        /// <summary>
        /// The payment all
        /// </summary>
        public const int PaymentAll = -1;

        /// <summary>
        /// The payment all text
        /// </summary>
        public const string PaymentAllText = "Tất cả";

        /// <summary>
        /// The payment cancel
        /// </summary>
        public const int PaymentCancel = 2;

        /// <summary>
        /// The payment cancel text
        /// </summary>
        public const string PaymentCancelText = "Hủy";

        /// <summary>
        /// The payment fail
        /// </summary>
        public const int PaymentFail = 3;

        /// <summary>
        /// The payment fail text
        /// </summary>
        public const string PaymentFailText = "Thanh toán thất bại";

        /// <summary>
        /// The payment full
        /// </summary>
        public const int PaymentFull = 1;

        /// <summary>
        /// The payment full text
        /// </summary>
        public const string PaymentFullText = "Đã thanh toán";

        /// <summary>
        /// The payment guide
        /// </summary>
        public const string PaymentGuide = "payment_guide";

        /// <summary>
        /// The payment guide text
        /// </summary>
        public const string PaymentGuideText = "Hướng dẫn thanh toán";

        /// <summary>
        /// The payment refund
        /// </summary>
        public const int PaymentRefund = 4;

        /// <summary>
        /// The payment refund text
        /// </summary>
        public const string PaymentRefundText = "Trả lại tiền";

        /// <summary>
        /// The payment start
        /// </summary>
        public const int PaymentStart = 0;

        /// <summary>
        /// The payment start text
        /// </summary>
        public const string PaymentStartText = "Chưa thanh toán";

        /// <summary>
        /// The post
        /// </summary>
        public const string Post = "post";

        /// <summary>
        /// The price maximum
        /// </summary>
        public const string PriceMax = "price_max";

        /// <summary>
        /// The price minimum
        /// </summary>
        public const string PriceMin = "price_min";

        /// <summary>
        /// The product
        /// </summary>
        public const string Product = "product";

        /// <summary>
        /// The product
        /// </summary>
        public const string ProductCategoryType = "SP";

        /// <summary>
        /// The product content
        /// </summary>
        public const string ProductContent = "productcontent";

        /// <summary>
        /// The product hot
        /// </summary>
        public const string ProductHot = "product_hot";

        /// <summary>
        /// The product promotion
        /// </summary>
        public const string ProductPromotion = "product_promotion";

        /// <summary>
        /// The project
        /// </summary>
        public const string Project = "PR";

        /// <summary>
        /// The project text
        /// </summary>
        public const string ProjectText = "Project";

        /// <summary>
        /// The role admin
        /// </summary>
        public const string RoleAdmin = "Admin";

        /// <summary>
        /// The role client
        /// </summary>
        public const string RoleClient = "Client";

        /// <summary>
        /// The service
        /// </summary>
        public const string Service = "SR";

        /// <summary>
        /// The service text
        /// </summary>
        public const string ServiceText = "Dịch vụ";

        /// <summary>
        /// The size
        /// </summary>
        public const string Size = "SIZ";

        /// <summary>
        /// The size text
        /// </summary>
        public const string SizeText = "Size sản phẩm";

        /// <summary>
        /// The skype
        /// </summary>
        public const string Skyper = "Skyper";

        /// <summary>
        /// The slide
        /// </summary>
        public const string Slide = "SL";

        /// <summary>
        /// The slide background
        /// </summary>
        public const string SlideBackground = "BG";

        /// <summary>
        /// The slide background text
        /// </summary>
        public const string SlideBackgroundText = "Background slide ảnh";

        /// <summary>
        /// The slide number
        /// </summary>
        public const int SlideNumber = 5;

        /// <summary>
        /// The slide text
        /// </summary>
        public const string SlideText = "Slide ảnh";

        /// <summary>
        /// The slogan
        /// </summary>
        public const string Slogan = "slogan";

        ////public const string VIDEO = "video";
        ////Email

        /// <summary>
        /// The host
        /// </summary>
        public const string SmtpHost = "smtphost";

        /// <summary>
        /// The pass
        /// </summary>
        public const string SmtpPass = "smtppass";

        /// <summary>
        /// The port
        /// </summary>
        public const string SmtpPort = "smtpport";

        /// <summary>
        /// The user
        /// </summary>
        public const string SmtpUser = "smtpuser";

        /// <summary>
        /// The Member
        /// </summary>
        public const string Member = "MB";

        /// <summary>
        /// The Member text
        /// </summary>
        public const string MemberText = "Thành Viên";

        /// <summary>
        /// The support
        /// </summary>
        public const string Support = "support";

        /// <summary>
        /// The tax
        /// </summary>
        public const string Tax = "tax";

        /// <summary>
        /// The testimonials
        /// </summary>
        public const string Testimonials = "TE";

        /// <summary>
        /// The testimonials text
        /// </summary>
        public const string TestimonialsText = "Cảm nhận";

        /// <summary>
        /// The time cache
        /// </summary>
        public const string TimeCache = "TimeCache";

        /// <summary>
        /// The video
        /// </summary>
        public const string Video = "VD";

        /// <summary>
        /// The video text
        /// </summary>
        public const string VideoText = "video";

        /// <summary>
        /// The view
        /// </summary>
        public const string View = "view";

        /// <summary>
        /// The yahoo
        /// </summary>
        public const string Yahoo = "yahoo";

        /// <summary>
        /// The vietnamese signs
        /// </summary>
        private static readonly string[] VietnameseSigns = new string[]
        {
            "aAeEoOuUiIdDyY",

            "áàạảãâấầậẩẫăắằặẳẵ",

            "ÁÀẠẢÃÂẤẦẬẨẪĂẮẰẶẲẴ",

            "éèẹẻẽêếềệểễ",

            "ÉÈẸẺẼÊẾỀỆỂỄ",

            "óòọỏõôốồộổỗơớờợởỡ",

            "ÓÒỌỎÕÔỐỒỘỔỖƠỚỜỢỞỠ",

            "úùụủũưứừựửữ",

            "ÚÙỤỦŨƯỨỪỰỬỮ",

            "íìịỉĩ",

            "ÍÌỊỈĨ",

            "đ",

            "Đ",

            "ýỳỵỷỹ",

            "ÝỲỴỶỸ"
        };

        /// <summary>
        /// The group mapping
        /// </summary>
        private static string[] groupMapping = new string[] { "Trăm", "Nghìn", "Triệu", "Tỉ", "Nghìn", "Triệu", "Tỉ", "Nghìn", "Triệu", "Tỉ" };

        /// <summary>
        /// The tens mapping
        /// </summary>
        private static string[] tensMapping =
            new string[]
        {
            "Mười", "Hai Mươi", "Ba mươi", "Bốn mươi", "Năm mươi", "Sáu mươi", "Bảy mươi", "Tám mươi", "Chín mươi"
        };

        /// <summary>
        /// The ones mapping
        /// </summary>
        private string[] onesMapping =
            new string[]
        {
            "Không", "Một", "Hai", "Ba", "Bốn", "Năm", "Sáu", "Bảy", "Tám", "Chín"
        };

        /// <summary>
        /// Initializes a new instance of the <see cref="CommonGlobal"/> class.
        /// </summary>
        public CommonGlobal()
        {
        }

        /// <summary>
        /// Check number the specified CHK.
        /// </summary>
        /// <param name="checkString">The Check number.</param>
        /// <returns>return bool</returns>
        public static bool Checknumber(string checkString)
        {
            double number;
            bool isNum;
            isNum = double.TryParse(checkString, out number);

            return isNum;
        }

        /// <summary>
        /// Completes the link.
        /// </summary>
        /// <param name="str">The string.</param>
        /// <returns>Complete Link</returns>
        public static string CompleteLink(string str)
        {
            str = RemoveSign4VietnameseString(str);
            str = RemoveSpecialWord(str);
            str = str.Trim();
            str = str.Replace(" ", "-");
            str = str.Replace("\"", string.Empty);

            return str;
        }

        /// <summary>
        /// Completes the name file images.
        /// </summary>
        /// <param name="str">The string.</param>
        /// <returns>Complete Name file Images</returns>
        public static string CompleteNamefileImages(string str)
        {
            str = RemoveSign4VietnameseString(str);
            str = RemoveSpecialWordForImages(str);
            str = str.Trim();
            str = str.Replace(" ", "-");
            str = str.Replace("\"", string.Empty);
            str = str.ToLower();

            return str;
        }

        /// <summary>
        /// Cuts the string.
        /// </summary>
        /// <param name="str">The string.</param>
        /// <param name="length">The length.</param>
        /// <returns>Cut String</returns>
        public static string CutString(string str, int length)
        {
            try
            {
                if (!string.IsNullOrEmpty(str) && str.Length > length)
                {
                    return str.Substring(0, length) + "...";
                }
                else
                {
                    return str;
                }
            }
            catch
            {
                return string.Empty;
            }
        }

        /// <summary>
        /// Deletes the photo.
        /// </summary>
        /// <param name="location">The location.</param>
        public static void DelPhoto(string location)
        {
            try
            {
                System.IO.FileInfo file = new System.IO.FileInfo(location);
                if (file.Exists == true)
                {
                    file.Delete();
                }
            }
            catch
            {
            }
        }

        /// <summary>
        /// Files the name.
        /// </summary>
        /// <param name="location">The location.</param>
        /// <returns>File Name</returns>
        public static string FileName(string location)
        {
            System.IO.FileInfo file = new System.IO.FileInfo(location);
            string name = ".jpg";
            if (file.Exists == true)
            {
                name = file.Name;
            }
            else
            {
                name = ".jpg";
            }

            return name;
        }

        /// <summary>
        /// Files the size.
        /// </summary>
        /// <param name="location">The location.</param>
        /// <returns>File Size</returns>
        public static string FileSize(string location)
        {
            System.IO.FileInfo file = new System.IO.FileInfo(location);
            string size = "0";
            double doubleSize;
            if (file.Exists == true)
            {
                if (file.Length < 1024)
                {
                    size = file.Length.ToString() + "&nbsp;Byte";
                }
                else
                {
                    doubleSize = file.Length / 1024.0;
                    if (doubleSize < 1024)
                    {
                        size = doubleSize.ToString() + "&nbsp;Kb";
                    }
                    else
                    {
                        doubleSize = doubleSize / 1024.0;
                        size = doubleSize.ToString() + "&nbsp; Mb";
                    }
                }
            }
            else
            {
                size = "0";
            }

            return size;
        }

        /// <summary>
        /// Fins the string in string.
        /// </summary>
        /// <param name="s1">The s1.</param>
        /// <param name="s2">The s2.</param>
        /// <returns>Fin String InString</returns>
        public static bool FinStringInString(string s1, string s2)
        {
            bool rt = false;
            string[] arr = s1.Split(',');
            foreach (string item in arr)
            {
                if (item == s2)
                {
                    return true;
                }
            }

            return rt;
        }

        /// <summary>
        /// Formats the money.
        /// </summary>
        /// <param name="priceOld">The price old.</param>
        /// <param name="priceNew">The price new.</param>
        /// <returns>
        /// Format Money
        /// </returns>
        public static string FormatMoney(string priceOld, string priceNew)
        {
            try
            {
                if (priceOld == "0" || priceNew == "0")
                {
                    return "liên hệ"; //Util.Translate("product_price_contact");
                }
                else
                {
                    string strGiaCu = string.Format(System.Globalization.CultureInfo.CreateSpecificCulture("vi-VN"), "{0:c0}", Convert.ToDouble(priceOld));

                    string strGiaMoi = string.Format(System.Globalization.CultureInfo.CreateSpecificCulture("vi-VN"), "{0:c0}", Convert.ToDouble(priceNew));

                    return string.Format("<span class=\"price-old\">{0}</span> <span class=\"price-new\">{1}</span>", strGiaCu.Replace(" ", string.Empty), strGiaMoi.Replace(" ", string.Empty));
                }
            }
            catch
            {
                return "liên hệ";
            }
        }

        /// <summary>
        /// Formats the money.
        /// </summary>
        /// <param name="money">The money.</param>
        /// <returns>Format Money</returns>
        public static string FormatMoney(string money)
        {
            try
            {
                if (money == "0")
                {
                    return "liên hệ"; //Util.Translate("product_price_contact");
                }
                else
                {
                    return string.Format(System.Globalization.CultureInfo.CreateSpecificCulture("vi-VN"), "{0:c0}", Convert.ToDouble(money));
                }
            }
            catch
            {
                return "liên hệ";
            }
        }

        /// <summary>
        /// Formats the money admin.
        /// </summary>
        /// <param name="money">The money.</param>
        /// <returns>Format Money Admin</returns>
        public static string FormatMoneyAdmin(string money)
        {
            try
            {
                return string.Format(System.Globalization.CultureInfo.CreateSpecificCulture("vi-VN"), "{0:c0}", Convert.ToDouble(money));
            }
            catch
            {
                return "liên hệ";
            }
        }

        /// <summary>
        /// Gets the name of the catalog type.
        /// </summary>
        /// <param name="type">The type.</param>
        /// <returns> Get Catalog Type Name </returns>
        public static string GetCatalogTypeName(string type)
        {
            string type_name = string.Empty;
            if (type == CommonGlobal.CateProduct)
            {
                type_name = CommonGlobal.CateProductName;
            }
            else if (type == CommonGlobal.CateNews)
            {
                type_name = CommonGlobal.CateNewsName;
            }
            else if (type == CommonGlobal.CateCollection)
            {
                type_name = CommonGlobal.CateCollectionName;
            }
            else if (type == CommonGlobal.CateLookBook)
            {
                type_name = CommonGlobal.CateLookBookName;
            }
            else if (type == CommonGlobal.CateGallery)
            {
                type_name = CommonGlobal.CateGalleryName;
            }
            else if (type == CommonGlobal.CateService)
            {
                type_name = CommonGlobal.CateServiceName;
            }
            else if (type == CommonGlobal.CateSaleoff)
            {
                type_name = CommonGlobal.CateSaleoffName;
            }
            else
            {
                type_name = "Sách";
            }

            return type_name;
        }

        /// <summary>
        /// Gets the date.
        /// </summary>
        /// <param name="date">The date.</param>
        /// <returns>Get Date</returns>
        public static string GetDate(string date)
        {
            try
            {
                DateTime dt = Convert.ToDateTime(date);
                return dt.ToString(CsDisplayDateFormat);
            }
            catch
            {
                return string.Empty;
            }
        }

        /// <summary>
        /// Gets the image.
        /// </summary>
        /// <param name="image">The Image.</param>
        /// <returns>Get Image</returns>
        public static string GetImage(string image)
        {
            try
            {
                if (image == "0" || image == string.Empty)
                {
                    return "/images/noimage.jpg";
                }
                else
                {
                    return image;
                }
            }
            catch
            {
                return "/images/noimage.jpg";
            }
        }

        /// <summary>
        /// Gets the name of the link ad type.
        /// </summary>
        /// <param name="type">The type.</param>
        /// <returns>Get Link AD Type Name</returns>
        public static string GetLinkADTypeName(string type)
        {
            string type_name = string.Empty;
            if (type == CommonGlobal.Link)
            {
                type_name = CommonGlobal.LinkText;
            }
            else if (type == CommonGlobal.AdFooter)
            {
                type_name = CommonGlobal.AdFooterText;
            }
            else if (type == CommonGlobal.Slide)
            {
                type_name = CommonGlobal.SlideText;
            }
            else if (type == CommonGlobal.SlideBackground)
            {
                type_name = CommonGlobal.SlideBackgroundText;
            }
            else if (type == CommonGlobal.Partner)
            {
                type_name = CommonGlobal.PartnerText;
            }
            else if (type == CommonGlobal.Project)
            {
                type_name = CommonGlobal.ProjectText;
            }
            else if (type == CommonGlobal.Testimonials)
            {
                type_name = CommonGlobal.TestimonialsText;
            }
            else if (type == CommonGlobal.Video)
            {
                type_name = CommonGlobal.VideoText;
            }
            else if (type == CommonGlobal.Member)
            {
                type_name = CommonGlobal.MemberText;
            }
            else if (type == CommonGlobal.Service)
            {
                type_name = CommonGlobal.ServiceText;
            }
            else if (type == CommonGlobal.AdLeft)
            {
                type_name = CommonGlobal.AdLeftText;
            }
            else if (type == CommonGlobal.AdRight)
            {
                type_name = CommonGlobal.AdRightText;
            }
            else if (type == CommonGlobal.AdTop)
            {
                type_name = CommonGlobal.AdTopText;
            }
            else if (type == CommonGlobal.AdMiddle)
            {
                type_name = CommonGlobal.AdMiddleText;
            }
            else if (type == CommonGlobal.AdBottom)
            {
                type_name = CommonGlobal.AdBottomText;
            }
            else if (type == CommonGlobal.AdBottomLeft)
            {
                type_name = CommonGlobal.AdBottomLeftText;
            }
            else if (type == CommonGlobal.AboutContent)
            {
                type_name = CommonGlobal.AboutContentText;
            }
            else if (type == CommonGlobal.AcountShort)
            {
                type_name = CommonGlobal.AboutShortText;
            }
            else if (type == CommonGlobal.ContactDetail)
            {
                type_name = CommonGlobal.ContactDetailText;
            }
            else if (type == CommonGlobal.Contact)
            {
                type_name = CommonGlobal.ContactText;
            }
            else if (type == CommonGlobal.ContentShipping)
            {
                type_name = CommonGlobal.ContentShippingText;
            }
            else if (type == CommonGlobal.PaymentGuide)
            {
                type_name = CommonGlobal.PaymentGuideText;
            }
            else if (type == CommonGlobal.EmailOrderConfirm)
            {
                type_name = CommonGlobal.EmailOrderConfirmText;
            }
            else if (type == CommonGlobal.EmailConfirmForgotPassword)
            {
                type_name = CommonGlobal.EmailConfirmForgotPasswordText;
            }
            else if (type == CommonGlobal.EmailOrderPaymentChangeStatus)
            {
                type_name = CommonGlobal.EmailOrderPaymentChangeStatusText;
            }

            return type_name;
        }

        /// <summary>
        /// Gets the order status string.
        /// </summary>
        /// <param name="order_process">The order process.</param>
        /// <returns>Get Order Status String</returns>
        public static string GetOrderStatusString(int order_process)
        {
            switch (order_process)
            {
                case CommonGlobal.OrderProcessStart:
                {
                    return CommonGlobal.OrderStart;
                }

                case CommonGlobal.OrderProcessProcessing:
                {
                    return CommonGlobal.OrderProcessing;
                }

                case CommonGlobal.OrderProcessComplete:
                {
                    return CommonGlobal.OrderComplete;
                }

                case CommonGlobal.OrderProcessCancel:
                {
                    return CommonGlobal.OrderCancel;
                }

                case CommonGlobal.OrderProcessFail:
                {
                    return CommonGlobal.OrderFail;
                }

                case CommonGlobal.OrderProcessError:
                {
                    return CommonGlobal.OrderNull;
                }

                default:
                {
                    return string.Empty;
                }
            }
        }

        /// <summary>
        /// Gets the payment status string.
        /// </summary>
        /// <param name="payment_status">The payment status.</param>
        /// <returns>Get Payment Status String</returns>
        public static string GetPaymentStatusString(int payment_status)
        {
            switch (payment_status)
            {
                case CommonGlobal.PaymentStart:
                {
                    return CommonGlobal.PaymentStartText;
                }

                case CommonGlobal.PaymentFull:
                {
                    return CommonGlobal.PaymentFullText;
                }

                case CommonGlobal.PaymentCancel:
                {
                    return CommonGlobal.PaymentCancelText;
                }

                case CommonGlobal.PaymentFail:
                {
                    return CommonGlobal.PaymentFailText;
                }

                case CommonGlobal.PaymentRefund:
                {
                    return CommonGlobal.PaymentRefundText;
                }

                default:
                {
                    return string.Empty;
                }
            }
        }

        /// <summary>
        /// Gets the name of the product.
        /// </summary>
        /// <param name="str">The string.</param>
        /// <returns>Get Product Name</returns>
        public static string GetProductName(string str)
        {
            try
            {
                return CutString(str, 25);
            }
            catch
            {
                return string.Empty;
            }
        }

        /// <summary>
        /// Gets the name of the property type.
        /// </summary>
        /// <param name="type">The type.</param>
        /// <returns>Get Property Type Name</returns>
        public static string GetPropertyTypeName(string type)
        {
            string type_name = string.Empty;
            if (type == CommonGlobal.Color)
            {
                type_name = CommonGlobal.ColorText;
            }
            else if (type == CommonGlobal.Size)
            {
                type_name = CommonGlobal.SizeText;
            }

            return type_name;
        }

        /// <summary>
        /// Gets the summary.
        /// </summary>
        /// <param name="str">The string.</param>
        /// <returns>Get Summary</returns>
        public static string GetSummary(string str)
        {
            try
            {
                if (str.Length > 130)
                {
                    return CutString(str, 130);
                }
                else
                {
                    return str;
                }
            }
            catch
            {
                return string.Empty;
            }
        }

        /// <summary>
        /// Determines whether the specified file is image.
        /// </summary>
        /// <param name="file">The file.</param>
        /// <returns>
        ///   <c>true</c> if the specified file is image; otherwise, <c>false</c>.
        /// </returns>
        //public static bool IsImage(HttpPostedFileBase file)
        //{
        //    if (file.ContentType.Contains("image"))
        //    {
        //        return true;
        //    }

        //    string[] formats = new string[] { ".jpg", ".png", ".gif", ".jpeg"}; //// add more if u like...

        //    foreach (var item in formats)
        //    {
        //        if (file.FileName.Contains(item))
        //        {
        //            return true;
        //        }
        //    }

        //    return false;
        //}

        /// <summary>
        /// Determines whether the specified file is image.
        /// </summary>
        /// <param name="file">The file.</param>
        /// <returns>
        ///   <c>true</c> if the specified file is image; otherwise, <c>false</c>.
        /// </returns>
        //public static bool IsImageOrVideo(HttpPostedFileBase file)
        //{
        //    if (file.ContentType.Contains("image"))
        //    {
        //        return true;
        //    }

        //    string[] formats = new string[] { ".jpg", ".png", ".gif", ".jpeg", ".mp4" }; //// add more if u like...

        //    foreach (var item in formats)
        //    {
        //        if (file.FileName.Contains(item))
        //        {
        //            return true;
        //        }
        //    }

        //    return false;
        //}

        /// <summary>
        /// Determines whether the specified file is image.
        /// </summary>
        /// <param name="file">The file.</param>
        /// <returns>
        ///   <c>true</c> if the specified file is image; otherwise, <c>false</c>.
        /// </returns>
        //public static bool IsPdf(HttpPostedFileBase file)
        //{
        //    string[] formats = new string[] {".pdf" }; //// add more if u like...

        //    foreach (var item in formats)
        //    {
        //        if (file.FileName.Contains(item))
        //        {
        //            return true;
        //        }
        //    }

        //    return false;
        //}

        /// <summary>
        /// Determines whether [is show on menu admin] [the specified user name].
        /// </summary>
        /// <param name="user_name">Name of the user.</param>
        /// <param name="act">The act.</param>
        /// <param name="ctrl">The control.</param>
        /// <param name="type_act">The type act.</param>
        /// <param name="type">The type.</param>
        /// <returns>IsShow On Menu Admin</returns>
        public static string IsShowOnMenuAdmin(string user_name, string path, string type_act, string type)
        {
            var returnActive = UserModels.CheckPermission(user_name, path, type_act, type);

            return returnActive ? "style='display:'" : "style='display:none'";
        }

        /// <summary>
        /// Removes the sign4 vietnamese string.
        /// </summary>
        /// <param name="str">The string.</param>
        /// <returns>Remove Sign4 Vietnamese String</returns>
        public static string RemoveSign4VietnameseString(string str)
        {
            ////Tiến hành thay thế , lọc bỏ dấu cho chuỗi

            for (int i = 1; i < VietnameseSigns.Length; i++)
            {
                for (int j = 0; j < VietnameseSigns[i].Length; j++)
                {
                    str = str.Replace(VietnameseSigns[i][j], VietnameseSigns[0][i - 1]);
                }
            }

            return str;
        }

        /// <summary>
        /// Removes the special word.
        /// </summary>
        /// <param name="str">The string.</param>
        /// <returns>Remove Special Word</returns>
        public static string RemoveSpecialWord(string str)
        {
            string sp = @"~!@#$%^&*()+[]{}\/><.,:;";
            int lenght;
            string rt = string.Empty;
            if (!string.IsNullOrEmpty(str))
            {
                lenght = str.Length;
                for (int i = 0; i < lenght; i++)
                {
                    bool p = true;
                    for (int k = 0; k < sp.Length; k++)
                    {
                        if (str[i] == sp[k])
                        {
                            p = false;
                            break;
                        }
                    }

                    if (p == true)
                    {
                        rt = rt + str[i];
                    }
                }
            }

            return rt;
        }

        /// <summary>
        /// Removes the special word for images.
        /// </summary>
        /// <param name="str">The string.</param>
        /// <returns>Remove Special Word For Images</returns>
        public static string RemoveSpecialWordForImages(string str)
        {
            string sp = @"~!@#$%^&*()+[]{}\/><,:;";
            int lenght;
            lenght = str.Length;
            string rt = string.Empty;
            for (int i = 0; i < lenght; i++)
            {
                bool p = true;
                for (int k = 0; k < sp.Length; k++)
                {
                    if (str[i] == sp[k])
                    {
                        p = false;
                        break;
                    }
                }

                if (p == true)
                {
                    rt = rt + str[i];
                }
            }

            return rt;
        }

        /// <summary>
        /// Sends the mail.
        /// </summary>
        /// <param name="fromEmail">From email.</param>
        /// <param name="subject">The subject.</param>
        /// <param name="body">The body.</param>
        public static void SendMail(string fromEmail, string subject, string body)
        {
            SmtpClient smtpClient = new SmtpClient();
            System.Net.Mail.MailMessage mm = new System.Net.Mail.MailMessage();
            WebInfoModels web_infor = new WebInfoModels();

            //// Cấu hình SMTP Client
            smtpClient.Host = web_infor.GetContent(CommonGlobal.SmtpHost);
            smtpClient.Port = Convert.ToInt32(web_infor.GetContent(CommonGlobal.SmtpPort));
            smtpClient.UseDefaultCredentials = false;
            smtpClient.Credentials = new System.Net.NetworkCredential(web_infor.GetContent(CommonGlobal.SmtpUser), web_infor.GetContent(CommonGlobal.SmtpPass));
            smtpClient.EnableSsl = true;
            mm.IsBodyHtml = true;

            ////MailAddress fromAdd = new MailAddress(fromEmail);
            ////mm.From = fromAdd;

            ////mm.To.Add(web_infor.getContent(CommonGlobal.EMAIL));

            System.Net.Mail.MailAddress fromAdd = new System.Net.Mail.MailAddress(web_infor.GetContent(CommonGlobal.SmtpUser));
            mm.From = fromAdd;

            mm.To.Add(fromEmail);

            mm.Subject = subject;
            mm.Body = body;
            mm.IsBodyHtml = true;

            smtpClient.Send(mm);
        }

        /// <summary>
        /// Sends the mail.
        /// </summary>
        /// <param name="host">The s host.</param>
        /// <param name="port">The n port.</param>
        /// <param name="userName">Name of the s user.</param>
        /// <param name="password">The s password.</param>
        /// <param name="fromName">Name of the s from.</param>
        /// <param name="fromEmail">The s from email.</param>
        /// <param name="toName">Name of the s to.</param>
        /// <param name="toEmail">The s to email.</param>
        /// <param name="header">The s header.</param>
        /// <param name="message">The s message.</param>
        /// <param name="ssl">if set to <c>true</c> [f SSL].</param>
        //[Obsolete]
        //public static void SendMail(string host, int port, string userName, string password, string fromName, string fromEmail, string toName, string toEmail, string header, string message, bool ssl)
        //{
        //    if (toName.Length == 0)
        //    {
        //        toName = toEmail;
        //    }

        //    if (fromName.Length == 0)
        //    {
        //        fromName = fromEmail;
        //    }

        //    System.Web.Mail.MailMessage mail = new System.Web.Mail.MailMessage();
        //    mail.Fields["http://schemas.microsoft.com/cdo/configuration/smtpserver"] = host;
        //    mail.Fields["http://schemas.microsoft.com/cdo/configuration/sendusing"] = 2;

        //    mail.Fields["http://schemas.microsoft.com/cdo/configuration/smtpserverport"] = port.ToString();
        //    if (ssl)
        //    {
        //        mail.Fields["http://schemas.microsoft.com/cdo/configuration/smtpusessl"] = "true";
        //    }

        //    if (userName.Length == 0)
        //    {
        //        ////Ingen auth
        //    }
        //    else
        //    {
        //        mail.Fields["http://schemas.microsoft.com/cdo/configuration/smtpauthenticate"] = 1;
        //        mail.Fields["http://schemas.microsoft.com/cdo/configuration/sendusername"] = userName;
        //        mail.Fields["http://schemas.microsoft.com/cdo/configuration/sendpassword"] = password;
        //    }

        //    mail.To = toEmail;
        //    mail.From = fromEmail;
        //    mail.Subject = header;
        //    mail.Body = message;
        //    mail.BodyFormat = MailFormat.Html;

        //    System.Web.Mail.SmtpMail.SmtpServer = host;
        //    System.Web.Mail.SmtpMail.Send(mail);
        //}

        /// <summary>
        /// Times the date.
        /// </summary>
        /// <param name="date">The date.</param>
        /// <returns>Time Date</returns>
        public static string TimeDate(string date)
        {
            try
            {
                DateTime dt = Convert.ToDateTime(date);
                return dt.ToString(CsDisplayTime) + " | " + dt.ToString(CsDisplayDateFormat);
            }
            catch
            {
                return string.Empty;
            }
        }

        /// <summary>
        /// remove special character in Query
        /// </summary>
        /// <param name="stringQuery">The s.</param>
        /// <returns>To Query</returns>
        public static string ToQuery(string stringQuery)
        {
            string sRt = string.Empty;
            try
            {
                if (stringQuery != null)
                {
                    string stringPatern = "0123456789";
                    int k;
                    k = stringQuery.Length;
                    for (int i = 0; i < k; i++)
                    {
                        for (int j = 0; j < 10; j++)
                        {
                            if (stringQuery[i] == stringPatern[j])
                            {
                                sRt = sRt + stringQuery[i];
                                break;
                            }
                        }
                    }
                }
            }
            catch
            {
            }

            return sRt;
        }

        /// <summary>
        /// Converts the number to character.
        /// </summary>
        /// <param name="number">The number.</param>
        /// <returns>convert Number ToChar</returns>
        public virtual string ConvertNumberToChar(int number)
        {
            return this.ConvertNumberToChar((long)number);
        }

        /// <summary>
        /// Converts the number to character.
        /// </summary>
        /// <param name="number">The number.</param>
        /// <returns>convert Number ToChar</returns>
        public string ConvertNumberToChar(long number)
        {
            string sign = string.Empty;
            if (number < 0)
            {
                sign = "Âm";
                number = Math.Abs(number);
            }

            string retVal = null;
            retVal = this.ConvertNumberToChar(number.ToString());

            return sign + " " + retVal + " đồng";
        }

        /// <summary>
        /// Converts the number to character.
        /// </summary>
        /// <param name="s">The s.</param>
        /// <returns>convert Number ToChar</returns>
        public virtual string ConvertNumberToChar(string s)
        {
            string[] so = { "không", "một", "hai", "ba", "bốn", "năm", "sáu", "bảy", "tám", "chín" };
            string[] hang = { string.Empty, "nghìn", "triệu", "tỉ" };

            int i;
            int j;
            int donvi;
            int chuc;
            int tram;
            string str;
            str = string.Empty;
            i = s.Length;
            if (s == "0")
            {
                return "không";
            }
            /////''''
            i = s.Length;
            if (i == 0)
            {
                str = string.Empty;
            }
            else
            {
                j = 0;
                while (i > 0)
                {
                    donvi = int.Parse(s.Substring(i - 1, 1));
                    i = i - 1;
                    if (i > 0)
                    {
                        chuc = int.Parse(s.Substring(i - 1, 1));
                    }
                    else
                    {
                        chuc = -1;
                    }

                    i = i - 1;

                    if (i > 0)
                    {
                        tram = int.Parse(s.Substring(i - 1, 1));
                    }
                    else
                    {
                        tram = -1;
                    }

                    i = i - 1;

                    if (donvi > 0 | chuc > 0 | tram > 0 | j == 3)
                    {
                        str = hang[j] + " " + str;
                    }

                    j = j + 1;

                    if (j > 3)
                    {
                        j = 1;
                    }

                    if (donvi == 1 & chuc > 1)
                    {
                        str = "mốt" + " " + str;
                    }
                    else
                    {
                        if (donvi == 5 & chuc > 0)
                        {
                            str = "lăm" + " " + str;
                        }
                        else if (donvi > 0)
                        {
                            str = so[donvi] + " " + str;
                        }
                    }

                    if (chuc < 0)
                    {
                        break;
                    }
                    else
                    {
                        if (chuc == 0 & donvi > 0)
                        {
                            str = "lẻ" + " " + str;
                        }
                        else if (chuc == 1)
                        {
                            str = "mười" + " " + str;
                        }
                        else if (chuc > 1)
                        {
                            str = so[chuc] + " " + "mươi" + " " + str;
                        }
                    }

                    if (tram < 0)
                    {
                        break;
                    }
                    else
                    {
                        if (tram > 0 | chuc > 0 | donvi > 0)
                        {
                            str = so[tram] + " " + "trăm" + " " + str;
                        }
                    }
                }
            }

            return str.Trim();
        }

        /// <summary>
        /// Processes the group.
        /// </summary>
        /// <param name="number">The number.</param>
        /// <returns>Process Group</returns>
        private string ProcessGroup(int number)
        {
            int tens = number % 100;
            int hundreds = number / 100;

            string retVal = null;
            if (hundreds > 0)
            {
                retVal = this.onesMapping[hundreds] + " " + groupMapping[0];
            }

            if (tens > 0)
            {
                if (tens < 10)
                {
                    retVal += ((retVal != null) ? " Lẻ " : string.Empty) + this.onesMapping[tens];
                }
                else
                {
                    int ones = tens % 10;
                    tens = (tens / 10) - 1; //// 20's offset

                    retVal += ((retVal != null) ? " " : string.Empty) + tensMapping[tens];

                    if (ones > 0)
                    {
                        retVal += ((retVal != null) ? " " : string.Empty) + this.onesMapping[ones];
                    }
                }
            }

            return retVal;
        }

        ////public static string GetHTML(string URL)
        ////{
        ////    string connectionString = URL;
        ////    try
        ////    {
        ////        System.Net.HttpWebRequest myRequest = (System.Net.HttpWebRequest)WebRequest.Create(connectionString);
        ////        myRequest.Credentials = CredentialCache.DefaultCredentials;
        ////        ////// Get the response
        ////        WebResponse webResponse = myRequest.GetResponse();
        ////        Stream respStream = webResponse.GetResponseStream();
        ////        //////
        ////        StreamReader ioStream = new StreamReader(respStream);
        ////        string pageContent = ioStream.ReadToEnd();
        ////        ////// Close streams
        ////        ioStream.Close();
        ////        respStream.Close();
        ////        return pageContent;
        ////    }
        ////    catch (Exception)
        ////    {
        ////    }
        ////    return null;
        ////}
    }
}