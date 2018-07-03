namespace Web.Controllers
{
    using System;
    using System.Collections;
    using System.Collections.Generic;
    using System.Linq;
    using System.Text;
    using System.Web;
    using System.Web.Mvc;
    using System.Web.Script.Serialization;
    using Data;
    using Models;
    using ViewModels;
    using Web.Enums;
    using System.IO;

    /// <summary>
    /// Product Controller
    /// </summary>
    [Obsolete]
    public class ProductController : BaseController
    {
        /// <summary>
        /// Add to compare.
        /// </summary>
        /// <param name="id">The identifier.</param>
        /// <param name="act">The act.</param>
        /// <returns>Add to compare</returns>
        public ActionResult Add_to_compare(int id, string act)
        {
            /////compare product
            string action = string.IsNullOrEmpty(act) ? "0" : act;

            ArrayList arrCompareList;
            //// Lấy danh sách SP đã xem từ session
            if (HttpContext.Session["compare"] == null || HttpContext.Session["compare"].ToString() == string.Empty)
            {
                arrCompareList = new ArrayList();
            }
            else
            {
                arrCompareList = (ArrayList)HttpContext.Session["compare"];
            }

            //// Thêm SP đang xem vào danh sách so sánh đã xem
            if (action == "1")
            {
                if (!Util.CheckExistInArray(id.ToString(), arrCompareList) && (arrCompareList.Count < 4))
                {
                    arrCompareList.Add(id);
                }

                //// Lưu danh sách xuống session
                HttpContext.Session["compare"] = arrCompareList;
            }
            else if (action == "2")
            {
                ////remove one product
                if (Util.CheckExistInArray(id.ToString(), arrCompareList))
                {
                    arrCompareList.Remove(id);
                }

                //// Lưu danh sách xuống session
                HttpContext.Session["compare"] = arrCompareList;
            }
            else
            {
                ////clear compare list
                HttpContext.Session["compare"] = new ArrayList();
            }

            ////var jsonSerialiser = new JavaScriptSerializer();
            ////var json = jsonSerialiser.Serialize(shoppingCart.Values);
            var results = "1";

            return this.Json(results);
        }

        /// <summary>
        /// Collections the specified identifier.
        /// </summary>
        /// <param name="id">The identifier.</param>
        /// <param name="search">The search.</param>
        /// <param name="tag">The tag.</param>
        /// <param name="param">The parameter.</param>
        /// <param name="style_list">The style list.</param>
        /// <returns>Collections the specified</returns>
        public ActionResult Collection(int? id, string search, string tag, string param, string style_list)
        {
            /////collection product
            var product_view = new Products_view();
            string strBread;
            id = RouteData.Values["id"] != null ? Convert.ToInt16(RouteData.Values["id"].ToString()) : 0;
            var link = RouteData.Values["Link"] != null ? RouteData.Values["Link"].ToString() : string.Empty;
            if (Request.QueryString["param"] != null && Request.QueryString["param"].ToString() != string.Empty)
            {
                param = HttpUtility.HtmlDecode(Request.QueryString["param"].ToString());
            }

            if (Request.QueryString["style_list"] != null && Request.QueryString["style_list"].ToString() != string.Empty)
            {
                style_list = Request.QueryString["style_list"].ToString();
            }

            if (id == 0)
            {
                ViewBag.Title = App_GlobalResources.Lang.strCollection + " | " + GeneralModels.GetContent(CommonGlobal.PageName, this.Lang);
                strBread = "<li>" + App_GlobalResources.Lang.strCollection + "</li>";
                product_view.Heading = App_GlobalResources.Lang.strCollection;
                ViewBag.str_breadcrumbs = strBread;
            }
            else
            {
                CatalogModels cateModels = new CatalogModels();
                C_Catalog obj = cateModels.GetbyID((int)id);
                if (obj.Title != string.Empty)
                {
                    ViewBag.Title = obj.Title + " | " + GeneralModels.GetContent(CommonGlobal.PageName, this.Lang);
                    strBread = "<li>" + obj.Title + "</li>";
                    product_view.Heading = obj.Title;
                }
                else
                {
                    ViewBag.Title = obj.CategoryName + " | " + GeneralModels.GetContent(CommonGlobal.PageName, this.Lang);
                    strBread = "<li>" + obj.CategoryName + "</li>";
                    product_view.Heading = obj.CategoryName;
                }

                this.AddMeta(CommonGlobal.Keyword, obj.Keyword);
                this.AddMeta(CommonGlobal.Description, this.ClearHtml(HttpUtility.HtmlDecode(obj.Description)));
                ViewBag.str_breadcrumbs = strBread;
            }

            if (search == null)
            {
                search = string.Empty;
            }

            if (tag == null)
            {
                tag = string.Empty;
            }

            product_view.Link = link;
            product_view.Cate_id = id ?? 0;
            product_view.Text_search = search;
            product_view.Tag = tag;
            product_view.Param = param;
            product_view.Style_list = style_list;

            return this.PartialView("../page/collection", product_view);
        }

        /// <summary>
        /// Collection the list all.
        /// </summary>
        /// <param name="id">The identifier.</param>
        /// <param name="link">The link.</param>
        /// <param name="cate_type">Type of the cate.</param>
        /// <param name="search">The search.</param>
        /// <param name="manufacture">The manufacture.</param>
        /// <param name="tag">The tag.</param>
        /// <param name="param">The parameter.</param>
        /// <param name="style_list">The style list.</param>
        /// <returns>Collection the list all</returns>
        [ChildActionOnly]
        [AcceptVerbs(HttpVerbs.Get)]
        public ActionResult Collection_list_all(int? id, string link, string cate_type, string search, string manufacture, string tag, string param, string style_list, string typekey = "ProductName")
        {
            WebInfoModels web_infor = new Models.WebInfoModels();
            int page = 1; ////start page
            int page_size = int.Parse(Util.GetConfigValue("NumberPageSizeDefault", "9")); ////start page size
            string order = "DateModify;desc";
            string lang = LanguageModels.ActiveLanguage().LangCultureName;
            if (string.IsNullOrEmpty(cate_type))
            {
                cate_type = CommonGlobal.CateCollection;
            }

            if (string.IsNullOrEmpty(style_list))
            {
                style_list = "grid";
            }

            int price_min = web_infor.GetContent(CommonGlobal.PriceMin) != string.Empty ? int.Parse(web_infor.GetContent(CommonGlobal.PriceMin)) : 0;
            int price_max = web_infor.GetContent(CommonGlobal.PriceMax) != string.Empty ? int.Parse(web_infor.GetContent(CommonGlobal.PriceMax)) : 10;

            return this.Collection_list_all(lang, cate_type, id, link, search, manufacture, tag, param, price_min, price_max, page, page_size, order, style_list, typekey);
        }

        /// <summary>
        /// Collections the list all.
        /// </summary>
        /// <param name="lang">The language.</param>
        /// <param name="cate_type">Type of the cate.</param>
        /// <param name="cate_id">The cate identifier.</param>
        /// <param name="link_text">The link text.</param>
        /// <param name="search">The search.</param>
        /// <param name="manufacture">The manufacture.</param>
        /// <param name="tag">The tag.</param>
        /// <param name="param">The parameter.</param>
        /// <param name="price_min">The price minimum.</param>
        /// <param name="price_max">The price maximum.</param>
        /// <param name="page">The page.</param>
        /// <param name="page_size">Size of the page.</param>
        /// <param name="order">The order.</param>
        /// <param name="style_list_show">The style list show.</param>
        /// <returns>Collection the list all</returns>
        [ChildActionOnly]
        [AcceptVerbs(HttpVerbs.Post)]
        public ActionResult Collection_list_all(string lang, string cate_type, int? cate_id, string link_text, string search, string manufacture, string tag, string param, int? price_min, int? price_max, int? page, int? page_size, string order, string style_list_show, string typekey = "ProductName")
        {
            WebInfoModels web_infor = new Models.WebInfoModels();
            CatalogModels cateModels = new CatalogModels();
            int total_record = 0;
            ProductModels proModels = new ProductModels();
            ////request query string param
            page = Request.QueryString["page"] != null ? Convert.ToInt16(Request.QueryString["page"].ToString()) : 1;

            if (cate_id == null)
            {
                cate_id = RouteData.Values["id"] != null ? Convert.ToInt16(RouteData.Values["id"].ToString()) : 0;
            }

            if (string.IsNullOrEmpty(link_text))
            {
                link_text = RouteData.Values["Link"] != null ? RouteData.Values["Link"].ToString() : string.Empty;
            }

            ////get order for product list
            string order_by = string.Empty;
            string order_type = string.Empty;
            if (string.IsNullOrEmpty(order))
            {
                order_by = "DateModify";
                order_type = "desc";
                order = order_by + ";" + order_type;
            }
            else
            {
                if (order.Contains(';'))
                {
                    order_by = order.Split(';')[0];
                    order_type = order.Split(';')[1];
                }
                else
                {
                    order_by = "DateModify";
                    order_type = "desc";
                    order = order_by + ";" + order_type;
                }
            }

            price_min = price_min * 1000000;
            price_max = price_max * 1000000;

            proModels.ClearCache(lang + cate_type + (cate_id ?? 0) + search + tag + param + price_min + price_max + page + page_size + order_by + order_type);

            List<SelectListItem> orderDrop = new List<SelectListItem>();
            orderDrop.AddRange(new SelectListItem[]
            {
                new SelectListItem { Selected = order == "DateModify;desc" ? true : false, Text = App_GlobalResources.Lang.strOrderDateDesc, Value = "DateModify;desc" },
                new SelectListItem { Selected = order == "DateModify;asc" ? true : false, Text = App_GlobalResources.Lang.strOrderDateAsc, Value = "DateModify;asc" },
                new SelectListItem { Selected = order == "ProductName;asc" ? true : false, Text = App_GlobalResources.Lang.strOrderNameAsc, Value = "ProductName;asc" },
                new SelectListItem { Selected = order == "ProductName;desc" ? true : false, Text = App_GlobalResources.Lang.strOrderNameDesc, Value = "ProductName;desc" },
                new SelectListItem { Selected = order == "PriceNew;asc" ? true : false, Text = App_GlobalResources.Lang.strOrderPriceAsc, Value = "PriceNew;asc" },
                new SelectListItem { Selected = order == "PriceNew;desc" ? true : false, Text = App_GlobalResources.Lang.strOrderPriceDesc, Value = "PriceNew;desc" }
            });

            var products_view = new ViewModels.Page_products_view();
            products_view.List_page_size = this.GetSizePagingPublic(page_size ?? int.Parse(Util.GetConfigValue("NumberPageSizeDefault", "9")));
            products_view.List_order = orderDrop;
            products_view.Page_list_product = proModels.GetListProductByCategoryID(lang, cate_type, cate_id, search, typekey, manufacture, tag, param, (int)price_min, (int)price_max, (int)page, (int)page_size, order_by, order_type, out total_record);
            products_view.Total_record = total_record;
            if (total_record == 0 && search != string.Empty && !string.IsNullOrEmpty(search))
            {
                products_view.Text_search_result = App_GlobalResources.Lang.strSearchResult;
            }

            products_view.Order = order;
            products_view.Page_size = page_size ?? int.Parse(Util.GetConfigValue("NumberPageSizeDefault", "9"));
            products_view.Style_list = style_list_show;
            products_view.Cate_type = cate_type;
            products_view.Cate_id = cate_id ?? 0;
            if (cate_id != null && cate_id > 0)
            {
                C_Catalog cate_parent = cateModels.GetbyID((int)cate_id);
                products_view.Cate_parent_name = cate_parent.CategoryName;
                products_view.Cate_parent_summary = cate_parent.Intro;
            }

            products_view.Link = link_text;
            products_view.Lang = lang;
            products_view.Tag = tag;
            products_view.Text_search = search;
            products_view.Param = param;
            products_view.Price_min = (int)price_min / 1000000;
            products_view.Price_max = (int)price_max / 1000000;
            products_view.Parent_action = HttpContext.Request.RequestContext.RouteData.Values["action"].ToString();
            products_view.Parent_controller = HttpContext.Request.RequestContext.RouteData.Values["controller"].ToString();

            return this.PartialView("../control/collection_list_all", products_view);
        }

        /// <summary>
        /// Compares this instance.
        /// </summary>
        /// <returns>the Compare</returns>
        public ActionResult Compare()
        {
            /////compare product
            string strbreadcrumbs = string.Empty;
            this.ViewBag.Title = App_GlobalResources.Lang.strCompare + " | " + GeneralModels.GetContent(CommonGlobal.PageName, this.Lang);

            strbreadcrumbs = string.Format("<li><a href=\"" + Url.Action("products", "product") + "\">" + App_GlobalResources.Lang.mnuProduct + "</a></li>");
            strbreadcrumbs += string.Format("<li>" + App_GlobalResources.Lang.strCompare + "</li>");
            this.ViewBag.str_breadcrumbs = strbreadcrumbs;

            this.ViewBag.heading = App_GlobalResources.Lang.strCompare;

            this.AddMeta(CommonGlobal.Keyword, App_GlobalResources.Lang.strCompare);
            this.AddMeta(CommonGlobal.Description, App_GlobalResources.Lang.strCompare);

            return this.PartialView("../page/compare");
        }

        /// <summary>
        /// Compares the detail.
        /// </summary>
        /// <returns>the Compare detail</returns>
        [ChildActionOnly]
        public ActionResult Compare_detail()
        {
            ProductModels proModels = new ProductModels();
            RatingModels ratingModels = new RatingModels();
            ProductPropertyModels servicePro = new ProductPropertyModels();
            ArrayList compareLst = (ArrayList)Session["compare"];
            StringBuilder sb = new StringBuilder();
            string compare_value = string.Empty;
            if (compareLst == null || compareLst.Count < 2)
            {
                compare_value = App_GlobalResources.Lang.messErrorCompare;
            }
            else
            {
                List<C_Product> lstProduct = proModels.GetCompareList(compareLst);

                sb.Append("<thead> <tr class=\"card_product_name\">");
                sb.Append(" <th>" + App_GlobalResources.Lang.strProduct + "</th>");
                foreach (var it in lstProduct)
                {
                    sb.Append("   <th id=\"" + it.ProductID + "\"><a href=\"" + Url.RouteUrl("Default_Link", new { controller = "product", action = "product", id = it.ProductID, Link = it.Link }) + "\">" + it.ProductName + "</a></th>");
                }

                sb.Append("</tr> </thead>");
                sb.Append("<tbody> <tr>");
                sb.Append("   <td class=\"card_product_image\" data-th=\"Products\">" + App_GlobalResources.Lang.strImage + "</td>");
                foreach (var it in lstProduct)
                {
                    sb.Append("   <td class=\"card_product_image\" data-th=\"Products\" id=\"" + it.ProductID + "\"><img src=" + CommonGlobal.GetImage(it.ImagePath) + " alt=" + it.ProductName + " /></td>");
                }

                sb.Append(" </tr>");
                sb.Append(" <tr>");
                sb.Append("   <td class=\"card_product_image\" data-th=\"Products\">" + App_GlobalResources.Lang.strReview + "</td>");
                foreach (var it in lstProduct)
                {
                    List<C_Rating> listRating = ratingModels.GetListRatingByItem(it.ProductID);
                    int ratingSum = ratingModels.GetRatingSumforItem(it.ProductID);
                    int ratingTotal = ratingModels.GetRatingTotalforItem(it.ProductID);

                    StringBuilder html_rating = new StringBuilder();
                    var start_no = ratingTotal != 0 ? (ratingSum / ratingTotal) : 0;
                    var other_no = 5 - start_no;
                    for (int jj = 0; jj < other_no; jj++)
                    {
                        html_rating.Append("<span class=\"star\"></span>");
                    }

                    for (int ii = 0; ii < start_no; ii++)
                    {
                        html_rating.Append("<span class=\"star active\"></span>");
                    }

                    sb.Append("   <td class=\"card_product_price\" data-th=\"Product\" id=\"" + it.ProductID + "\"> <div class=\"product-rating\"><div class=\"stars\">" + html_rating.ToString() + " </div></div></td>");
                }

                sb.Append(" </tr>");
                sb.Append(" <tr>");
                sb.Append("   <td class=\"card_product_image\" data-th=\"Products\">" + App_GlobalResources.Lang.strDescription + "</td>");
                foreach (var it in lstProduct)
                {
                    sb.Append("   <td class=\"card_product_price\" data-th=\"Product\" id=\"" + it.ProductID + "\">" + it.Summary + "</td>");
                }

                sb.Append(" </tr>");
                sb.Append(" <tr>");
                sb.Append("   <td class=\"card_product_image\" data-th=\"Products\">" + App_GlobalResources.Lang.strBrand + "</td>");
                foreach (var it in lstProduct)
                {
                    sb.Append("   <td class=\"card_product_price\" data-th=\"Product\" id=\"" + it.ProductID + "\">" + it.Manufacture + "</td>");
                }

                sb.Append(" </tr>");
                sb.Append(" <tr>");
                sb.Append("   <td class=\"card_product_image\" data-th=\"Products\">" + App_GlobalResources.Lang.strAvailability + "</td>");
                foreach (var it in lstProduct)
                {
                    sb.Append("   <td id=\"" + it.ProductID + "\">" + ((it.Store == 0) ? App_GlobalResources.Lang.strOutOfStock : App_GlobalResources.Lang.strInStock) + "</td>");
                }

                sb.Append(" </tr>");
                sb.Append(" <tr>");
                sb.Append("   <td class=\"card_product_image\" data-th=\"Products\">" + App_GlobalResources.Lang.strColor + "</td>");
                foreach (var it in lstProduct)
                {
                    List<C_ProductProperty> listColor = servicePro.GetPropertyByType(it.ProductID, CommonGlobal.Color);
                    StringBuilder html_color = new StringBuilder();
                    for (int m = 0; m < listColor.Count; m++)
                    {
                        if (m == 0)
                        {
                            html_color.Append(listColor[m].Name);
                        }
                        else
                        {
                            html_color.Append("," + listColor[m].Name);
                        }
                    }

                    sb.Append("   <td class=\"card_product_price\" data-th=\"Product\" id=\"" + it.ProductID + "\"> " + html_color.ToString() + " </td>");
                }

                sb.Append(" </tr>");
                sb.Append(" <tr>");
                sb.Append("   <td class=\"card_product_image\" data-th=\"Products\">" + App_GlobalResources.Lang.strSize + "</td>");
                foreach (var it in lstProduct)
                {
                    List<C_ProductProperty> listSize = servicePro.GetPropertyByType(it.ProductID, CommonGlobal.Size);
                    StringBuilder html_size = new StringBuilder();
                    for (int m = 0; m < listSize.Count; m++)
                    {
                        if (m == 0)
                        {
                            html_size.Append(listSize[m].Name);
                        }
                        else
                        {
                            html_size.Append("," + listSize[m].Name);
                        }
                    }

                    sb.Append("   <td class=\"card_product_price\" data-th=\"Product\" id=\"" + it.ProductID + "\"> " + html_size.ToString() + " </td>");
                }

                sb.Append(" </tr>");
                sb.Append(" <tr>");
                sb.Append("   <td class=\"card_product_image\" data-th=\"Products\">" + App_GlobalResources.Lang.strCode + "</td>");
                foreach (var it in lstProduct)
                {
                    sb.Append("   <td class=\"card_product_price\" data-th=\"Product\" id=\"" + it.ProductID + "\"> " + it.ProductCode + " </td>");
                }

                sb.Append(" </tr>");
                sb.Append(" <tr>");
                sb.Append("   <td class=\"card_product_image\" data-th=\"Products\">" + App_GlobalResources.Lang.strPrice + "</td>");
                foreach (var it in lstProduct)
                {
                    sb.Append("   <td class=\"card_product_price\" data-th=\"Product\" id=\"" + it.ProductID + "\"> " + CommonGlobal.FormatMoney(it.PriceNew.ToString()) + " </td>");
                }

                sb.Append(" </tr>");
                sb.Append(" <tr>");
                sb.Append("   <td> </td>");
                foreach (var it in lstProduct)
                {
                    sb.Append("     <td id=\"" + it.ProductID + "\"><div class=\"product-icon\"><a onclick=\"AddToCart(" + it.ProductID + ",1,$(this))\" class=\"product-card-icon btn-default\" title=\"" + App_GlobalResources.Lang.strAddToCart + "\"><i class=\"ion-ios-cart-outline\"></i></a></div>");
                }

                sb.Append(" </tr>");
                sb.Append(" <tr>");
                sb.Append("   <td> </td>");
                foreach (var it in lstProduct)
                {
                    sb.Append("     <td id=\"" + it.ProductID + "\"><div class=\"product-icon\"><a onclick='AddToCompare(" + it.ProductID + ",2,$(this))' class=\"product-card-icon btn-default\"><i class=\"ion-ios-close-outline\"></i></a></td></div>");
                }

                sb.Append("</td></tr></tbody>");
                compare_value = sb.ToString();
            }

            return this.PartialView("../control/compare_detail", compare_value);
        }

        /// <summary>
        /// Processes the wish list.
        /// </summary>
        /// <param name="id">The identifier.</param>
        /// <param name="act">The act.</param>
        /// <returns>Processes the wish list</returns>
        public ActionResult Process_wishlist(string id, string act)
        {
            HttpCookie mycookie = HttpContext.Request.Cookies["wishlist"];
            ArrayList arrCompareList = new ArrayList();
            ////string old_url = HttpContext.Current.Request.UrlReferrer != null ? HttpContext.Current.Request.UrlReferrer.ToString() : "";
            string processId = id;
            string action = string.IsNullOrEmpty(act) ? "0" : act;

            //// Lấy danh sách SP wishlist từ cookies
            if (mycookie != null)
            {
                var arr = mycookie.Value.Split(',');
                for (int j = 0; j < arr.Count(); j++)
                {
                    arrCompareList.Add(arr[j]);
                }
            }
            else
            {
                arrCompareList = new ArrayList();
            }

            //// Thêm SP vào danh sách SP wishlist
            if (action == "1")
            {
                if (processId != string.Empty)
                {
                    if (!Util.CheckExistInArray(processId, arrCompareList))
                    {
                        arrCompareList.Add(processId);
                    }

                    //// Lưu danh sách xuống cookies
                    string[] arrLst = (string[])arrCompareList.ToArray(typeof(string));
                    ////HttpContext.Session["wishlist"] = arrCompareList;

                    if (mycookie != null)
                    {
                        HttpContext.Response.Cookies.Remove("wishlist");
                        mycookie.Expires = DateTime.Now.AddMonths(-6);
                        mycookie.Value = null;
                        HttpContext.Response.SetCookie(mycookie);
                    }

                    HttpCookie cookie_new = new HttpCookie("wishlist");
                    cookie_new.Value = string.Join(",", arrLst);
                    cookie_new.Expires = DateTime.Now.AddMonths(6);
                    HttpContext.Response.Cookies.Add(cookie_new);
                }
            }
            else if (action == "2")
            {
                ////remove one product
                if (processId != string.Empty)
                {
                    if (Util.CheckExistInArray(processId, arrCompareList))
                    {
                        arrCompareList.Remove(processId);
                    }

                    //// Lưu danh sách xuống session
                    string[] arrLst = (string[])arrCompareList.ToArray(typeof(string));
                    ////HttpContext.Session["wishlist"] = arrCompareList;

                    if (mycookie != null)
                    {
                        HttpContext.Response.Cookies.Remove("wishlist");
                        mycookie.Expires = DateTime.Now.AddMonths(-6);
                        mycookie.Value = null;
                        HttpContext.Response.SetCookie(mycookie);
                    }

                    HttpCookie cookie_new = new HttpCookie("wishlist");
                    cookie_new.Value = string.Join(",", arrLst);
                    cookie_new.Expires = DateTime.Now.AddMonths(6);
                    HttpContext.Response.Cookies.Add(cookie_new);
                }
            }
            else
            {
                ////clear compare list
                mycookie = new HttpCookie("wishlist");
            }

            var jsonSerialiser = new JavaScriptSerializer();
            var json = jsonSerialiser.Serialize(string.Join(",", (string[])arrCompareList.ToArray(typeof(string))));
            var results = json;

            return this.Json(results);
        }

        /// <summary>
        /// Products the specified identifier.
        /// </summary>
        /// <param name="id">The identifier.</param>
        /// <param name="cate_id">The cate identifier.</param>
        /// <returns>the Product</returns>
        public ActionResult Product(int? id, int? cate_id)
        {
            /////product detail
            ProductModels proModels = new ProductModels();

            id = RouteData.Values["id"] != null ? Convert.ToInt16(RouteData.Values["id"].ToString()) : 0;
            var link = RouteData.Values["Link"] != null ? RouteData.Values["Link"].ToString() : string.Empty;
            cate_id = string.IsNullOrEmpty(Request.QueryString["cate_id"]) ? 0 : Convert.ToInt16(Request.QueryString["cate_id"].ToString());
            if (id == 0)
            {
                return this.HttpNotFound();
            }
            else
            {
                proModels.ClearCache(CommonGlobal.Product + string.Empty + id);
                C_Product obj = proModels.GetProductById((int)id);

                if (obj.ProductID == 0 || obj.IsShow == false)
                {
                    return this.HttpNotFound();
                }
                //else if (obj.DocTypeView != null && obj.DocTypeView > 0)
                //{
                //    if (!this.CheckMemberlogin())
                //    {
                //        return this.RedirectToAction("login", "account", new { return_url = Url.RouteUrl("_products_detail_Link", new { controller = "product", action = "product", id = id, Link = link }) });
                //    }
                //}

                ViewBag.Title = obj.ProductName + " | " + GeneralModels.GetContent(CommonGlobal.PageName, this.Lang);

                ////breadcrumbs
                string strbreadcrumbs = string.Empty;
                CatalogModels cateModels = new CatalogModels();
                C_Catalog cateItem = new C_Catalog();

                if (cate_id == 0)
                {
                    if (!string.IsNullOrEmpty(obj.CatalogID))
                    {
                        if (obj.CatalogID.Contains(','))
                        {
                            cate_id = int.Parse(obj.CatalogID.Split(',')[0]);
                        }
                        else
                        {
                            cate_id = int.Parse(obj.CatalogID.ToString());
                        }
                    }
                }

                cateItem = cateModels.GetbyID((int)cate_id);

                strbreadcrumbs = string.Format("<li><a href=\"" + Url.Action("products", "product") + "\">" + App_GlobalResources.Lang.mnuProduct + "</a></li>");
                strbreadcrumbs += string.Format("<li><a href=\"" + Url.RouteUrl("Default_Link", new { controller = "product", action = "products", id = cate_id, Link = cateItem.Link }) + "\">" + cateItem.CategoryName + "</a></li>");
                strbreadcrumbs += string.Format("<li>" + obj.ProductName + "</li>");

                ViewBag.str_breadcrumbs = strbreadcrumbs;
                ViewBag.back_link = Url.RouteUrl("Default_Link", new { controller = "product", action = "products", id = cate_id, Link = cateItem.Link });
                ViewBag.heading = obj.ProductName;

                this.AddMeta(CommonGlobal.Keyword, obj.ProductCode + "," + obj.ProductName);
                this.AddMeta(CommonGlobal.Description, this.ClearHtml(HttpUtility.HtmlDecode(obj.Summary)));
                this.ViewBag.id = id;
                this.ViewBag.cate_id = cate_id;

                //// Add product cookies
                HttpCookie mycookie = HttpContext.Request.Cookies["listView"];
                ArrayList arrListView = new ArrayList();

                //// Lấy danh sách SP đã xem từ cookies
                if (mycookie != null)
                {
                    var arr = mycookie.Value.Split(',');
                    for (int j = 0; j < arr.Count(); j++)
                    {
                        arrListView.Add(arr[j]);
                    }
                }
                else
                {
                    arrListView = new ArrayList();
                }

                if (obj.ProductID != 0)
                {
                    if (!Util.CheckExistInArray(obj.ProductID.ToString(), arrListView))
                    {
                        arrListView.Add(obj.ProductID.ToString());
                    }

                    //// Lưu danh sách xuống cookies
                    string[] arrLst = (string[])arrListView.ToArray(typeof(string));

                    if (mycookie != null)
                    {
                        HttpContext.Response.Cookies.Remove("listView");
                        mycookie.Expires = DateTime.Now.AddMonths(-6);
                        mycookie.Value = null;
                        HttpContext.Response.SetCookie(mycookie);
                    }

                    HttpCookie cookie_new = new HttpCookie("listView");
                    cookie_new.Value = string.Join(",", arrLst);
                    cookie_new.Expires = DateTime.Now.AddMonths(6);
                    HttpContext.Response.Cookies.Add(cookie_new);
                }

                return this.PartialView("../page/product");
            }
        }

        /// <summary>
        /// Products the specified identifier.
        /// </summary>
        /// <param name="id">The identifier.</param>
        /// <param name="search">The search.</param>
        /// <param name="tag">The tag.</param>
        /// <param name="param">The parameter.</param>
        /// <param name="manufacture">The manufacture.</param>
        /// <param name="style_list">The style list.</param>
        /// <returns>the Product</returns>
        public ActionResult Products(int? id, string search, string tag, string param, string manufacture, string style_list)
        {
            /////list products
            var product_view = new Products_view();
            string strBread;
            id = RouteData.Values["id"] != null ? Convert.ToInt16(RouteData.Values["id"].ToString()) : 0;
            var link = RouteData.Values["Link"] != null ? RouteData.Values["Link"].ToString() : string.Empty;
            if (Request.QueryString["param"] != null && Request.QueryString["param"].ToString() != string.Empty)
            {
                param = HttpUtility.HtmlDecode(Request.QueryString["param"].ToString());
            }

            if (Request.QueryString["style_list"] != null && Request.QueryString["style_list"].ToString() != string.Empty)
            {
                style_list = Request.QueryString["style_list"].ToString();
            }
            else
            {
                style_list = "grid";
            }

            if (Request.QueryString["manufacture"] != null && Request.QueryString["manufacture"].ToString() != string.Empty)
            {
                manufacture = Request.QueryString["manufacture"].ToString();
            }

            strBread = string.Format("<li><a href=\"" + Url.Action("products", "product") + "\">" + App_GlobalResources.Lang.mnuProduct + "</a></li>");
            if (id == 0)
            {
                ViewBag.Title = App_GlobalResources.Lang.strProduct + " | " + GeneralModels.GetContent(CommonGlobal.PageName, this.Lang);
                ////strBread = strBread + "<li>" + Lang.strProduct + "</li>";
                if (string.IsNullOrEmpty(manufacture))
                {
                    product_view.Heading = App_GlobalResources.Lang.strProduct;
                }
                else
                {
                    product_view.Heading = manufacture;
                }

                ViewBag.str_breadcrumbs = strBread;
            }
            else
            {
                CatalogModels cateModels = new CatalogModels();
                C_Catalog obj = cateModels.GetbyID((int)id);
                if(obj != null)
                {
                    if (obj.ParentID != null && obj.ParentID != 0)
                    {
                        this.BuildBreadcrumbs(obj.ParentID ?? 0, ref strBread);
                    }

                    if (obj.CategoryName != string.Empty)
                    {
                        ViewBag.Title = obj.CategoryName + " | " + GeneralModels.GetContent(CommonGlobal.PageName, this.Lang);
                        strBread = strBread + "<li>" + obj.CategoryName + "</li>";
                        product_view.Heading = obj.CategoryName;
                        ViewBag.cateName = obj.CategoryName;
                    }
                    else
                    {
                        ViewBag.Title = obj.Title + " | " + GeneralModels.GetContent(CommonGlobal.PageName, this.Lang);
                        strBread = strBread + "<li>" + obj.Title + "</li>";
                        product_view.Heading = obj.Title;
                        ViewBag.cateName = obj.Title;
                    }

                    this.AddMeta(CommonGlobal.Keyword, obj.Keyword);
                    this.AddMeta(CommonGlobal.Description, obj.Description);
                    this.ViewBag.str_breadcrumbs = strBread;                    
                }
            }

            if (search == null)
            {
                search = string.Empty;
            }

            if (tag == null)
            {
                tag = string.Empty;
            }

            product_view.Link = link;
            product_view.Cate_id = id ?? 0;
            product_view.Text_search = search;
            product_view.Tag = tag;
            product_view.Param = param;
            product_view.Style_list = style_list;
            product_view.Manufacture = manufacture;

            return this.PartialView("../page/products", product_view);
        }

        /// <summary>
        /// Products the category collection.
        /// </summary>
        /// <returns>Product the category collection</returns>
        [ChildActionOnly]
        public ActionResult Product_category_collection()
        {
            ///// Lấy danh sách collection mới nhất
            CatalogModels cateModels = new CatalogModels();
            var lstCollection = cateModels.GetbyParentID(0, CommonGlobal.CateCollection, LanguageModels.ActiveLanguage().LangCultureName, int.Parse(Util.GetConfigValue("NumberListCollection", "0")));

            return this.PartialView("../control/product_category_collection", lstCollection);
        }

        /// <summary>
        /// Products the category hot.
        /// </summary>
        /// <returns>Product the category hot</returns>
        [ChildActionOnly]
        public ActionResult Product_category_hot()
        {
            CatalogModels cateModels = new CatalogModels();
            var lstCategory = cateModels.GetbyParentID(0, CommonGlobal.ProductCategoryType, LanguageModels.ActiveLanguage().LangCultureName, int.Parse(Util.GetConfigValue("NumberListCategory", "0")));

            return this.PartialView("../control/product_category_hot", lstCategory);
        }

        /// <summary>
        /// Products the detail.
        /// </summary>
        /// <param name="id">The identifier.</param>
        /// <param name="cate_id">The cate identifier.</param>
        /// <param name="back_link">The back link.</param>
        /// <returns>Products the detail</returns>
        [ChildActionOnly]
        public ActionResult Product_detail(int? id, int? cate_id, string back_link)
        {
            string url = Request.Url.ToString();
            RatingModels ratingModels = new RatingModels();
            ProductModels proModels = new ProductModels();
            id = RouteData.Values["id"] != null ? Convert.ToInt16(RouteData.Values["id"].ToString()) : 0;
            var products_view = new ViewModels.Products_detail_view();
            if (id == 0)
            {
                return this.HttpNotFound();
            }
            else
            {
                proModels.ClearCache(CommonGlobal.Product + string.Empty + id);
                C_Product obj = proModels.GetProductById((int)id);
                if (obj.ProductID == 0 || obj.IsShow == false)
                {
                    return this.HttpNotFound();
                }

                ////load list image
                ProductImagesModels imageModels = new ProductImagesModels();
                products_view.ArrayImage = imageModels.GetLstImagebyProductId((int)id);
                StringBuilder html1 = new StringBuilder();
                html1.Append("<div class=\"item\">");
                html1.Append(string.Format("<a href=\"{0}\" data-standard=\"{1}\"><img src=\"{2}\"></a>", obj.ImageBigPath, obj.ImageBigPath, obj.ImageBigPath));
                html1.Append("</div>");
                if (products_view.ArrayImage.Count > 0)
                {
                    int countImage = 0;
                    foreach (ImageProduct item in products_view.ArrayImage)
                    {
                        html1.Append("<div class=\"item\">");
                        html1.Append(string.Format("<a href=\"{0}\" data-standard=\"{1}\"><img src=\"{2}\"></a>", item.ImagesFull, item.ImagesFull, item.ImagesFull));
                        html1.Append("</div>");
                        countImage++;
                    }
                }

                products_view.ListThumbImageView = html1.ToString();
                ////Property
                ProductPropertyModels productModels = new ProductPropertyModels();
                ////color
                products_view.ListColor = productModels.GetPropertyByType((int)id, CommonGlobal.Color);
                StringBuilder html3 = new StringBuilder();
                for (int m = 0; m < products_view.ListColor.Count; m++)
                {
                    if (m == 0)
                    {
                        html3.Append(string.Format("<option value=\"{0}\" selected=\"selected\">{1}</option>", products_view.ListColor[m].ProID, products_view.ListColor[m].Name));
                    }
                    else
                    {
                        html3.Append(string.Format("<option value=\"{0}\">{1}</option>", products_view.ListColor[m].ProID, products_view.ListColor[m].Name));
                    }
                }

                products_view.ListColorView = html3.ToString();

                ////size
                products_view.ListSize = productModels.GetPropertyByType((int)id, CommonGlobal.Size);
                StringBuilder html4 = new StringBuilder();
                for (int k = 0; k < products_view.ListSize.Count; k++)
                {
                    if (k == 0)
                    {
                        html4.Append(string.Format("<option value=\"{0}\" selected=\"selected\">{1}</option>", products_view.ListSize[k].ProID, products_view.ListSize[k].Name));
                    }
                    else
                    {
                        html4.Append(string.Format("<option value=\"{0}\">{1}</option>", products_view.ListSize[k].ProID, products_view.ListSize[k].Name));
                    }
                }

                products_view.ListSizeView = html4.ToString();

                products_view.ListRating = ratingModels.GetListRatingByItem(obj.ProductID);
                StringBuilder html5 = new StringBuilder();
                for (int j = 0; j < products_view.ListRating.Count; j++)
                {
                    ////_html5.Append("<li class=\"comment\">");
                    ////_html5.Append("    <div class=\"comment_container\">");
                    ////_html5.Append("        <div class=\"comment-text\">");
                    ////_html5.Append("            <div class=\"meta\">");
                    ////_html5.Append("                <strong>" + HttpUtility.HtmlDecode(products_view.listRating[j].name) + "</strong>");
                    ////_html5.Append("                <p class=\"reating-review\"><span>");
                    var start = products_view.ListRating[j].Rating ?? 0;
                    ////_html5.Append("<a class=\"star-" + start + "\">1</a>");
                    var other = 5 - start;
                    for (int jj = 0; jj < start; jj++)
                    {
                        html5.Append("<li><a href=\"#\"><i class=\"fa fa-star\"></i></a></li>");
                    }

                    for (int ii = 0; ii < other; ii++)
                    {
                        html5.Append("<li><a href=\"#\" class=\"not-rated\"><i class=\"fa fa-star\"></i></a></li>");
                    }

                    ////_html5.Append("                </span></p>");
                    ////_html5.Append("            </div>");
                    ////_html5.Append("            <div class=\"description\">");
                    ////_html5.Append("                <p>" + HttpUtility.HtmlDecode(products_view.listRating[j].contents) + "</p>");
                    ////_html5.Append("            </div>");
                    ////_html5.Append("        </div>");
                    ////_html5.Append("    </div>");
                    ////_html5.Append("</li>");
                }

                products_view.ListRatingView = html5.ToString();
                products_view.RatingSum = ratingModels.GetRatingSumforItem(obj.ProductID);
                products_view.RatingTotal = ratingModels.GetRatingTotalforItem(obj.ProductID);

                StringBuilder html6 = new StringBuilder();
                var start_no = products_view.RatingTotal != 0 ? (products_view.RatingSum / products_view.RatingTotal) : 0;
                var other_no = 5 - start_no;
                for (int jj = 0; jj < start_no; jj++)
                {
                    html6.Append("<i class=\"fa fa-star\"></i>");
                }

                for (int ii = 0; ii < other_no; ii++)
                {
                    html6.Append("<i class=\"fa fa-star-o\"></i>");
                }

                products_view.RatingStart = html6.ToString();

                CatalogModels cateModels = new CatalogModels();
                C_Catalog cateItem = new C_Catalog();

                if (cate_id == 0)
                {
                    if (!string.IsNullOrEmpty(obj.CatalogID))
                    {
                        if (obj.CatalogID.Contains(','))
                        {
                            cate_id = int.Parse(obj.CatalogID.Split(',')[0]);
                        }
                        else
                        {
                            cate_id = int.Parse(obj.CatalogID.ToString());
                        }
                    }
                }

                cateItem = cateModels.GetbyID((int)cate_id);

                products_view.ListOtherProduct = proModels.GetProductByCategory(cateItem.CatalogID, LanguageModels.ActiveLanguage().LangCultureName, string.Empty, string.Empty, string.Empty, string.Empty, true).Take(int.Parse(Util.GetConfigValue("NumberProductSame", "10"))).ToList();

                var lstCollection = cateModels.GetListNamebyListId(obj.CatalogID, CommonGlobal.CateCollection);
                StringBuilder html7 = new StringBuilder();
                for (int m = 0; m < lstCollection.Count; m++)
                {
                    html7.Append("<a href=\"" + Url.RouteUrl("Default_Link", new { controller = "product", action = "collection", id = lstCollection[m].CatalogID, Link = lstCollection[m].Link }) + "\">" + lstCollection[m].CategoryName + "</a>");
                }

                products_view.ListCollectionName = html7.ToString();

                var lstCategory = cateModels.GetListNamebyListId(obj.CatalogID, CommonGlobal.CateProduct);
                StringBuilder html8 = new StringBuilder();
                for (int m = 0; m < lstCategory.Count; m++)
                {
                    html8.Append("<a href=\"" + Url.RouteUrl("Default_Link", new { controller = "product", action = "products", id = lstCategory[m].CatalogID, Link = lstCategory[m].Link }) + "\">" + lstCategory[m].CategoryName + "</a>");
                }

                products_view.ListCategoryName = html8.ToString();

                products_view.ProductID = obj.ProductID;
                products_view.ProductName = obj.ProductName;
                products_view.ProductCode = obj.ProductCode;
                products_view.Summary = obj.Summary;
                products_view.Content = obj.Content;
                products_view.ImagePath = obj.ImagePath;
                products_view.ImageBigPath = obj.ImageBigPath;
                products_view.DateModify = obj.DateModify;
                products_view.Store = (obj.Store == 0) ? App_GlobalResources.Lang.strOutOfStock : App_GlobalResources.Lang.strInStock;
                products_view.Promotion = obj.Promotion;
                products_view.Warranty = obj.Warranty;
                products_view.Manufacture = obj.Manufacture;
                products_view.PriceOld = obj.PriceOld;
                products_view.PriceNew = Convert.ToInt32(obj.PriceNew).ToString(); //CommonGlobal.FormatMoney(obj.PriceNew.ToString());
                products_view.Views = obj.Views;
                products_view.OrderDisplay = obj.OrderDisplay;
                products_view.Lang = obj.Lang;
                products_view.IsShow = obj.IsShow;
                products_view.IsHot = obj.IsHot;
                products_view.IsPromotion = obj.IsPromotion;
                products_view.Link = obj.Link;
                products_view.Cate_id = cate_id ?? 0;
                products_view.Url = url;
                products_view.PaymentGuide = GeneralModels.GetContent(CommonGlobal.PaymentGuide, this.Lang);
                //products_view.DocTypeView = obj.DocTypeView == Convert.ToInt32(DocTypeViewEnum.Pdf) ? DocTypeViewEnum.Pdf : DocTypeViewEnum.Img;
                //products_view.CanViewOnline = products_view.ArrayImage != null && products_view.ArrayImage.Any();

                //products_view.DocType = obj.DocType;
                //products_view.DocLangISO = obj.DocLangISO;
                //products_view.DocLang = obj.DocLang;
                //products_view.DocCountryCode = obj.DocCountryCode;
                //products_view.DocTitleTranslate = obj.DocTitleTranslate;
                //products_view.DocAuthor = obj.DocAuthor;
                //products_view.DocAuthorGroup = obj.DocAuthorGroup;
                //products_view.DocChuBien = obj.DocChuBien;
                //products_view.DocBienSoan = obj.DocBienSoan;
                //products_view.DocNguoiDich = obj.DocNguoiDich;
                //products_view.DocHieuDinh = obj.DocHieuDinh;
                //products_view.DocDiaChiXuatBan = obj.DocDiaChiXuatBan;
                //products_view.DocNhaXuatBan = obj.DocNhaXuatBan;
                //products_view.DocNamXuatBan = obj.DocNamXuatBan;
                //products_view.DocLanXuatBan = obj.DocLanXuatBan;
                //products_view.DocSoTrang = obj.DocSoTrang;
                //products_view.DocTenTap = obj.DocTenTap;
                //products_view.DocSoLanPhanLoai = obj.DocSoLanPhanLoai;
                //products_view.DocDiaChiTaiLieu = obj.DocDiaChiTaiLieu;
                //products_view.DocTomTat = obj.DocTomTat;
                //products_view.DocNguoiXuLy = obj.DocNguoiXuLy;
                //products_view.DocNguoiHieuDinh = obj.DocNguoiHieuDinh;

            }

            return this.PartialView("../control/product_detail", products_view);
        }

        /// <summary>
        /// Products the list all.
        /// </summary>
        /// <param name="id">The identifier.</param>
        /// <param name="link">The link.</param>
        /// <param name="cate_type">Type of the cate.</param>
        /// <param name="search">The search.</param>
        /// <param name="manufacture">The manufacture.</param>
        /// <param name="tag">The tag.</param>
        /// <param name="param">The parameter.</param>
        /// <param name="style_list">The style list.</param>
        /// <param name="strbreadcrumbs">The string breadcrumb.</param>
        /// <param name="is_search">if set to <c>true</c> [is search].</param>
        /// <returns>Products the list all</returns>
        [ChildActionOnly]
        [AcceptVerbs(HttpVerbs.Get)]
        public ActionResult Product_list_all(int? id, string link, string cate_type, string search, string manufacture, string tag, string param, string style_list, string strbreadcrumbs, bool is_search = false, string typekey = "ProductName")
        {
            WebInfoModels web_infor = new Models.WebInfoModels();
            int page = 1; ////start page
            int page_size = int.Parse(Util.GetConfigValue("NumberPageSizeDefault", "9")); ////start page size
            string order = "OrderDisplay;asc";
            string lang = LanguageModels.ActiveLanguage().LangCultureName;
            if (string.IsNullOrEmpty(cate_type))
            {
                cate_type = CommonGlobal.CateProduct;
            }

            if (string.IsNullOrEmpty(style_list))
            {
                style_list = "grid";
            }

            int price_min = web_infor.GetContent(CommonGlobal.PriceMin) != string.Empty ? int.Parse(web_infor.GetContent(CommonGlobal.PriceMin)) : 0;
            int price_max = web_infor.GetContent(CommonGlobal.PriceMax) != string.Empty ? int.Parse(web_infor.GetContent(CommonGlobal.PriceMax)) : 10;

            return this.Product_list_all(lang, cate_type, id, link, search, manufacture, tag, param, price_min, price_max, page, page_size, order, style_list, strbreadcrumbs, is_search, typekey);
        }

        /// <summary>
        /// Products the list all.
        /// </summary>
        /// <param name="lang">The language.</param>
        /// <param name="cate_type">Type of the cate.</param>
        /// <param name="cate_id">The cate identifier.</param>
        /// <param name="link_text">The link text.</param>
        /// <param name="search">The search.</param>
        /// <param name="manufacture">The manufacture.</param>
        /// <param name="tag">The tag.</param>
        /// <param name="param">The parameter.</param>
        /// <param name="price_min">The price minimum.</param>
        /// <param name="price_max">The price maximum.</param>
        /// <param name="page">The page.</param>
        /// <param name="page_size">Size of the page.</param>
        /// <param name="order">The order.</param>
        /// <param name="style_list_show">The style list show.</param>
        /// <param name="strbreadcrumbs">The string breadcrumbs.</param>
        /// <param name="is_search">if set to <c>true</c> [is search].</param>
        /// <returns>Products the list all</returns>
        [ChildActionOnly]
        [AcceptVerbs(HttpVerbs.Post)]
        public ActionResult Product_list_all(string lang, string cate_type, int? cate_id, string link_text, string search, string manufacture, string tag, string param, int? price_min, int? price_max, int? page, int? page_size, string order, string style_list_show, string strbreadcrumbs, bool is_search = false, string typekey = "ProductName")
        {
            WebInfoModels web_infor = new Models.WebInfoModels();
            int total_record = 0;
            CatalogModels cateModels = new CatalogModels();
            ProductModels proModels = new ProductModels();
            C_Catalog cate = null;
            ////request query string param
            page = Request.QueryString["page"] != null ? Convert.ToInt16(Request.QueryString["page"].ToString()) : 1;

            if (cate_id == null)
            {
                cate_id = RouteData.Values["id"] != null ? Convert.ToInt16(RouteData.Values["id"].ToString()) : 0;
            }

            if (string.IsNullOrEmpty(link_text))
            {
                link_text = RouteData.Values["Link"] != null ? RouteData.Values["Link"].ToString() : string.Empty;
            }

            if (cate_id > 0)
            {
                cate = cateModels.GetbyID((int)cate_id);
            }

            ////get order for product list
            string order_by = string.Empty;
            string order_type = string.Empty;
            if (string.IsNullOrEmpty(order))
            {
                order_by = "OrderDisplay";
                order_type = "asc";
                order = order_by + ";" + order_type;
            }
            else
            {
                if (order.Contains(';'))
                {
                    order_by = order.Split(';')[0];
                    order_type = order.Split(';')[1];
                }
                else
                {
                    order_by = "OrderDisplay";
                    order_type = "asc";
                    order = order_by + ";" + order_type;
                }
            }

            price_min = price_min * 1000000;
            price_max = price_max * 1000000;

            proModels.ClearCache(lang + cate_type + (cate_id ?? 0) + search + tag + param + price_min + price_max + page + page_size + order_by + order_type);

            List<SelectListItem> orderDrop = new List<SelectListItem>();
            orderDrop.AddRange(new SelectListItem[]
            {
                new SelectListItem { Selected = order == "DateModify;desc" ? true : false, Text = App_GlobalResources.Lang.strOrderDateDesc, Value = "DateModify;desc" },
                new SelectListItem { Selected = order == "DateModify;asc" ? true : false, Text = App_GlobalResources.Lang.strOrderDateAsc, Value = "DateModify;asc" },
                new SelectListItem { Selected = order == "ProductName;asc" ? true : false, Text = App_GlobalResources.Lang.strOrderNameAsc, Value = "ProductName;asc" },
                new SelectListItem { Selected = order == "ProductName;desc" ? true : false, Text = App_GlobalResources.Lang.strOrderNameDesc, Value = "ProductName;desc" },
                new SelectListItem { Selected = order == "PriceNew;asc" ? true : false, Text = App_GlobalResources.Lang.strOrderPriceAsc, Value = "PriceNew;asc" },
                new SelectListItem { Selected = order == "PriceNew;desc" ? true : false, Text = App_GlobalResources.Lang.strOrderPriceDesc, Value = "PriceNew;desc" }
            });

            List<C_Catalog> lst_parent = new List<C_Catalog>();
            List<C_Catalog> lst_parent_all = new List<C_Catalog>();
            if (cate_id == 0)
            {
                lst_parent = cateModels.GetbyParentID(0, cate_type, lang).Where(p => p.Show == true).ToList();
            }
            else
            {
                lst_parent = cateModels.GetbyParentID((int)cate_id, cate_type, lang).Where(p => p.Show == true).ToList();
            }

            foreach (var it in lst_parent)
            {
                lst_parent_all.Add(it);
                var lst_child = cateModels.GetbyParentID(it.CatalogID, cate_type, lang).Where(p => p.Show == true).ToList();
                foreach (var child in lst_child)
                {
                    lst_parent_all.Add(child);
                }
            }

            var products_view = new ViewModels.Page_products_view();
            products_view.List_parent_category = lst_parent;
            products_view.List_parent_all = lst_parent_all;
            products_view.List_page_size = this.GetSizePagingPublic(page_size ?? int.Parse(Util.GetConfigValue("NumberPageSizeDefault", "9")));
            products_view.List_order = orderDrop;
            products_view.Page_list_product = proModels.GetListProductByCategoryID(lang, cate_type, cate_id, search, typekey, manufacture, tag, param, (int)price_min, (int)price_max, (int)page, (int)page_size, order_by, order_type, out total_record);
            products_view.Total_record = total_record;
            if (total_record == 0 && search != string.Empty && !string.IsNullOrEmpty(search))
            {
                products_view.Text_search_result = App_GlobalResources.Lang.strSearchResult;
            }

            products_view.Order = order;
            products_view.Page_size = page_size ?? int.Parse(Util.GetConfigValue("NumberPageSizeDefault", "18"));
            products_view.Style_list = style_list_show;
            products_view.Cate_type = cate_type;
            products_view.Cate_id = cate_id ?? 0;
            products_view.Link = link_text;
            products_view.Lang = lang;
            products_view.Tag = tag;
            products_view.Text_search = search;
            products_view.Param = param;
            products_view.Is_search = is_search;
            products_view.Price_min = (int)price_min / 1000000;
            products_view.Price_max = (int)price_max / 1000000;
            products_view.Parent_action = HttpContext.Request.RequestContext.RouteData.Values["action"].ToString();
            products_view.Parent_controller = HttpContext.Request.RequestContext.RouteData.Values["controller"].ToString();
            ViewBag.str_breadcrumbs = strbreadcrumbs;

            return this.PartialView("../control/product_list_all", products_view);
        }

        /// <summary>
        /// Products the list hot.
        /// </summary>
        /// <returns>Products the list hot</returns>
        [ChildActionOnly]
        public ActionResult Product_list_hot()
        {
            ProductModels product_models = new ProductModels();
            //product_models.ClearCache(CommonGlobal.ProductHot + int.Parse(Util.GetConfigValue("NumberListProductHot", "0")) + this.Lang);
            List<C_Product> listProduct_hot = new List<C_Product>();
            listProduct_hot = product_models.GetProductHot(int.Parse(Util.GetConfigValue("NumberListProductHot", "20")), LanguageModels.ActiveLanguage().LangCultureName);

            return this.PartialView("../control/product_list_hot", listProduct_hot);
        }

        /// <summary>
        /// Products the list new.
        /// </summary>
        /// <returns>Products the list new</returns>
        [ChildActionOnly]
        public ActionResult Product_list_new()
        {
            List<C_Product> listProduct_new = new List<C_Product>();
            listProduct_new = ProductModels.GetProductNew(int.Parse(Util.GetConfigValue("NumberListProductNew", "0")), LanguageModels.ActiveLanguage().LangCultureName);

            return this.PartialView("../control/product_list_new", listProduct_new);
        }

        /// <summary>
        /// Products the list sale.
        /// </summary>
        /// <returns>Products the list sale</returns>
        [ChildActionOnly]
        public ActionResult Product_list_sale()
        {
            ProductModels product_models = new ProductModels();
            //product_models.ClearCache(CommonGlobal.ProductPromotion + int.Parse(Util.GetConfigValue("NumberListProductSale", "0")) + this.Lang);
            List<C_Product> listProduct_sale = new List<C_Product>();
            listProduct_sale = product_models.GetProductPromotion(int.Parse(Util.GetConfigValue("NumberListProductSale", "20")), LanguageModels.ActiveLanguage().LangCultureName);

            return this.PartialView("../control/product_list_sale", listProduct_sale);
        }

        /// <summary>
        /// Products the list view.
        /// </summary>
        /// <returns>Products the list view</returns>
        [ChildActionOnly]
        public ActionResult Product_list_view()
        {
            ProductModels proModels = new ProductModels();
            var list_view = new ViewModels.List_product_view();
            ArrayList viewLst = new ArrayList();

            HttpCookie mycookie = Request.Cookies["listView"];
            if (mycookie != null)
            {
                var arr = mycookie.Value.Split(',');
                for (int j = arr.Count() - 1; j > 0; j--)
                {
                    ////max 3
                    if ((arr.Count() - j) <= 3)
                    {
                        viewLst.Add(arr[j]);
                    }
                }
            }

            if (viewLst.Count <= 0)
            {
                list_view.Message = App_GlobalResources.Lang.messErrorWishlist;
                list_view.ListView = null;
                list_view.Item_count = "0";
            }
            else
            {
                list_view.Message = string.Empty;
                list_view.ListView = new ArrayList(proModels.GetCompareList(viewLst));
                list_view.Item_count = proModels.GetCompareList(viewLst).Count.ToString();
            }

            return this.PartialView("../control/product_list_view", list_view);
        }

        /// <summary>
        /// Products the price filter.
        /// </summary>
        /// <param name="price_min">The price minimum.</param>
        /// <param name="price_max">The price maximum.</param>
        /// <returns>Products the price filter</returns>
        [ChildActionOnly]
        public ActionResult Product_price_filter(int price_min, int price_max)
        {
            var price_view = new ViewModels.Products_price_view();
            WebInfoModels web_infor = new Models.WebInfoModels();
            if (price_min.ToString() != string.Empty)
            {
                price_view.Price_min = price_min;
            }
            else
            {
                price_view.Price_min = web_infor.GetContent(CommonGlobal.PriceMin) != string.Empty ? int.Parse(web_infor.GetContent(CommonGlobal.PriceMin)) : 0;
            }

            if (price_max.ToString() != string.Empty)
            {
                price_view.Price_max = price_max;
            }
            else
            {
                price_view.Price_max = web_infor.GetContent(CommonGlobal.PriceMax) != string.Empty ? int.Parse(web_infor.GetContent(CommonGlobal.PriceMax)) : 10;
            }

            return this.PartialView("../control/product_price_filter", price_view);
        }

        /// <summary>
        /// Products the property filter.
        /// </summary>
        /// <param name="type">The type.</param>
        /// <returns>Products the property filter</returns>
        [ChildActionOnly]
        public ActionResult Product_property_filter(string type)
        {
            ProductPropertyModels productModels = new ProductPropertyModels();
            var lst_property = productModels.GetPropertyByType(type);

            return this.PartialView("../control/product_property_filter", lst_property);
        }

        /// <summary>
        /// Searches the specified key.
        /// </summary>
        /// <param name="key">The key.</param>
        /// <param name="tag">The tag.</param>
        /// <param name="param">The parameter.</param>
        /// <returns>search product</returns>
        [ValidateInput(false)]
        public ActionResult Search(string key, string typekey, string tag, string param, string style_list)
        {
            /////search product result
            var product_view = new Products_view();
            string strBread;
            if (Request.QueryString["param"] != null && Request.QueryString["param"].ToString() != string.Empty)
            {
                param = HttpUtility.HtmlDecode(Request.QueryString["param"].ToString());
            }

            if (Request.QueryString["style_list"] != null && Request.QueryString["style_list"].ToString() != string.Empty)
            {
                style_list = Request.QueryString["style_list"].ToString();
            }
            else
            {
                style_list = "grid";
            }

            key = CommonGlobal.RemoveSpecialWord(key);

            //typekey = CommonGlobal.RemoveSpecialWord(typekey);

            ViewBag.Title = App_GlobalResources.Lang.strSearch + " | " + GeneralModels.GetContent(CommonGlobal.PageName, this.Lang);
            strBread = "<li>" + App_GlobalResources.Lang.strSearch + "</li>";
            product_view.Heading = App_GlobalResources.Lang.strSearch;
            ViewBag.str_breadcrumbs = strBread;
            this.AddMeta(CommonGlobal.Keyword, App_GlobalResources.Lang.strSearch + "," + key);
            this.AddMeta(CommonGlobal.Description, App_GlobalResources.Lang.strSearch + "," + key);

            if (string.IsNullOrEmpty(key) || key == "undefined")
            {
                key = string.Empty;
            }

            if (string.IsNullOrEmpty(tag))
            {
                tag = string.Empty;
            }

            product_view.Link = string.Empty;
            product_view.Cate_id = 0;
            product_view.Text_search = HttpUtility.UrlDecode(key);
            product_view.Typekey = typekey;
            product_view.Style_list = style_list;
            product_view.Tag = tag;
            product_view.Param = param;
            product_view.Is_search = true;
            ViewBag.key = key;

            return this.PartialView("../page/search", product_view);
        }

        /// <summary>
        /// Tag this instance.
        /// </summary>
        /// <returns>Tag list</returns>
        [ChildActionOnly]
        public ActionResult Tags()
        {
            ProductTagModels tagModels = new ProductTagModels();
            var lst_tags = tagModels.GetAll();

            return this.PartialView("../control/tags", lst_tags);
        }

        /// <summary>
        /// Gets the list image album.
        /// </summary>
        /// <param name="albumId">The album identifier.</param>
        /// <returns>list image album</returns>
        public ActionResult GetListImageProduct(int id)
        {
            ProductImagesModels imageModels = new ProductImagesModels();
            ProductModels proModels = new ProductModels();
            List<ImageSlideObject> objs = new List<ImageSlideObject>();
            C_Product product = proModels.GetProductById((int)id);
            var arrayImage = imageModels.GetLstImagebyProductId((int)id);
            if (arrayImage.Count > 0)
            {
                foreach (ImageProduct item in arrayImage)
                {
                    ImageSlideObject ia = new ImageSlideObject();
                    ia.url = Util.GetConfigValue("Domain", "") + item.ImagesFull;
                    ia.caption = product.ProductName;
                    objs.Add(ia);
                }
            }

            var jsonSerialiser = new JavaScriptSerializer();
            var json = jsonSerialiser.Serialize(objs);
            var results = json;

            return this.Json(results);
        }

        /// <summary>
        /// Whish lists this instance.
        /// </summary>
        /// <returns>Whish list</returns>
        public ActionResult Whishlist()
        {
            /////whishlit product
            string strbreadcrumbs = string.Empty;
            ViewBag.Title = App_GlobalResources.Lang.strWishlist + " | " + GeneralModels.GetContent(CommonGlobal.PageName, this.Lang);

            strbreadcrumbs = string.Format("<li><a href=\"" + Url.Action("products", "product") + "\">" + App_GlobalResources.Lang.mnuProduct + "</a></li>");
            strbreadcrumbs += string.Format("<li>" + App_GlobalResources.Lang.strWishlist + "</li>");
            ViewBag.str_breadcrumbs = strbreadcrumbs;

            ViewBag.heading = App_GlobalResources.Lang.strWishlist;

            this.AddMeta(CommonGlobal.Keyword, App_GlobalResources.Lang.strWishlist);
            this.AddMeta(CommonGlobal.Description, App_GlobalResources.Lang.strWishlist);

            return this.PartialView("../page/whishlist");
        }

        /// <summary>
        /// Wish lists the detail.
        /// </summary>
        /// <returns>Wish list detail</returns>
        [ChildActionOnly]
        public ActionResult Wishlist_detail()
        {
            ProductModels proModels = new ProductModels();
            var wishlist_view = new ViewModels.Wishlist_view();
            ArrayList compareLst = new ArrayList();

            HttpCookie mycookie = Request.Cookies["wishlist"];
            if (mycookie != null)
            {
                var arr = mycookie.Value.Split(',');
                for (int j = 0; j < arr.Count(); j++)
                {
                    compareLst.Add(arr[j]);
                }
            }

            if (compareLst.Count <= 0)
            {
                wishlist_view.Message = App_GlobalResources.Lang.messErrorWishlist;
                wishlist_view.ListWishlist = null;
                wishlist_view.Item_count = "0";
            }
            else
            {
                wishlist_view.Message = string.Empty;
                wishlist_view.ListWishlist = new ArrayList(proModels.GetCompareList(compareLst));
                wishlist_view.Item_count = proModels.GetCompareList(compareLst).Count.ToString();
            }

            return this.PartialView("../control/wishlist_detail", wishlist_view);
        }

        /// <summary>
        /// Builds the breadcrumbs.
        /// </summary>
        /// <param name="parent_id">The parent identifier.</param>
        /// <param name="strbreadcrumbs">The string breadcrumbs.</param>
        private void BuildBreadcrumbs(int parent_id, ref string strbreadcrumbs)
        {
            CatalogModels cateModels = new CatalogModels();
            C_Catalog cateItem = cateModels.GetbyID(parent_id);
            strbreadcrumbs += string.Format("<li><a href=\"" + Url.RouteUrl("Default_Link", new { controller = "product", action = "products", id = parent_id, Link = cateItem.Link }) + "\">" + cateItem.CategoryName + "</a></li>");
            if (cateItem.ParentID != null && cateItem.ParentID != 0)
            {
                this.BuildBreadcrumbs(cateItem.ParentID ?? 0, ref strbreadcrumbs);
            }
        }

        /// <summary>
        /// Gets the picture by product identifier.
        /// </summary>
        /// <param name="productId">The product identifier.</param>
        /// <param name="page">The page.</param>
        /// <returns></returns>
        [HttpGet]
        public JsonResult GetPictureByProductId(DocTypeViewEnum docType, int? productId, int? page)
        {
            if (!productId.HasValue || productId.Value == 0)
            {
                return Json(new
                {
                    Url = "pics/preview.jpg",
                    Name = "preview"
                }, JsonRequestBehavior.AllowGet);
            }

            if (!page.HasValue || page.Value < 0)
            {
                page = 1;
            }

            ProductModels product_models = new ProductModels();


            if (docType == DocTypeViewEnum.Img)
            {

                var image = product_models.GetImage(productId.Value, page.Value);

                return Json(new
                {
                    Url = image != null ? image.ImagesFull : string.Empty,
                    //Name = image.ImagesName
                }, JsonRequestBehavior.AllowGet);
            }
            else
            {
                var image = product_models.GetImage(productId.Value, 1);

                var pdfFile = Path.GetFileNameWithoutExtension(Server.MapPath(image.ImagesFull));
                //var imgDir = Server.MapPath(image.ImagesHtml);

                //var imgFile = string.Format("{0}/{1}{2}.png", imgDir, pdfFile, page);
                //if (System.IO.File.Exists(imgFile))
                //{
                //    return Json(new
                //    {
                //        Url = string.Format("{0}/{1}{2}.png", image.ImagesHtml, pdfFile, page),
                //        Name = image.ImagesName
                //    }, JsonRequestBehavior.AllowGet);
                //}
            }


            return Json(new
            {
                Url = "pics/preview.jpg",
                Name = "preview"
            }, JsonRequestBehavior.AllowGet);
        }


        /// <summary>
        /// Gets the picture by product identifier.
        /// </summary>
        /// <param name="productId">The product identifier.</param>
        /// <param name="page">The page.</param>
        /// <returns></returns>
        [HttpGet]
        public JsonResult GetPages(int? productId, DocTypeViewEnum docType)
        {
            if (!productId.HasValue || productId.Value == 0)
            {
                return Json(new
                {
                    Pages = 0
                }, JsonRequestBehavior.AllowGet);
            }

            ProductModels product_models = new ProductModels();

            if (docType == DocTypeViewEnum.Img)
            {
                int pages = product_models.CountImages(productId.Value);

                return Json(new
                {
                    Pages = pages
                }, JsonRequestBehavior.AllowGet);
            }
            else
            {
                var image = product_models.GetImage(productId.Value, 1);
                var pdfFile = Path.GetFileNameWithoutExtension(Server.MapPath(image.ImagesFull));
                //var imgDir = Server.MapPath(image.ImagesHtml);

                //if (Directory.Exists(imgDir))
                //{
                //    return Json(new
                //    {
                //        Pages = Directory.GetFiles(imgDir, string.Format("{0}*.png", pdfFile)).Length,
                //    }, JsonRequestBehavior.AllowGet);
                //}
            }


            return Json(new
            {
                Pages = 0
            }, JsonRequestBehavior.AllowGet);
        }
    }
}