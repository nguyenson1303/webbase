namespace Web.Areas.Admin.Controllers
{
    using System;
    using System.Collections.Generic;
    using System.Text;
    using System.Web;
    using System.Web.Mvc;
    using Data;
    using Models;
    using Web.Controllers;
    using Web.Models;

    /// <summary>
    /// admin Showroom Controller
    /// </summary>
    /// <seealso cref="Web.Controllers.BaseController" />
    public class AdminShowroomController : BaseController
    {
        /// <summary>
        /// Changes the showroom.
        /// </summary>
        /// <param name="showroomID">The showroom identifier.</param>
        /// <param name="type">The type.</param>
        /// <param name="act">The act.</param>
        /// <param name="ctrl">The control.</param>
        /// <param name="type_act">The type act.</param>
        /// <param name="lang">The language.</param>
        /// <returns>change showroom</returns>
        [ChildActionOnly]
        [AcceptVerbs(HttpVerbs.Get)]
        public ActionResult Change_showroom(int? showroomID, string type, string act, string ctrl, string type_act, string lang)
        {
            ShowroomModels showroomModels = new ShowroomModels();
            CityModels cityModels = new CityModels();
            DistrictModels districtModels = new DistrictModels();
            Showroom objShowroom = new Showroom();
            var showroom_view = new Web.Areas.Admin.ViewModels.Showroom_view();
            StringBuilder sb = new StringBuilder();

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

            if (showroomID == null)
            {
                showroomID = RouteData.Values["showroom_id"] != null ? Convert.ToInt32(RouteData.Values["ShowroomID"].ToString()) : 0;
            }

            if (string.IsNullOrEmpty(lang))
            {
                lang = LanguageModels.ActiveLanguage().LangCultureName;
            }

            if (string.IsNullOrEmpty(type_act))
            {
                type_act = Request.QueryString["type_act"] != null ? Request.QueryString["type_act"].ToString() : CommonGlobal.Add;
                if (showroomID == 0)
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
                objShowroom = showroomModels.GetShowroomById((int)showroomID);
                showroom_view.ShowroomID = objShowroom.ShowroomID;
                showroom_view.DistrictID = objShowroom.DistrictID;
                showroom_view.Longitude = objShowroom.Longitude;
                showroom_view.Latitude = objShowroom.Latitude;
                showroom_view.Name = objShowroom.Name;
                showroom_view.Address = objShowroom.Address;
                showroom_view.Phone = objShowroom.Phone;
                showroom_view.Image = objShowroom.Image;

                ////Link tab
                sb.Append("<li><a class=\"active\" href=\"" + Url.Action("index", "dashboard", new { act = "list_showroom", ctrl = "adminShowroom", page = "1" }) + "\"><span><span>Danh sách Showroom</span></span></a></li>");
                sb.Append("<li class=\"active\"><a href=\"#\"><span><span>Cập nhật</span></span></a></li>");

                District objDistrict = districtModels.GetDistrictByID(objShowroom.DistrictID);
                ////City and District
                showroom_view.List_city = cityModels.List_city(objDistrict.CityID);
                showroom_view.List_district = districtModels.List_district(objDistrict.CityID, objShowroom.DistrictID);

                showroom_view.City = objDistrict.CityID;
                showroom_view.District = objDistrict.DistrictID;
            }
            else
            {
                ////Link tab
                sb.Append("<li><a class=\"active\" href=\"" + Url.Action("index", "dashboard", new { act = "list_showroom", ctrl = "adminShowroom", page = "1", lang = lang }) + "\"><span><span>Danh sách Showroom</span></span></a></li>");
                sb.Append("<li class=\"active\"><a href=\"#\"><span><span>Thêm mới</span></span></a></li>");

                ////City and District
                showroom_view.List_city = cityModels.List_city(0);
                showroom_view.List_district = districtModels.List_district(0, 0);
            }

            showroom_view.Type = type;
            showroom_view.Type_act = type_act;
            showroom_view.Html_link_tab = sb.ToString();
            ////action
            showroom_view.Act = act;
            showroom_view.Ctrl = ctrl;
            showroom_view.Parent_action = HttpContext.Request.RequestContext.RouteData.Values["action"].ToString();
            showroom_view.Parent_controller = HttpContext.Request.RequestContext.RouteData.Values["controller"].ToString();
            ////end action

            return this.PartialView("../control/change_showroom", showroom_view);
        }

        /// <summary>
        /// Changes the showroom.
        /// </summary>
        /// <param name="collection">The collection.</param>
        /// <param name="file_image">The file image.</param>
        /// <returns>change showroom</returns>
        [ChildActionOnly]
        [ValidateInput(false)]
        [AcceptVerbs(HttpVerbs.Post)]
        public ActionResult Change_showroom(FormCollection collection, HttpPostedFileBase file_image)
        {
            ShowroomModels showroomModels = new ShowroomModels();
            CityModels cityModels = new CityModels();
            DistrictModels districtModels = new DistrictModels();
            Showroom objShowroom = new Showroom();
            StringBuilder sb = new StringBuilder();
            int rt = 0;
            bool is_valid = true;
            var showroom_view = new Web.Areas.Admin.ViewModels.Showroom_view();
            this.TryUpdateModel(showroom_view);

            if (showroom_view.ShowroomID > 0)
            {
                objShowroom = showroomModels.GetShowroomById(showroom_view.ShowroomID);
            }

            ////validation server
            if (string.IsNullOrEmpty(showroom_view.Name))
            {
                is_valid = false;
                showroom_view.Message = "Bạn cần nhập tên Showroom";
            }

            ////validation server
            if (showroom_view.District == 0)
            {
                is_valid = false;
                showroom_view.Message = "Bạn cần lựa chọn Quận/Huyện";
            }

            ////action
            ////post_view.act = "change_post";
            ////post_view.ctrl = "adminPost";
            showroom_view.Parent_action = HttpContext.Request.RequestContext.RouteData.Values["action"].ToString();
            showroom_view.Parent_controller = HttpContext.Request.RequestContext.RouteData.Values["controller"].ToString();

            if (!is_valid)
            {
                return this.PartialView("../control/change_showroom", showroom_view);
            }

            ////Post info
            objShowroom.DistrictID = showroom_view.District;
            objShowroom.Name = showroom_view.Name;
            objShowroom.Address = showroom_view.Address;
            objShowroom.Phone = showroom_view.Phone;
            objShowroom.Latitude = showroom_view.Latitude;
            objShowroom.Longitude = showroom_view.Longitude;

            var imgPathTemp = "images/newspost/" +
                              DateTime.Now.Year.ToString() + "/" + DateTime.Now.Month.ToString() + "/";
            var name_time = DateTime.Now.Day + DateTime.Now.Month + DateTime.Now.Year + DateTime.Now.Hour + DateTime.Now.Minute + string.Empty;
            if (file_image != null && file_image.ContentLength > 0 && CommonGlobal.IsImage(file_image) == true)
            {
                string image_small = imgPathTemp + "sc_small_" + name_time + "_" + CommonGlobal.CompleteNamefileImages(file_image.FileName);
                string image_lager = imgPathTemp + "sc_full_" + name_time + "_" + CommonGlobal.CompleteNamefileImages(file_image.FileName);

                ////save image and delete old file
                this.Savephoto(objShowroom.Image, file_image, imgPathTemp, image_small, image_lager);

                ////set image thumb to link catalog
                objShowroom.Image = "/" + image_small;
            }
            else if (string.IsNullOrEmpty(objShowroom.Image))
            {
                objShowroom.Image = "0";
            }
            else
            {
                objShowroom.Image = objShowroom.Image;
            }

            if (showroom_view.ShowroomID != 0 && showroom_view.Type_act == CommonGlobal.Edit)
            {
                rt = showroomModels.Edit(objShowroom);
            }
            else
            {
                objShowroom.CreateDate = DateTime.Now;
                rt = showroomModels.Add(objShowroom);
            }

            if (showroom_view.ShowroomID != 0 && showroom_view.Type_act == CommonGlobal.Edit)
            {
                ////Link tab
                sb.Append("<li><a class=\"active\" href=\"" + Url.Action("index", "dashboard", new { act = "list_showroom", ctrl = "adminShowroom", type = showroom_view.Type, page = "1" }) + "\"><span><span>Danh sách Showroom</span></span></a></li>");
                sb.Append("<li class=\"active\"><a href=\"#\"><span><span>Cập nhật</span></span></a></li>");

                ////list parent
                District objDistrict = districtModels.GetDistrictByID(showroom_view.District);
                ////City and District
                showroom_view.List_city = cityModels.List_city(objDistrict.CityID);
                showroom_view.List_district = districtModels.List_district(objDistrict.CityID, showroom_view.District);
            }
            else
            {
                ////Link tab
                sb.Append("<li><a class=\"active\" href=\"" + Url.Action("index", "dashboard", new { act = "list_showroom", ctrl = "adminShowroom", type = showroom_view.Type, page = "1" }) + "\"><span><span>Danh sách Showroom</span></span></a></li>");
                sb.Append("<li class=\"active\"><a href=\"#\"><span><span>Thêm mới</span></span></a></li>");

                ////City and District
                showroom_view.List_city = cityModels.List_city(showroom_view.City);
                showroom_view.List_district = districtModels.List_district(showroom_view.City, showroom_view.District);
            }

            showroom_view.Html_link_tab = sb.ToString();

            if (rt > 0)
            {
                showroom_view.Message = "Cập nhật thành công!";
                showroom_view.ShowroomID = rt;
                showroom_view.Type_act = CommonGlobal.Edit;
            }
            else
            {
                showroom_view.Message = "Cập nhật không thành công!";
            }

            return this.PartialView("../control/change_showroom", showroom_view);
        }

        /// <summary>
        /// Lists the showroom.
        /// </summary>
        /// <param name="city">The city.</param>
        /// <param name="district">The district.</param>
        /// <param name="showroom_id">The showroom identifier.</param>
        /// <param name="type">The type.</param>
        /// <param name="act">The act.</param>
        /// <param name="ctrl">The control.</param>
        /// <param name="type_act">The type act.</param>
        /// <param name="page">The page.</param>
        /// <param name="page_size">The page_size.</param>
        /// <returns>list showroom</returns>
        [ChildActionOnly]
        public ActionResult List_showroom(int? city, int? district, int? showroom_id, string type, string act, string ctrl, string type_act, int? page, int? page_size)
        {
            ShowroomModels showroomModels = new ShowroomModels();
            CityModels cityModels = new CityModels();
            DistrictModels districtModels = new DistrictModels();

            List<SelectListItem> list_city = new List<SelectListItem>();
            List<SelectListItem> list_district = new List<SelectListItem>();
            var list_showroom_view = new Web.Areas.Admin.ViewModels.List_showroom_view();
            StringBuilder sb = new StringBuilder();

            int total_record = 0;

            if (string.IsNullOrEmpty(type))
            {
                type = Request.QueryString["type"] != null ? Request.QueryString["type"].ToString() : CommonGlobal.RoleAdmin;
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

            if (city == null)
            {
                city = Request.QueryString["city"] != null ? Convert.ToInt32(Request.QueryString["city"].ToString()) : 0;
            }

            if (district == null)
            {
                district = Request.QueryString["district"] != null ? Convert.ToInt32(Request.QueryString["district"].ToString()) : 0;
            }

            if (string.IsNullOrEmpty(this.Lang))
            {
                this.Lang = LanguageModels.ActiveLanguage().LangCultureName;
            }

            if (page_size == null)
            {
                page_size = int.Parse(Util.GetConfigValue("NumberPageSizeAdmin", "30"));
            }

            list_showroom_view.Page = (int)page;
            list_showroom_view.Page_size = (int)page_size;

            list_showroom_view.List_city = cityModels.List_city((int)city);
            list_showroom_view.List_district = districtModels.List_district((int)city, (int)district);

            ////tab
            sb.Append("<li class=\"active\"><a class=\"active\" href=\"" + Url.Action("index", "dashboard", new { act = "list_showroom", ctrl = "adminShowroom", type = type, page = "1", city = city, district = district, lang = Lang }) + "\"><span><span>Danh sách Showroom</span></span></a></li>");
            sb.Append("<li><a href=\"" + Url.Action("index", "dashboard", new { act = "change_showroom", ctrl = "adminShowroom", type = type, type_act = "add", city = city, district = district, lang = Lang }) + "\"><span><span>Thêm Showroom</span></span></a></li>");
            list_showroom_view.Html_link_tab = sb.ToString();

            if (showroom_id != null && showroom_id != 0 && type_act != null && type_act == CommonGlobal.Delete)
            {
                ////check permission delete
                if (UserModels.CheckPermission(this.Session["mem"] != null ? this.Session["mem"].ToString() : string.Empty, act, ctrl, type_act, type)) 
                {
                    Showroom objShowroom = new Showroom();
                    objShowroom = showroomModels.GetShowroomById((int)showroom_id);
                    if (objShowroom != null)
                    {
                        ////delete post
                        bool rt = showroomModels.Delete((int)showroom_id);
                        if (rt)
                        {
                            list_showroom_view.Message = "Bạn đã xóa showroom: " + objShowroom.Name;
                        }
                        else
                        {
                            list_showroom_view.Message = "Xóa không thành công";
                        }
                    }
                    else
                    {
                        list_showroom_view.Message = "Không tìm thấy showroom: " + objShowroom.Name;
                    }
                }
                else
                {
                    list_showroom_view.Message = " Bạn không có quyền thực thi hành động xóa.";
                }
            }
            ////list post
            list_showroom_view.List_page_size = this.GetSizePagingPublic((int)page_size);
            list_showroom_view.Page_list_showroom = showroomModels.GetListShowroom((int)district, (int)page, (int)page_size, out total_record);
            list_showroom_view.Total_record = total_record;
            list_showroom_view.Type_act = type_act;
            ////action
            list_showroom_view.Act = act;
            list_showroom_view.Ctrl = ctrl;
            list_showroom_view.Parent_action = HttpContext.Request.RequestContext.RouteData.Values["action"].ToString();
            list_showroom_view.Parent_controller = HttpContext.Request.RequestContext.RouteData.Values["controller"].ToString();
            ////end action

            return this.PartialView("../control/list_showroom", list_showroom_view);
        }

        /// <summary>
        /// Loads the district by city.
        /// </summary>
        /// <param name="cityID">The city identifier.</param>
        /// <returns>load district by city</returns>
        public ActionResult Load_district_by_city(string cityID)
        {
            List<District> lstDistrict = new List<District>();
            DistrictModels districtModels = new DistrictModels();

            if (cityID == null || cityID == "0")
            {
                lstDistrict = districtModels.AllDistrict();
            }
            else
            {
                //////Your Code For Getting Physicans Goes Here
                lstDistrict = districtModels.GetListDistrictByCityID(Convert.ToInt32(cityID));
            }

            SelectList obgDistrict = new SelectList(lstDistrict, "DistrictID", "DistrictName", 0);

            return this.Json(obgDistrict);
        }
    }
}