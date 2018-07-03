namespace Web.Areas.Admin.Controllers
{
    using System;
    using System.Collections.Generic;
    using System.Linq;
    using System.Text;
    using System.Web;
    using System.Web.Mvc;
    using System.Web.Script.Serialization;

    using Web.Controllers;
    using Web.Data;
    using Web.Models;

    /// <summary>
    /// admin Product Controller
    /// </summary>
    public class AdminProductController : BaseController
    {
        /// <summary>
        /// Changes the product.
        /// </summary>
        /// <param name="parent">The parent.</param>
        /// <param name="id">The identifier.</param>
        /// <param name="type">The type.</param>
        /// <param name="act">The act.</param>
        /// <param name="ctrl">The control.</param>
        /// <param name="lang">The language.</param>
        /// <param name="type_act">The type act.</param>
        /// <returns>change product</returns>
        [ChildActionOnly]
        [AcceptVerbs(HttpVerbs.Get)]
        public ActionResult Change_product(int? parent, int? id, string type, string act, string ctrl, string lang, string type_act)
        {
            CatalogModels cateModels = new CatalogModels();
            ProductModels proModels = new ProductModels();
            LinkModels linkModel = new LinkModels();
            C_Catalog cate = new C_Catalog();
            C_Product pro = new C_Product();
            StringBuilder sb = new StringBuilder();
            List<SelectListItem> list_select_catalog = new List<SelectListItem>();
            List<SelectListItem> list_select_brand = new List<SelectListItem>();
            var product_view = new Web.Areas.Admin.ViewModels.Product_view();
            int level = 0;
            if (string.IsNullOrEmpty(type))
            {
                type = Request.QueryString["type"] != null ? Request.QueryString["type"].ToString() : string.Empty;
            }

            if (string.IsNullOrEmpty(act))
            {
                act = Request.QueryString["act"] != null ? Request.QueryString["act"].ToString() : "change_product";
            }

            if (string.IsNullOrEmpty(ctrl))
            {
                ctrl = Request.QueryString["ctrl"] != null ? Request.QueryString["ctrl"].ToString() : "adminProduct";
            }

            if (id == null)
            {
                id = RouteData.Values["id"] != null ? Convert.ToInt32(RouteData.Values["id"].ToString()) : 0;
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
                pro = proModels.GetProductById((int)id);
                cateModels.List_catalog_parent(0, level, 0, type, pro.Lang ?? lang, ref list_select_catalog);
                linkModel.List_brand(pro.Manufacture, CommonGlobal.Partner, pro.Lang ?? lang, ref list_select_brand);
                sb.Append("<li><a href=\"" + Url.Action("index", "dashboard", new { act = "list_product", ctrl = "adminProduct", type_act = CommonGlobal.View, type = type, page = "1", parent = parent, lang = pro.Lang }) + "\"><span><span>Danh sách " + CommonGlobal.GetCatalogTypeName(type) + "</span></span></a></li>");
                sb.Append("<li class=\"active\"><a href=\"#\"><span><span>" + CommonGlobal.CutString(pro.ProductName, 50) + "</span></span></a></li>");
                sb.Append("<li><a href=\"" + Url.Action("index", "dashboard", new { act = "image_product", ctrl = "adminProduct", type_act = CommonGlobal.View, type = type, page = "1", pro_id = pro.ProductID, lang = pro.Lang }) + "\"><span><span> Ảnh thiết kế </span></span></a></li>");
                ////sb.Append("<li><a href=\"" + Url.Action("index", "dashboard", new { act = "property_product", ctrl = "adminProduct", type_act = CommonGlobal.VIEW, type = type, type_property = CommonGlobal.COLOR, page = "1", pro_id = pro.ProductID, lang = pro.Lang}) + "\"><span><span>" + CommonGlobal.COLOR_TEXT + "</span></span></a></li>");
                ////sb.Append("<li><a href=\"" + Url.Action("index", "dashboard", new { act = "property_product", ctrl = "adminProduct", type_act = CommonGlobal.VIEW, type = type, type_property = CommonGlobal.SIZE, page = "1", pro_id = pro.ProductID, lang = pro.Lang}) + "\"><span><span>" + CommonGlobal.SIZE_TEXT + "</span></span></a></li>");
                sb.Append("<li><a href=\"" + Url.Action("index", "dashboard", new { act = "list_Rating", ctrl = "adminProduct", type_act = CommonGlobal.View, type = type, page = "1", pro_id = pro.ProductID, lang = pro.Lang }) + "\"><span><span>Bình luận và đánh giá</span></span></a></li>");
                sb.Append("<li><a href=\"" + Url.Action("index", "dashboard", new { act = "comment_facebook", ctrl = "adminProduct", type_act = CommonGlobal.View, type = string.Empty, page = "1", pro_id = pro.ProductID, lang = pro.Lang }) + "\"><span><span>Bình luận Facebook</span></span></a></li>");
                product_view.Lang = pro.Lang ?? lang;
                product_view.Id = pro.ProductID;
                product_view.ProductName = pro.ProductName;
                product_view.ImagePath = pro.ImagePath;
                product_view.ImageBigPath = pro.ImageBigPath;
                product_view.ProductCode = pro.ProductCode;
                product_view.CatalogID = pro.CatalogID;
                product_view.Summary = pro.Summary;
                product_view.Content = pro.Content;
                product_view.Link = pro.Link;
                product_view.DateModify = pro.DateModify ?? DateTime.Now;
                product_view.Store = pro.Store;
                product_view.Promotion = pro.Promotion;
                product_view.Warranty = pro.Warranty;
                product_view.Manufacture = pro.Manufacture;
                product_view.PriceOld = (long)pro.PriceOld;
                product_view.PriceNew = (long)(pro.PriceNew ?? 0);
                product_view.Views = pro.Views;
                product_view.OrderDisplay = pro.OrderDisplay;
                product_view.IsShow = pro.IsShow;
                product_view.IsHot = pro.IsHot;
                product_view.IsPromotion = pro.IsPromotion;
                product_view.Rating = pro.Rating ?? 0;
                product_view.Multi_cate = pro.CatalogID.ToString();

                if (pro.IsShow == true)
                {
                    product_view.IsShow = true;
                    product_view.IsShow_text = "checked='checked'";
                }
                else
                {
                    product_view.IsShow = false;
                    product_view.IsShow_text = string.Empty;
                }

                if (pro.IsHot == true)
                {
                    product_view.IsHot = true;
                    product_view.IsHot_text = "checked='checked'";
                }
                else
                {
                    product_view.IsHot = false;
                    product_view.IsHot_text = string.Empty;
                }

                if (pro.IsPromotion == true)
                {
                    product_view.IsPromotion = true;
                    product_view.IsPromotion_text = "checked='checked'";
                }
                else
                {
                    product_view.IsPromotion = false;
                    product_view.IsPromotion_text = string.Empty;
                }

                product_view.List_language = this.List_select_language(pro.Lang ?? this.Lang);

                //product_view.DocType = pro.DocType;
                //product_view.DocLangISO = pro.DocLangISO;
                //product_view.DocLang = pro.DocLang;
                //product_view.DocCountryCode = pro.DocCountryCode;
                //product_view.DocTitleTranslate = pro.DocTitleTranslate;
                //product_view.DocAuthor = pro.DocAuthor;
                //product_view.DocAuthorGroup = pro.DocAuthorGroup;
                //product_view.DocChuBien = pro.DocChuBien;
                //product_view.DocBienSoan = pro.DocBienSoan;
                //product_view.DocNguoiDich = pro.DocNguoiDich;
                //product_view.DocHieuDinh = pro.DocHieuDinh;
                //product_view.DocDiaChiXuatBan = pro.DocDiaChiXuatBan;
                //product_view.DocNhaXuatBan = pro.DocNhaXuatBan;
                //product_view.DocNamXuatBan = pro.DocNamXuatBan;
                //product_view.DocLanXuatBan = pro.DocLanXuatBan;
                //product_view.DocSoTrang = pro.DocSoTrang;
                //product_view.DocTenTap = pro.DocTenTap;
                //product_view.DocSoLanPhanLoai = pro.DocSoLanPhanLoai;
                //product_view.DocDiaChiTaiLieu = pro.DocDiaChiTaiLieu;
                //product_view.DocTomTat = pro.DocTomTat;
                //product_view.DocNguoiXuLy = pro.DocNguoiXuLy;
                //product_view.DocNguoiHieuDinh = pro.DocNguoiHieuDinh;
                //product_view.Borrow = pro.Borrow;
                //product_view.DocTypeView = pro.DocTypeView;

            }
            else
            {
                cateModels.List_catalog_parent(0, level, (int)parent, type, lang, ref list_select_catalog);
                linkModel.List_brand(string.Empty, CommonGlobal.Partner, lang, ref list_select_brand);
                sb.Append("<li><a href=\"" + Url.Action("index", "dashboard", new { act = "list_product", ctrl = "adminProduct", type_act = CommonGlobal.View, type = type, page = "1", parent = parent, lang = lang }) + "\"><span><span>Danh sách " + CommonGlobal.GetCatalogTypeName(type) + "</span></span></a></li>");
                sb.Append("<li class=\"active\"><a href=\"#\"><span><span>Thêm mới</span></span></a></li>");
                product_view.Lang = lang;
                product_view.List_language = this.List_select_language(this.Lang);
                product_view.OrderDisplay = proModels.GetMaxOrderDisplay(type);
                product_view.Parent = (int)parent;
                product_view.IsShow = true;
                product_view.Store = 1;
            }

            product_view.List_parent = list_select_catalog;
            product_view.List_brand = list_select_brand;
            product_view.Html_link_tab = sb.ToString();
            product_view.Type = type;
            product_view.Type_act = type_act;

            ////action and parent action
            product_view.Act = act;
            product_view.Ctrl = ctrl;
            product_view.Parent_action = HttpContext.Request.RequestContext.RouteData.Values["action"].ToString();
            product_view.Parent_controller = HttpContext.Request.RequestContext.RouteData.Values["controller"].ToString();

            return this.PartialView("../control/change_product", product_view);
        }

        /// <summary>
        /// Changes the product.
        /// </summary>
        /// <param name="collection">The collection.</param>
        /// <returns>change product</returns>
        [ChildActionOnly]
        [ValidateInput(false)]
        [AcceptVerbs(HttpVerbs.Post)]
        public ActionResult Change_product(FormCollection collection)
        {
            CatalogModels cateModels = new CatalogModels();
            ProductModels proModels = new ProductModels();
            LinkModels linkModel = new LinkModels();
            C_Catalog cate = new C_Catalog();
            C_Product pro = new C_Product();
            StringBuilder sb = new StringBuilder();
            List<SelectListItem> list_select_catalog = new List<SelectListItem>();
            List<SelectListItem> list_select_brand = new List<SelectListItem>();
            var product_view = new Web.Areas.Admin.ViewModels.Product_view();
            this.TryUpdateModel(product_view);
            int rt = 0;
            bool is_valid = true;
            int level = 0;

            if (product_view.Id > 0)
            {
                pro = proModels.GetProductById(product_view.Id);
            }

            ////action
            product_view.Parent_action = HttpContext.Request.RequestContext.RouteData.Values["action"].ToString();
            product_view.Parent_controller = HttpContext.Request.RequestContext.RouteData.Values["controller"].ToString();

            if (product_view.Id != 0 && product_view.Type_act == CommonGlobal.Edit)
            {
                ////Link tab
                sb.Append("<li><a href=\"" + Url.Action("index", "dashboard", new { act = "list_product", ctrl = "adminProduct", type_act = CommonGlobal.View, type = product_view.Type, page = "1", lang = pro.Lang }) + "\"><span><span>Danh sách " + CommonGlobal.GetCatalogTypeName(product_view.Type) + "</span></span></a></li>");
                sb.Append("<li class=\"active\"><a href=\"#\"><span><span>" + CommonGlobal.CutString(pro.ProductName, 50) + "</span></span></a></li>");
                sb.Append("<li><a href=\"" + Url.Action("index", "dashboard", new { act = "image_product", ctrl = "adminProduct", type_act = CommonGlobal.View, type = product_view.Type, page = "1", pro_id = pro.ProductID, lang = pro.Lang }) + "\"><span><span> Ảnh thiết kế </span></span></a></li>");
                ////sb.Append("<li><a href=\"" + Url.Action("index", "dashboard", new { act = "property_product", ctrl = "adminProduct", type_act = CommonGlobal.VIEW, type = product_view.type, type_property = CommonGlobal.COLOR, page = "1", pro_id = pro.ProductID, lang = pro.Lang }) + "\"><span><span>" + CommonGlobal.COLOR_TEXT + "</span></span></a></li>");
                ////sb.Append("<li><a href=\"" + Url.Action("index", "dashboard", new { act = "property_product", ctrl = "adminProduct", type_act = CommonGlobal.VIEW, type = product_view.type, type_property = CommonGlobal.SIZE, page = "1", pro_id = pro.ProductID, lang = pro.Lang }) + "\"><span><span>" + CommonGlobal.SIZE_TEXT + "</span></span></a></li>");
                sb.Append("<li><a href=\"" + Url.Action("index", "dashboard", new { act = "list_Rating", ctrl = "adminProduct", type_act = CommonGlobal.View, type = product_view.Type, page = "1", pro_id = pro.ProductID, lang = pro.Lang }) + "\"><span><span>Bình luận và đánh giá</span></span></a></li>");
                sb.Append("<li><a href=\"" + Url.Action("index", "dashboard", new { act = "comment_facebook", ctrl = "adminProduct", type_act = CommonGlobal.View, type = string.Empty, page = "1", pro_id = pro.ProductID, lang = pro.Lang }) + "\"><span><span>Bình luận Facebook</span></span></a></li>");
                ////list parent
                cateModels.List_catalog_parent(0, level, pro.ProductID, product_view.Type, pro.Lang, ref list_select_catalog);
                linkModel.List_brand(pro.Manufacture, CommonGlobal.Partner, pro.Lang ?? this.Lang, ref list_select_brand);
                product_view.List_parent = list_select_catalog;
                product_view.List_language = this.List_select_language(pro.Lang);
                ////product infor
                pro.ProductCode = product_view.ProductCode;
            }
            else
            {
                ////Link tab
                sb.Append("<li><a class=\"active\" href=\"" + Url.Action("index", "dashboard", new { act = "list_product", ctrl = "adminProduct", type_act = CommonGlobal.View, type = product_view.Type, page = "1", lang = Lang }) + "\"><span><span>Danh sách " + CommonGlobal.GetCatalogTypeName(product_view.Type) + "</span></span></a></li>");
                sb.Append("<li class=\"active\"><a href=\"#\"><span><span>Thêm sách mới</span></span></a></li>");
                ////list parent
                cateModels.List_catalog_parent(0, level, 0, product_view.Type, product_view.Lang, ref list_select_catalog);
                linkModel.List_brand(string.Empty, CommonGlobal.Partner, product_view.Lang, ref list_select_brand);
                product_view.List_parent = list_select_catalog;
                product_view.List_language = this.List_select_language(product_view.Lang);
                ////product infor
                int max_size = 6;
                pro.ProductCode = product_view.ProductCode;
            }

            product_view.Html_link_tab = sb.ToString();
            product_view.List_brand = list_select_brand;
            ////validation server

            if (product_view.Parent_select == null || product_view.Parent_select.Count() == 0)
            {
                is_valid = false;
                product_view.Message = "Bạn cần lựa chọn danh mục";
            }

            if (string.IsNullOrEmpty(product_view.ProductName))
            {
                is_valid = false;
                product_view.Message = "Bạn cần nhập tên sản phẩm";
            }

            if (!is_valid)
            {
                return this.PartialView("../control/change_product", product_view);
            }
            ////product info
            pro.ProductName = product_view.ProductName;
            var arr_selected = string.Empty;
            foreach (var item in product_view.Parent_select)
            {
                if (item >= 0)
                {
                    arr_selected = arr_selected + "," + item;
                }
            }

            product_view.Multi_cate = arr_selected.Substring(1, arr_selected.Length - 1);
            pro.CatalogID = product_view.Multi_cate.ToString();

            var imgPathTemp = "images/photoproduct/" +
                              DateTime.Now.Year.ToString() + "/" + DateTime.Now.Month.ToString() + "/";
            var name_time = DateTime.Now.Day + DateTime.Now.Month + DateTime.Now.Year + DateTime.Now.Hour + DateTime.Now.Minute + string.Empty;
            if (product_view.File_image != null && product_view.File_image.ContentLength > 0 && CommonGlobal.IsImage(product_view.File_image) == true)
            {
                string image_small = imgPathTemp + "sc_small_" + name_time + "_" + CommonGlobal.CompleteNamefileImages(product_view.File_image.FileName);
                string image_lager = imgPathTemp + "sc_full_" + name_time + "_" + CommonGlobal.CompleteNamefileImages(product_view.File_image.FileName);
                ////save image and delete old file
                this.Savephoto(pro.ImagePath, product_view.File_image, imgPathTemp, image_small, image_lager);
                ////set image thumb to link catalog
                pro.ImagePath = "/" + image_small;
                pro.ImageBigPath = "/" + image_lager;
                product_view.ImagePath = "/" + image_small;
            }
            else if (string.IsNullOrEmpty(pro.ImagePath))
            {
                pro.ImagePath = "0";
                pro.ImageBigPath = "0";
            }
            else
            {
                pro.ImagePath = product_view.ImagePath;
                pro.ImageBigPath = product_view.ImageBigPath;
            }

            pro.Link = CommonGlobal.CompleteLink(product_view.ProductName);
            pro.Summary = product_view.Summary != null ? product_view.Summary : string.Empty;
            pro.Content = product_view.Content != null ? product_view.Content : string.Empty;
            pro.DateModify = DateTime.Now;
            pro.Store = product_view.Store;
            pro.Promotion = product_view.Promotion != null ? product_view.Promotion : string.Empty;
            pro.Warranty = product_view.Warranty != null ? product_view.Warranty : string.Empty;
            pro.Manufacture = product_view.Manufacture != null ? product_view.Manufacture : string.Empty;
            pro.PriceOld = product_view.PriceOld;
            pro.PriceNew = product_view.PriceNew;
            pro.Views = product_view.Views;
            pro.Rating = product_view.Rating;
            pro.IsHot = product_view.IsHot;
            if (pro.IsHot == true)
            {
                product_view.IsHot = true;
                product_view.IsHot_text = "checked='checked'";
            }
            else
            {
                product_view.IsHot = false;
                product_view.IsHot_text = string.Empty;
            }

            pro.IsShow = product_view.IsShow;

            if (pro.IsShow == true)
            {
                product_view.IsShow = true;
                product_view.IsShow_text = "checked='checked'";
            }
            else
            {
                product_view.IsShow = false;
                product_view.IsShow_text = string.Empty;
            }

            pro.IsPromotion = product_view.IsPromotion;

            if (pro.IsPromotion == true)
            {
                product_view.IsPromotion = true;
                product_view.IsPromotion_text = "checked='checked'";
            }
            else
            {
                product_view.IsPromotion = false;
                product_view.IsPromotion_text = string.Empty;
            }

            pro.Lang = product_view.Lang;
            pro.OrderDisplay = product_view.OrderDisplay;
            ////return list catalog for view
            product_view.Multi_cate = pro.CatalogID.ToString();

            //pro.DocType = product_view.DocType;
            //pro.DocLangISO = product_view.DocLangISO;
            //pro.DocLang = product_view.DocLang;
            //pro.DocCountryCode = product_view.DocCountryCode;
            //pro.DocTitleTranslate = product_view.DocTitleTranslate;
            //pro.DocAuthor = product_view.DocAuthor;
            //pro.DocAuthorGroup = product_view.DocAuthorGroup;
            //pro.DocChuBien = product_view.DocChuBien;
            //pro.DocBienSoan = product_view.DocBienSoan;
            //pro.DocNguoiDich = product_view.DocNguoiDich;
            //pro.DocHieuDinh = product_view.DocHieuDinh;
            //pro.DocDiaChiXuatBan = product_view.DocDiaChiXuatBan;
            //pro.DocNhaXuatBan = product_view.DocNhaXuatBan;
            //pro.DocNamXuatBan = product_view.DocNamXuatBan;
            //pro.DocLanXuatBan = product_view.DocLanXuatBan;
            //pro.DocSoTrang = product_view.DocSoTrang;
            //pro.DocTenTap = product_view.DocTenTap;
            //pro.DocSoLanPhanLoai = product_view.DocSoLanPhanLoai;
            //pro.DocDiaChiTaiLieu = product_view.DocDiaChiTaiLieu;
            //pro.DocTomTat = product_view.DocTomTat;
            //pro.DocNguoiXuLy = product_view.DocNguoiXuLy;
            //pro.DocNguoiHieuDinh = product_view.DocNguoiHieuDinh;
            //pro.Borrow = product_view.Borrow;
            //pro.DocTypeView = product_view.DocTypeView;

            if (product_view.Id != 0 && product_view.Type_act == CommonGlobal.Edit)
            {
                rt = proModels.Update(pro);
            }
            else
            {
                rt = proModels.Insert(pro);
            }

            if (rt > 0)
            {
                if (product_view.Type_act == CommonGlobal.Add)
                {
                    sb = new StringBuilder();
                    ////Link tab
                    sb.Append("<li><a href=\"" + Url.Action("index", "dashboard", new { act = "list_product", ctrl = "adminProduct", type_act = CommonGlobal.View, type = product_view.Type, page = "1", lang = pro.Lang }) + "\"><span><span>Danh sách " + CommonGlobal.GetCatalogTypeName(product_view.Type) + "</span></span></a></li>");
                    sb.Append("<li class=\"active\"><a href=\"#\"><span><span>" + CommonGlobal.CutString(pro.ProductName, 50) + "</span></span></a></li>");
                    sb.Append("<li><a href=\"" + Url.Action("index", "dashboard", new { act = "image_product", ctrl = "adminProduct", type = product_view.Type, page = "1", pro_id = pro.ProductID, lang = pro.Lang }) + "\"><span><span> Ảnh sản phẩm </span></span></a></li>");
                    ////sb.Append("<li><a href=\"" + Url.Action("index", "dashboard", new { act = "property_product", ctrl = "adminProduct", type = product_view.type, type_property = CommonGlobal.COLOR, page = "1", pro_id = pro.ProductID, lang = pro.Lang }) + "\"><span><span>" + CommonGlobal.COLOR_TEXT + "</span></span></a></li>");
                    ////sb.Append("<li><a href=\"" + Url.Action("index", "dashboard", new { act = "property_product", ctrl = "adminProduct", type = product_view.type, type_property = CommonGlobal.SIZE, page = "1", pro_id = pro.ProductID, lang = pro.Lang }) + "\"><span><span>" + CommonGlobal.SIZE_TEXT + "</span></span></a></li>");
                    sb.Append("<li><a href=\"" + Url.Action("index", "dashboard", new { act = "list_Rating", ctrl = "adminProduct", type_act = CommonGlobal.View, type = product_view.Type, page = "1", pro_id = pro.ProductID, lang = pro.Lang }) + "\"><span><span>Bình luận và đánh giá</span></span></a></li>");
                    sb.Append("<li><a href=\"" + Url.Action("index", "dashboard", new { act = "comment_facebook", ctrl = "adminProduct", type_act = CommonGlobal.View, type = string.Empty, page = "1", pro_id = pro.ProductID, lang = pro.Lang }) + "\"><span><span>Bình luận Facebook</span></span></a></li>");
                }

                product_view.Html_link_tab = sb.ToString();
                product_view.Message = "Cập nhật thành công!";
                product_view.Id = rt;
                product_view.Type_act = CommonGlobal.Edit;
            }
            else
            {
                product_view.Message = "Cập nhật không thành công!";
            }

            string return_url = Url.Action("index", "dashboard", new { act = "change_product", ctrl = "adminProduct", type = product_view.Type, type_act = Web.Models.CommonGlobal.Edit, id = rt, lang = product_view.Lang });

            // return this.PartialView("../control/change_product", product_view);

            return this.PartialView("../control/redirect", return_url);
        }

        /// <summary>
        /// Comments the facebook.
        /// </summary>
        /// <param name="pro_id">The pro identifier.</param>
        /// <param name="type">The type.</param>
        /// <param name="act">The act.</param>
        /// <param name="ctrl">The control.</param>
        /// <param name="type_act">The type act.</param>
        /// <param name="lang">The language.</param>
        /// <returns>comment facebook</returns>
        [ChildActionOnly]
        public ActionResult Comment_facebook(int? pro_id, string type, string act, string ctrl, string type_act, string lang)
        {
            ProductModels proModels = new ProductModels();
            C_Product pro = new C_Product();
            var comment_facebok_view = new Web.Areas.Admin.ViewModels.Comment_facebook_view();
            string url = string.Empty;

            if (pro_id == null)
            {
                pro_id = Request.QueryString["pro_id"] != null ? Convert.ToInt32(Request.QueryString["pro_id"].ToString()) : 0;
            }

            if (string.IsNullOrEmpty(type))
            {
                type = Request.QueryString["type"] != null ? Request.QueryString["type"].ToString() : string.Empty;
            }

            if (string.IsNullOrEmpty(act))
            {
                act = Request.QueryString["act"] != null ? Request.QueryString["act"].ToString() : "comment_facebook";
            }

            if (string.IsNullOrEmpty(ctrl))
            {
                ctrl = Request.QueryString["ctrl"] != null ? Request.QueryString["ctrl"].ToString() : "adminProduct";
            }

            if (string.IsNullOrEmpty(lang))
            {
                lang = LanguageModels.ActiveLanguage().LangCultureName;
            }

            if (pro_id != 0)
            {
                pro = proModels.GetProductById((int)pro_id);
                comment_facebok_view.Product_name = pro.ProductName;
                comment_facebok_view.Pro_id = (int)pro_id;
                url = Util.GetConfigValue("Domain", Request.UserHostName).ToString() + "/" + lang + "/" + "product/product" + "/" + pro.ProductID + "/" + pro.Link;
                ////Link for test site
                ////url = "http://v2.local" + "/" + lang.Trim() + "/" + "product/product" + "/" + pro.ProductID + "/" + pro.Link;
            }

            ////tab
            StringBuilder sb = new StringBuilder();
            sb.Append("<li><a href=\"" + Url.Action("index", "dashboard", new { act = "list_product", ctrl = "adminProduct", type_act = CommonGlobal.View, type = type, page = "1", lang = pro.Lang }) + "\"><span><span>Danh sách " + CommonGlobal.GetCatalogTypeName(type) + "</span></span></a></li>");
            sb.Append("<li><a href=\"" + Url.Action("index", "dashboard", new { act = "change_product", ctrl = "adminProduct", type_act = CommonGlobal.Edit, type = type, id = pro_id, lang = pro.Lang }) + "\"><span><span>" + (pro != null ? CommonGlobal.CutString(pro.ProductName, 50) : string.Empty) + "</span></span></a></li>");
            sb.Append("<li><a href=\"" + Url.Action("index", "dashboard", new { act = "image_product", ctrl = "adminProduct", type_act = CommonGlobal.View, type = type, page = "1", pro_id = pro.ProductID, lang = pro.Lang }) + "\"><span><span> Ảnh thiết kế chi tiết </span></span></a></li>");
            ////sb.Append("<li><a href=\"" + Url.Action("index", "dashboard", new { act = "property_product", ctrl = "adminProduct", type_act = CommonGlobal.VIEW, type = type, type_property = CommonGlobal.COLOR, page = "1", pro_id = pro.ProductID, lang = pro.Lang }) + "\"><span><span>" + CommonGlobal.COLOR_TEXT + "</span></span></a></li>");
            ////sb.Append("<li><a href=\"" + Url.Action("index", "dashboard", new { act = "property_product", ctrl = "adminProduct", type_act = CommonGlobal.VIEW, type = type, type_property = CommonGlobal.SIZE, page = "1", pro_id = pro.ProductID, lang = pro.Lang }) + "\"><span><span>" + CommonGlobal.SIZE_TEXT + "</span></span></a></li>");
            sb.Append("<li><a href=\"" + Url.Action("index", "dashboard", new { act = "list_Rating", ctrl = "adminProduct", type_act = CommonGlobal.View, type = type, page = "1", pro_id = pro.ProductID, lang = pro.Lang }) + "\"><span><span>Bình luận và đánh giá</span></span></a></li>");
            sb.Append("<li class=\"active\"><a class=\"active\" href=\"#\"><span><span>Bình luận Facebook</span></span></a></li>");
            comment_facebok_view.Html_link_tab = sb.ToString();
            comment_facebok_view.Url = url;

            comment_facebok_view.Type = type;
            comment_facebok_view.Cate_type = "Bình luận Facebook";
            comment_facebok_view.Type_act = type_act;

            ////acton and parent action
            comment_facebok_view.Act = act;
            comment_facebok_view.Ctrl = ctrl;
            comment_facebok_view.Parent_action = HttpContext.Request.RequestContext.RouteData.Values["action"].ToString();
            comment_facebok_view.Parent_controller = HttpContext.Request.RequestContext.RouteData.Values["controller"].ToString();

            return this.PartialView("../control/comment_facebook", comment_facebok_view);
        }

        /// <summary>
        /// Images the product.
        /// </summary>
        /// <param name="pro_id">The pro identifier.</param>
        /// <param name="type">The type.</param>
        /// <param name="act">The act.</param>
        /// <param name="ctrl">The control.</param>
        /// <param name="page">The page.</param>
        /// <param name="page_size">The page_size.</param>
        /// <param name="order_by">The order by.</param>
        /// <param name="order_type">Type of the order.</param>
        /// <returns>image product</returns>
        [ChildActionOnly]
        [AcceptVerbs(HttpVerbs.Get)]
        public ActionResult Image_product(int? pro_id, string type, string act, string ctrl, int? page, int? page_size, string order_by, string order_type)
        {
            ProductModels proModels = new ProductModels();
            ProductImagesModels imgModels = new ProductImagesModels();
            C_Product pro = new C_Product();
            ImageProduct imgPro = new ImageProduct();
            StringBuilder sb = new StringBuilder();
            var list_image_product_view = new Web.Areas.Admin.ViewModels.List_image_product_view();
            int total_record = 0;

            if (pro_id == null)
            {
                pro_id = Request.QueryString["pro_id"] != null ? Convert.ToInt32(Request.QueryString["pro_id"].ToString()) : 1;
            }

            if (string.IsNullOrEmpty(type))
            {
                type = Request.QueryString["type"] != null ? Request.QueryString["type"].ToString() : string.Empty;
            }

            if (string.IsNullOrEmpty(act))
            {
                act = Request.QueryString["act"] != null ? Request.QueryString["act"].ToString() : "image_product";
            }

            if (string.IsNullOrEmpty(ctrl))
            {
                ctrl = Request.QueryString["ctrl"] != null ? Request.QueryString["ctrl"].ToString() : "adminProduct";
            }

            if (page == null || page == 0)
            {
                page = Request.QueryString["page"] != null ? Convert.ToInt32(Request.QueryString["page"].ToString()) : 1;
            }

            if (page_size == null)
            {
                page_size = int.Parse(Util.GetConfigValue("NumberPageSizeAdmin", "30"));
            }

            if (string.IsNullOrEmpty(order_by) || string.IsNullOrEmpty(order_type))
            {
                order_by = "ID";
                order_type = "desc";
            }

            if (pro_id != 0)
            {
                pro = proModels.GetProductById((int)pro_id);
                list_image_product_view.Product_name = pro.ProductName;
                list_image_product_view.Pro_id = (int)pro_id;
            }

            //ViewBag.DocTypeView = pro.DocTypeView;

            list_image_product_view.Type = type;
            list_image_product_view.Cate_type = CommonGlobal.GetCatalogTypeName(type);
            list_image_product_view.Lang = this.Lang;
            list_image_product_view.Type_act = CommonGlobal.View;
            ////tab
            sb.Append("<li><a href=\"" + Url.Action("index", "dashboard", new { act = "list_product", ctrl = "adminProduct", type_act = CommonGlobal.View, type = type, page = "1", lang = pro.Lang }) + "\"><span><span>Danh sách " + CommonGlobal.GetCatalogTypeName(type) + "</span></span></a></li>");
            sb.Append("<li><a href=\"" + Url.Action("index", "dashboard", new { act = "change_product", ctrl = "adminProduct", type_act = CommonGlobal.Edit, type = type, id = pro_id, lang = pro.Lang }) + "\"><span><span>" + CommonGlobal.CutString(pro.ProductName, 50) + "</span></span></a></li>");
            sb.Append("<li class=\"active\"><a href=\"#\"><span><span> Ảnh thiết kế </span></span></a></li>");
            ////sb.Append("<li><a href=\"" + Url.Action("index", "dashboard", new { act = "property_product", ctrl = "adminProduct", type_act = CommonGlobal.VIEW, type = type, type_property = CommonGlobal.COLOR, page = "1", pro_id = pro.ProductID, lang = pro.Lang }) + "\"><span><span>" + CommonGlobal.COLOR_TEXT + "</span></span></a></li>");
            ////sb.Append("<li><a href=\"" + Url.Action("index", "dashboard", new { act = "property_product", ctrl = "adminProduct", type_act = CommonGlobal.VIEW, type = type, type_property = CommonGlobal.SIZE, page = "1", pro_id = pro.ProductID, lang = pro.Lang }) + "\"><span><span>" + CommonGlobal.SIZE_TEXT + "</span></span></a></li>");
            sb.Append("<li><a href=\"" + Url.Action("index", "dashboard", new { act = "list_Rating", ctrl = "adminProduct", type_act = CommonGlobal.View, type = type, page = "1", pro_id = pro.ProductID, lang = pro.Lang }) + "\"><span><span>Bình luận và đánh giá</span></span></a></li>");
            sb.Append("<li><a href=\"" + Url.Action("index", "dashboard", new { act = "comment_facebook", ctrl = "adminProduct", type_act = CommonGlobal.View, type = string.Empty, page = "1", pro_id = pro.ProductID, lang = pro.Lang }) + "\"><span><span>Bình luận Facebook</span></span></a></li>");
            list_image_product_view.Html_link_tab = sb.ToString();
            ////list page size and paging
            list_image_product_view.List_page_size = this.GetSizePagingPublic((int)page_size);
            list_image_product_view.Page = (int)page;
            list_image_product_view.Page_size = (int)page_size;
            ////acton and parent action
            list_image_product_view.Act = act;
            list_image_product_view.Ctrl = ctrl;
            list_image_product_view.Parent_action = HttpContext.Request.RequestContext.RouteData.Values["action"].ToString();
            list_image_product_view.Parent_controller = HttpContext.Request.RequestContext.RouteData.Values["controller"].ToString();
            ////list product
            list_image_product_view.Page_list_image = imgModels.AdminGetAllImageProductByProID((int)pro_id, (int)page, (int)page_size, order_by, order_type, out total_record);
            list_image_product_view.Order_by = order_by;
            list_image_product_view.Order_type = order_type;
            list_image_product_view.Total_record = total_record;

            return this.PartialView("../control/image_product", list_image_product_view);
        }

        /// <summary>
        /// Images the product.
        /// </summary>
        /// <param name="collection">The collection.</param>
        /// <returns>image product</returns>
        [ChildActionOnly]
        [AcceptVerbs(HttpVerbs.Post)]
        public ActionResult Image_product(FormCollection collection)
        {
            ProductModels proModels = new ProductModels();
            ProductImagesModels imgModels = new ProductImagesModels();
            C_Product pro = new C_Product();
            ImageProduct imgPro = new ImageProduct();
            StringBuilder sb = new StringBuilder();
            var list_image_product_view = new Web.Areas.Admin.ViewModels.List_image_product_view();
            this.TryUpdateModel(list_image_product_view);
            int total_record = 0;
            bool rt = true;
            bool is_valid = true;

            var DocTypeView = 0;
            var pro_detail = proModels.GetProductById(list_image_product_view.Pro_id);
            //if (pro_detail != null)
            //{
            //    DocTypeView = pro_detail.DocTypeView ?? 0;
            //}

            list_image_product_view.Cate_type = CommonGlobal.GetCatalogTypeName(list_image_product_view.Type);
            ////tab
            sb.Append("<li><a href=\"" + Url.Action("index", "dashboard", new { act = "list_product", ctrl = "adminProduct", type_act = CommonGlobal.View, type = list_image_product_view.Type, page = "1", lang = list_image_product_view.Lang }) + "\"><span><span>Danh sách " + CommonGlobal.GetCatalogTypeName(list_image_product_view.Type) + "</span></span></a></li>");
            sb.Append("<li><a href=\"" + Url.Action("index", "dashboard", new { act = "change_product", ctrl = "adminProduct", type_act = CommonGlobal.Edit, type = list_image_product_view.Type, id = list_image_product_view.Pro_id, lang = list_image_product_view.Lang }) + "\"><span><span>" + CommonGlobal.CutString(list_image_product_view.Product_name, 50) + "</span></span></a></li>");
            sb.Append("<li class=\"active\"><a href=\"#\"><span><span> Ảnh thiết kế </span></span></a></li>");
            ////sb.Append("<li><a href=\"" + Url.Action("index", "dashboard", new { act = "property_product", ctrl = "adminProduct", type_act = CommonGlobal.VIEW, type = list_image_product_view.type, type_property = CommonGlobal.COLOR, page = "1", pro_id = list_image_product_view.pro_id, lang = list_image_product_view.lang }) + "\"><span><span>" + CommonGlobal.COLOR_TEXT + "</span></span></a></li>");
            ////sb.Append("<li><a href=\"" + Url.Action("index", "dashboard", new { act = "property_product", ctrl = "adminProduct", type_act = CommonGlobal.VIEW, type = list_image_product_view.type, type_property = CommonGlobal.SIZE, page = "1", pro_id = list_image_product_view.pro_id, lang = list_image_product_view.lang }) + "\"><span><span>" + CommonGlobal.SIZE_TEXT + "</span></span></a></li>");
            sb.Append("<li><a href=\"" + Url.Action("index", "dashboard", new { act = "list_Rating", ctrl = "adminProduct", type_act = CommonGlobal.View, type = list_image_product_view.Type, page = "1", pro_id = pro.ProductID, lang = list_image_product_view.Lang }) + "\"><span><span>Bình luận và đánh giá</span></span></a></li>");
            sb.Append("<li><a href=\"" + Url.Action("index", "dashboard", new { act = "comment_facebook", ctrl = "adminProduct", type_act = CommonGlobal.View, type = string.Empty, page = "1", pro_id = pro.ProductID, lang = pro.Lang }) + "\"><span><span>Bình luận Facebook</span></span></a></li>");
            list_image_product_view.Html_link_tab = sb.ToString();
            ////list page size and paging
            list_image_product_view.List_page_size = this.GetSizePagingPublic(list_image_product_view.Page_size);
            ////acton and parent action
            list_image_product_view.Act = "image_product";
            list_image_product_view.Ctrl = "adminProduct";
            list_image_product_view.Parent_action = HttpContext.Request.RequestContext.RouteData.Values["action"].ToString();
            list_image_product_view.Parent_controller = HttpContext.Request.RequestContext.RouteData.Values["controller"].ToString();

            ////delete image
            if (list_image_product_view.Id > 0 && list_image_product_view.Type_act == CommonGlobal.Delete)
            {
                imgPro = imgModels.GetImageById(list_image_product_view.Id);
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
                    rt = imgModels.Delete_Images(list_image_product_view.Id);
                    if (rt)
                    {
                        list_image_product_view.Message = "Bạn đã xóa " + list_image_product_view.Id;
                    }
                    else
                    {
                        list_image_product_view.Message = "Xóa không thành công";
                    }
                }
                else
                {
                    list_image_product_view.Message = "Không tìm thấy : " + list_image_product_view.Id;
                }
            }
            else
            {
                var max_length = 1024 * 1024 * 10 * 50; ////10MB
                var length_all = 0;
                var is_img = false;
                //var is_pdf = false;
                foreach (HttpPostedFileBase fi in list_image_product_view.File_image)
                {
                    if(fi != null)
                    {
                        length_all = length_all + fi.ContentLength;

                        if (CommonGlobal.IsImage(fi))
                        {
                            is_img = true;
                        }

                        //if (CommonGlobal.IsPdf(fi))
                        //{
                        //    is_pdf = true;
                        //}

                        //if (!CommonGlobal.IsImage(fi) && !CommonGlobal.IsPdf(fi))
                        //{
                        //    is_valid = false;
                        //    list_image_product_view.Message = "Bạn chỉ có thể chọn file ảnh (jpg | png | gif | jpeg) hoặc mp4";
                        //}

                        if (!CommonGlobal.IsImage(fi))
                        {
                            is_valid = false;
                            list_image_product_view.Message = "Bạn chỉ có thể chọn file ảnh (jpg | png | gif | jpeg)";
                        }
                    }
                    else
                    {
                        is_valid = false;
                        list_image_product_view.Message = "Hãy chọn file trước khi lưu";
                    }

                }

                //if (DocTypeView > 0)
                //{
                //    if (DocTypeView == 1 && is_pdf)
                //    {
                //        is_valid = false;
                //        list_image_product_view.Message = "Bạn không thể chọn file pdf";
                //    }

                //    if (DocTypeView == 2 && is_img)
                //    {
                //        is_valid = false;
                //        list_image_product_view.Message = "Bạn không thể chọn file ảnh";
                //    }
                //}
                //else
                //{
                //    if (is_img && is_pdf)
                //    {
                //        is_valid = false;
                //        list_image_product_view.Message = "Bạn không thể chọn cả file ảnh và file pdf";
                //    }
                //}
                              

                if (length_all > max_length)
                {
                    is_valid = false;
                    list_image_product_view.Message = "Bạn đã không thể đăng quá nhiều ảnh (Tổng dung lượng tối đa 500MB)";
                }

                if (is_valid && is_img)
                {
                    ////upload multi images
                    foreach (HttpPostedFileBase fi in list_image_product_view.File_image)
                    {
                        if (fi != null && fi.ContentLength > 0)
                        {
                            ////add new image
                            var imgPathTemp = "images/photoproduct/" +
                                              DateTime.Now.Year.ToString() + "/" + DateTime.Now.Month.ToString() + "/";
                            var name_time = DateTime.Now.Day + DateTime.Now.Month + DateTime.Now.Year + DateTime.Now.Hour + DateTime.Now.Minute + DateTime.Now.Second + DateTime.Now.Ticks + string.Empty;

                            imgPro = new ImageProduct();
                            string image_small = imgPathTemp + "sc_small_" + name_time + "_" + CommonGlobal.CompleteNamefileImages(fi.FileName);
                            string image_lager = imgPathTemp + "sc_full_" + name_time + "_" + CommonGlobal.CompleteNamefileImages(fi.FileName);
                            //////save image and delete old file only for single file
                            ////if (!string.IsNullOrEmpty(list_image_product_view.ImagePath))
                            ////{
                            ////    Savephoto(list_image_product_view.ImagePath, fi, imgPathTemp, image_small, image_lager);
                            ////}
                            ////else
                            ////{
                            ////    Savephoto(null, fi, imgPathTemp, image_small, image_lager);
                            ////}
                            //////save images for multi file
                            this.Savephoto(null, fi, imgPathTemp, image_small, image_lager);

                            imgPro.Images = "/" + image_small;
                            imgPro.ImagesFull = "/" + image_lager;
                            imgPro.MaSP = list_image_product_view.Pro_id;
                            //imgPro.ImagesName = fi.FileName;
                            list_image_product_view.ImagePath = "/" + image_small;
                            rt = imgModels.Add_Images(imgPro);

                            if (rt)
                            {
                                proModels.UpdateDocViewTypeProduct(list_image_product_view.Pro_id, 1);

                                ViewBag.DocTypeView = 1;
                                list_image_product_view.Message = "Bạn đã thêm ảnh thành công!";
                            }
                            else
                            {
                                if (list_image_product_view.Message != string.Empty)
                                {
                                    list_image_product_view.Message = "updload ảnh không thành công: " + CommonGlobal.CompleteNamefileImages(fi.FileName);
                                }
                                else
                                {
                                    list_image_product_view.Message += "; " + CommonGlobal.CompleteNamefileImages(fi.FileName);
                                }
                            }

                            list_image_product_view.File_image = null;
                        }
                    }
                }
                //else if (is_valid && is_pdf)
                //{
                //    ////upload multi images
                //    foreach (HttpPostedFileBase fi in list_image_product_view.File_image)
                //    {
                //        if (fi != null && fi.ContentLength > 0)
                //        {
                //            ////add new image
                //            var imgPathTemp = "images/photoproduct/" +
                //                              DateTime.Now.Year.ToString() + "/" + DateTime.Now.Month.ToString() + "/";
                //            var name_time = DateTime.Now.Day + DateTime.Now.Month + DateTime.Now.Year + DateTime.Now.Hour + DateTime.Now.Minute + DateTime.Now.Second + DateTime.Now.Ticks + string.Empty;

                //            imgPro = new ImageProduct();
                //            string image_small = imgPathTemp + "sc_small_" + name_time + "_" + CommonGlobal.CompleteNamefileImages(fi.FileName);
                //            string image_lager = imgPathTemp + "sc_full_" + name_time + "_" + CommonGlobal.CompleteNamefileImages(fi.FileName);
                //            //////save image and delete old file only for single file
                //            ////if (!string.IsNullOrEmpty(list_image_product_view.ImagePath))
                //            ////{
                //            ////    Savephoto(list_image_product_view.ImagePath, fi, imgPathTemp, image_small, image_lager);
                //            ////}
                //            ////else
                //            ////{
                //            ////    Savephoto(null, fi, imgPathTemp, image_small, image_lager);
                //            ////}
                //            //////save images for multi file
                //            this.SavePdf(null, fi, imgPathTemp, image_small, image_lager);

                //            imgPro.Images = "/" + image_small;
                //            imgPro.ImagesFull = "/" + image_lager;
                //            imgPro.MaSP = list_image_product_view.Pro_id;
                //            //imgPro.ImagesName = fi.FileName;
                //            list_image_product_view.ImagePath = "/" + image_small;
                //            rt = imgModels.Add_Images(imgPro);

                //            if (rt)
                //            {
                //                proModels.UpdateDocViewTypeProduct(list_image_product_view.Pro_id, 2);
                //                ViewBag.DocTypeView = 2;
                //                list_image_product_view.Message = "Bạn đã thêm pdf thành công!";
                //            }
                //            else
                //            {
                //                if (list_image_product_view.Message != string.Empty)
                //                {
                //                    list_image_product_view.Message = "updload pdf không thành công: " + CommonGlobal.CompleteNamefileImages(fi.FileName);
                //                }
                //                else
                //                {
                //                    list_image_product_view.Message += "; " + CommonGlobal.CompleteNamefileImages(fi.FileName);
                //                }
                //            }

                //            list_image_product_view.File_image = null;
                //        }
                //    }
                //}
            }

            ////get list product
            list_image_product_view.Page_list_image = imgModels.AdminGetAllImageProductByProID(list_image_product_view.Pro_id, list_image_product_view.Page, list_image_product_view.Page_size, list_image_product_view.Order_by, list_image_product_view.Order_type, out total_record);
            if(list_image_product_view.Page_list_image.Count == 0)
            {
                proModels.UpdateDocViewTypeProduct(list_image_product_view.Pro_id, 0);
            }
            list_image_product_view.Total_record = total_record;

            return this.PartialView("../control/image_product", list_image_product_view);


        }

        /// <summary>
        /// Lists the product.
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
        /// <param name="is_show">The is show.</param>
        /// <param name="is_hot">The is hot.</param>
        /// <param name="is_promotion">The is promotion.</param>
        /// <returns>list product</returns>
        [ChildActionOnly]
        public ActionResult List_product(int? parent, int? id, string type, string act, string ctrl, string type_act, string lang, string search, int? page, int? page_size, string order_by, string order_type, bool? is_show, bool? is_hot, bool? is_promotion)
        {
            CatalogModels cateModels = new CatalogModels();
            ProductModels proModels = new ProductModels();
            ProductPropertyModels produsctpropertyModels = new ProductPropertyModels();
            ProductImagesModels imgModels = new ProductImagesModels();
            RatingModels ratingModels = new RatingModels();
            C_Catalog cate = new C_Catalog();
            C_Product pro = new C_Product();
            StringBuilder sb = new StringBuilder();
            List<SelectListItem> list_select_catalog = new List<SelectListItem>();
            var list_product_view = new Web.Areas.Admin.ViewModels.List_product_view();
            int total_record = 0;
            int level = 0;
            /////type is get type catalog
            /////ex   : SP - product
            /////     : CL - collection
            /////parent is array parent id
            if (string.IsNullOrEmpty(type))
            {
                type = Request.QueryString["type"] != null ? Request.QueryString["type"].ToString() : string.Empty;
            }

            if (string.IsNullOrEmpty(act))
            {
                act = Request.QueryString["act"] != null ? Request.QueryString["act"].ToString() : "list_product";
            }

            if (string.IsNullOrEmpty(ctrl))
            {
                ctrl = Request.QueryString["ctrl"] != null ? Request.QueryString["ctrl"].ToString() : "adminProduct";
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
                    pro = proModels.GetProductById((int)id);
                    if (pro != null)
                    {
                        ////delete image
                        if (!string.IsNullOrEmpty(pro.ImagePath))
                        {
                            string strImg = pro.ImagePath;
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

                        ////delete all product properties
                        produsctpropertyModels.DeleteByProductID((int)id);
                        ////delete all image product
                        imgModels.Delete_Images_By_Product_ID((int)id);
                        ////delete all rating items
                        ratingModels.DeleteByItemID((int)id);
                        ////delete product
                        bool rt = proModels.Delete((int)id);

                        if (rt)
                        {
                            list_product_view.Message = "Bạn đã xóa sách " + id;
                        }
                        else
                        {
                            list_product_view.Message = "Xóa không thành công";
                        }
                    }
                    else
                    {
                        list_product_view.Message = "Không tìm thấy sách : " + id;
                    }
                }
                else
                {
                    list_product_view.Message = " Bạn không có quyền thực thi hành động xóa.";
                }
            }

            if (string.IsNullOrEmpty(order_by) || string.IsNullOrEmpty(order_type))
            {
                order_by = "DateModify";
                order_type = "desc";
            }

            if (parent != 0)
            {
                cate = cateModels.GetbyID((int)parent);
                list_product_view.Category_name = cate.CategoryName;
            }

            list_product_view.Type = type;
            list_product_view.Cate_type = CommonGlobal.GetCatalogTypeName(type);
            list_product_view.Parent = (int)parent;
            list_product_view.Lang = lang;
            list_product_view.Type_act = type_act;
            list_product_view.Is_show = is_show ?? false;
            list_product_view.Is_hot = is_hot ?? false;
            list_product_view.Is_promotion = is_promotion ?? false;
            ////tab
            sb.Append("<li class=\"active\"><a class=\"active\" href=\"" + Url.Action("index", "dashboard", new { act = "list_catalog", ctrl = "adminCatalog", type_act = CommonGlobal.View, type = type, page = "1", parent = parent, lang = lang }) + "\"><span><span>Danh sách " + CommonGlobal.GetCatalogTypeName(type) + "</span></span></a></li>");
            sb.Append("<li><a href=\"" + Url.Action("index", "dashboard", new { act = "change_product", ctrl = "adminProduct", type_act = CommonGlobal.Add, type = type, parent = parent, lang = lang }) + "\"><span><span>Thêm mới</span></span></a></li>");
            list_product_view.Html_link_tab = sb.ToString();
            ////list language
            list_product_view.List_language = this.List_select_language(this.Lang);
            ////list category
            cateModels.List_catalog_parent(0, level, (int)parent, type, lang, ref list_select_catalog);
            list_product_view.List_parent = list_select_catalog;
            ////list page size and paging
            list_product_view.List_page_size = this.GetSizePagingPublic((int)page_size);
            list_product_view.Page = (int)page;
            list_product_view.Page_size = (int)page_size;
            ////list product
            int Total_store = 0;
            int Total_borrow = 0;
            int Total_in_stock = 0;
            list_product_view.Page_list_product = proModels.AdminGetAllProductByParentID((int)parent, type, lang, search, (int)page, (int)page_size, order_by, order_type, is_show ?? false, is_hot ?? false, is_promotion ?? false, out total_record, out Total_store, out Total_borrow, out Total_in_stock);
            list_product_view.Total_store = Total_store;
            list_product_view.Total_borrow = Total_borrow;
            list_product_view.Total_in_stock = Total_in_stock;

            list_product_view.Search = search;
            list_product_view.Order_by = order_by;
            list_product_view.Order_type = order_type;
            list_product_view.Total_record = total_record;
            ////acton and parent action
            list_product_view.Act = act;
            list_product_view.Ctrl = ctrl;
            list_product_view.Parent_action = HttpContext.Request.RequestContext.RouteData.Values["action"].ToString();
            list_product_view.Parent_controller = HttpContext.Request.RequestContext.RouteData.Values["controller"].ToString();

            return this.PartialView("../control/list_product", list_product_view);
        }

        /// <summary>
        /// Lists the rating.
        /// </summary>
        /// <param name="pro_id">The pro identifier.</param>
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
        /// <returns>list Rating</returns>
        [ChildActionOnly]
        public ActionResult List_Rating(int? pro_id, int? id, string type, string act, string ctrl, string type_act, string lang, string search, int? page, int? page_size, string order_by, string order_type)
        {
            RatingModels ratingModels = new RatingModels();
            ProductModels proModels = new ProductModels();
            C_Rating objectRating = new C_Rating();
            C_Product pro = new C_Product();
            StringBuilder sb = new StringBuilder();
            var list_rating_view = new Web.Areas.Admin.ViewModels.List_rating_view();
            int total_record = 0;

            if (pro_id == null)
            {
                pro_id = Request.QueryString["pro_id"] != null ? Convert.ToInt32(Request.QueryString["pro_id"].ToString()) : 0;
            }

            if (string.IsNullOrEmpty(type))
            {
                type = Request.QueryString["type"] != null ? Request.QueryString["type"].ToString() : string.Empty;
            }

            if (string.IsNullOrEmpty(act))
            {
                act = Request.QueryString["act"] != null ? Request.QueryString["act"].ToString() : "list_Rating";
            }

            if (string.IsNullOrEmpty(ctrl))
            {
                ctrl = Request.QueryString["ctrl"] != null ? Request.QueryString["ctrl"].ToString() : "adminProduct";
            }

            if (page == null || page == 0)
            {
                page = Request.QueryString["page"] != null ? Convert.ToInt32(Request.QueryString["page"].ToString()) : 1;
            }

            if (page_size == null)
            {
                page_size = int.Parse(Util.GetConfigValue("NumberPageSizeAdmin", "30"));
            }

            if (string.IsNullOrEmpty(lang))
            {
                lang = LanguageModels.ActiveLanguage().LangCultureName;
            }

            if (pro_id != 0)
            {
                pro = proModels.GetProductById((int)pro_id);
                list_rating_view.Product_name = pro.ProductName;
                list_rating_view.Pro_id = (int)pro_id;
            }

            if (id != null && type_act != null && type_act == CommonGlobal.Delete)
            {
                ////if (UserModels.CheckPermission(Session["mem"].ToString(), act, ctrl, type_act, type)) ////check permission delete
                ////{
                objectRating = ratingModels.GetByID((int)id);
                if (objectRating != null)
                {
                    ////delete contact
                    bool rt = ratingModels.Delete((int)id);
                    if (rt)
                    {
                        list_rating_view.Message = "Bạn đã xóa " + id;
                    }
                    else
                    {
                        list_rating_view.Message = "Xóa không thành công";
                    }
                }
                else
                {
                    list_rating_view.Message = "Không tìm thấy  : " + id;
                }
            }

            if (string.IsNullOrEmpty(order_by) || string.IsNullOrEmpty(order_type))
            {
                order_by = "RatingId";
                order_type = "desc";
            }

            list_rating_view.Type = type;
            list_rating_view.Cate_type = "Bình luận và đánh giá";
            list_rating_view.Type_act = type_act;
            ////tab
            sb.Append("<li><a href=\"" + Url.Action("index", "dashboard", new { act = "list_product", ctrl = "adminProduct", type_act = CommonGlobal.View, type = type, page = "1", lang = pro.Lang }) + "\"><span><span>Danh sách " + CommonGlobal.GetCatalogTypeName(type) + "</span></span></a></li>");
            sb.Append("<li><a href=\"" + Url.Action("index", "dashboard", new { act = "change_product", ctrl = "adminProduct", type_act = CommonGlobal.Edit, type = type, id = pro_id, lang = pro.Lang }) + "\"><span><span>" + (pro != null ? CommonGlobal.CutString(list_rating_view.Product_name, 50) : string.Empty) + "</span></span></a></li>");
            sb.Append("<li><a href=\"" + Url.Action("index", "dashboard", new { act = "image_product", ctrl = "adminProduct", type_act = CommonGlobal.View, type = type, page = "1", pro_id = pro.ProductID, lang = pro.Lang }) + "\"><span><span> Ảnh thiết kế </span></span></a></li>");
            ////sb.Append("<li><a href=\"" + Url.Action("index", "dashboard", new { act = "property_product", ctrl = "adminProduct", type_act = CommonGlobal.VIEW, type = type, type_property = CommonGlobal.COLOR, page = "1", pro_id = pro.ProductID, lang = pro.Lang }) + "\"><span><span>" + CommonGlobal.COLOR_TEXT + "</span></span></a></li>");
            ////sb.Append("<li><a href=\"" + Url.Action("index", "dashboard", new { act = "property_product", ctrl = "adminProduct", type_act = CommonGlobal.VIEW, type = type, type_property = CommonGlobal.SIZE, page = "1", pro_id = pro.ProductID, lang = pro.Lang }) + "\"><span><span>" + CommonGlobal.SIZE_TEXT + "</span></span></a></li>");
            sb.Append("<li class=\"active\"><a class=\"active\" href=\"#\"><span><span>" + list_rating_view.Cate_type + "</span></span></a></li>");
            sb.Append("<li><a href=\"" + Url.Action("index", "dashboard", new { act = "comment_facebook", ctrl = "adminProduct", type_act = CommonGlobal.View, type = string.Empty, page = "1", pro_id = pro.ProductID, lang = pro.Lang }) + "\"><span><span>Bình luận Facebook</span></span></a></li>");
            list_rating_view.Html_link_tab = sb.ToString();
            ////list page size and paging
            list_rating_view.List_page_size = this.GetSizePagingPublic((int)page_size);
            list_rating_view.Page = (int)page;
            list_rating_view.Page_size = (int)page_size;
            ////list catalog
            list_rating_view.Page_list_rating = ratingModels.AdminGetAllRatingByProductId((int)pro_id, search, (int)page, (int)page_size, order_by, order_type, out total_record);
            list_rating_view.Search = search;
            list_rating_view.Order_by = order_by;
            list_rating_view.Order_type = order_type;
            list_rating_view.Total_record = total_record;
            ////acton and parent action
            list_rating_view.Act = act;
            list_rating_view.Ctrl = ctrl;
            list_rating_view.Parent_action = HttpContext.Request.RequestContext.RouteData.Values["action"].ToString();
            list_rating_view.Parent_controller = HttpContext.Request.RequestContext.RouteData.Values["controller"].ToString();

            return this.PartialView("../control/list_Rating", list_rating_view);
        }

        /// <summary>
        /// Properties the product.
        /// </summary>
        /// <param name="pro_id">The pro identifier.</param>
        /// <param name="id">The identifier.</param>
        /// <param name="type">The type.</param>
        /// <param name="act">The act.</param>
        /// <param name="ctrl">The control.</param>
        /// <param name="type_property">The type property.</param>
        /// <param name="lang">The language.</param>
        /// <param name="page">The page.</param>
        /// <param name="page_size">The page_size.</param>
        /// <param name="order_by">The order by.</param>
        /// <param name="order_type">Type of the order.</param>
        /// <returns>property product</returns>
        [ChildActionOnly]
        [AcceptVerbs(HttpVerbs.Get)]
        public ActionResult Property_product(int? pro_id, int? id, string type, string act, string ctrl, string type_property, string lang, int? page, int? page_size, string order_by, string order_type)
        {
            ProductModels proModels = new ProductModels();
            ProductPropertyModels productpropertyModels = new ProductPropertyModels();
            C_Product pro = new C_Product();
            C_ProductProperty proPr = new C_ProductProperty();
            StringBuilder sb = new StringBuilder();
            var list_property_product_view = new Web.Areas.Admin.ViewModels.List_property_product_view();
            int total_record = 0;

            if (pro_id == null)
            {
                pro_id = Request.QueryString["pro_id"] != null ? Convert.ToInt32(Request.QueryString["pro_id"].ToString()) : 0;
            }

            if (string.IsNullOrEmpty(type))
            {
                type = Request.QueryString["type"] != null ? Request.QueryString["type"].ToString() : string.Empty;
            }

            if (string.IsNullOrEmpty(act))
            {
                act = Request.QueryString["act"] != null ? Request.QueryString["act"].ToString() : "property_product";
            }

            if (string.IsNullOrEmpty(ctrl))
            {
                ctrl = Request.QueryString["ctrl"] != null ? Request.QueryString["ctrl"].ToString() : "adminProduct";
            }

            if (string.IsNullOrEmpty(type_property))
            {
                type_property = Request.QueryString["type_property"] != null ? Request.QueryString["type_property"].ToString() : CommonGlobal.Color;
            }

            if (page == null || page == 0)
            {
                page = Request.QueryString["page"] != null ? Convert.ToInt32(Request.QueryString["page"].ToString()) : 1;
            }

            if (page_size == null)
            {
                page_size = int.Parse(Util.GetConfigValue("NumberPageSizeAdmin", "30"));
            }

            if (string.IsNullOrEmpty(order_by) || string.IsNullOrEmpty(order_type))
            {
                order_by = "ProID";
                order_type = "desc";
            }

            if (pro_id != 0)
            {
                pro = proModels.GetProductById((int)pro_id);
                list_property_product_view.Product_name = pro.ProductName;
                list_property_product_view.Pro_id = (int)pro_id;
            }

            list_property_product_view.Type = type;
            list_property_product_view.Cate_type = CommonGlobal.GetPropertyTypeName(type_property);
            list_property_product_view.Lang = lang;
            list_property_product_view.Type_act = CommonGlobal.View;
            ////type property
            list_property_product_view.Type_property = type_property;
            ////tab
            sb.Append("<li><a href=\"" + Url.Action("index", "dashboard", new { act = "list_product", ctrl = "adminProduct", type_act = CommonGlobal.View, type = type, page = "1", lang = pro.Lang }) + "\"><span><span>Danh sách " + CommonGlobal.GetCatalogTypeName(type) + "</span></span></a></li>");
            sb.Append("<li><a href=\"" + Url.Action("index", "dashboard", new { act = "change_product", ctrl = "adminProduct", type_act = CommonGlobal.Edit, type = type, id = pro_id, lang = pro.Lang }) + "\"><span><span>" + CommonGlobal.CutString(pro.ProductName, 50) + "</span></span></a></li>");
            sb.Append("<li><a href=\"" + Url.Action("index", "dashboard", new { act = "image_product", ctrl = "adminProduct", type_act = CommonGlobal.View, type = type, page = "1", pro_id = pro.ProductID, lang = pro.Lang }) + "\"><span><span> Ảnh sản phẩm </span></span></a></li>");

            if (type_property == CommonGlobal.Color)
            {
                sb.Append("<li class=\"active\"><a href=\"#\"><span><span>" + CommonGlobal.ColorText + "</span></span></a></li>");
                sb.Append("<li><a href=\"" + Url.Action("index", "dashboard", new { act = "property_product", ctrl = "adminProduct", type_act = CommonGlobal.View, type = type, type_property = CommonGlobal.Size, page = "1", pro_id = pro.ProductID, lang = pro.Lang }) + "\"><span><span>" + CommonGlobal.SizeText + "</span></span></a></li>");
            }
            else if (type_property == CommonGlobal.Size)
            {
                sb.Append("<li><a href=\"" + Url.Action("index", "dashboard", new { act = "property_product", ctrl = "adminProduct", type_act = CommonGlobal.View, type = type, type_property = CommonGlobal.Color, page = "1", pro_id = pro.ProductID, lang = pro.Lang }) + "\"><span><span>" + CommonGlobal.ColorText + "</span></span></a></li>");
                sb.Append("<li class=\"active\"><a href=\"#\"><span><span>" + CommonGlobal.SizeText + "</span></span></a></li>");
            }

            sb.Append("<li><a href=\"" + Url.Action("index", "dashboard", new { act = "list_Rating", ctrl = "adminProduct", type_act = CommonGlobal.View, type = type, page = "1", pro_id = pro.ProductID, lang = pro.Lang }) + "\"><span><span>Bình luận và đánh giá</span></span></a></li>");
            sb.Append("<li><a href=\"" + Url.Action("index", "dashboard", new { act = "comment_facebook", ctrl = "adminProduct", type_act = CommonGlobal.View, type = string.Empty, page = "1", pro_id = pro.ProductID, lang = pro.Lang }) + "\"><span><span>Bình luận Facebook</span></span></a></li>");
            list_property_product_view.Html_link_tab = sb.ToString();
            ////list page size and paging
            list_property_product_view.List_page_size = this.GetSizePagingPublic((int)page_size);
            list_property_product_view.Page = (int)page;
            list_property_product_view.Page_size = (int)page_size;
            ////acton and parent action
            list_property_product_view.Act = act;
            list_property_product_view.Ctrl = ctrl;
            list_property_product_view.Parent_action = HttpContext.Request.RequestContext.RouteData.Values["action"].ToString();
            list_property_product_view.Parent_controller = HttpContext.Request.RequestContext.RouteData.Values["controller"].ToString();
            ////list properties
            list_property_product_view.Page_list_property = productpropertyModels.AdminGetAllPropertyByProID((int)pro_id, type_property, (int)page, (int)page_size, order_by, order_type, out total_record);
            list_property_product_view.Order_by = order_by;
            list_property_product_view.Order_type = order_type;
            list_property_product_view.Total_record = total_record;

            return this.PartialView("../control/property_product", list_property_product_view);
        }

        /// <summary>
        /// Properties the product.
        /// </summary>
        /// <param name="collection">The collection.</param>
        /// <returns>property product</returns>
        [ChildActionOnly]
        [ValidateInput(false)]
        [AcceptVerbs(HttpVerbs.Post)]
        public ActionResult Property_product(FormCollection collection)
        {
            ProductModels proModels = new ProductModels();
            ProductPropertyModels productpropertyModels = new ProductPropertyModels();
            C_Product pro = new C_Product();
            C_ProductProperty proPr = new C_ProductProperty();
            StringBuilder sb = new StringBuilder();
            var list_property_product_view = new Web.Areas.Admin.ViewModels.List_property_product_view();
            this.TryUpdateModel(list_property_product_view);
            int total_record = 0;
            bool is_valid = true;
            bool rt = true;

            list_property_product_view.Cate_type = CommonGlobal.GetPropertyTypeName(list_property_product_view.Type_property);
            ////tab
            sb.Append("<li><a href=\"" + Url.Action("index", "dashboard", new { act = "list_product", ctrl = "adminProduct", type_act = CommonGlobal.View, type = list_property_product_view.Type, page = "1", lang = list_property_product_view.Lang }) + "\"><span><span>Danh sách " + CommonGlobal.GetCatalogTypeName(list_property_product_view.Type) + "</span></span></a></li>");
            sb.Append("<li><a href=\"" + Url.Action("index", "dashboard", new { act = "change_product", ctrl = "adminProduct", type_act = CommonGlobal.Edit, type = list_property_product_view.Type, id = list_property_product_view.Pro_id, lang = list_property_product_view.Lang }) + "\"><span><span>" + CommonGlobal.CutString(list_property_product_view.Product_name, 50) + "</span></span></a></li>");
            sb.Append("<li><a href=\"" + Url.Action("index", "dashboard", new { act = "image_product", ctrl = "adminProduct", type_act = CommonGlobal.View, type = list_property_product_view.Type, page = "1", pro_id = list_property_product_view.Pro_id, lang = list_property_product_view.Lang }) + "\"><span><span> Ảnh sản phẩm </span></span></a></li>");

            if (list_property_product_view.Type_property == CommonGlobal.Color)
            {
                sb.Append("<li class=\"active\"><a href=\"#\"><span><span>" + CommonGlobal.ColorText + "</span></span></a></li>");
                sb.Append("<li><a href=\"" + Url.Action("index", "dashboard", new { act = "property_product", ctrl = "adminProduct", type_act = CommonGlobal.View, type = list_property_product_view.Type, type_property = CommonGlobal.Size, page = "1", pro_id = pro.ProductID, lang = list_property_product_view.Lang }) + "\"><span><span>" + CommonGlobal.SizeText + "</span></span></a></li>");
            }
            else if (list_property_product_view.Type_property == CommonGlobal.Size)
            {
                sb.Append("<li><a href=\"" + Url.Action("index", "dashboard", new { act = "property_product", ctrl = "adminProduct", type_act = CommonGlobal.View, type = list_property_product_view.Type, type_property = CommonGlobal.Color, page = "1", pro_id = pro.ProductID, lang = list_property_product_view.Lang }) + "\"><span><span>" + CommonGlobal.ColorText + "</span></span></a></li>");
                sb.Append("<li class=\"active\"><a href=\"#\"><span><span>" + CommonGlobal.SizeText + "</span></span></a></li>");
            }

            sb.Append("<li><a href=\"" + Url.Action("index", "dashboard", new { act = "list_Rating", ctrl = "adminProduct", type_act = CommonGlobal.View, type = list_property_product_view.Type, page = "1", pro_id = pro.ProductID, lang = list_property_product_view.Lang }) + "\"><span><span>Bình luận và đánh giá</span></span></a></li>");
            sb.Append("<li><a href=\"" + Url.Action("index", "dashboard", new { act = "comment_facebook", ctrl = "adminProduct", type_act = CommonGlobal.View, type = string.Empty, page = "1", pro_id = pro.ProductID, lang = pro.Lang }) + "\"><span><span>Bình luận Facebook</span></span></a></li>");
            list_property_product_view.Html_link_tab = sb.ToString();
            ////list page size and paging
            list_property_product_view.List_page_size = this.GetSizePagingPublic(list_property_product_view.Page_size);
            ////acton and parent action
            ////list_property_product_view.act = "property_product";
            ////list_property_product_view.ctrl = "adminProduct";
            list_property_product_view.Parent_action = HttpContext.Request.RequestContext.RouteData.Values["action"].ToString();
            list_property_product_view.Parent_controller = HttpContext.Request.RequestContext.RouteData.Values["controller"].ToString();

            ////delete property
            if (list_property_product_view.Id > 0 && list_property_product_view.Type_act == CommonGlobal.Delete)
            {
                proPr = productpropertyModels.GetPropertyByID(list_property_product_view.Id);
                if (proPr != null)
                {
                    rt = productpropertyModels.Delete(list_property_product_view.Id);
                    if (rt)
                    {
                        list_property_product_view.Message = "Bạn đã xóa " + list_property_product_view.Id;
                    }
                    else
                    {
                        list_property_product_view.Message = "Xóa không thành công";
                    }
                }
                else
                {
                    list_property_product_view.Message = "Không tìm thấy : " + list_property_product_view.Id;
                }
            }
            else
            {
                ////add new property
                ////validation server
                if (string.IsNullOrEmpty(list_property_product_view.Name))
                {
                    is_valid = false;
                    list_property_product_view.Message = "Bạn cần nhập tên thuộc tính";
                }

                if (string.IsNullOrEmpty(list_property_product_view.Value))
                {
                    is_valid = false;
                    list_property_product_view.Message = "Bạn cần nhập giá trị thuộc tính";
                }

                if (is_valid)
                {
                    proPr = new C_ProductProperty();
                    proPr.ProductID = list_property_product_view.Pro_id;
                    proPr.Name = list_property_product_view.Name;
                    proPr.Value = list_property_product_view.Value;
                    proPr.Type = list_property_product_view.Type_property;
                    rt = productpropertyModels.Add(proPr);
                    if (rt)
                    {
                        list_property_product_view.Message = "Bạn đã thêm thuộc tính thành công";
                    }
                    else
                    {
                        list_property_product_view.Message = "Tạo thuộc tính không thành công";
                    }

                    list_property_product_view.Name = string.Empty;
                    list_property_product_view.Value = string.Empty;
                }
            }

            ////list properties
            list_property_product_view.Page_list_property = productpropertyModels.AdminGetAllPropertyByProID(list_property_product_view.Pro_id, list_property_product_view.Type_property, list_property_product_view.Page, list_property_product_view.Page_size, list_property_product_view.Order_by, list_property_product_view.Order_type, out total_record);
            list_property_product_view.Total_record = total_record;

            return this.PartialView("../control/property_product", list_property_product_view);
        }

        /// <summary>
        /// Updates the status is hot product.
        /// </summary>
        /// <param name="id">The identifier.</param>
        /// <param name="status">The status.</param>
        /// <param name="type">The type.</param>
        /// <returns>update status is hot product</returns>
        public ActionResult Update_status_is_hot_product(string id, string status, string type)
        {
            ProductModels proModels = new ProductModels();
            C_Product pro = new C_Product();
            bool isOk = false;
            if (UserModels.CheckPermission(this.Session["mem"] != null ? this.Session["mem"].ToString() : string.Empty, "change_product", "adminProduct", CommonGlobal.Edit, type))
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
                    pro = proModels.GetProductById(int.Parse(id));
                }

                if (pro != null)
                {
                    try
                    {
                        if (bool.Parse(status) == true)
                        {
                            pro.IsHot = true;
                        }
                        else
                        {
                            pro.IsHot = false;
                        }

                        if (isOk)
                        {
                            pro.DateModify = DateTime.Now;
                            proModels.Update(pro);
                        }
                    }
                    catch (Exception)
                    {
                    }
                }
            }

            var jsonSerialiser = new JavaScriptSerializer();
            var results = Convert.ToDateTime(DateTime.Now).ToString("dd/MM/yyyy") + "|" + pro.IsHot;

            return this.Json(results);
        }

        /// <summary>
        /// Updates the status is promotion product.
        /// </summary>
        /// <param name="id">The identifier.</param>
        /// <param name="status">The status.</param>
        /// <param name="type">The type.</param>
        /// <returns>update status is promotion product</returns>
        public ActionResult Update_status_is_promotion_product(string id, string status, string type)
        {
            ProductModels proModels = new ProductModels();
            C_Product pro = new C_Product();
            bool isOk = false;
            if (UserModels.CheckPermission(this.Session["mem"] != null ? this.Session["mem"].ToString() : string.Empty, "change_product", "adminProduct", CommonGlobal.Edit, type))
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
                    pro = proModels.GetProductById(int.Parse(id));
                }

                if (pro != null)
                {
                    try
                    {
                        if (bool.Parse(status) == true)
                        {
                            pro.IsPromotion = true;
                        }
                        else
                        {
                            pro.IsPromotion = false;
                        }

                        if (isOk)
                        {
                            pro.DateModify = DateTime.Now;
                            proModels.Update(pro);
                        }
                    }
                    catch (Exception)
                    {
                    }
                }
            }

            var jsonSerialiser = new JavaScriptSerializer();
            var results = Convert.ToDateTime(DateTime.Now).ToString("dd/MM/yyyy") + "|" + pro.IsPromotion;

            return this.Json(results);
        }

        /// <summary>
        /// Updates the status is show product.
        /// </summary>
        /// <param name="id">The identifier.</param>
        /// <param name="status">The status.</param>
        /// <param name="type">The type.</param>
        /// <returns>update status is show product</returns>
        public ActionResult Update_status_is_show_product(string id, string status, string type)
        {
            ProductModels proModels = new ProductModels();
            C_Product pro = new C_Product();
            bool isOk = false;
            if (UserModels.CheckPermission(this.Session["mem"] != null ? this.Session["mem"].ToString() : string.Empty, "change_product", "adminProduct", CommonGlobal.Edit, type))
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
                    pro = proModels.GetProductById(int.Parse(id));
                }

                if (pro != null)
                {
                    try
                    {
                        if (bool.Parse(status) == true)
                        {
                            pro.IsShow = true;
                        }
                        else
                        {
                            pro.IsShow = false;
                        }

                        if (isOk)
                        {
                            pro.DateModify = DateTime.Now;
                            proModels.Update(pro);
                        }
                    }
                    catch (Exception)
                    {
                    }
                }
            }

            var jsonSerialiser = new JavaScriptSerializer();
            var results = Convert.ToDateTime(DateTime.Now).ToString("dd/MM/yyyy") + "|" + pro.IsShow;

            return this.Json(results);
        }
    }
}