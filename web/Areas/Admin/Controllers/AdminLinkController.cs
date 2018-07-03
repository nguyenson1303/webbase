namespace Web.Areas.Admin.Controllers
{
    using System;
    using System.Collections.Generic;
    using System.Text;
    using System.Web;
    using System.Web.Mvc;
    using Web.Controllers;
    using Web.Data;
    using Web.Models;

    /// <summary>
    /// admin Link Controller
    /// </summary>
    public class AdminLinkController : BaseController
    {
        /// <summary>
        /// Changes the link.
        /// </summary>
        /// <param name="id">The identifier.</param>
        /// <param name="type">The type.</param>
        /// <param name="act">The act.</param>
        /// <param name="ctrl">The control.</param>
        /// <param name="lang">The language.</param>
        /// <param name="type_act">The type act.</param>
        /// <returns>change link</returns>
        [ChildActionOnly]
        [AcceptVerbs(HttpVerbs.Get)]
        public ActionResult Change_link(int? id, string type, string act, string ctrl, string lang, string type_act)
        {
            LinkModels linkModels = new LinkModels();
            C_Link clink = new C_Link();
            StringBuilder sb = new StringBuilder();
            var link_view = new Web.Areas.Admin.ViewModels.Link_view();
            if (string.IsNullOrEmpty(type))
            {
                type = Request.QueryString["type"] != null ? Request.QueryString["type"].ToString() : CommonGlobal.CateProduct;
            }

            if (string.IsNullOrEmpty(act))
            {
                act = Request.QueryString["act"] != null ? Request.QueryString["act"].ToString() : "change_link";
            }

            if (string.IsNullOrEmpty(ctrl))
            {
                ctrl = Request.QueryString["ctrl"] != null ? Request.QueryString["ctrl"].ToString() : "adminLink";
            }

            if (id == null)
            {
                id = RouteData.Values["id"] != null ? Convert.ToInt32(RouteData.Values["id"].ToString()) : 0;
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
                clink = linkModels.GetByID((int)id);
                sb.Append("<li><a href=\"" + Url.Action("index", "dashboard", new { act = "list_link", ctrl = "adminLink", type_act = CommonGlobal.Add, type = type, page = "1" }) + "\"><span><span>Danh sách " + CommonGlobal.GetLinkADTypeName(type) + "</span></span></a></li>");
                sb.Append("<li class=\"active\"><a href=\"#\"><span><span>" + clink.Title + "</span></span></a></li>");
                link_view.Lang = clink.Lang ?? lang;
                link_view.Id = clink.ID;
                link_view.Title = clink.Title;
                link_view.ImagePath = clink.ImagePath;
                link_view.LinkContent = clink.LinkContent;
                link_view.Link_url = clink.Link;
                link_view.Summary = clink.Summary;
                link_view.OrderDisplay = clink.OrderDisplay ?? 0;
                link_view.List_language = this.List_select_language(clink.Lang ?? this.Lang);
            }
            else
            {
                sb.Append("<li><a href=\"" + Url.Action("index", "dashboard", new { act = "list_link", ctrl = "adminLink", type_act = CommonGlobal.Add, type = type, page = "1" }) + "\"><span><span>Danh sách " + CommonGlobal.GetLinkADTypeName(type) + "</span></span></a></li>");
                sb.Append("<li class=\"active\"><a href=\"#\"><span><span>Thêm mới</span></span></a></li>");
                link_view.Lang = lang;
                link_view.List_language = this.List_select_language(this.Lang);
                link_view.OrderDisplay = linkModels.GetMaxOrderDisplay(type);
            }

            link_view.Html_link_tab = sb.ToString();
            link_view.Type = type;
            link_view.Type_act = type_act;
            ////action and parent action
            link_view.Act = act;
            link_view.Ctrl = ctrl;
            link_view.Parent_action = HttpContext.Request.RequestContext.RouteData.Values["action"].ToString();
            link_view.Parent_controller = HttpContext.Request.RequestContext.RouteData.Values["controller"].ToString();

            return this.PartialView("../control/change_link", link_view);
        }

        /// <summary>
        /// Changes the link.
        /// </summary>
        /// <param name="collection">The collection.</param>
        /// <returns>change link</returns>
        [ChildActionOnly]
        [ValidateInput(false)]
        [AcceptVerbs(HttpVerbs.Post)]
        public ActionResult Change_link(FormCollection collection)
        {
            LinkModels linkModels = new LinkModels();
            C_Link clink = new C_Link();
            StringBuilder sb = new StringBuilder();
            var link_view = new Web.Areas.Admin.ViewModels.Link_view();
            this.TryUpdateModel(link_view);
            int rt = 0;
            bool is_valid = true;
            if (link_view.Id > 0)
            {
                clink = linkModels.GetByID(link_view.Id);
            }

            ////validation server
            if (string.IsNullOrEmpty(link_view.Title))
            {
                is_valid = false;
                link_view.Message = "Bạn cần nhập tiêu đề";
            }

            ////action
            link_view.Parent_action = HttpContext.Request.RequestContext.RouteData.Values["action"].ToString();
            link_view.Parent_controller = HttpContext.Request.RequestContext.RouteData.Values["controller"].ToString();
            ////Link tab
            var link_dashboard = Url.Action("index", "dashboard", new { act = "list_link", ctrl = "adminLink", type_act = CommonGlobal.Add, type = link_view.Type, page = "1" });
            sb.Append("<li><a href=\"" + link_dashboard + "\"><span><span>Danh sách " + CommonGlobal.GetLinkADTypeName(link_view.Type) + "</span></span></a></li>");
            if (link_view.Id != 0 && link_view.Type_act == CommonGlobal.Edit)
            {
                sb.Append("<li class=\"active\"><a href=\"#\"><span><span>" + clink.Title + "</span></span></a></li>");
                link_view.List_language = this.List_select_language(clink.Lang);
            }
            else
            {
                sb.Append("<li class=\"active\"><a href=\"#\"><span><span>Thêm mới</span></span></a></li>");
                link_view.List_language = this.List_select_language(link_view.Lang);
            }

            link_view.Html_link_tab = sb.ToString();
            if (!is_valid)
            {
                return this.PartialView("../control/change_link", link_view);
            }

            clink.Title = link_view.Title;
            clink.Summary = string.IsNullOrEmpty(link_view.Summary) == false ? link_view.Summary : string.Empty;
            clink.LinkContent = string.IsNullOrEmpty(link_view.LinkContent) == false ? link_view.LinkContent : string.Empty;
            clink.Link = string.IsNullOrEmpty(link_view.Link_url) == false ? link_view.Link_url : string.Empty;
            clink.Lang = link_view.Lang;
            clink.Type = link_view.Type;

            var imgPathTemp = "images/link/" + DateTime.Now.Year.ToString() + "/" + DateTime.Now.Month.ToString() + "/";
            var name_time = DateTime.Now.Day + DateTime.Now.Month + DateTime.Now.Year + DateTime.Now.Hour + DateTime.Now.Minute + string.Empty;
            if (link_view.File_image != null && link_view.File_image.ContentLength > 0 && CommonGlobal.IsImageOrVideo(link_view.File_image) == true)
            {
                string image_name = imgPathTemp + "sc_original_" + name_time + "_" + CommonGlobal.CompleteNamefileImages(link_view.File_image.FileName);

                ////save image and delete old file
                this.SavephotoOriginal(clink.ImagePath, link_view.File_image, imgPathTemp, image_name);

                ////set image thumb to link catalog
                clink.ImagePath = "/" + image_name;
                link_view.ImagePath = "/" + image_name;
            }
            else if (string.IsNullOrEmpty(clink.ImagePath))
            {
                clink.ImagePath = "0";
            }
            else
            {
                clink.ImagePath = link_view.ImagePath;
            }

            clink.OrderDisplay = link_view.OrderDisplay;

            if (link_view.Id != 0 && link_view.Type_act == CommonGlobal.Edit)
            {
                rt = linkModels.Update(clink);
            }
            else
            {
                rt = linkModels.Add(clink);
            }

            if (rt > 0)
            {
                linkModels.ClearCache(CommonGlobal.Slide);
                link_view.Message = "Cập nhật thành công!";
                link_view.Id = rt;
                link_view.Type_act = CommonGlobal.Edit;
            }
            else
            {
                link_view.Message = "Cập nhật không thành công!";
            }

            // return this.PartialView("../control/change_link", link_view);

            string return_url = Url.Action("index", "dashboard", new { act = "list_link", ctrl = "adminLink", type = link_view.Type, type_act = Web.Models.CommonGlobal.Edit, page = 1, parent = 0 });

            return this.PartialView("../control/redirect", return_url);
        }

        /// <summary>
        /// Lists the album images.
        /// </summary>
        /// <param name="parent">The parent.</param>
        /// <param name="id">The identifier.</param>
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
        /// <returns>list album images</returns>
        [ChildActionOnly]
        [AcceptVerbs(HttpVerbs.Get)]
        public ActionResult List_album_images(int? parent, int? id, string type, string act, string ctrl, string type_act, string lang, string search, int? page, int? page_size, string order_by, string order_type)
        {
            CatalogModels cateModels = new CatalogModels();
            GalleryModels galleryModels = new GalleryModels();
            C_Catalog cate = new C_Catalog();
            ImageAlbum img = new ImageAlbum();
            StringBuilder sb = new StringBuilder();
            List<SelectListItem> list_select_catalog = new List<SelectListItem>();
            var list_album_images_view = new Web.Areas.Admin.ViewModels.List_album_images_view();
            int total_record = 0;
            int level = 0;
            /////type is get type catalog
            /////ex   : LB - Lookbook
            /////     : GL - Gallery
            /////parent is array parent id
            if (string.IsNullOrEmpty(type))
            {
                type = Request.QueryString["type"] != null ? Request.QueryString["type"].ToString() : CommonGlobal.CateLookBook;
            }

            if (string.IsNullOrEmpty(act))
            {
                act = Request.QueryString["act"] != null ? Request.QueryString["act"].ToString() : "list_album_images";
            }

            if (string.IsNullOrEmpty(ctrl))
            {
                ctrl = Request.QueryString["ctrl"] != null ? Request.QueryString["ctrl"].ToString() : "adminLink";
            }

            if (page == null || page == 0)
            {
                page = Request.QueryString["page"] != null ? Convert.ToInt32(Request.QueryString["page"].ToString()) : 1;
            }

            if (page_size == null)
            {
                page_size = int.Parse(Util.GetConfigValue("NumberPageSizeAdmin", "30"));
            }

            if (parent == null)
            {
                parent = Request.QueryString["parent"] != null ? Convert.ToInt32(Request.QueryString["parent"].ToString()) : 0;
            }

            if (string.IsNullOrEmpty(lang))
            {
                lang = LanguageModels.ActiveLanguage().LangCultureName;
            }

            if (id != null && type_act != null && type_act == CommonGlobal.Delete)
            {
                ////check permission delete
                if (UserModels.CheckPermission(this.Session["mem"] != null ? this.Session["mem"].ToString() : string.Empty, act, ctrl, type_act, type)) 
                {
                    img = galleryModels.GetImageById((int)id);
                    if (img != null)
                    {
                        ////delete old image
                        if (!string.IsNullOrEmpty(img.Images))
                        {
                            string strImg = img.Images;
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
                        ////delete imgage album
                        bool rt = galleryModels.Delete_Images((int)id);
                        if (rt)
                        {
                            list_album_images_view.Message = "Bạn đã xóa ảnh " + id;
                        }
                        else
                        {
                            list_album_images_view.Message = "Xóa không thành công";
                        }
                    }
                    else
                    {
                        list_album_images_view.Message = "Không tìm thấy ảnh : " + id;
                    }
                }
                else
                {
                    list_album_images_view.Message = " Bạn không có quyền thực thi hành động xóa.";
                }
            }

            if (string.IsNullOrEmpty(order_by) || string.IsNullOrEmpty(order_type))
            {
                order_by = "ID";
                order_type = "asc";
            }

            if (parent != 0)
            {
                cate = cateModels.GetbyID((int)parent);
                list_album_images_view.Category_name = cate.CategoryName;
            }

            list_album_images_view.Type = type;
            list_album_images_view.Cate_type = CommonGlobal.GetCatalogTypeName(type);
            list_album_images_view.Parent = (int)parent;
            list_album_images_view.Lang = lang;
            list_album_images_view.Type_act = type_act;
            ////tab
            sb.Append("<li class=\"active\"><a class=\"active\" href=\"" + Url.Action("index", "dashboard", new { act = "list_catalog", ctrl = "adminCatalog", type = type, page = "1", parent = parent }) + "\"><span><span>Danh sách " + CommonGlobal.GetCatalogTypeName(type) + "</span></span></a></li>");
            list_album_images_view.Html_link_tab = sb.ToString();
            ////list language
            list_album_images_view.List_language = this.List_select_language(this.Lang);
            ////list category for filter
            cateModels.List_catalog_parent(0, level, (int)parent, type, lang, ref list_select_catalog);
            list_album_images_view.List_parent = list_select_catalog;
            ////list page size and paging
            list_album_images_view.List_page_size = this.GetSizePagingPublic((int)page_size);
            list_album_images_view.Page = (int)page;
            list_album_images_view.Page_size = (int)page_size;
            ////list product
            list_album_images_view.Page_list_image = galleryModels.AdminGetAllImageGallery((int)parent, type, lang, (int)page, (int)page_size, order_by, order_type, out total_record);
            list_album_images_view.Order_by = order_by;
            list_album_images_view.Order_type = order_type;
            list_album_images_view.Total_record = total_record;
            ////acton and parent action
            list_album_images_view.Act = act;
            list_album_images_view.Ctrl = ctrl;
            list_album_images_view.Parent_action = HttpContext.Request.RequestContext.RouteData.Values["action"].ToString();
            list_album_images_view.Parent_controller = HttpContext.Request.RequestContext.RouteData.Values["controller"].ToString();

            return this.PartialView("../control/list_album_images", list_album_images_view);
        }

        /// <summary>
        /// Lists the album images.
        /// </summary>
        /// <param name="collection">The collection.</param>
        /// <returns>list album images</returns>
        [ChildActionOnly]
        [AcceptVerbs(HttpVerbs.Post)]
        public ActionResult List_album_images(FormCollection collection)
        {
            CatalogModels cateModels = new CatalogModels();
            GalleryModels galleryModels = new GalleryModels();
            C_Catalog cate = new C_Catalog();
            ImageAlbum imgPro = new ImageAlbum();
            StringBuilder sb = new StringBuilder();
            List<SelectListItem> list_select_catalog = new List<SelectListItem>();
            var list_album_images_view = new Web.Areas.Admin.ViewModels.List_album_images_view();
            this.TryUpdateModel(list_album_images_view);
            int total_record = 0;
            int level = 0;
            bool rt = true;
            bool is_valid = true;

            list_album_images_view.Cate_type = CommonGlobal.GetCatalogTypeName(list_album_images_view.Type);
            ////tab
            sb.Append("<li class=\"active\"><a class=\"active\" href=\"" + Url.Action("index", "dashboard", new { act = "list_catalog", ctrl = "adminCatalog", type = list_album_images_view.Type, page = "1", parent = list_album_images_view.Parent }) + "\"><span><span>Danh sách " + CommonGlobal.GetCatalogTypeName(list_album_images_view.Type) + "</span></span></a></li>");
            list_album_images_view.Html_link_tab = sb.ToString();
            ////list page size and paging
            list_album_images_view.List_page_size = this.GetSizePagingPublic(list_album_images_view.Page_size);
            ////acton and parent action
            list_album_images_view.Act = "list_album_images";
            list_album_images_view.Ctrl = "adminLink";
            list_album_images_view.Parent_action = HttpContext.Request.RequestContext.RouteData.Values["action"].ToString();
            list_album_images_view.Parent_controller = HttpContext.Request.RequestContext.RouteData.Values["controller"].ToString();
            ////delete image
            if (list_album_images_view.Id > 0 && list_album_images_view.Type_act == CommonGlobal.Delete)
            {
                ////check permission delete
                if (UserModels.CheckPermission(this.Session["mem"] != null ? this.Session["mem"].ToString() : string.Empty, list_album_images_view.Act, list_album_images_view.Ctrl, list_album_images_view.Type_act, list_album_images_view.Type)) 
                {
                    imgPro = galleryModels.GetImageById(list_album_images_view.Id);
                    if (imgPro != null)
                    {
                        ////delete old image
                        if (!string.IsNullOrEmpty(imgPro.Images))
                        {
                            string strImg = imgPro.Images;
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
                        ////delete image product
                        rt = galleryModels.Delete_Images(list_album_images_view.Id);

                        if (rt)
                        {
                            list_album_images_view.Message = "Bạn đã xóa ảnh " + list_album_images_view.Id;
                        }
                        else
                        {
                            list_album_images_view.Message = "Xóa không thành công";
                        }
                    }
                    else
                    {
                        list_album_images_view.Message = "Không tìm thấy ảnh : " + list_album_images_view.Id;
                    }
                }
                else
                {
                    list_album_images_view.Message = " Bạn không có quyền thực thi hành động xóa.";
                }
            }
            else
            {
                if (list_album_images_view.Type_act == CommonGlobal.Add)
                {
                    ////check permission add
                    if (UserModels.CheckPermission(this.Session["mem"] != null ? this.Session["mem"].ToString() : string.Empty, list_album_images_view.Act, list_album_images_view.Ctrl, list_album_images_view.Type_act, list_album_images_view.Type)) 
                    {
                        ////validation server
                        if (list_album_images_view.Album == 0)
                        {
                            is_valid = false;
                            list_album_images_view.Message = "Bạn cần lựa chọn album";
                        }

                        if (list_album_images_view.File_image == null)
                        {
                            is_valid = false;
                            list_album_images_view.Message = "Bạn cần chọn ảnh";
                        }

                        var max_length = 1024 * 1024 * 10; ////10MB
                        var length_all = 0;
                        foreach (HttpPostedFileBase fi in list_album_images_view.File_image)
                        {
                            if (fi != null) {
                                length_all = length_all + fi.ContentLength;
                            }                            
                        }

                        if (length_all == 0) {
                            is_valid = false;
                        }

                        if (length_all > max_length)
                        {
                            is_valid = false;
                            list_album_images_view.Message = "Bạn đã không thể đăng quá nhiều ảnh (Tổng dung lượng tối đa 10MB)";
                        }

                        if (is_valid)
                        {
                            ////upload multi images
                            foreach (HttpPostedFileBase fi in list_album_images_view.File_image)
                            {
                                if (fi != null && fi.ContentLength > 0 && CommonGlobal.IsImage(fi) == true)
                                {
                                    ////add new image
                                    var imgPathTemp = "images/photogallery/" +
                                                      DateTime.Now.Year.ToString() + "/" + DateTime.Now.Month.ToString() + "/";
                                    var name_time = DateTime.Now.Day + DateTime.Now.Month + DateTime.Now.Year + DateTime.Now.Hour + DateTime.Now.Minute + DateTime.Now.Second + DateTime.Now.Ticks + string.Empty;

                                    imgPro = new ImageAlbum();
                                    string image_small = imgPathTemp + "sc_small_" + name_time + "_" + CommonGlobal.CompleteNamefileImages(fi.FileName);
                                    string image_lager = imgPathTemp + "sc_full_" + name_time + "_" + CommonGlobal.CompleteNamefileImages(fi.FileName);
                                    //////save images for multi file
                                    this.Savephoto(null, fi, imgPathTemp, image_small, image_lager);

                                    imgPro.Images = "/" + image_small;
                                    imgPro.ImagesFull = "/" + image_lager;
                                    imgPro.CatalogID = list_album_images_view.Album;
                                    list_album_images_view.ImagePath = "/" + image_small;
                                    rt = galleryModels.Add_Images(imgPro);

                                    if (rt)
                                    {
                                        list_album_images_view.Message = "Bạn đã thêm ảnh thành công!";
                                    }
                                    else
                                    {
                                        if (list_album_images_view.Message != string.Empty)
                                        {
                                            list_album_images_view.Message = "updload ảnh không thành công: " + CommonGlobal.CompleteNamefileImages(fi.FileName);
                                        }
                                        else
                                        {
                                            list_album_images_view.Message += "; " + CommonGlobal.CompleteNamefileImages(fi.FileName);
                                        }
                                    }

                                    list_album_images_view.File_image = null;
                                }
                            }
                        }
                    }
                    else
                    {
                        list_album_images_view.Message = " Bạn không có quyền thực thi thêm ảnh cho album ";
                    }
                }
                else
                {
                    list_album_images_view.Message = string.Empty;
                }
            }

            ////list language
            list_album_images_view.List_language = this.List_select_language(list_album_images_view.Lang);
            ////list category
            cateModels.List_catalog_parent(0, level, list_album_images_view.Parent, list_album_images_view.Type, list_album_images_view.Lang, ref list_select_catalog);
            list_album_images_view.List_parent = list_select_catalog;
            ////get list product
            list_album_images_view.Page_list_image = galleryModels.AdminGetAllImageGallery(list_album_images_view.Parent, list_album_images_view.Type, list_album_images_view.Lang, list_album_images_view.Page, list_album_images_view.Page_size, list_album_images_view.Order_by, list_album_images_view.Order_type, out total_record);
            list_album_images_view.Total_record = total_record;
            list_album_images_view.Order_by = list_album_images_view.Order_by;
            list_album_images_view.Order_type = list_album_images_view.Order_type;
        

            return this.PartialView("../control/list_album_images", list_album_images_view);
        }

        /// <summary>
        /// Lists the link.
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
        /// <returns>list link</returns>
        [ChildActionOnly]
        public ActionResult List_link(int? id, string type, string act, string ctrl, string type_act, string lang, string search, int? page, int? page_size, string order_by, string order_type)
        {
            LinkModels linkModels = new LinkModels();
            C_Link clink = new C_Link();
            StringBuilder sb = new StringBuilder();
            var list_link_view = new Web.Areas.Admin.ViewModels.List_link_view();
            int total_record = 0;

            if (string.IsNullOrEmpty(type))
            {
                type = Request.QueryString["type"] != null ? Request.QueryString["type"].ToString() : string.Empty;
            }

            if (type == string.Empty)
            {
                list_link_view.Message = "Chúng tôi không tìm thấy danh sách bạn yêu cầu";
            }

            if (string.IsNullOrEmpty(act))
            {
                act = Request.QueryString["act"] != null ? Request.QueryString["act"].ToString() : "list_link";
            }

            if (string.IsNullOrEmpty(ctrl))
            {
                ctrl = Request.QueryString["ctrl"] != null ? Request.QueryString["ctrl"].ToString() : "adminLink";
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

            if (id != null && type_act != null && type_act == CommonGlobal.Delete)
            {
                ////check permission delete
                if (UserModels.CheckPermission(this.Session["mem"] != null ? this.Session["mem"].ToString() : string.Empty, act, ctrl, type_act, type)) 
                {
                    clink = linkModels.GetByID((int)id);
                    if (clink != null)
                    {
                        ////delete old image
                        if (!string.IsNullOrEmpty(clink.ImagePath))
                        {
                            string strImg = clink.ImagePath;
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
                        ////delete clink
                        bool rt = linkModels.Delete((int)id);
                        if (rt)
                        {
                            list_link_view.Message = "Bạn đã xóa " + id;
                        }
                        else
                        {
                            list_link_view.Message = "Xóa không thành công";
                        }
                    }
                    else
                    {
                        list_link_view.Message = "Không tìm thấy  : " + id;
                    }
                }
                else
                {
                    list_link_view.Message = " Bạn không có quyền thực thi hành động xóa.";
                }
            }

            if (string.IsNullOrEmpty(order_by) || string.IsNullOrEmpty(order_type))
            {
                order_by = "OrderDisplay";
                order_type = "asc";
            }

            list_link_view.Type = type;
            list_link_view.Cate_type = CommonGlobal.GetLinkADTypeName(type);
            list_link_view.Lang = lang;
            list_link_view.Type_act = type_act;
            ////tab
            sb.Append("<li class=\"active\"><a class=\"active\" href=\"" + Url.Action("index", "dashboard", new { act = "list_link", ctrl = "adminLink", type_act = CommonGlobal.View, type = type, page = "1" }) + "\"><span><span>Danh sách " + CommonGlobal.GetLinkADTypeName(type) + "</span></span></a></li>");
            sb.Append("<li><a href=\"" + Url.Action("index", "dashboard", new { act = "change_link", ctrl = "adminLink", type_act = CommonGlobal.Add, type = type }) + "\"><span><span>Thêm mới</span></span></a></li>");
            list_link_view.Html_link_tab = sb.ToString();
            ////list language
            list_link_view.List_language = this.List_select_language(this.Lang);
            ////list page size and paging
            list_link_view.List_page_size = this.GetSizePagingPublic((int)page_size);
            list_link_view.Page = (int)page;
            list_link_view.Page_size = (int)page_size;
            ////list catalog
            list_link_view.Page_list_link = linkModels.AdminGetAllLinkAd(type, lang, search, (int)page, (int)page_size, order_by, order_type, out total_record);
            list_link_view.Search = search;
            list_link_view.Order_by = order_by;
            list_link_view.Order_type = order_type;
            list_link_view.Total_record = total_record;
            ////acton and parent action
            list_link_view.Act = act;
            list_link_view.Ctrl = ctrl;
            list_link_view.Parent_action = HttpContext.Request.RequestContext.RouteData.Values["action"].ToString();
            list_link_view.Parent_controller = HttpContext.Request.RequestContext.RouteData.Values["controller"].ToString();

            return this.PartialView("../control/list_link", list_link_view);
        }
    }
}