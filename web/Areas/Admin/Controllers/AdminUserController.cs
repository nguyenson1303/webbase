namespace Web.Areas.Admin.Controllers
{
    using System;
    using System.Collections.Generic;
    using System.Linq;
    using System.Text;
    using System.Web.Mvc;
    using System.Web.Script.Serialization;
    using Web.Areas.Admin.ViewModels;
    using Web.Controllers;
    using Web.Data;
    using Web.Models;

    /// <summary>
    /// adminUser Controller
    /// </summary>
    public class AdminUserController : BaseController
    {
        /// <summary>
        /// Changes the user.
        /// </summary>
        /// <param name="user_name">Name of the user.</param>
        /// <param name="type">The type.</param>
        /// <param name="act">The act.</param>
        /// <param name="ctrl">The control.</param>
        /// <param name="type_act">The type act.</param>
        /// <returns>change user</returns>
        [ChildActionOnly]
        [AcceptVerbs(HttpVerbs.Get)]
        public ActionResult Change_user(string user_name, string type, string act, string ctrl, string type_act)
        {
            UserModels userModels = new UserModels();
            RoleModels roleModels = new RoleModels();
            C_User cuser = new C_User();
            StringBuilder sb = new StringBuilder();
            var user_view = new Web.Areas.Admin.ViewModels.User_view();
            if (string.IsNullOrEmpty(type))
            {
                type = Request.QueryString["type"] != null ? Request.QueryString["type"].ToString() : CommonGlobal.CateProduct;
            }

            if (string.IsNullOrEmpty(act))
            {
                act = Request.QueryString["act"] != null ? Request.QueryString["act"].ToString() : "change_user";
            }

            if (string.IsNullOrEmpty(ctrl))
            {
                ctrl = Request.QueryString["ctrl"] != null ? Request.QueryString["ctrl"].ToString() : "adminUser";
            }

            if (user_name == null)
            {
                user_name = Request.QueryString["user_name"] != null ? Request.QueryString["user_name"].ToString() : string.Empty;
            }

            if (string.IsNullOrEmpty(type_act))
            {
                type_act = Request.QueryString["type_act"] != null ? Request.QueryString["type_act"].ToString() : CommonGlobal.Add;
                if (user_name == string.Empty)
                {
                    type_act = CommonGlobal.Add;
                }
                else
                {
                    type_act = CommonGlobal.Edit;
                }
            }

            sb.Append("<li><a href=\"" + Url.Action("index", "dashboard", new { act = "list_user", ctrl = "adminUser", type = type, page = "1" }) + "\"><span><span>Danh sách Admin</span></span></a></li>");
            if (type_act == CommonGlobal.Edit)
            {
                cuser = userModels.GetUserbyUserName(user_name);
                sb.Append("<li class=\"active\"><a href=\"#\"><span><span>" + cuser.Username + "</span></span></a></li>");
                if (type == "Admin")
                {
                    sb.Append("<li><a href=\"" + Url.Action("index", "dashboard", new { act = "list_user_permission", ctrl = "adminUser", type = type, page = "1", user_name = cuser.Username }) + "\"><span><span>Page Permission</span></span></a></li>");
                }

                user_view.Username = cuser.Username;
                user_view.Username_text = "readonly='readonly'";
                user_view.Role = cuser.Role;
                user_view.Online = cuser.Online ?? false;
                if (cuser.Online == true)
                {
                    user_view.Online = true;
                    user_view.Online_text = "checked='checked'";
                }
                else
                {
                    user_view.Online = false;
                    user_view.Online_text = string.Empty;
                }
            }
            else
            {
                if (type == "Admin")
                {
                    sb.Append("<li class=\"active\"><a href=\"#\"><span><span>Thêm Admin</span></span></a></li>");
                    user_view.Username_text = string.Empty;
                }
            }

            user_view.Html_link_tab = sb.ToString();
            user_view.Type = type;
            user_view.Type_act = type_act;
            ////action and parent action
            user_view.Act = act;
            user_view.Ctrl = ctrl;
            user_view.Parent_action = HttpContext.Request.RequestContext.RouteData.Values["action"].ToString();
            user_view.Parent_controller = HttpContext.Request.RequestContext.RouteData.Values["controller"].ToString();

            return this.PartialView("../control/change_user", user_view);
        }

        /// <summary>
        /// Changes the user.
        /// </summary>
        /// <param name="collection">The collection.</param>
        /// <returns>change user</returns>
        [ChildActionOnly]
        [AcceptVerbs(HttpVerbs.Post)]
        public ActionResult Change_user(FormCollection collection)
        {
            UserModels userModels = new UserModels();
            C_User cuser = null;
            StringBuilder sb = new StringBuilder();
            var user_view = new Web.Areas.Admin.ViewModels.User_view();
            this.TryUpdateModel(user_view);
            string rt = string.Empty;
            bool is_valid = true;
            if (!string.IsNullOrEmpty(user_view.Username))
            {
                cuser = userModels.GetUserbyUserName(user_view.Username);
            }

            ////validation server
            if (string.IsNullOrEmpty(user_view.Username))
            {
                is_valid = false;
                if (user_view.Message == string.Empty)
                {
                    user_view.Message = "Bạn phải nhập User Name";
                }
            }

            ////UserName duplicate Admin
            if (user_view.Username == "Admin")
            {
                is_valid = false;
                if (user_view.Message == string.Empty)
                {
                    user_view.Message = "Bạn không thể tạo Admin";
                }
            }
            ////Link tab
            sb.Append("<li><a href=\"" + Url.Action("index", "dashboard", new { act = "list_user", ctrl = "adminUser", type = user_view.Type, page = "1" }) + "\"><span><span>Danh sách Admin</span></span></a></li>");
            if (!string.IsNullOrEmpty(user_view.Username) && user_view.Type_act == CommonGlobal.Edit)
            {
                sb.Append("<li class=\"active\"><a href=\"#\"><span><span>" + cuser.Username + "</span></span></a></li>");
            }
            else
            {
                sb.Append("<li class=\"active\"><a href=\"#\"><span><span>Thêm mới</span></span></a></li>");
                ////validation password
                if (string.IsNullOrEmpty(user_view.Password))
                {
                    is_valid = false;
                    if (user_view.Message == string.Empty)
                    {
                        user_view.Message = "Bạn phải nhập mật khẩu";
                    }
                }

                if (string.IsNullOrEmpty(user_view.ConfirmPassword))
                {
                    is_valid = false;
                    if (user_view.Message == string.Empty)
                    {
                        user_view.Message = "Bạn phải xác nhận mật khẩu";
                    }
                }

                if (user_view.Password != user_view.ConfirmPassword)
                {
                    is_valid = false;
                    if (user_view.Message == string.Empty)
                    {
                        user_view.Message = "Bạn phải xác nhận mật khẩu";
                    }
                }
            }

            sb.Append("<li><a href=\"" + Url.Action("index", "dashboard", new { act = "list_user_permission", ctrl = "adminUser", type = user_view.Type, user_name = user_view.Username, page = "1" }) + "\"><span><span>Permission</span></span></a></li>");
            user_view.Html_link_tab = sb.ToString();
            if (!is_valid)
            {
                return this.PartialView("../control/change_user", user_view);
            }

            cuser = new C_User();
            cuser.Username = user_view.Username;
            cuser.Online = user_view.Online;

            if (cuser.Online == true)
            {
                user_view.Online = true;
                user_view.Online_text = "checked='checked'";
            }
            else
            {
                user_view.Online = false;
                user_view.Online_text = string.Empty;
            }

            if (!string.IsNullOrEmpty(user_view.Username) && user_view.Type_act == CommonGlobal.Edit)
            {
                rt = userModels.Update_User(cuser);
            }
            else
            {
                cuser.Role = 1;
                cuser.Password = MD5Extend.EncodePassword(user_view.Password);
                cuser.IP = "not login";
                cuser.Online = true;
                cuser.LastLogin = null;
                rt = userModels.Add_User(cuser);
            }

            if (rt.Length > 0)
            {
                user_view.Message = "Cập nhật thành công!";
                user_view.Username = rt;
                user_view.Type_act = CommonGlobal.Edit;
            }
            else
            {
                user_view.Message = "Cập nhật không thành công!";
            }

            return this.PartialView("../control/change_user", user_view);
        }

        /// <summary>
        /// Lists the log.
        /// </summary>
        /// <param name="id">The identifier.</param>
        /// <param name="from_date">From date.</param>
        /// <param name="to_date">To date.</param>
        /// <param name="act">The act.</param>
        /// <param name="ctrl">The control.</param>
        /// <param name="type_act">The type act.</param>
        /// <param name="type">The type.</param>
        /// <param name="search">The search.</param>
        /// <param name="page">The page.</param>
        /// <param name="page_size">The page size.</param>
        /// <param name="order_by">The order by.</param>
        /// <param name="order_type">Type of the order.</param>
        /// <returns>list log</returns>
        [ChildActionOnly]
        public ActionResult List_log(int? id, DateTime? from_date, DateTime? to_date, string act, string ctrl, string type_act, string type, string search, int? page, int? page_size, string order_by, string order_type)
        {
            LogModels logModels = new LogModels();
            Log logs = new Log();
            StringBuilder sb = new StringBuilder();
            var list_log_view = new Web.Areas.Admin.ViewModels.List_log_view();
            int total_record = 0;

            if (from_date == null)
            {
                from_date = DateTime.Now.AddMonths(-1);
            }

            if (to_date == null)
            {
                to_date = DateTime.Now;
            }

            if (string.IsNullOrEmpty(act))
            {
                act = Request.QueryString["act"] != null ? Request.QueryString["act"].ToString() : "list_log";
            }

            if (string.IsNullOrEmpty(ctrl))
            {
                ctrl = Request.QueryString["ctrl"] != null ? Request.QueryString["ctrl"].ToString() : "adminUser";
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
                order_by = "EventDateTime";
                order_type = "desc";
            }

            if (id != null && type_act != null && type_act == CommonGlobal.Delete)
            {
                ////check permission delete
                if (UserModels.CheckPermission(this.Session["mem"] != null ? this.Session["mem"].ToString() : string.Empty, act, ctrl, type_act, type ?? string.Empty)) 
                {
                    logs = logModels.GetLogbyID((int)id);
                    if (logs != null)
                    {
                        ////delete order
                        bool rt = logModels.Delete((int)id);
                        if (rt)
                        {
                            list_log_view.Message = "Bạn đã xóa log record :" + id;
                        }
                        else
                        {
                            list_log_view.Message = "Xóa không thành công";
                        }
                    }
                    else
                    {
                        list_log_view.Message = "Không tìm thấy log record : " + id;
                    }
                }
                else
                {
                    list_log_view.Message = " Bạn không có quyền thực thi hành động xóa.";
                }
            }

            list_log_view.Cate_type = "Log system";
            list_log_view.Type_act = type_act;
            ////tab
            sb.Append("<li class=\"active\"><a href=\"#\"><span><span>Log system</span></span></a></li>");
            list_log_view.Html_link_tab = sb.ToString();
            ////list page size and paging
            list_log_view.List_page_size = this.GetSizePagingPublic((int)page_size);
            list_log_view.Page = (int)page;
            list_log_view.Page_size = (int)page_size;
            ////list catalog
            list_log_view.Page_list_log = logModels.GetAllLogByAdmin((DateTime)from_date, (DateTime)to_date, search, (int)page, (int)page_size, order_by, order_type, out total_record);
            list_log_view.Search = search;
            list_log_view.Order_by = order_by;
            list_log_view.Order_type = order_type;
            list_log_view.Total_record = total_record;
            ////Filter
            list_log_view.Search = search;
            list_log_view.From_date = (DateTime)from_date;
            list_log_view.To_date = (DateTime)to_date;
            ////acton and parent action
            list_log_view.Act = act;
            list_log_view.Ctrl = ctrl;
            list_log_view.Parent_action = HttpContext.Request.RequestContext.RouteData.Values["action"].ToString();
            list_log_view.Parent_controller = HttpContext.Request.RequestContext.RouteData.Values["controller"].ToString();

            return this.PartialView("../control/list_log", list_log_view);
        }

        /// <summary>
        /// Lists the user.
        /// </summary>
        /// <param name="user_name">Name of the user.</param>
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
        /// <returns>list user</returns>
        [ChildActionOnly]
        public ActionResult List_user(string user_name, string act, string ctrl, string type_act, string type, string lang, string search, int? page, int? page_size, string order_by, string order_type)
        {
            UserModels userModels = new UserModels();
            RoleModels roleModels = new RoleModels();
            C_User cuser = new C_User();
            StringBuilder sb = new StringBuilder();
            var list_user_view = new Web.Areas.Admin.ViewModels.List_user_view();
            this.TryUpdateModel(list_user_view);
            int total_record = 0;

            if (string.IsNullOrEmpty(type))
            {
                type = Request.QueryString["type"] != null ? Request.QueryString["type"].ToString() : string.Empty;
            }

            if (type == string.Empty)
            {
                list_user_view.Message = "Chúng tôi không tìm thấy danh sách bạn yêu cầu";
            }

            if (string.IsNullOrEmpty(act))
            {
                act = Request.QueryString["act"] != null ? Request.QueryString["act"].ToString() : "list_user";
            }

            if (string.IsNullOrEmpty(ctrl))
            {
                ctrl = Request.QueryString["ctrl"] != null ? Request.QueryString["ctrl"].ToString() : "adminUser";
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

            if (user_name != null && type_act != null && type_act == CommonGlobal.Delete)
            {
                ////check permission delete
                if (UserModels.CheckPermission(this.Session["mem"] != null ? this.Session["mem"].ToString() : string.Empty, act, ctrl, type_act, type ?? string.Empty)) 
                {
                    cuser = userModels.GetUserbyUserName(user_name);
                    if (cuser != null)
                    {
                        ////delete user
                        bool rt = userModels.Delete_User(user_name);
                        if (rt)
                        {
                            list_user_view.Message = "Bạn đã xóa " + user_name;
                        }
                        else
                        {
                            list_user_view.Message = "Xóa không thành công";
                        }
                    }
                    else
                    {
                        list_user_view.Message = "Không tìm thấy  : " + user_name;
                    }
                }
                else
                {
                    list_user_view.Message = " Bạn không có quyền thực thi hành động xóa.";
                }
            }

            if (string.IsNullOrEmpty(order_by) || string.IsNullOrEmpty(order_type))
            {
                order_by = "Username";
                order_type = "asc";
            }

            list_user_view.Type = type;
            list_user_view.Cate_type = roleModels.GetRoleByRole(type);
            list_user_view.Lang = lang;
            list_user_view.Type_act = type_act;
            ////tab
            sb.Append("<li class=\"active\"><a href=\"#\"><span><span>Danh sách "+ list_user_view.Cate_type + "</span></span></a></li>");
            if (type == "Admin")
            {
                sb.Append("<li><a href=\"" + Url.Action("index", "dashboard", new { act = "change_user", ctrl = "adminUser", type = type, type_act = CommonGlobal.Add }) + "\"><span><span>Thêm " + list_user_view.Cate_type + "</span></span></a></li>");
            }

            list_user_view.Html_link_tab = sb.ToString();
            ////list language
            list_user_view.List_language = this.List_select_language(this.Lang);
            ////list page size and paging
            list_user_view.List_page_size = this.GetSizePagingPublic((int)page_size);
            list_user_view.Page = (int)page;
            list_user_view.Page_size = (int)page_size;
            ////list catalog
            list_user_view.Page_list_user = userModels.AdminGetAllUser(type, lang, search, (int)page, (int)page_size, order_by, order_type, out total_record);
            list_user_view.Search = search;
            list_user_view.Order_by = order_by;
            list_user_view.Order_type = order_type;
            list_user_view.Total_record = total_record;
            ////acton and parent action
            list_user_view.Act = act;
            list_user_view.Ctrl = ctrl;
            list_user_view.Parent_action = HttpContext.Request.RequestContext.RouteData.Values["action"].ToString();
            list_user_view.Parent_controller = HttpContext.Request.RequestContext.RouteData.Values["controller"].ToString();

            return this.PartialView("../control/list_user", list_user_view);
        }

        /// <summary>
        /// Lists the user permission.
        /// </summary>
        /// <param name="user_name">Name of the user.</param>
        /// <param name="type">The type.</param>
        /// <param name="act">The act.</param>
        /// <param name="ctrl">The control.</param>
        /// <param name="type_act">The type act.</param>
        /// <returns>list user permission</returns>
        [ChildActionOnly]
        [AcceptVerbs(HttpVerbs.Get)]
        public ActionResult List_user_permission(string user_name, string type, string act, string ctrl, string type_act)
        {
            UserModels userModels = new UserModels();
            var permission_view = new Web.Areas.Admin.ViewModels.List_user_permission_view();
            StringBuilder sb = new StringBuilder();

            if (string.IsNullOrEmpty(type))
            {
                type = Request.QueryString["type"] != null ? Request.QueryString["type"].ToString() : CommonGlobal.RoleAdmin;
            }

            if (string.IsNullOrEmpty(act))
            {
                act = Request.QueryString["act"] != null ? Request.QueryString["act"].ToString() : "list_user_permission";
            }

            if (string.IsNullOrEmpty(ctrl))
            {
                ctrl = Request.QueryString["ctrl"] != null ? Request.QueryString["ctrl"].ToString() : "adminUser";
            }

            if (user_name == null)
            {
                user_name = Request.QueryString["user_name"] != null ? Request.QueryString["user_name"].ToString() : string.Empty;
            }

            List<PagePermission> lstPagePermission = userModels.GetListPermissionByUser(user_name);
            permission_view.List_permission = lstPagePermission;
            permission_view.TotalPage = lstPagePermission.Where(p => p.Parent_ID > 0).ToList().Count;
            permission_view.User_name = user_name;
            permission_view.Type = type;
            permission_view.Type_act = type_act;

            sb.Append("<li><a href=\"" + Url.Action("index", "dashboard", new { act = "list_user", ctrl = "adminUser", type = type, page = "1" }) + "\"><span><span>Danh sách Admin</span></span></a></li>");
            sb.Append("<li><a href=\"" + Url.Action("index", "dashboard", new { act = "change_user", ctrl = "adminUser", type = type, type_act = CommonGlobal.Edit, user_name = user_name }) + "\"><span><span>Cập nhật Admin</span></span></a></li>");
            sb.Append("<li class=\"active\"><a href=\"#\"><span>Page Permission</span></a></li>");
            permission_view.Html_link_tab = sb.ToString();

            ////action and parent action
            permission_view.Act = act;
            permission_view.Ctrl = ctrl;
            permission_view.Parent_action = HttpContext.Request.RequestContext.RouteData.Values["action"].ToString();
            permission_view.Parent_controller = HttpContext.Request.RequestContext.RouteData.Values["controller"].ToString();

            return this.PartialView("../control/list_user_permission", permission_view);
        }

        /// <summary>
        /// Lists the user permission.
        /// </summary>
        /// <param name="collection">The collection.</param>
        /// <param name="type">The type.</param>
        /// <param name="act">The act.</param>
        /// <param name="ctrl">The control.</param>
        /// <param name="type_act">The type act.</param>
        /// <returns>list user permission</returns>
        [ChildActionOnly]
        [AcceptVerbs(HttpVerbs.Post)]
        public ActionResult List_user_permission(FormCollection collection, string type, string act, string ctrl, string type_act)
        {
            UserModels userModels = new UserModels();
            var permission_view = new Web.Areas.Admin.ViewModels.List_user_permission_view();
            this.TryUpdateModel(permission_view);
            StringBuilder sb = new StringBuilder();

            if (string.IsNullOrEmpty(type))
            {
                type = collection["type"].ToString();
            }

            if (string.IsNullOrEmpty(act))
            {
                act = Request.QueryString["act"] != null ? Request.QueryString["act"].ToString() : "list_user_permission";
            }

            if (string.IsNullOrEmpty(ctrl))
            {
                ctrl = Request.QueryString["ctrl"] != null ? Request.QueryString["ctrl"].ToString() : "adminUser";
            }

            string user_name = collection["user_name"].ToString();

            int totalPage = 0;
            if (!string.IsNullOrEmpty(collection["totalPage"]))
            {
                totalPage = int.Parse(collection["totalPage"]);
            }

            for (int i = 1; i <= totalPage; ++i)
            {
                string index = "page_" + i;
                if (!string.IsNullOrEmpty(collection[index]))
                {
                    C_UserPermission objUserPermission = new C_UserPermission();
                    int pageID = int.Parse(collection[index]);
                    objUserPermission.page_id = pageID;
                    objUserPermission.user = user_name;

                    string strAdd = collection["add_" + pageID];
                    if (strAdd.Contains("true"))
                    {
                        objUserPermission.add = true;
                    }
                    else
                    {
                        objUserPermission.add = false;
                    }

                    string strEdit = collection["edit_" + pageID];
                    if (strEdit.Contains("true"))
                    {
                        objUserPermission.edit = true;
                    }
                    else
                    {
                        objUserPermission.edit = false;
                    }

                    string strDelete = collection["delete_" + pageID];
                    if (strDelete.Contains("true"))
                    {
                        objUserPermission.del = true;
                    }
                    else
                    {
                        objUserPermission.del = false;
                    }

                    string strView = collection["view_" + pageID];
                    if (strView.Contains("true"))
                    {
                        objUserPermission.view = true;
                    }
                    else
                    {
                        objUserPermission.view = false;
                    }

                    userModels.UpdatePermission(objUserPermission);
                }
            }

            permission_view.Message = "Cập nhật thành công.";

            List<PagePermission> lstPagePermission = userModels.GetListPermissionByUser(user_name);
            permission_view.List_permission = lstPagePermission;
            permission_view.TotalPage = lstPagePermission.Count;
            permission_view.User_name = user_name;
            permission_view.Type = type;

            sb.Append("<li><a href=\"" + Url.Action("index", "dashboard", new { act = "list_user", ctrl = "adminUser", type = type, page = "1" }) + "\"><span><span>Danh sách Admin</span></span></a></li>");
            sb.Append("<li><a href=\"" + Url.Action("index", "dashboard", new { act = "change_user", ctrl = "adminUser", type = type, type_act = CommonGlobal.Edit, user_name = user_name }) + "\"><span><span>Cập nhật Admin</span></span></a></li>");
            sb.Append("<li class=\"active\"><a href=\"#\"><span>Page Permission</span></a></li>");
            permission_view.Html_link_tab = sb.ToString();

            ////action and parent action
            permission_view.Parent_action = HttpContext.Request.RequestContext.RouteData.Values["action"].ToString();
            permission_view.Parent_controller = HttpContext.Request.RequestContext.RouteData.Values["controller"].ToString();

            return this.PartialView("../control/list_user_permission", permission_view);
        }

        /// <summary>
        /// Updates the status user.
        /// </summary>
        /// <param name="user_name">Name of the user.</param>
        /// <param name="status">The status.</param>
        /// <param name="type">The type.</param>
        /// <returns>update status user</returns>
        public ActionResult Update_status_user(string user_name, string status, string type)
        {
            UserModels userModels = new UserModels();
            C_User cuser = new C_User();
            bool isOk = false;
            if (UserModels.CheckPermission(this.Session["mem"] != null ? this.Session["mem"].ToString() : string.Empty, "change_user", "adminUser", CommonGlobal.Edit, type))
            {
                isOk = true;
            }
            else
            {
                isOk = false;
            }

            if (!string.IsNullOrEmpty(user_name))
            {
                cuser = userModels.GetUserbyUserName(user_name);
                if (cuser != null)
                {
                    try
                    {
                        if (bool.Parse(status) == true)
                        {
                            cuser.Online = true;
                        }
                        else
                        {
                            cuser.Online = false;
                        }

                        if (isOk)
                        {
                            userModels.Update_User(cuser);
                        }
                    }
                    catch (Exception)
                    {
                    }
                }
            }

            var jsonSerialiser = new JavaScriptSerializer();
            var results = Convert.ToDateTime(DateTime.Now).ToString("dd/MM/yyyy") + "|" + cuser.Online;

            return this.Json(results);
        }
    }
}