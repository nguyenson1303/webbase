namespace Web.Controllers
{
    using System;
    using System.Collections;
    using System.Collections.Generic;
    using System.Linq;
    using System.Web;
    using System.Web.Mvc;
    using Web.Data;
    using Web.Models;
    using Web.ViewModels;

    /// <summary>
    /// News Controller
    /// </summary>
    /// <seealso cref="Web.Controllers.BaseController" />
    public class NewsController : BaseController
    {
        /// <summary>
        /// Posts the specified identifier.
        /// </summary>
        /// <param name="id">The identifier.</param>
        /// <param name="cate_id">The cate identifier.</param>
        /// <param name="cate_type">Type of the cate.</param>
        /// <returns>Posts the specified</returns>
        public ActionResult Post(int? id, int? cate_id, string cate_type)
        {
            /////post detail
            PostModels postModels = new PostModels();

            id = RouteData.Values["id"] != null ? Convert.ToInt16(RouteData.Values["id"].ToString()) : 0;
            var link = RouteData.Values["Link"] != null ? RouteData.Values["Link"].ToString() : string.Empty;
            cate_id = string.IsNullOrEmpty(Request.QueryString["cate_id"]) ? 0 : Convert.ToInt16(Request.QueryString["cate_id"].ToString());
            if (string.IsNullOrEmpty(cate_type))
            {
                cate_type = CommonGlobal.CateNews;
            }

            if (id == 0)
            {
                return this.HttpNotFound();
            }
            else
            {
                postModels.ClearCache(CommonGlobal.Post + string.Empty + id);
                C_Post obj = postModels.GetbyID((int)id);

                if (obj.PostID == 0)
                {
                    return this.HttpNotFound();
                }

                ViewBag.Title = obj.Title + " | " + GeneralModels.GetContent(CommonGlobal.PageName, this.Lang);

                ////breadcrumbs
                string strbreadcrumbs = string.Empty;
                CatalogModels catalogModel = new CatalogModels();
                C_Catalog cateItem = new C_Catalog();

                if (cate_id == 0)
                {
                    if (obj.CatelogID != null && obj.CatelogID != 0)
                    {
                        cate_id = obj.CatelogID;
                    }
                }

                cateItem = catalogModel.GetbyID((int)cate_id);
                strbreadcrumbs = string.Format("<li><a href=\"" + Url.RouteUrl((cate_type != CommonGlobal.CateService ? "_post_only" : "_service_only"), new { controller = "news", action = "posts" }) + "\">" + (cate_type != CommonGlobal.CateService ? App_GlobalResources.Lang.mnuNews : App_GlobalResources.Lang.mnuService ) + "</a></li>");
                if (cateItem != null)
                {
                    strbreadcrumbs += string.Format("<li><a href=\"" + Url.RouteUrl(cate_type == Web.Models.CommonGlobal.CateService ? "_service" : "_post", new { controller = "news", action = "posts", id = cate_id, Link = cateItem.Link != null ? cateItem.Link : string.Empty, cate_type = cate_type }) + "\">" + cateItem.CategoryName + "</a></li>");
                    ViewBag.cate_name = cateItem.CategoryName;
                }

                strbreadcrumbs += string.Format("<li>" + obj.Title + "</li>");

                ViewBag.str_breadcrumbs = strbreadcrumbs;
                ViewBag.back_link = Url.RouteUrl(cate_type == CommonGlobal.CateService ? "_service" : "_post", new { controller = "news", action = "posts", id = cate_id, Link = cateItem.Link, cate_type = cate_type });
                ViewBag.heading = obj.Title;

                this.AddMeta(CommonGlobal.Keyword, obj.Title);
                this.AddMeta(CommonGlobal.Description, this.ClearHtml(HttpUtility.HtmlDecode(obj.Summary)));
                ViewBag.id = id;
                ViewBag.cate_id = cate_id;
                ViewBag.cate_type = cate_type;

                ////// Add post cookies
                HttpCookie mycookie = HttpContext.Request.Cookies["listPostView"];
                ArrayList arrListView = new ArrayList();

                ////// Lấy danh sách post đã xem từ cookies
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

                if (obj.PostID != 0)
                {
                    if (!Util.CheckExistInArray(obj.PostID.ToString(), arrListView))
                    {
                        arrListView.Add(obj.PostID.ToString());
                    }
                    ////// Lưu danh sách xuống cookies
                    string[] arrLst = (string[])arrListView.ToArray(typeof(string));

                    if (mycookie != null)
                    {
                        HttpContext.Response.Cookies.Remove("listPostView");
                        mycookie.Expires = DateTime.Now.AddMonths(-6);
                        mycookie.Value = null;
                        HttpContext.Response.SetCookie(mycookie);
                    }

                    HttpCookie cookie_new = new HttpCookie("listPostView");
                    cookie_new.Value = string.Join(",", arrLst);
                    cookie_new.Expires = DateTime.Now.AddMonths(6);
                    HttpContext.Response.Cookies.Add(cookie_new);
                }

                return this.PartialView("../page/post");
            }
        }
        
        /// <summary>
        /// Posts the specified identifier.
        /// </summary>
        /// <param name="id">The identifier.</param>
        /// <param name="search">The search.</param>
        /// <param name="tag">The tag.</param>
        /// <param name="param">The parameter.</param>
        /// <param name="style_list">The style list.</param>
        /// <param name="type">The type.</param>
        /// <returns>the post</returns>
        public ActionResult Posts(int? id, string search, string tag, string param, string style_list, string type)
        {
            /////list post
            var posts_view = new Posts_view();
            string strBread;
            id = RouteData.Values["id"] != null ? Convert.ToInt16(RouteData.Values["id"].ToString()) : 0;
            var link = RouteData.Values["Link"] != null ? RouteData.Values["Link"].ToString() : string.Empty;
            if (Request.QueryString["search"] != null && Request.QueryString["search"].ToString() != string.Empty)
            {
                search = HttpUtility.HtmlDecode(Request.QueryString["search"].ToString());
            }

            if (id == 0)
            {
                ViewBag.Title = App_GlobalResources.Lang.strPost + " | " + GeneralModels.GetContent(CommonGlobal.PageName, this.Lang);
                strBread = "<li>" + App_GlobalResources.Lang.strPost + "</li>";
                posts_view.Heading = App_GlobalResources.Lang.strPost;
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
                    posts_view.Heading = obj.Title;
                }
                else
                {
                    ViewBag.Title = obj.CategoryName + " | " + GeneralModels.GetContent(CommonGlobal.PageName, this.Lang);
                    strBread = "<li>" + obj.CategoryName + "</li>";
                    posts_view.Heading = obj.CategoryName;
                }

                this.AddMeta(CommonGlobal.Keyword, obj.Keyword);
                this.AddMeta(CommonGlobal.Description, obj.Description);
                ViewBag.str_breadcrumbs = strBread;
            }

            posts_view.Link = link;
            posts_view.Cate_id = id ?? 0;
            posts_view.Text_search = search;
            posts_view.Tag = tag;
            posts_view.Param = param;
            posts_view.Style_list = style_list;
            posts_view.Cate_type = type;

            return this.PartialView("../page/posts", posts_view);
        }

        /// <summary>
        /// Posts the category host.
        /// </summary>
        /// <param name="parent_id">The parent identifier.</param>
        /// <returns>Posts the category</returns>
        [ChildActionOnly]
        public ActionResult Post_category_host(int? parent_id)
        {
            ///// Lấy danh sách collection mới nhất
            CatalogModels cateModels = new CatalogModels();
            var lstCategory = cateModels.GetbyParentID(0, CommonGlobal.CateService, LanguageModels.ActiveLanguage().LangCultureName, int.Parse(Util.GetConfigValue("NumberListCategory", "0")));

            return this.PartialView("../control/post_category_host", lstCategory);
        }

        /// <summary>
        /// Posts the detail.
        /// </summary>
        /// <param name="id">The identifier.</param>
        /// <param name="cate_id">The cate identifier.</param>
        /// <param name="back_link">The back link.</param>
        /// <param name="cate_type">Type of the cate.</param>
        /// <returns>Posts the detail</returns>
        [ChildActionOnly]
        public ActionResult Post_detail(int? id, int? cate_id, string back_link, string cate_type)
        {
            string url = Request.Url.ToString();
            RatingModels ratingModels = new RatingModels();
            PostModels postModels = new PostModels();
            id = RouteData.Values["id"] != null ? Convert.ToInt16(RouteData.Values["id"].ToString()) : 0;
            var post_view = new ViewModels.Post_detail_view();
            if (id == 0)
            {
                return this.HttpNotFound();
            }
            else
            {
                postModels.ClearCache(CommonGlobal.Post + string.Empty + id);
                C_Post obj = postModels.GetbyID((int)id);
                if (obj.PostID == 0)
                {
                    return this.HttpNotFound();
                }

                ////post_view.listRating = ratingModels.GetListRatingByItem(obj.PostID);
                ////StringBuilder _html5 = new StringBuilder();
                ////for (int j = 0; j < post_view.listRating.Count; j++)
                ////{

                ////    _html5.Append("<div class=\"review-header\">");
                ////    _html5.Append("   <h5>" + HttpUtility.HtmlDecode(post_view.listRating[j].name) + "</h5>");
                ////    _html5.Append("   <div class=\"product-rating\">");
                ////    _html5.Append("      <div class=\"stars\">");
                ////    var start = post_view.listRating[j].Rating ?? 0;
                ////    var other = 5 - start;
                ////    for (int jj = 0; jj < other; jj++)
                ////    {
                ////        _html5.Append("<span class=\"star\"></span>");
                ////    }
                ////    for (int ii = 0; ii < start; ii++)
                ////    {
                ////        _html5.Append("<span class=\"star active\"></span>");
                ////    }
                ////    _html5.Append("      </div>");
                ////    _html5.Append("   </div>");
                ////    _html5.Append("</div>");
                ////    _html5.Append("<div class=\"review-body\">");
                ////    _html5.Append("   <p>" + HttpUtility.HtmlDecode(post_view.listRating[j].contents) + "</p>");
                ////    _html5.Append("</div>");
                ////    _html5.Append("<hr>");
                ////}
                ////post_view.ltrRating = _html5.ToString();
                ////post_view.ratingSum = ratingModels.GetRatingSumforItem(obj.PostID);
                ////post_view.ratingTotal = ratingModels.GetRatingTotalforItem(obj.PostID);

                ////StringBuilder _html6 = new StringBuilder();
                ////var start_no = post_view.ratingTotal != 0 ? (post_view.ratingSum / post_view.ratingTotal) : 0;
                ////var other_no = 5 - start_no;
                ////for (int jj = 0; jj < other_no; jj++)
                ////{
                ////    _html6.Append("<span class=\"star\"></span>");
                ////}
                ////for (int ii = 0; ii < start_no; ii++)
                ////{
                ////    _html6.Append("<span class=\"star active\"></span>");
                ////}
                ////post_view.ratingStart = _html6.ToString();

                post_view.ListOther = postModels.GetOthers(obj.PostID, obj.CatelogID ?? 0, LanguageModels.ActiveLanguage().LangCultureName, int.Parse(Util.GetConfigValue("NumberOtherNews", "3")));

                CatalogModels catalogModel = new CatalogModels();
                C_Catalog cateItem = new C_Catalog();

                if (cate_id == 0)
                {
                    if (obj.CatelogID != null && obj.CatelogID != 0)
                    {
                        cate_id = obj.CatelogID;
                    }
                }

                cateItem = catalogModel.GetbyID((int)cate_id);

                post_view.PostID = obj.PostID;
                post_view.PostName = obj.PostName;
                post_view.Title = obj.Title;
                post_view.Summary = CommonGlobal.CutString(obj.Summary, 500);
                post_view.CatalogID = obj.CatelogID;
                post_view.ImagePath = obj.ImagePath;
                post_view.Link = obj.Link;
                post_view.PostContent = obj.PostContent;
                post_view.DateModified = obj.DateModified;
                post_view.IsHot = obj.IsHot;
                post_view.Lang = obj.Lang;
                post_view.Keyword = obj.Keyword;
                post_view.Description = obj.Description;
                post_view.OrderDisplay = obj.OrderDisplay;
                post_view.Approve = obj.Approve;
                post_view.Cate_id = cate_id ?? 0;
                post_view.Cate_type = cate_type;
                post_view.Url = url;
            }

            return this.PartialView("../control/post_detail", post_view);
        }

        /// <summary>
        /// Posts the list all.
        /// </summary>
        /// <param name="id">The identifier.</param>
        /// <param name="link">The link.</param>
        /// <param name="cate_type">Type of the cate.</param>
        /// <param name="search">The search.</param>
        /// <param name="tag">The tag.</param>
        /// <param name="param">The parameter.</param>
        /// <param name="style_list">The style list.</param>
        /// <returns>Posts the list all</returns>
        [ChildActionOnly]
        [AcceptVerbs(HttpVerbs.Get)]
        public ActionResult Post_list_all(int? id, string link, string cate_type, string search, string tag, string param, string style_list)
        {
            WebInfoModels web_infor = new Models.WebInfoModels();
            int page = 1; ////start page
            int page_size = int.Parse(Util.GetConfigValue("NumberPageSizeNews", "4")); ////start page size
            string order = "DateModified;desc";
            string lang = LanguageModels.ActiveLanguage().LangCultureName;
            if (string.IsNullOrEmpty(cate_type))
            {
                cate_type = CommonGlobal.CateProduct;
            }

            if (string.IsNullOrEmpty(style_list))
            {
                style_list = "grid";
            }

            return this.Post_list_all(lang, cate_type, id, link, search, tag, param, page, page_size, order, style_list);
        }

        /// <summary>
        /// Posts the list all.
        /// </summary>
        /// <param name="lang">The language.</param>
        /// <param name="cate_type">Type of the cate.</param>
        /// <param name="cate_id">The cate identifier.</param>
        /// <param name="link_text">The link text.</param>
        /// <param name="search">The search.</param>
        /// <param name="tag">The tag.</param>
        /// <param name="param">The parameter.</param>
        /// <param name="page">The page.</param>
        /// <param name="page_size">Size of the page.</param>
        /// <param name="order">The order.</param>
        /// <param name="style_list_show">The style list show.</param>
        /// <returns>Posts the list all</returns>
        [ChildActionOnly]
        [AcceptVerbs(HttpVerbs.Post)]
        public ActionResult Post_list_all(string lang, string cate_type, int? cate_id, string link_text, string search, string tag, string param, int? page, int? page_size, string order, string style_list_show)
        {
            CatalogModels cateModels = new CatalogModels();
            WebInfoModels web_infor = new Models.WebInfoModels();
            int total_record = 0;
            PostModels postModels = new PostModels();
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
                order_by = "DateModified";
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
                    order_by = "DateModified";
                    order_type = "desc";
                    order = order_by + ";" + order_type;
                }
            }

            postModels.ClearCache(lang + cate_type + (cate_id ?? 0) + search + tag + param + page + page_size + order_by + order_type);

            List<SelectListItem> orderDrop = new List<SelectListItem>();
            orderDrop.AddRange(new SelectListItem[]
            {
                new SelectListItem { Selected = order == "DateModified;desc" ? true : false, Text = App_GlobalResources.Lang.strOrderDateDesc, Value = "DateModified;desc" },
                new SelectListItem { Selected = order == "DateModified;asc" ? true : false, Text = App_GlobalResources.Lang.strOrderDateAsc, Value = "DateModified;asc" }
            });

            List<C_Catalog> lst_parent = new List<C_Catalog>();
            List<C_Catalog> lst_parent_all = new List<C_Catalog>();
            if (cate == null || (cate.CategoryName != App_GlobalResources.Lang.mnuRecruitment && cate.CategoryName != App_GlobalResources.Lang.mnuBeautyTips))
            {
                lst_parent = cateModels.GetbyParentID(0, cate_type, lang).Where(p => p.CategoryName != App_GlobalResources.Lang.mnuRecruitment && p.CategoryName != App_GlobalResources.Lang.mnuBeautyTips).ToList();

                foreach (var it in lst_parent)
                {
                    lst_parent_all.Add(it);
                    var lst_child = cateModels.GetbyParentID(it.CatalogID, cate_type, lang).Where(p => p.Show == true).ToList();
                    foreach (var child in lst_child)
                    {
                        lst_parent_all.Add(child);
                    }
                }
            }

            var posts_view = new ViewModels.Page_posts_view();

            posts_view.List_parent_category = lst_parent;
            posts_view.List_parent_all = lst_parent_all;
            posts_view.List_page_size = this.GetSizePagingPublic(page_size ?? int.Parse(Util.GetConfigValue("NumberPageSizeNews", "8")));
            posts_view.List_order = orderDrop;
            posts_view.Page_list_post = postModels.GetListPostAll(lang, cate_type, cate_id, search, tag, param, (int)page, (int)page_size, order_by, order_type, out total_record);
            posts_view.Total_record = total_record;
            if (total_record == 0 && search != string.Empty && !string.IsNullOrEmpty(search))
            {
                posts_view.Text_search_result = App_GlobalResources.Lang.strSearchResult;
            }

            posts_view.Order = order;
            posts_view.Page_size = page_size ?? int.Parse(Util.GetConfigValue("NumberPageSizeNews", "4"));
            posts_view.Style_list = style_list_show;
            posts_view.Cate_type = cate_type;
            posts_view.Cate_id = cate_id ?? 0;
            if (cate != null && (cate.CategoryName == App_GlobalResources.Lang.mnuBeautyTips || cate.CategoryName == App_GlobalResources.Lang.mnuRecruitment))
            {
                posts_view.Cate_name = cate.CategoryName;
            }
            else
            {
                posts_view.Cate_name = string.Empty;
            }

            posts_view.Link = link_text;
            posts_view.Lang = lang;
            posts_view.Tag = tag;
            posts_view.Text_search = search;
            posts_view.Param = param;
            posts_view.Parent_action = HttpContext.Request.RequestContext.RouteData.Values["action"].ToString();
            posts_view.Parent_controller = HttpContext.Request.RequestContext.RouteData.Values["controller"].ToString();

            return this.PartialView("../control/post_list_all", posts_view);
        }

        /// <summary>
        /// Posts the list hot.
        /// </summary>
        /// <param name="cate_id">The cate identifier.</param>
        /// <returns>Posts the list hot</returns>
        [ChildActionOnly]
        public ActionResult Post_list_hot(int? cate_id)
        {
            PostModels postModels = new PostModels();
            List<C_Post> listPost = new List<C_Post>();
            postModels.ClearCache(CommonGlobal.Post + CommonGlobal.CateNews + LanguageModels.ActiveLanguage().LangCultureName + int.Parse(Util.GetConfigValue("NumberListLatestNews", "0")));
            listPost = postModels.TopPostHot(CommonGlobal.CateNews, cate_id, LanguageModels.ActiveLanguage().LangCultureName, int.Parse(Util.GetConfigValue("NumberListLatestNews", "0")));

            return this.PartialView("../control/post_list_hot", listPost);
        }

        /// <summary>
        /// Posts the list view.
        /// </summary>
        /// <returns>Posts the list view</returns>
        [ChildActionOnly]
        public ActionResult Post_list_view()
        {
            PostModels postModels = new PostModels();
            var list_view = new ViewModels.List_post_view();
            ArrayList viewLst = new ArrayList();

            HttpCookie mycookie = Request.Cookies["listPostView"];
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
                list_view.ItemCount = "0";
            }
            else
            {
                list_view.Message = string.Empty;
                list_view.ListView = new ArrayList(postModels.GetListPostView(viewLst));
                list_view.ItemCount = postModels.GetListPostView(viewLst).Count.ToString();
            }

            return this.PartialView("../control/post_list_view", list_view);
        }
    }
}