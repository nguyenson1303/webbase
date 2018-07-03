namespace Web.Controllers
{
    using System;
    using System.Collections;
    using System.Collections.Generic;
    using System.Web;
    using System.Web.Mvc;
    using System.Web.Script.Serialization;
    using Web.Data;
    using Web.Models;
    using Web.ViewModels;

    /// <summary>
    /// Gallery Controller
    /// </summary>
    /// <seealso cref="Web.Controllers.BaseController" />
    public class GalleryController : BaseController
    {
        /// <summary>
        /// Galleries the look book.
        /// </summary>
        /// <returns>Galleries the look book</returns>
        [ChildActionOnly]
        public ActionResult Gallery_lookbook()
        {
            ///// Lấy danh sách gallery mới nhất
            CatalogModels cateModels = new CatalogModels();
            var lstGallery = cateModels.GetMenubyParentID(0, CommonGlobal.CateLookBook, LanguageModels.ActiveLanguage().LangCultureName);

            return this.PartialView("../control/gallery_lookbook", lstGallery);
        }

        /// <summary>
        /// Gets the list image album.
        /// </summary>
        /// <param name="albumId">The album identifier.</param>
        /// <returns>list image album</returns>
        public ActionResult GetListImageAlbum(int albumId)
        {
            GalleryModels sv = new GalleryModels();
            List<ImageAlbum> list = new List<ImageAlbum>();
            List<ImageSlideObject> objs = new List<ImageSlideObject>();
            if (albumId > 0)
            {
                list = sv.GetListImagebyCategory(albumId);
                if (list.Count > 0)
                {
                    foreach (var it in list)
                    {
                        ImageSlideObject ia = new ImageSlideObject();
                        ia.url = it.ImagesFull;
                        ia.caption = it.ImagesName;
                        objs.Add(ia);
                    }
                }
            }
            else
            {
            }

            var jsonSerialiser = new JavaScriptSerializer();
            var json = jsonSerialiser.Serialize(objs);
            var results = json;

            return this.Json(results);
        }

        /// <summary>
        /// Look books this instance.
        /// </summary>
        /// <returns>Look books this instance</returns>
        public ActionResult Lookbook()
        {
            /////list album
            string strBread;
            ViewBag.Title = App_GlobalResources.Lang.mnuGallery + " | " + GeneralModels.GetContent(CommonGlobal.PageName, this.Lang);
            strBread = "<li>" + App_GlobalResources.Lang.mnuGallery + "</li>";
            ViewBag.heading = App_GlobalResources.Lang.mnuGallery;
            ViewBag.str_breadcrumbs = strBread;
            this.AddMeta(CommonGlobal.Keyword, App_GlobalResources.Lang.mnuGallery);
            this.AddMeta(CommonGlobal.Description, App_GlobalResources.Lang.mnuGallery);

            return this.PartialView("../page/lookbook");
        }


        /// <summary>
        /// Posts the specified identifier.
        /// </summary>
        /// <param name="id">The identifier.</param>
        /// <param name="cate_id">The cate identifier.</param>
        /// <param name="cate_type">Type of the cate.</param>
        /// <returns>Posts the specified</returns>
        public ActionResult LookbookDetail(int? id, string cate_type)
        {
            /////lookbook detail
            GalleryModels sv = new GalleryModels();
            CatalogModels cateModels = new CatalogModels();
            C_Catalog cateItem = new C_Catalog();

            id = RouteData.Values["id"] != null ? Convert.ToInt16(RouteData.Values["id"].ToString()) : 0;
            var link = RouteData.Values["Link"] != null ? RouteData.Values["Link"].ToString() : string.Empty;
            
            if (string.IsNullOrEmpty(cate_type))
            {
                cate_type = CommonGlobal.CateGallery;
            }

            if (id == 0)
            {
                return this.HttpNotFound();
            }
            else
            {
                cateItem = cateModels.GetbyID((int)id);

                if (cateItem.CatalogID == 0)
                {
                    return this.HttpNotFound();
                }

                ViewBag.Title = cateItem.CategoryName + " | " + GeneralModels.GetContent(CommonGlobal.PageName, this.Lang);

                ////breadcrumbs
                string strbreadcrumbs = string.Empty;                      

                strbreadcrumbs = string.Format("<li><a href=\"" + Url.Action("lookbook", "gallery") + "\">" + App_GlobalResources.Lang.mnuGallery + "</a></li>");
                if (cateItem != null)
                {
                    strbreadcrumbs += string.Format("<li><a href=\"" + Url.RouteUrl("_lookbook", new { controller = "gallery", action = "LookbookDetail", id = id, Link = cateItem.Link != null ? cateItem.Link : string.Empty, cate_type = cate_type }) + "\">" + cateItem.CategoryName + "</a></li>");
                    ViewBag.cate_name = cateItem.CategoryName;
                }

                strbreadcrumbs += string.Format("<li>" + cateItem.CategoryName + "</li>");

                ViewBag.str_breadcrumbs = strbreadcrumbs;
                ViewBag.back_link = Url.RouteUrl("_lookbook", new { controller = "gallery", action = "LookbookDetail", id = id, Link = cateItem.Link != null ? cateItem.Link : string.Empty, cate_type = cate_type });
                ViewBag.heading = cateItem.CategoryName;

                this.AddMeta(CommonGlobal.Keyword, cateItem.CategoryName);
                this.AddMeta(CommonGlobal.Description, this.ClearHtml(HttpUtility.HtmlDecode(cateItem.Description)));
                ViewBag.id = id;
                ViewBag.cate_id = id;
                ViewBag.cate_type = cate_type;
                ViewBag.ImagePath = cateItem.ImagePath;
                ViewBag.MoreInfo = cateItem.MoreInfo;

                return this.PartialView("../page/lookbookDetail");
            }
        }
    }
}