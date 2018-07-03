namespace Web.Areas.Admin.Controllers
{
    using System;
    using System.Collections.Generic;
    using System.Text;
    using System.Web;
    using System.Web.Mvc;
    using System.Web.Script.Serialization;

    using Web.Controllers;
    using Web.Data;
    using Web.Models;

    /// <summary>
    /// admin Post Controller
    /// </summary>
    /// <seealso cref="Web.Controllers.BaseController" />
    public class AdminPostController : BaseController
    {
        /// <summary>
        /// Changes the post.
        /// </summary>
        /// <param name="post_id">The post identifier.</param>
        /// <param name="type">The type.</param>
        /// <param name="act">The act.</param>
        /// <param name="ctrl">The control.</param>
        /// <param name="type_act">The type act.</param>
        /// <param name="lang">The language.</param>
        /// <returns>change post</returns>
        [ChildActionOnly]
        [AcceptVerbs(HttpVerbs.Get)]
        public ActionResult Change_post(int? post_id, string type, string act, string ctrl, string type_act, string lang)
        {
            CatalogModels cateModels = new CatalogModels();
            PostModels postModel = new PostModels();
            C_Catalog cate = new C_Catalog();
            C_Post objPost = new C_Post();
            List<SelectListItem> list_select_catalog = new List<SelectListItem>();
            var post_view = new Web.Areas.Admin.ViewModels.Post_view();
            StringBuilder sb = new StringBuilder();
            int level = 0;
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

            if (post_id == null)
            {
                post_id = RouteData.Values["id"] != null ? Convert.ToInt32(RouteData.Values["id"].ToString()) : 0;
            }

            if (string.IsNullOrEmpty(lang))
            {
                lang = LanguageModels.ActiveLanguage().LangCultureName;
            }

            if (string.IsNullOrEmpty(type_act))
            {
                type_act = Request.QueryString["type_act"] != null ? Request.QueryString["type_act"].ToString() : CommonGlobal.Add;
                if (post_id == 0)
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
                objPost = postModel.GetbyID((int)post_id);
                post_view.PostID = objPost.PostID;
                post_view.PostName = objPost.PostName;
                post_view.PostContent = objPost.PostContent;
                post_view.ImagePath = objPost.ImagePath;
                post_view.Title = objPost.Title;
                post_view.Keyword = objPost.Keyword;
                post_view.Description = objPost.Description;
                post_view.Summary = objPost.Summary;
                post_view.Lang = objPost.Lang;
                post_view.CatalogID = (int)objPost.CatelogID;
                post_view.OrderDisplay = (int)objPost.OrderDisplay;
                post_view.Parent = (int)objPost.CatelogID;
                post_view.CreateDate = objPost.CreateDate ?? DateTime.Now;
                if ((objPost.IsHot ?? false) == true)
                {
                    post_view.IsHot = true;
                    post_view.Is_short_text = "checked='checked'";
                }
                else
                {
                    post_view.IsHot = false;
                    post_view.Is_short_text = string.Empty;
                }

                if ((objPost.Approve ?? false) == true)
                {
                    post_view.Approve = true;
                    post_view.Show_text = "checked='checked'";
                }
                else
                {
                    post_view.Approve = false;
                    post_view.Show_text = string.Empty;
                }

                cateModels.List_catalog_parent(0, level, (int)objPost.CatelogID, type, cate.Lang ?? objPost.Lang, ref list_select_catalog);

                ////Link tab
                sb.Append("<li><a href=\"" + Url.Action("index", "dashboard", new { act = "list_post", ctrl = "adminPost", type = type, page = "1", lang = objPost.Lang }) + "\"><span><span>Danh sách tin tức</span></span></a></li>");
                sb.Append("<li class=\"active\"><a href=\"#\"><span><span>Cập nhật</span></span></a></li>");

                post_view.List_language = this.List_select_language(cate.Lang ?? objPost.Lang);
            }
            else
            {
                ////Link tab
                sb.Append("<li><a href=\"" + Url.Action("index", "dashboard", new { act = "list_post", ctrl = "adminPost", type = type, page = "1", lang = lang }) + "\"><span><span>Danh sách tin tức</span></span></a></li>");
                sb.Append("<li class=\"active\"><a href=\"#\"><span><span>Thêm mới</span></span></a></li>");

                cateModels.List_catalog_parent(0, level, 0, type, lang, ref list_select_catalog);
                post_view.List_language = this.List_select_language(lang);
            }

            post_view.List_category = list_select_catalog;
            post_view.Type = type;
            post_view.Type_act = type_act;
            post_view.Html_link_tab = sb.ToString();
            ////action
            post_view.Act = act;
            post_view.Ctrl = ctrl;
            post_view.Parent_action = HttpContext.Request.RequestContext.RouteData.Values["action"].ToString();
            post_view.Parent_controller = HttpContext.Request.RequestContext.RouteData.Values["controller"].ToString();
            ////end action

            return this.PartialView("../control/change_post", post_view);
        }

        /// <summary>
        /// Changes the post.
        /// </summary>
        /// <param name="collection">The collection.</param>
        /// <param name="file_image">The file image.</param>
        /// <returns>change post</returns>
        [ChildActionOnly]
        [ValidateInput(false)]
        [AcceptVerbs(HttpVerbs.Post)]
        public ActionResult Change_post(FormCollection collection, HttpPostedFileBase file_image)
        {
            CatalogModels cateModels = new CatalogModels();
            PostModels postModel = new PostModels();
            C_Post objPost = new C_Post();
            StringBuilder sb = new StringBuilder();
            int rt = 0;
            bool is_valid = true;
            int level = 0;
            List<SelectListItem> list_select_catalog = new List<SelectListItem>();
            var post_view = new Web.Areas.Admin.ViewModels.Post_view();
            this.TryUpdateModel(post_view);

            if (post_view.PostID > 0)
            {
                objPost = postModel.GetbyID(post_view.PostID);
            }

            ////validation server
            if (string.IsNullOrEmpty(post_view.PostName))
            {
                is_valid = false;
                post_view.Message = "Bạn cần nhập tên danh mục";
            }

            ////validation server
            if (post_view.Parent == 0)
            {
                is_valid = false;
                post_view.Message = "Bạn cần lựa chọn danh mục";
            }
            ////action
            ////post_view.act = "change_post";
            ////post_view.ctrl = "adminPost";
            post_view.Parent_action = HttpContext.Request.RequestContext.RouteData.Values["action"].ToString();
            post_view.Parent_controller = HttpContext.Request.RequestContext.RouteData.Values["controller"].ToString();

            if (post_view.PostID != 0 && post_view.Type_act == CommonGlobal.Edit)
            {
                ////Link tab
                sb.Append("<li><a class=\"active\" href=\"" + Url.Action("index", "dashboard", new { act = "list_post", ctrl = "adminPost", type = post_view.Type, page = "1" }) + "\"><span><span>Danh sách tin tức</span></span></a></li>");
                sb.Append("<li class=\"active\"><a href=\"#\"><span><span>Cập nhật</span></span></a></li>");

                ////list parent
                cateModels.List_catalog_parent(0, level, objPost.CatelogID ?? 0, post_view.Type, objPost.Lang, ref list_select_catalog);
                post_view.List_category = list_select_catalog;

                ////list language
                post_view.List_language = this.List_select_language(objPost.Lang);
            }
            else
            {
                ////Link tab
                sb.Append("<li><a class=\"active\" href=\"" + Url.Action("index", "dashboard", new { act = "list_post", ctrl = "adminPost", type = post_view.Type, page = "1" }) + "\"><span><span>Danh sách tin tức</span></span></a></li>");
                sb.Append("<li class=\"active\"><a href=\"#\"><span><span>Thêm mới</span></span></a></li>");

                ////list parent
                cateModels.List_catalog_parent(0, level, 0, post_view.Type, post_view.Lang, ref list_select_catalog);
                post_view.List_category = list_select_catalog;

                ////list language
                post_view.List_language = this.List_select_language(post_view.Lang);
            }

            post_view.Html_link_tab = sb.ToString();

            if (!is_valid)
            {
                return this.PartialView("../control/change_post", post_view);
            }

            ////Post info
            objPost.CatelogID = post_view.Parent;
            objPost.PostName = post_view.PostName;

            var imgPathTemp = "images/newspost/" +
                              DateTime.Now.Year.ToString() + "/" + DateTime.Now.Month.ToString() + "/";
            var name_time = DateTime.Now.Day + DateTime.Now.Month + DateTime.Now.Year + DateTime.Now.Hour + DateTime.Now.Minute + string.Empty;
            if (file_image != null && file_image.ContentLength > 0 && CommonGlobal.IsImage(file_image) == true)
            {
                string image_small = imgPathTemp + "sc_small_" + name_time + "_" + CommonGlobal.CompleteNamefileImages(file_image.FileName);
                string image_lager = imgPathTemp + "sc_full_" + name_time + "_" + CommonGlobal.CompleteNamefileImages(file_image.FileName);

                ////save image and delete old file
                this.Savephoto(objPost.ImagePath, file_image, imgPathTemp, image_small, image_lager);

                ////set image thumb to link catalog
                objPost.ImagePath = "/" + image_small;
                post_view.ImagePath = "/" + image_small;
            }
            else if (string.IsNullOrEmpty(objPost.ImagePath))
            {
                objPost.ImagePath = "0";
            }
            else
            {
                objPost.ImagePath = post_view.ImagePath;
            }

            objPost.Link = CommonGlobal.CompleteLink(post_view.PostName);
            objPost.Summary = post_view.Summary;
            objPost.PostContent = post_view.PostContent;
            objPost.DateModified = DateTime.Now;
            objPost.IsHot = post_view.IsHot;
            if (objPost.IsHot == true)
            {
                post_view.IsHot = true;
                post_view.Is_short_text = "checked='checked'";
            }
            else
            {
                post_view.IsHot = false;
                post_view.Is_short_text = string.Empty;
            }

            objPost.Approve = post_view.Approve;

            if (objPost.Approve == true)
            {
                post_view.Approve = true;
                post_view.Show_text = "checked='checked'";
            }
            else
            {
                post_view.Approve = false;
                post_view.Show_text = string.Empty;
            }

            objPost.Lang = post_view.Lang;
            objPost.Title = post_view.Title;
            objPost.Keyword = post_view.Keyword;
            objPost.Description = post_view.Description;
            objPost.OrderDisplay = post_view.OrderDisplay;

            if (post_view.PostID != 0 && post_view.Type_act == CommonGlobal.Edit)
            {
                objPost.CreateDate = post_view.CreateDate;
                rt = postModel.Edit(objPost);
            }
            else
            {
                objPost.CreateDate = DateTime.Now;
                rt = postModel.Add(objPost);
            }

            if (rt > 0)
            {
                post_view.Message = "Cập nhật thành công!";
                post_view.PostID = rt;
                post_view.Type_act = CommonGlobal.Edit;
            }
            else
            {
                post_view.Message = "Cập nhật không thành công!";
            }

            return this.PartialView("../control/change_post", post_view);
        }

        /// <summary>
        /// Lists the post.
        /// </summary>
        /// <param name="parent">The parent.</param>
        /// <param name="cate_id">The cate identifier.</param>
        /// <param name="post_id">The post identifier.</param>
        /// <param name="type">The type.</param>
        /// <param name="act">The act.</param>
        /// <param name="ctrl">The control.</param>
        /// <param name="type_act">The type act.</param>
        /// <param name="lang">The language.</param>
        /// <param name="search">The search.</param>
        /// <param name="page">The page.</param>
        /// <param name="page_size">The page_size.</param>
        /// <param name="order_by">The order by.</param>
        /// <param name="order_type">Type of the order.</param>
        /// <returns>list post</returns>
        [ChildActionOnly]
        public ActionResult List_post(int? parent, int? cate_id, int? post_id, string type, string act, string ctrl, string type_act, string lang, string search, int? page, int? page_size, string order_by, string order_type)
        {
            CatalogModels cataModel = new CatalogModels();
            PostModels postModel = new PostModels();
            C_Post post = new C_Post();
            List<SelectListItem> list_select_catalog = new List<SelectListItem>();
            var list_post_view = new Web.Areas.Admin.ViewModels.List_post_view();
            StringBuilder sb = new StringBuilder();

            int total_record = 0;
            int level = 0;

            if (string.IsNullOrEmpty(type))
            {
                type = Request.QueryString["type"] != null ? Request.QueryString["type"].ToString() : CommonGlobal.CateNews;
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

            if (parent == null)
            {
                parent = Request.QueryString["parent"] != null ? Convert.ToInt32(Request.QueryString["parent"].ToString()) : 0;
            }

            if (string.IsNullOrEmpty(lang))
            {
                lang = LanguageModels.ActiveLanguage().LangCultureName;
            }

            if (page_size == null)
            {
                page_size = int.Parse(Util.GetConfigValue("NumberPageSizeAdmin", "30"));
            }

            list_post_view.Page = (int)page;
            list_post_view.Page_size = (int)page_size;

            list_post_view.Cate_type = CommonGlobal.GetCatalogTypeName(type);

            ////list category
            cataModel.List_catalog_parent(0, level, (int)parent, type, lang, ref list_select_catalog);
            list_post_view.List_parent = list_select_catalog;

            ////list language
            list_post_view.List_language = this.List_select_language(lang);

            ////tab
            sb.Append("<li class=\"active\"><a class=\"active\" href=\"" + Url.Action("index", "dashboard", new { act = "list_post", ctrl = "adminPost", type = type, page = "1", parent = parent, lang = lang }) + "\"><span><span>Danh mục " + CommonGlobal.GetCatalogTypeName(type) + "</span></span></a></li>");
            sb.Append("<li><a href=\"" + Url.Action("index", "dashboard", new { act = "change_post", ctrl = "adminPost", type = type, type_act = "add", parent = parent, lang = lang }) + "\"><span><span>Thêm bài viết</span></span></a></li>");
            list_post_view.Html_link_tab = sb.ToString();

            if (post_id != null && post_id != 0 && type_act != null && type_act == CommonGlobal.Delete)
            {
                ////check permission delete
                if (UserModels.CheckPermission(this.Session["mem"] != null ? this.Session["mem"].ToString() : string.Empty, act, ctrl, type_act, type)) 
                {
                    post = postModel.GetbyID((int)post_id);
                    if (post != null)
                    {
                        ////delete old image
                        if (!string.IsNullOrEmpty(post.ImagePath))
                        {
                            string strImg = post.ImagePath;
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
                        ////delete post
                        bool rt = postModel.Delete((int)post_id);
                        if (rt)
                        {
                            list_post_view.Message = "Bạn đã xóa bài viết: " + post_id;
                        }
                        else
                        {
                            list_post_view.Message = "Xóa không thành công";
                        }
                    }
                    else
                    {
                        list_post_view.Message = "Không tìm thấy bài viết : " + post_id;
                    }
                }
                else
                {
                    list_post_view.Message = " Bạn không có quyền thực thi hành động xóa.";
                }
            }

            ////list post
            list_post_view.List_page_size = this.GetSizePagingPublic((int)page_size);
            list_post_view.Page_list_post = postModel.GetListPostAll(lang, type, (int)parent, search, (int)page, (int)page_size, order_by, order_type, out total_record);
            list_post_view.Total_record = total_record;
            list_post_view.Search = search;
            list_post_view.Type_act = type_act;
            list_post_view.Type = type;
            ////action
            list_post_view.Act = act;
            list_post_view.Ctrl = ctrl;
            list_post_view.Parent_action = HttpContext.Request.RequestContext.RouteData.Values["action"].ToString();
            list_post_view.Parent_controller = HttpContext.Request.RequestContext.RouteData.Values["controller"].ToString();
            ////end action

            return this.PartialView("../control/list_post", list_post_view);
        }

        /// <summary>
        /// Updates the status is approve post.
        /// </summary>
        /// <param name="id">The identifier.</param>
        /// <param name="status">The status.</param>
        /// <param name="type">The type.</param>
        /// <returns>update status is approve post</returns>
        public ActionResult Update_status_is_approve_post(string id, string status, string type)
        {
            PostModels postModel = new PostModels();
            C_Post objPost = new C_Post();
            bool isOk = false;
            if (UserModels.CheckPermission(this.Session["mem"] != null ? this.Session["mem"].ToString() : string.Empty, "change_post", "adminPost", CommonGlobal.Edit, type))
            {
                isOk = true;
            }
            else
            {
                isOk = false;
            }

            if (!string.IsNullOrEmpty(id))
            {
                if (int.Parse(id) > 0)
                {
                    objPost = postModel.GetbyID(int.Parse(id));
                }

                if (objPost != null)
                {
                    try
                    {
                        if (bool.Parse(status) == true)
                        {
                            objPost.Approve = true;
                        }
                        else
                        {
                            objPost.Approve = false;
                        }

                        if (isOk)
                        {
                            objPost.DateModified = DateTime.Now;
                            postModel.Edit(objPost);
                        }
                    }
                    catch (Exception)
                    {
                    }
                }
            }

            var jsonSerialiser = new JavaScriptSerializer();
            var results = Convert.ToDateTime(DateTime.Now).ToString("dd/MM/yyyy") + "|" + objPost.Approve;

            return this.Json(results);
        }

        /// <summary>
        /// Updates the status is hot post.
        /// </summary>
        /// <param name="id">The identifier.</param>
        /// <param name="status">The status.</param>
        /// <param name="type">The type.</param>
        /// <returns>update status is hot post</returns>
        public ActionResult Update_status_is_hot_post(string id, string status, string type)
        {
            PostModels postModel = new PostModels();
            C_Post objPost = new C_Post();
            bool isOk = false;
            if (UserModels.CheckPermission(this.Session["mem"] != null ? this.Session["mem"].ToString() : string.Empty, "change_post", "adminPost", CommonGlobal.Edit, type))
            {
                isOk = true;
            }
            else
            {
                isOk = false;
            }

            if (!string.IsNullOrEmpty(id))
            {
                if (int.Parse(id) > 0)
                {
                    objPost = postModel.GetbyID(int.Parse(id));
                }

                if (objPost != null)
                {
                    try
                    {
                        if (bool.Parse(status) == true)
                        {
                            objPost.IsHot = true;
                        }
                        else
                        {
                            objPost.IsHot = false;
                        }

                        if (isOk)
                        {
                            objPost.DateModified = DateTime.Now;
                            postModel.Edit(objPost);
                        }
                    }
                    catch (Exception)
                    {
                    }
                }
            }

            var jsonSerialiser = new JavaScriptSerializer();
            var results = Convert.ToDateTime(DateTime.Now).ToString("dd/MM/yyyy") + "|" + objPost.IsHot;

            return this.Json(results);
        }
    }
}