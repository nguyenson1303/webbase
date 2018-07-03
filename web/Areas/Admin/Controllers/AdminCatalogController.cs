namespace Web.Areas.Admin.Controllers
{
    using System;
    using System.Collections.Generic;
    using System.Text;
    using System.Web;
    using System.Web.Mvc;
    using System.Web.Script.Serialization;
    using Data;
    using Models;
    using Web.Controllers;
    using Web.Models;

    /// <summary>
    /// admin Catalog Controller
    /// </summary>
    /// <seealso cref="Web.Controllers.BaseController" />
    public class AdminCatalogController : BaseController
    {
        /// <summary>
        /// Changes the catalog.
        /// </summary>
        /// <param name="parent">The parent.</param>
        /// <param name="cate_id">The cate identifier.</param>
        /// <param name="type">The type.</param>
        /// <param name="act">The act.</param>
        /// <param name="ctrl">The control.</param>
        /// <param name="lang">The language.</param>
        /// <param name="type_act">The type act.</param>
        /// <returns>
        /// change catalog
        /// </returns>
        [ChildActionOnly]
        [AcceptVerbs(HttpVerbs.Get)]
        public ActionResult Change_catalog(int? parent, int? cate_id, string type, string act, string ctrl, string lang, string type_act)
        {
            CatalogModels cateModels = new CatalogModels();
            C_Catalog cate = new C_Catalog();
            StringBuilder sb = new StringBuilder();
            List<SelectListItem> list_select_catalog = new List<SelectListItem>();
            var catalog_view = new Web.Areas.Admin.ViewModels.Catalog_view();
            int level = 0;

            if (string.IsNullOrEmpty(type))
            {
                type = Request.QueryString["type"] != null ? Request.QueryString["type"].ToString() : CommonGlobal.CateProduct;
            }

            if (string.IsNullOrEmpty(act))
            {
                act = Request.QueryString["act"] != null ? Request.QueryString["act"].ToString() : "change_catalog";
            }

            if (string.IsNullOrEmpty(ctrl))
            {
                ctrl = Request.QueryString["ctrl"] != null ? Request.QueryString["ctrl"].ToString() : "adminCatalog";
            }

            if (cate_id == null)
            {
                cate_id = RouteData.Values["id"] != null ? Convert.ToInt32(RouteData.Values["id"].ToString()) : 0;
            }

            if (parent == null)
            {
                parent = string.IsNullOrEmpty(Request.QueryString["parent"]) ? 0 : Convert.ToInt32(Request.QueryString["parent"].ToString());
            }

            if (string.IsNullOrEmpty(lang))
            {
                lang = LanguageModels.ActiveLanguage().LangCultureName;
            }

            if (string.IsNullOrEmpty(type_act))
            {
                type_act = Request.QueryString["type_act"] != null ? Request.QueryString["type_act"].ToString() : CommonGlobal.Add;
                if (cate_id == 0)
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
                cate = cateModels.GetbyID((int)cate_id);
                cateModels.List_catalog_parent(0, level, cate.ParentID ?? 0, type, cate.Lang ?? lang, ref list_select_catalog);
                var link_catalog = Url.Action("index", "dashboard", new { act = "list_catalog", ctrl = "adminCatalog", type_act = CommonGlobal.View, type = type, page = "1", parent = parent, lang = cate.Lang ?? lang });
                sb.Append("<li><a class=\"active\" href=\"" + link_catalog + "\"><span><span>Danh mục " + CommonGlobal.GetCatalogTypeName(type) + "</span></span></a></li>");
                sb.Append("<li class=\"active\"><a href=\"#\"><span><span>" + cate.CategoryName + "</span></span></a></li>");
                catalog_view.Lang = cate.Lang ?? lang;
                catalog_view.Cate_id = cate.CatalogID;
                catalog_view.Category_name = cate.CategoryName;
                catalog_view.ImagePath = cate.ImagePath;
                catalog_view.Intro = cate.Intro;
                catalog_view.MoreInfo = cate.MoreInfo;
                catalog_view.Keyword = cate.Keyword;
                catalog_view.Description = cate.Description;
                catalog_view.Title = cate.Title;
                catalog_view.Link = cate.Link;
                catalog_view.Parent = cate.ParentID ?? 0;
                if ((cate.Show ?? false) == true)
                {
                    catalog_view.Show = true;
                    catalog_view.Show_text = "checked='checked'";
                }
                else
                {
                    catalog_view.Show = false;
                    catalog_view.Show_text = string.Empty;
                }

                catalog_view.List_language = this.List_select_language(cate.Lang ?? this.Lang);
                catalog_view.OrderDisplay = (int)cate.OrderDisplay;
            }
            else
            {
                cateModels.List_catalog_parent(0, level, (int)parent, type, lang, ref list_select_catalog);
                var link_catalog = Url.Action("index", "dashboard", new { act = "list_catalog", ctrl = "adminCatalog", type = type, page = "1", parent = parent, lang = lang });
                sb.Append("<li><a class=\"active\" href=\"" + link_catalog + "\"><span><span>Danh mục " + CommonGlobal.GetCatalogTypeName(type) + "</span></span></a></li>");
                sb.Append("<li class=\"active\"><a href=\"#\"><span><span>Thêm danh mục</span></span></a></li>");
                catalog_view.Lang = lang;
                catalog_view.List_language = this.List_select_language(this.Lang);
                catalog_view.OrderDisplay = cateModels.GetMaxOrderDisplay(type);
                catalog_view.Parent = (int)parent;
            }

            catalog_view.List_parent = list_select_catalog;
            catalog_view.Html_link_tab = sb.ToString();
            catalog_view.Type = type;
            catalog_view.Type_act = type_act;

            ////action and parent action
            catalog_view.Act = act;
            catalog_view.Ctrl = ctrl;
            catalog_view.Parent_action = HttpContext.Request.RequestContext.RouteData.Values["action"].ToString();
            catalog_view.Parent_controller = HttpContext.Request.RequestContext.RouteData.Values["controller"].ToString();

            return this.PartialView("../control/change_catalog", catalog_view);
        }

        /// <summary>
        /// Changes the catalog.
        /// </summary>
        /// <param name="collection">The collection.</param>
        /// <param name="file_image">The file image.</param>
        /// <returns>change catalog</returns>
        [ChildActionOnly]
        [ValidateInput(false)]
        [AcceptVerbs(HttpVerbs.Post)]
        public ActionResult Change_catalog(FormCollection collection, HttpPostedFileBase file_image)
        {
            CatalogModels cateModels = new CatalogModels();
            C_Catalog cate = new C_Catalog();
            StringBuilder sb = new StringBuilder();
            int rt = 0;
            bool is_valid = true;
            int level = 0;
            List<SelectListItem> list_select_catalog = new List<SelectListItem>();
            var catalog_view = new Web.Areas.Admin.ViewModels.Catalog_view();
            this.TryUpdateModel(catalog_view);

            if (catalog_view.Cate_id > 0)
            {
                cate = cateModels.GetbyID(catalog_view.Cate_id);
            }

            ////validation server
            if (string.IsNullOrEmpty(catalog_view.Category_name))
            {
                is_valid = false;
                catalog_view.Message = "Bạn cần nhập tên danh mục";
            }

            ////action
            catalog_view.Parent_action = HttpContext.Request.RequestContext.RouteData.Values["action"].ToString();
            catalog_view.Parent_controller = HttpContext.Request.RequestContext.RouteData.Values["controller"].ToString();

            if (catalog_view.Cate_id != 0 && catalog_view.Type_act == CommonGlobal.Edit)
            {
                ////tab
                var link_catalog = Url.Action("index", "dashboard", new { act = "list_catalog", ctrl = "adminCatalog", type_act = CommonGlobal.View, type = catalog_view.Type, page = "1", parent = catalog_view.Parent, lang = catalog_view.Lang });
                sb.Append("<li><a href=\"" + link_catalog + "\"><span><span>Danh sách " + CommonGlobal.GetCatalogTypeName(catalog_view.Type) + "</span></span></a></li>");
                sb.Append("<li class=\"active\"><a href=\"#\"><span><span>" + cate.CategoryName + "</span></span></a></li>");
                ////list parent
                cateModels.List_catalog_parent(0, level, cate.ParentID ?? 0, catalog_view.Type, cate.Lang, ref list_select_catalog);
                catalog_view.List_parent = list_select_catalog;
                ////list lang
                catalog_view.List_language = this.List_select_language(cate.Lang);
                catalog_view.Cate_id = cate.CatalogID;
            }
            else
            {
                ////tab
                sb.Append("<li><a href=\"" + Url.Action("index", "dashboard", new { act = "list_catalog", ctrl = "adminCatalog", type_act = CommonGlobal.View, type = catalog_view.Type, page = "1", parent = catalog_view.Parent, lang = catalog_view.Lang }) + "\"><span><span>Danh sách " + CommonGlobal.GetCatalogTypeName(catalog_view.Type) + "</span></span></a></li>");
                sb.Append("<li class=\"active\"><a href=\"#\"><span><span>Thêm danh mục</span></span></a></li>");
                ////list parent
                cateModels.List_catalog_parent(0, level, 0, catalog_view.Type, catalog_view.Lang, ref list_select_catalog);
                catalog_view.List_parent = list_select_catalog;
                ////list lang
                catalog_view.List_language = this.List_select_language(catalog_view.Lang);
            }

            catalog_view.Html_link_tab = sb.ToString();

            if (!is_valid)
            {
                return this.PartialView("../control/change_catalog", catalog_view);
            }

            cate.CategoryName = catalog_view.Category_name;
            cate.Description = string.IsNullOrEmpty(catalog_view.Description) == false ? catalog_view.Description : string.Empty;
            cate.Keyword = string.IsNullOrEmpty(catalog_view.Keyword) == false ? catalog_view.Keyword : string.Empty;
            if (!string.IsNullOrEmpty(catalog_view.Title))
            {
                cate.Title = catalog_view.Title;
            }
            else
            {
                cate.Title = catalog_view.Category_name;
                catalog_view.Title = cate.Title;
            }

            cate.Intro = string.IsNullOrEmpty(catalog_view.Intro) == false ? catalog_view.Intro : string.Empty;
            cate.MoreInfo = string.IsNullOrEmpty(catalog_view.MoreInfo) == false ? catalog_view.MoreInfo : string.Empty;
            cate.Lang = catalog_view.Lang;
            cate.OrderDisplay = catalog_view.OrderDisplay;
            cate.ParentID = catalog_view.Parent;
            cate.Show = catalog_view.Show;
            if ((cate.Show ?? false) == true)
            {
                catalog_view.Show = true;
                catalog_view.Show_text = "checked='checked'";
            }
            else
            {
                catalog_view.Show = false;
                catalog_view.Show_text = string.Empty;
            }

            cate.Link = CommonGlobal.CompleteLink(catalog_view.Category_name); 
            cate.Type = catalog_view.Type;

            var imgPathTemp = "images/catalog/" + DateTime.Now.Year.ToString() + "/" + DateTime.Now.Month.ToString() + "/";
            var name_time = DateTime.Now.Day + DateTime.Now.Month + DateTime.Now.Year + DateTime.Now.Hour + DateTime.Now.Minute + string.Empty;

            if (file_image != null && file_image.ContentLength > 0 && CommonGlobal.IsImage(file_image) == true)
            {
                string image_small = imgPathTemp + "sc_small_" + name_time + "_" + CommonGlobal.CompleteNamefileImages(file_image.FileName);
                string image_lager = imgPathTemp + "sc_full_" + name_time + "_" + CommonGlobal.CompleteNamefileImages(file_image.FileName);
                ////save image and delete old file
                //this.SavephotoCategory(cate.ImagePath, file_image, imgPathTemp, image_small, image_lager);

                ////save image and delete old file
                this.SavephotoOriginal(cate.ImagePath, file_image, imgPathTemp, image_lager);

                ////set image thumb to link catalog
                cate.ImagePath = "/" + image_lager;
                catalog_view.ImagePath = "/" + image_lager;
            }
            else if (string.IsNullOrEmpty(cate.ImagePath))
            {
                cate.ImagePath = "0";
            }
            else
            {
                cate.ImagePath = catalog_view.ImagePath;
            }

            if (catalog_view.Cate_id != 0 && catalog_view.Type_act == "edit")
            {
                rt = cateModels.Edit(cate);
            }
            else
            {
                rt = cateModels.Add(cate);
            }

            if (rt > 0)
            {
                catalog_view.Message = "Cập nhật thành công!";
                catalog_view.Cate_id = rt;
                catalog_view.Cate_type = CommonGlobal.Edit;
            }
            else
            {
                catalog_view.Message = "Cập nhật không thành công!";
            }

            return this.PartialView("../control/change_catalog", catalog_view);
        }

        /// <summary>
        /// Lists the catalog.
        /// </summary>
        /// <param name="parent">The parent.</param>
        /// <param name="cate_id">The cate identifier.</param>
        /// <param name="act">The act.</param>
        /// <param name="ctrl">The control.</param>
        /// <param name="type">The type.</param>
        /// <param name="type_act">The type act.</param>
        /// <param name="lang">The language.</param>
        /// <param name="search">The search.</param>
        /// <param name="page">The page.</param>
        /// <param name="page_size">The page_size.</param>
        /// <param name="order_by">The order by.</param>
        /// <param name="order_type">Type of the order.</param>
        /// <returns>list catalog</returns>
        [ChildActionOnly]
        public ActionResult List_catalog(int? parent, int? cate_id, string act, string ctrl, string type, string type_act, string lang, string search, int? page, int? page_size, string order_by, string order_type)
        {
            CatalogModels cateModels = new CatalogModels();
            C_Catalog cate = new C_Catalog();
            StringBuilder sb = new StringBuilder();
            List<SelectListItem> list_select_catalog = new List<SelectListItem>();
            var list_catalog_view = new Web.Areas.Admin.ViewModels.List_catalog_view();
            int total_record = 0;
            int level = 0;
            /////type is get type catalog
            /////ex   : SP - product
            /////     : TT - news
            /////     : CL - collection
            /////     : LB - lookbook
            /////     : GL - gallery
            /////parent is parent id
            if (string.IsNullOrEmpty(type))
            {
                type = Request.QueryString["type"] != null ? Request.QueryString["type"].ToString() : CommonGlobal.CateProduct;
            }

            if (string.IsNullOrEmpty(act))
            {
                act = Request.QueryString["act"] != null ? Request.QueryString["act"].ToString() : "list_catalog";
            }

            if (string.IsNullOrEmpty(ctrl))
            {
                ctrl = Request.QueryString["ctrl"] != null ? Request.QueryString["ctrl"].ToString() : "adminCatalog";
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

            if (string.IsNullOrEmpty(order_by) || string.IsNullOrEmpty(order_type))
            {
                order_by = "OrderDisplay";
                order_type = "asc";
            }

            ////type act delete
            if (cate_id != null && type_act != null && type_act == CommonGlobal.Delete) 
            {
                ////check permission delete
                if (UserModels.CheckPermission(this.Session["mem"] != null ? this.Session["mem"].ToString() : string.Empty, act, ctrl, type_act, type)) 
                {
                    cate = cateModels.GetbyID((int)cate_id);
                    if (cate != null)
                    {
                        ////delete old image
                        if (!string.IsNullOrEmpty(cate.ImagePath))
                        {
                            string strImg = cate.ImagePath;
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

                        ////delete category
                        bool rt = cateModels.Delete((int)cate_id);
                        if (rt)
                        {
                            list_catalog_view.Message = "Bạn đã xóa danh mục " + cate_id;
                        }
                        else
                        {
                            list_catalog_view.Message = "Xóa không thành công";
                        }
                    }
                    else
                    {
                        list_catalog_view.Message = "Không tìm thấy danh mục : " + cate_id;
                    }
                }
                else
                {
                    list_catalog_view.Message = " Bạn không có quyền thực thi hành động xóa cho danh mục này ";
                }
            }

            if (parent != 0)
            {
                cate = cateModels.GetbyID((int)parent);
                list_catalog_view.Category_name = cate.CategoryName;
            }

            list_catalog_view.Type = type;
            list_catalog_view.Cate_type = CommonGlobal.GetCatalogTypeName(type);
            list_catalog_view.Parent = (int)parent;
            list_catalog_view.Lang = lang;
            list_catalog_view.Type_act = type_act;
            ////tab
            var link_dashboard = Url.Action("index", "dashboard", new { act = "list_catalog", ctrl = "adminCatalog", type_act = CommonGlobal.View, type = type, page = "1", parent = parent, lang = lang });
            var link_change_catalog = Url.Action("index", "dashboard", new { act = "change_catalog", ctrl = "adminCatalog", type_act = CommonGlobal.Add, type = type, parent = parent, lang = lang });
            sb.Append("<li class=\"active\"><a class=\"active\" href=\"" + link_dashboard + "\"><span><span>Danh sách " + CommonGlobal.GetCatalogTypeName(type) + "</span></span></a></li>");
            sb.Append("<li><a href=\"" + link_change_catalog + "\"><span><span>Thêm mới</span></span></a></li>");
            list_catalog_view.Html_link_tab = sb.ToString();
            ////list language
            list_catalog_view.List_language = this.List_select_language(this.Lang);
            ////list category
            cateModels.List_catalog_parent(0, level, (int)parent, type, lang, ref list_select_catalog);
            list_catalog_view.List_parent = list_select_catalog;
            ////list page size and paging
            list_catalog_view.List_page_size = this.GetSizePagingPublic((int)page_size);
            list_catalog_view.Page = (int)page;
            list_catalog_view.Page_size = (int)page_size;
            ////list catalog
            list_catalog_view.Page_list_catalog = cateModels.GetAllCatalogByParentID((int)parent, type, lang, search, (int)page, (int)page_size, order_by, order_type, out total_record);
            list_catalog_view.Search = search;
            list_catalog_view.Order_by = order_by;
            list_catalog_view.Order_type = order_type;
            list_catalog_view.Total_record = total_record;
            ////acton and parent action
            list_catalog_view.Act = act;
            list_catalog_view.Ctrl = ctrl;
            list_catalog_view.Parent_action = HttpContext.Request.RequestContext.RouteData.Values["action"].ToString();
            list_catalog_view.Parent_controller = HttpContext.Request.RequestContext.RouteData.Values["controller"].ToString();

            return this.PartialView("../control/list_catalog", list_catalog_view);
        }

        /// <summary>
        /// Updates the status catalog.
        /// </summary>
        /// <param name="id">The identifier.</param>
        /// <param name="status">The status.</param>
        /// <param name="type">The type.</param>
        /// <returns>update status catalog</returns>
        public ActionResult Update_status_catalog(string id, string status, string type)
        {
            CatalogModels cateModels = new CatalogModels();
            C_Catalog cate = new C_Catalog();
            bool isOk = false;
            if (UserModels.CheckPermission(this.Session["mem"] != null ? this.Session["mem"].ToString() : string.Empty, "change_catalog", "adminCatalog", CommonGlobal.Edit, type))
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
                    cate = cateModels.GetbyID(int.Parse(id));
                }

                if (cate != null)
                {
                    try
                    {
                        if (bool.Parse(status) == true)
                        {
                            cate.Show = true;
                        }
                        else
                        {
                            cate.Show = false;
                        }

                        if (isOk)
                        {
                            cateModels.Edit(cate);
                        }
                    }
                    catch (Exception)
                    {
                    }
                }
            }

            var jsonSerialiser = new JavaScriptSerializer();
            var results = Convert.ToDateTime(DateTime.Now).ToString("dd/MM/yyyy") + "|" + cate.Show;

            return this.Json(results);
        }
    }
}