using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Authorization;
using System.Security.Claims;
using ApiBase.Models.BusinessAccess;
using System.Text;
using Microsoft.AspNetCore.Mvc.Rendering;
using ApiBase.Models.DB;
using ApiBase.Models.AdminViewModels;

// For more information on enabling Web API for empty projects, visit https://go.microsoft.com/fwlink/?LinkID=397860

namespace ApiBase.Controllers
{
    [Route("api/[controller]")]
    public class AdminCatelogController : Controller
    {
        // GET: api/values
        [HttpGet, Authorize(Roles = "Admin")]
        public JsonResult Get(int? parent, int? cate_id, string path, string type, string type_act, string lang, string search, int? page, int? page_size, string order_by, string order_type)
        {
            var identity = (ClaimsIdentity)User.Identity;
            IEnumerable<Claim> claims = identity.Claims;
            var userLogin = claims.FirstOrDefault(c => c.Type == ClaimTypes.Email).Value;

            CatalogModels cateModels = new CatalogModels();
            Catalog cate = new Catalog();
            StringBuilder sb = new StringBuilder();
            List<SelectListItem> list_select_catalog = new List<SelectListItem>();
            BaseClass baseClass = new BaseClass();
            var list_catalog_view = new AdminListCatalogView();
            int total_record = 0;
            int level = 0;


            if (UserModels.CheckPermission(userLogin, path, type_act, type) == false)
            {
                list_catalog_view.Message = " Bạn không có quyền thực thi cho danh mục này ";
                return Json(list_catalog_view);
            }

            /////type is get type catalog
            /////ex   : SP - product
            /////     : TT - news
            /////     : CL - collection
            /////     : LB - lookbook
            /////     : GL - gallery
            /////parent is parent id
            type = type ?? CommonGlobal.CateProduct;

            path = path ?? "list_catalog";

            page = page ?? 1;

            parent = parent ?? 0;

            if (string.IsNullOrEmpty(lang))
            {
                lang = LanguageModels.ActiveLanguage().LangCultureName;
            }

            if (page_size == null)
            {
                page_size = 30;
            }

            if (string.IsNullOrEmpty(order_by) || string.IsNullOrEmpty(order_type))
            {
                order_by = "OrderDisplay";
                order_type = "asc";
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
            list_catalog_view.List_language = baseClass.ListSelectLanguage(lang);

            ////list category
            cateModels.List_catalog_parent(0, level, (int)parent, type, lang, ref list_select_catalog);
            list_catalog_view.List_parent = list_select_catalog;

            ////list page size and paging
            list_catalog_view.List_page_size = baseClass.GetSizePagingPublic((int)page_size);
            list_catalog_view.Page = (int)page;
            list_catalog_view.Page_size = (int)page_size;

            ////list catalog
            list_catalog_view.Page_list_catalog = cateModels.GetAllCatalogByParentID((int)parent, type, lang, search, (int)page, (int)page_size, order_by, order_type, out total_record);
            list_catalog_view.Search = search;
            list_catalog_view.Order_by = order_by;
            list_catalog_view.Order_type = order_type;
            list_catalog_view.Total_record = total_record;

            ////acton and parent action
            list_catalog_view.Path = path;
            //list_catalog_view.Parent_action = HttpContext.Request.RequestContext.RouteData.Values["action"].ToString();
            //list_catalog_view.Parent_controller = HttpContext.Request.RequestContext.RouteData.Values["controller"].ToString();

            return Json(list_catalog_view);
        }

        // GET api/values/5
        [HttpGet("{cate_id}")]
        public JsonResult Get(int? cate_id, int? parent, string type, string path, string lang, string type_act)
        {
            var identity = (ClaimsIdentity)User.Identity;
            IEnumerable<Claim> claims = identity.Claims;
            var userLogin = claims.FirstOrDefault(c => c.Type == ClaimTypes.Email).Value;

            CatalogModels cateModels = new CatalogModels();
            Catalog cate = new Catalog();
            StringBuilder sb = new StringBuilder();
            List<SelectListItem> list_select_catalog = new List<SelectListItem>();
            BaseClass baseClass = new BaseClass();
            var catalog_view = new AdminCatalogView();
            int level = 0;

            if (UserModels.CheckPermission(userLogin, path, type_act, type) == false)
            {
                catalog_view.Message = " Bạn không có quyền thực thi cho danh mục này ";
                return Json(catalog_view);
            }

            type = type ?? CommonGlobal.CateProduct;
            path = path ?? "adminCatalog";
            cate_id = cate_id ?? 0;

            if (cate_id == null)
            {
                cate_id = RouteData.Values["id"] != null ? Convert.ToInt32(RouteData.Values["id"].ToString()) : 0;
            }

            if (string.IsNullOrEmpty(lang))
            {
                lang = LanguageModels.ActiveLanguage().LangCultureName;
            }

            if (string.IsNullOrEmpty(type_act))
            {
                type_act = type_act ?? CommonGlobal.Add;
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
                cateModels.List_catalog_parent(0, level, cate.ParentId ?? 0, type, cate.Lang ?? lang, ref list_select_catalog);
                var link_catalog = Url.Action("index", "dashboard", new { act = "list_catalog", ctrl = "adminCatalog", type_act = CommonGlobal.View, type = type, page = "1", parent = parent, lang = cate.Lang ?? lang });
                sb.Append("<li><a class=\"active\" href=\"" + link_catalog + "\"><span><span>Danh mục " + CommonGlobal.GetCatalogTypeName(type) + "</span></span></a></li>");
                sb.Append("<li class=\"active\"><a href=\"#\"><span><span>" + cate.CategoryName + "</span></span></a></li>");
                catalog_view.Lang = cate.Lang ?? lang;
                catalog_view.Cate_id = cate.CatalogId;
                catalog_view.Category_name = cate.CategoryName;
                catalog_view.ImagePath = cate.ImagePath;
                catalog_view.Intro = cate.Intro;
                catalog_view.MoreInfo = cate.MoreInfo;
                catalog_view.Keyword = cate.Keyword;
                catalog_view.Description = cate.Description;
                catalog_view.Title = cate.Title;
                catalog_view.Link = cate.Link;
                catalog_view.Parent = cate.ParentId ?? 0;
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

                catalog_view.List_language = baseClass.ListSelectLanguage(cate.Lang ?? lang);
                catalog_view.OrderDisplay = (int)cate.OrderDisplay;
            }
            else
            {
                cateModels.List_catalog_parent(0, level, (int)parent, type, lang, ref list_select_catalog);
                var link_catalog = Url.Action("index", "dashboard", new { act = "list_catalog", ctrl = "adminCatalog", type = type, page = "1", parent = parent, lang = lang });
                sb.Append("<li><a class=\"active\" href=\"" + link_catalog + "\"><span><span>Danh mục " + CommonGlobal.GetCatalogTypeName(type) + "</span></span></a></li>");
                sb.Append("<li class=\"active\"><a href=\"#\"><span><span>Thêm danh mục</span></span></a></li>");
                catalog_view.Lang = lang;
                catalog_view.List_language = baseClass.ListSelectLanguage(lang);
                catalog_view.OrderDisplay = cateModels.GetMaxOrderDisplay(type);
                catalog_view.Parent = (int)parent;
            }

            catalog_view.List_parent = list_select_catalog;
            catalog_view.Html_link_tab = sb.ToString();
            catalog_view.Type = type;
            catalog_view.Type_act = type_act;

            ////action and parent action
            catalog_view.Path = path;

            return Json(catalog_view);
            //catalog_view.Parent_action = HttpContext.Request.RequestContext.RouteData.Values["action"].ToString();
            //catalog_view.Parent_controller = HttpContext.Request.RequestContext.RouteData.Values["controller"].ToString();
        }

        // POST api/values
        [HttpPost]
        public void Post([FromBody]string value)
        {
            CatalogModels cateModels = new CatalogModels();
            Catalog cate = new Catalog();
            StringBuilder sb = new StringBuilder();
            BaseClass baseClass = new BaseClass();
            int rt = 0;
            bool is_valid = true;
            int level = 0;

            List<SelectListItem> list_select_catalog = new List<SelectListItem>();
            var catalog_view = new AdminCatalogView();

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
            // catalog_view.Parent_action = HttpContext.Request.RequestContext.RouteData.Values["action"].ToString();
            // catalog_view.Parent_controller = HttpContext.Request.RequestContext.RouteData.Values["controller"].ToString();

            if (catalog_view.Cate_id != 0 && catalog_view.Type_act == CommonGlobal.Edit)
            {
                ////tab
                var link_catalog = Url.Action("index", "dashboard", new { act = "list_catalog", ctrl = "adminCatalog", type_act = CommonGlobal.View, type = catalog_view.Type, page = "1", parent = catalog_view.Parent, lang = catalog_view.Lang });
                sb.Append("<li><a href=\"" + link_catalog + "\"><span><span>Danh sách " + CommonGlobal.GetCatalogTypeName(catalog_view.Type) + "</span></span></a></li>");
                sb.Append("<li class=\"active\"><a href=\"#\"><span><span>" + cate.CategoryName + "</span></span></a></li>");
                ////list parent
                cateModels.List_catalog_parent(0, level, cate.ParentId ?? 0, catalog_view.Type, cate.Lang, ref list_select_catalog);
                catalog_view.List_parent = list_select_catalog;
                ////list lang
                catalog_view.List_language = baseClass.ListSelectLanguage(cate.Lang);
                catalog_view.Cate_id = cate.CatalogId;
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
                catalog_view.List_language = baseClass.ListSelectLanguage(catalog_view.Lang);
            }

            catalog_view.Html_link_tab = sb.ToString();

            if (!is_valid)
            {
                //return this.PartialView("../control/change_catalog", catalog_view);
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
            cate.ParentId = catalog_view.Parent;
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

            //if (file_image != null && file_image.ContentLength > 0 && CommonGlobal.IsImage(file_image) == true)
            //{
            //    string image_small = imgPathTemp + "sc_small_" + name_time + "_" + CommonGlobal.CompleteNamefileImages(file_image.FileName);
            //    string image_lager = imgPathTemp + "sc_full_" + name_time + "_" + CommonGlobal.CompleteNamefileImages(file_image.FileName);
            //    ////save image and delete old file
            //    //this.SavephotoCategory(cate.ImagePath, file_image, imgPathTemp, image_small, image_lager);

            //    ////save image and delete old file
            //    this.SavephotoOriginal(cate.ImagePath, file_image, imgPathTemp, image_lager);

            //    ////set image thumb to link catalog
            //    cate.ImagePath = "/" + image_lager;
            //    catalog_view.ImagePath = "/" + image_lager;
            //}
            //else if (string.IsNullOrEmpty(cate.ImagePath))
            //{
            //    cate.ImagePath = "0";
            //}
            //else
            //{
            //    cate.ImagePath = catalog_view.ImagePath;
            //}

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

            // return this.PartialView("../control/change_catalog", catalog_view);
        }

        // PUT api/values/5
        [HttpPut("{id}")]
        public void Put(int id, [FromBody]string value)
        {
        }

        // DELETE api/values/5
        [HttpDelete("{id}")]
        public void Delete(int id)
        {
        }
    }
}
