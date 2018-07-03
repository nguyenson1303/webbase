namespace Web.Areas.Admin.Controllers
{
    using System;
    using System.Text;
    using System.Web.Mvc;
    using System.Web.Script.Serialization;
    using Data;
    using Models;
    using Web.Controllers;
    using Web.Models;

    /// <summary>
    /// admin Static Controller
    /// </summary>
    public class AdminStaticController : BaseController
    {
        /// <summary>
        /// Changes the static.
        /// </summary>
        /// <param name="id">The identifier.</param>
        /// <param name="act">The act.</param>
        /// <param name="ctrl">The control.</param>
        /// <param name="lang">The language.</param>
        /// <param name="type_act">The type act.</param>
        /// <returns>change static</returns>
        [ChildActionOnly]
        [AcceptVerbs(HttpVerbs.Get)]
        public ActionResult Change_static(int? id, string act, string ctrl, string lang, string type_act)
        {
            PageModels pageModels = new PageModels();
            C_Pages cpage = new C_Pages();
            StringBuilder sb = new StringBuilder();
            var page_view = new Web.Areas.Admin.ViewModels.Page_view();

            if (string.IsNullOrEmpty(act))
            {
                act = Request.QueryString["act"] != null ? Request.QueryString["act"].ToString() : "change_static";
            }

            if (string.IsNullOrEmpty(ctrl))
            {
                ctrl = Request.QueryString["ctrl"] != null ? Request.QueryString["ctrl"].ToString() : "adminStatic";
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
                cpage = pageModels.GetbyID((int)id);
                sb.Append("<li><a href=\"" + Url.Action("index", "dashboard", new { act = "list_page_static", ctrl = "adminStatic", page = "1" }) + "\"><span><span>Danh sách trang tĩnh</span></span></a></li>");
                sb.Append("<li class=\"active\"><a href=\"#\"><span><span>" + cpage.PageName + "</span></span></a></li>");
                page_view.Lang = cpage.Lang ?? lang;
                page_view.Id = cpage.PageID;
                page_view.PageName = cpage.PageName;
                page_view.PageContent = cpage.PageContent;
                page_view.Link = cpage.Link;
                page_view.Title = cpage.Title;
                page_view.ImagePath = cpage.ImagePath;
                page_view.Description = cpage.Description;
                page_view.Keyword = cpage.Description;
                page_view.Summary = cpage.Summary;
                page_view.OrderDisplay = cpage.OrderDisplay ?? 0;
                page_view.List_language = this.List_select_language(cpage.Lang ?? this.Lang);
                page_view.Show = cpage.Show ?? false;
                if (cpage.Show == true)
                {
                    page_view.Show = true;
                    page_view.Show_text = "checked='checked'";
                }
                else
                {
                    page_view.Show = false;
                    page_view.Show_text = string.Empty;
                }
            }
            else
            {
                sb.Append("<li><a href=\"" + Url.Action("index", "dashboard", new { act = "list_page_static", ctrl = "adminStatic", page = "1" }) + "\"><span><span>Danh sách trang tĩnh</span></span></a></li>");
                sb.Append("<li class=\"active\"><a href=\"#\"><span><span>Thêm mới</span></span></a></li>");
                page_view.Lang = lang;
                page_view.List_language = this.List_select_language(this.Lang);
                page_view.OrderDisplay = pageModels.GetMaxOrderDisplay();
            }

            page_view.Html_link_tab = sb.ToString();
            page_view.Type_act = type_act;
            ////action and parent action
            page_view.Act = act;
            page_view.Ctrl = ctrl;
            page_view.Parent_action = HttpContext.Request.RequestContext.RouteData.Values["action"].ToString();
            page_view.Parent_controller = HttpContext.Request.RequestContext.RouteData.Values["controller"].ToString();

            return this.PartialView("../control/change_static", page_view);
        }

        /// <summary>
        /// Changes the static.
        /// </summary>
        /// <param name="collection">The collection.</param>
        /// <returns>change static</returns>
        [ChildActionOnly]
        [ValidateInput(false)]
        [AcceptVerbs(HttpVerbs.Post)]
        public ActionResult Change_static(FormCollection collection)
        {
            PageModels pageModels = new PageModels();
            C_Pages cpage = new C_Pages();
            StringBuilder sb = new StringBuilder();
            var page_view = new Web.Areas.Admin.ViewModels.Page_view();
            this.TryUpdateModel(page_view);
            int rt = 0;
            bool is_valid = true;
            if (page_view.Id > 0)
            {
                cpage = pageModels.GetbyID(page_view.Id);
            }

            ////validation server
            if (string.IsNullOrEmpty(page_view.PageName))
            {
                is_valid = false;
                if (page_view.Message != string.Empty)
                {
                    page_view.Message = "Bạn cần nhập Tên trang";
                }
            }

            if (string.IsNullOrEmpty(page_view.PageContent))
            {
                is_valid = false;
                if (page_view.Message != string.Empty)
                {
                    page_view.Message = "Bạn cần nhập nội dung trang tĩnh";
                }
            }

            ////Link tab
            sb.Append("<li><a href=\"" + Url.Action("index", "dashboard", new { act = "list_page_static", ctrl = "adminStatic", page = "1" }) + "\"><span><span>Danh sách trang tĩnh</span></span></a></li>");
            if (page_view.Id != 0 && page_view.Type_act == CommonGlobal.Edit)
            {
                sb.Append("<li class=\"active\"><a href=\"#\"><span><span>" + cpage.PageName + "</span></span></a></li>");
                page_view.List_language = this.List_select_language(cpage.Lang);
                page_view.Id = cpage.PageID;
            }
            else
            {
                sb.Append("<li class=\"active\"><a href=\"#\"><span><span>Thêm trang tĩnh</span></span></a></li>");
                page_view.List_language = this.List_select_language(page_view.Lang);
            }

            page_view.Html_link_tab = sb.ToString();
            ////action
            page_view.Parent_action = HttpContext.Request.RequestContext.RouteData.Values["action"].ToString();
            page_view.Parent_controller = HttpContext.Request.RequestContext.RouteData.Values["controller"].ToString();
            if (!is_valid)
            {
                return this.PartialView("../control/change_static", page_view);
            }

            cpage.Summary = string.IsNullOrEmpty(page_view.Summary) == false ? page_view.Summary : string.Empty;
            cpage.PageContent = string.IsNullOrEmpty(page_view.PageContent) == false ? page_view.PageContent : string.Empty;
            cpage.Lang = page_view.Lang;
            cpage.PageName = page_view.PageName;
            if (string.IsNullOrEmpty(page_view.Title))
            {
                cpage.Title = page_view.PageName;
            }
            else
            {
                cpage.Title = page_view.Title;
            }

            cpage.Keyword = string.IsNullOrEmpty(page_view.Keyword) == false ? page_view.Keyword : string.Empty;
            cpage.Description = string.IsNullOrEmpty(page_view.Description) == false ? page_view.Description : string.Empty;
            cpage.Show = page_view.Show;
            if ((cpage.Show ?? false) == true)
            {
                page_view.Show = true;
                page_view.Show_text = "checked='checked'";
            }
            else
            {
                page_view.Show = false;
                page_view.Show_text = string.Empty;
            }

            cpage.Link = CommonGlobal.CompleteLink(page_view.PageName); 
            cpage.DateModified = DateTime.Now;

            var imgPathTemp = "images/static/" +
                              DateTime.Now.Year.ToString() + "/" + DateTime.Now.Month.ToString() + "/";
            var name_time = DateTime.Now.Day + DateTime.Now.Month + DateTime.Now.Year + DateTime.Now.Hour + DateTime.Now.Minute + string.Empty;
            if (page_view.File_image != null && page_view.File_image.ContentLength > 0 && CommonGlobal.IsImage(page_view.File_image) == true)
            {
                string image_small = imgPathTemp + "sc_small_" + name_time + "_" + CommonGlobal.CompleteNamefileImages(page_view.File_image.FileName);
                string image_lager = imgPathTemp + "sc_full_" + name_time + "_" + CommonGlobal.CompleteNamefileImages(page_view.File_image.FileName);
                ////save image and delete old file
                this.Savephoto(cpage.ImagePath, page_view.File_image, imgPathTemp, image_small, image_lager);
                ////set image thumb to link catalog
                cpage.ImagePath = "/" + image_small;
                page_view.ImagePath = "/" + image_small;
            }
            else if (string.IsNullOrEmpty(cpage.ImagePath))
            {
                cpage.ImagePath = "0";
            }
            else
            {
                cpage.ImagePath = page_view.ImagePath;
            }

            cpage.OrderDisplay = page_view.OrderDisplay;

            if (page_view.Id != 0 && page_view.Type_act == CommonGlobal.Edit)
            {
                rt = pageModels.Edit(cpage);
            }
            else
            {
                rt = pageModels.Add(cpage);
            }

            if (rt > 0)
            {
                page_view.Message = "Cập nhật thành công!";
                page_view.Id = rt;
                page_view.Type_act = CommonGlobal.Edit;
            }
            else
            {
                page_view.Message = "Cập nhật không thành công!";
            }

            return this.PartialView("../control/change_static", page_view);
        }

        /// <summary>
        /// Lists the page static.
        /// </summary>
        /// <param name="id">The identifier.</param>
        /// <param name="act">The act.</param>
        /// <param name="ctrl">The control.</param>
        /// <param name="type_act">The type act.</param>
        /// <param name="type">The type.</param>
        /// <param name="lang">The language.</param>
        /// <param name="search">The search.</param>
        /// <param name="page">The page.</param>
        /// <param name="page_size">The page size.</param>
        /// <param name="order_by">The order by.</param>
        /// <param name="order_type">Type of the order.</param>
        /// <returns>list page static</returns>
        [ChildActionOnly]
        public ActionResult List_page_static(int? id, string act, string ctrl, string type_act, string type, string lang, string search, int? page, int? page_size, string order_by, string order_type)
        {
            PageModels pageModels = new PageModels();
            StringBuilder sb = new StringBuilder();
            C_Pages cpage = new C_Pages();
            var list_page_view = new Web.Areas.Admin.ViewModels.List_page_view();
            int total_record = 0;

            if (string.IsNullOrEmpty(act))
            {
                act = Request.QueryString["act"] != null ? Request.QueryString["act"].ToString() : "list_page_static";
            }

            if (string.IsNullOrEmpty(ctrl))
            {
                ctrl = Request.QueryString["ctrl"] != null ? Request.QueryString["ctrl"].ToString() : "adminStatic";
            }

            if (string.IsNullOrEmpty(type_act))
            {
                type_act = Request.QueryString["type_act"] != null ? Request.QueryString["type_act"].ToString() : CommonGlobal.View;
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
                if (UserModels.CheckPermission(this.Session["mem"] != null ? this.Session["mem"].ToString() : string.Empty, act, ctrl, type_act, type ?? string.Empty)) 
                {
                    cpage = pageModels.GetbyID((int)id);
                    if (cpage != null)
                    {
                        ////delete old image
                        if (!string.IsNullOrEmpty(cpage.ImagePath))
                        {
                            string strImg = cpage.ImagePath;
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
                        bool rt = pageModels.Delete((int)id);
                        if (rt)
                        {
                            list_page_view.Message = "Bạn đã xóa page " + id;
                        }
                        else
                        {
                            list_page_view.Message = "Xóa không thành công";
                        }
                    }
                    else
                    {
                        list_page_view.Message = "Không tìm thấy page : " + id;
                    }
                }
                else
                {
                    list_page_view.Message = " Bạn không có quyền thực thi hành động xóa.";
                }
            }

            if (string.IsNullOrEmpty(order_by) || string.IsNullOrEmpty(order_type))
            {
                order_by = "OrderDisplay";
                order_type = "asc";
            }

            list_page_view.Type_act = type_act;
            list_page_view.Cate_type = "Danh sách trang tĩnh ";
            list_page_view.Lang = lang;
            ////tab
            sb.Append("<li class=\"active\"><a class=\"active\" href=\"" + Url.Action("index", "dashboard", new { act = "list_page_static", ctrl = "adminStatic", page = "1" }) + "\"><span><span>Danh sách trang tĩnh</span></span></a></li>");
            sb.Append("<li><a href=\"" + Url.Action("index", "dashboard", new { act = "change_static", ctrl = "adminStatic", type_act = CommonGlobal.Add }) + "\"><span><span>Thêm trang tĩnh</span></span></a></li>");
            list_page_view.Html_link_tab = sb.ToString();
            ////list language
            list_page_view.List_language = this.List_select_language(this.Lang);
            ////list page size and paging
            list_page_view.List_page_size = this.GetSizePagingPublic((int)page_size);
            list_page_view.Page = (int)page;
            list_page_view.Page_size = (int)page_size;
            ////list catalog
            list_page_view.Page_list = pageModels.GetAllPageStaticAdmin(lang, search, (int)page, (int)page_size, order_by, order_type, out total_record);
            list_page_view.Search = search;
            list_page_view.Order_by = order_by;
            list_page_view.Order_type = order_type;
            list_page_view.Total_record = total_record;
            ////acton and parent action
            list_page_view.Act = act;
            list_page_view.Ctrl = ctrl;
            list_page_view.Parent_action = HttpContext.Request.RequestContext.RouteData.Values["action"].ToString();
            list_page_view.Parent_controller = HttpContext.Request.RequestContext.RouteData.Values["controller"].ToString();

            return this.PartialView("../control/list_page_static", list_page_view);
        }

        /// <summary>
        /// Updates the status is show page static.
        /// </summary>
        /// <param name="id">The identifier.</param>
        /// <param name="status">The status.</param>
        /// <param name="type">The type.</param>
        /// <returns>update status is show page static</returns>
        public ActionResult Update_status_is_show_page_static(string id, string status, string type)
        {
            PageModels pageModels = new PageModels();
            C_Pages cpage = new C_Pages();
            bool isOk = false;
            if (UserModels.CheckPermission(this.Session["mem"] != null ? this.Session["mem"].ToString() : string.Empty, "change_static", "adminStatic", CommonGlobal.Edit, type))
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
                    cpage = pageModels.GetbyID(int.Parse(id));
                }

                if (cpage != null)
                {
                    try
                    {
                        if (bool.Parse(status) == true)
                        {
                            cpage.Show = true;
                        }
                        else
                        {
                            cpage.Show = false;
                        }

                        if (isOk)
                        {
                            cpage.DateModified = DateTime.Now;
                            pageModels.Edit(cpage);
                        }
                    }
                    catch (Exception)
                    {
                    }
                }
            }

            var jsonSerialiser = new JavaScriptSerializer();
            var results = Convert.ToDateTime(DateTime.Now).ToString("dd/MM/yyyy") + "|" + cpage.Show;

            return this.Json(results);
        }
    }
}