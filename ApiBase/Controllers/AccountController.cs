using System.Collections.Generic;
using System.Linq;
using System.Security.Claims;
using ApiBase.Models.BusinessAccess;
using ApiBase.Models.DB;
using DBBase.EntitysObject;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;
using Web.Areas.Admin.ViewModels;

// For more information on enabling Web API for empty projects, visit https://go.microsoft.com/fwlink/?LinkID=397860

namespace ApiBase.Controllers
{
    [Route("api/[controller]")]
    public class AccountController : Controller
    {
        // GET: api/<controller>
        [HttpGet, Authorize]
        public UserInfo Get()
        {
            UserModels sv = new UserModels();

            var identity = (ClaimsIdentity)User.Identity;
            IEnumerable<Claim> claims = identity.Claims;
            var userLogin = claims.FirstOrDefault(c => c.Type == ClaimTypes.Email).Value;
            var userInfor = sv.GetUserInforByEmail(userLogin);
            return userInfor;
        }

        [HttpGet("listUser"), Authorize(Roles = "Admin")]
        public IActionResult ListUser(string type, string lang, string search, int? pageIndex, int? pageSize, string orderBy, string orderType)
        {
            IActionResult response = null;
            BaseClass baseClass = new BaseClass();
            UserModels userModels = new UserModels();
            RoleModels roleModels = new RoleModels();
            User cuser = new User();

            var identity = (ClaimsIdentity)User.Identity;
            IEnumerable<Claim> claims = identity.Claims;
            var userLogin = claims.FirstOrDefault(c => c.Type == ClaimTypes.Email).Value;

            var mess = string.Empty;
            var listUserView = new AdminListUserView();
            int total_record = 0;

            type = type ?? string.Empty;

            string path = "/api/account/listUser";

            var action = userModels.GetActionByActionName(CommonGlobal.View);

            string typeAct = action != null ? action.Id.ToString() : string.Empty;

            if (type == string.Empty)
            {
                mess = "Chúng tôi không tìm thấy danh sách bạn yêu cầu";
                response = StatusCode(200, Json(new { code = 2, message = mess }));
            }
            
            if (pageIndex == null || pageIndex == 0)
            {
                pageIndex = 1;
            }            

            if (string.IsNullOrEmpty(lang))
            {
                lang = LanguageModels.ActiveLanguage().LangCultureName;
            }

            if (pageSize == null)
            {
                pageSize = 30;
            }

            if (string.IsNullOrEmpty(orderBy) || string.IsNullOrEmpty(orderType))
            {
                orderBy = "Username";
                orderType = "asc";
            }

            ////check permission update
            if (UserModels.CheckPermission(userLogin, path, typeAct, type))
            {
                listUserView.Type = type;
                listUserView.CateType = roleModels.GetRoleByRole(type);
                listUserView.Lang = lang;
                listUserView.TypeAct = typeAct;

                ////list language
                listUserView.List_language = baseClass.ListSelectLanguage(lang);

                ////list page size and paging
                listUserView.List_page_size = baseClass.GetSizePagingPublic((int)pageSize);
                listUserView.Page = (int)pageIndex;
                listUserView.Page_size = (int)pageSize;

                ////list catalog
                listUserView.Page_list_user = userModels.AdminGetAllUser(type, lang, search, (int)pageIndex, (int)pageSize, orderBy, orderType, out total_record);
                listUserView.Search = search;
                listUserView.Order_by = orderBy;
                listUserView.Order_type = orderType;
                listUserView.Total_record = total_record;

                response = Json(listUserView);
            }
            else
            {
                mess = "Bạn không có quyền xem danh sách này";
                response = StatusCode(200, Json(new { code = 4, message = mess }));
            }                        

            return response;
        }

        [HttpPost("changePassword")]
        [Authorize]
        public IActionResult ChangePassword([FromBody]ChangePasswordView login)
        {
            UserModels sv = new UserModels();
            IActionResult response = null;
            var mess = string.Empty;

            var identity = (ClaimsIdentity)User.Identity;
            IEnumerable<Claim> claims = identity.Claims;
            var userLogin = claims.FirstOrDefault(c => c.Type == ClaimTypes.Email).Value;

            if (!string.IsNullOrEmpty(login.Password) && !string.IsNullOrEmpty(login.ConfirmPassword))
            {
                // user change password
                User user = sv.GetUserbyUserName(userLogin);
                if (user != null && MD5Extend.EncodePassword(login.OldPassword) == user.Password)
                {
                    if (login.Password == login.ConfirmPassword)
                    {
                        user.Password = MD5Extend.EncodePassword(login.Password);
                        sv.UpdateUserPassword(user);
                        mess = "Thay đổi mật khẩu thành công !";
                        response = StatusCode(200, Json(new { code = 1, message = mess }));
                    }
                    else
                    {
                        mess = "Vui lòng xác nhận lại mật khẩu !";
                        response = StatusCode(200, Json(new { code = 2, message = mess }));
                    }
                }
            }

            return response;
        }

        // POST api/<controller>
        [HttpPost]
        [Authorize(Roles = "Admin")]
        public IActionResult Post([FromBody]AdminUserView userView)
        {
            IActionResult response = null;
            UserModels userModels = new UserModels();
            User user = null;
            var mess = string.Empty;
            string rt = string.Empty;
            bool is_valid = true;

            if (!string.IsNullOrEmpty(userView.Username))
            {
                user = userModels.GetUserbyUserName(userView.Username);

                if(user != null)
                {
                    is_valid = false;
                    if (mess == string.Empty)
                    {
                        mess = "Tài khoản đã tồn tại";
                        response = StatusCode(200, Json(new { code = 4, message = mess }));
                    }
                }                
            }

            ////validation server
            if (string.IsNullOrEmpty(userView.Username))
            {
                is_valid = false;
                if (mess == string.Empty)
                {
                    mess = "Bạn phải nhập User Name";
                    response = StatusCode(200, Json(new { code = 2, message = mess }));
                }
            }

            ////UserName duplicate Admin
            if (userView.Username == "Admin")
            {
                is_valid = false;
                if (mess == string.Empty)
                {
                    mess = "Bạn không thể tạo Admin";
                    response = StatusCode(200, Json(new { code = 3, message = mess }));
                }
            }

            // validation password
            if (string.IsNullOrEmpty(userView.Password))
            {
                is_valid = false;
                if (mess == string.Empty)
                {
                    mess = "Bạn phải nhập mật khẩu";
                    response = StatusCode(200, Json(new { code = 5, message = mess }));
                }
            }

            if (string.IsNullOrEmpty(userView.ConfirmPassword))
            {
                is_valid = false;
                if (mess == string.Empty)
                {
                    mess = "Bạn phải xác nhận mật khẩu";
                    response = StatusCode(200, Json(new { code = 5, message = mess }));
                }
            }

            if (userView.Password != userView.ConfirmPassword)
            {
                is_valid = false;
                if (mess == string.Empty)
                {
                    mess = "Bạn phải xác nhận mật khẩu";
                    response = StatusCode(200, Json(new { code = 5, message = mess }));
                }
            }

            if(userModels.GetRolebyId(userView.Role) == null)
            {
                is_valid = false;
                if (mess == string.Empty)
                {
                    mess = "Role id không hợp lệ";
                    response = StatusCode(200, Json(new { code = 5, message = mess }));
                }
            }       

            if (!is_valid)
            {
                return response;
            }

            user = new User();
            user.Username = userView.Username;
            user.Online = userView.Online;            
            user.Role = user.Role;
            user.Password = MD5Extend.EncodePassword(userView.Password);
            user.Ip = userView.Ip;
            user.Online = userView.Online;
            user.LastLogin = null;

            rt = userModels.AddUser(user);
                       
            if (rt.Length > 0)
            {
                mess = "Tạo tài khoản thành công";
                userView.Username = rt;
                response = StatusCode(200, Json(new { code = 1, message = mess }));
            }
            else
            {
                mess = "Tạo tài khoản thất bại";
                response = StatusCode(200, Json(new { code = 6, message = mess }));
            }

            return response;
        }

        // PUT api/<controller>/email
        [HttpPut("{userName}")]
        public IActionResult Put(string userName, [FromBody]AdminEditUserView userView)
        {
            IActionResult response = null;
            UserModels userModels = new UserModels();
            User user = null;
            var mess = string.Empty;
            string rt = string.Empty;
            bool is_valid = true;

            var identity = (ClaimsIdentity)User.Identity;
            IEnumerable<Claim> claims = identity.Claims;
            var userLogin = claims.FirstOrDefault(c => c.Type == ClaimTypes.Email).Value;

            string path = "/api/account";

            var action = userModels.GetActionByActionName(CommonGlobal.Edit);

            string typeAct = action != null ? action.Id.ToString() : string.Empty;

            string type = string.Empty;          

            if (!string.IsNullOrEmpty(userName))
            {
                user = userModels.GetUserbyUserName(userName);
            }

            ////validation server
            if (string.IsNullOrEmpty(userView.Username))
            {
                is_valid = false;
                if (mess == string.Empty)
                {
                    mess = "Bạn phải nhập User Name";
                    response = StatusCode(200, Json(new { code = 2, message = mess }));
                }
            }

            ////UserName duplicate Admin
            if (userView.Username == "Admin")
            {
                is_valid = false;
                if (mess == string.Empty)
                {
                    mess = "UserName không hợp lệ!";
                    response = StatusCode(200, Json(new { code = 3, message = mess }));
                }
            }

            if (!is_valid)
            {
                return response;
            }

            ////check permission update
            if (UserModels.CheckPermission(userLogin, path, typeAct, type))
            {
                if (user != null)
                {
                    user.Username = userView.Username;
                    user.Online = userView.Online;
                    user.Role = userView.Role;
                    user.Ip = userView.Ip;

                    rt = userModels.UpdateUser(userName, user);
                }

                if (rt.Length > 0)
                {
                    mess = "Cập nhật thành công!";
                    userView.Username = rt;
                    response = StatusCode(200, Json(new { code = 1, message = mess }));
                }
                else
                {
                    mess = "Cập nhật không thành công!";
                    response = StatusCode(200, Json(new { code = 6, message = mess }));
                }
            }
            else
            {
                mess = "Bạn không có quyền cập nhật.";
                response = StatusCode(200, Json(new { code = 4, message = mess }));
            }

            return response;
        }

        // DELETE api/<controller>/email
        [HttpDelete("{userName}")]
        public IActionResult Delete(string userName)
        {
            IActionResult response = null;
            string mess = string.Empty;
            UserModels userModels = new UserModels();
            var identity = (ClaimsIdentity)User.Identity;
            IEnumerable<Claim> claims = identity.Claims;
            var userLogin = claims.FirstOrDefault(c => c.Type == ClaimTypes.Email).Value;

            string path = "/api/account";

            var action = userModels.GetActionByActionName(CommonGlobal.Delete);

            string typeAct = action != null ? action.Id.ToString() : string.Empty;

            string type = string.Empty;

            ////check permission delete
            if (UserModels.CheckPermission(userLogin, path, typeAct, type))
            {
                User cuser = userModels.GetUserbyUserName(userName);
                if (cuser != null)
                {
                    //// delete user
                    bool rt = userModels.DeleteUser(userName);
                    if (rt)
                    {
                        mess = "Bạn đã xóa " + userName;
                        response = StatusCode(200, Json(new { code = 1, message = mess }));
                    }
                    else
                    {
                        mess = "Xóa không thành công";
                        response = StatusCode(200, Json(new { code = 2, message = mess }));
                    }
                }
                else
                {
                    mess = "Không tìm thấy  : " + userName;
                    response = StatusCode(200, Json(new { code = 3, message = mess }));
                }
            }
            else
            {
                mess = " Bạn không có quyền thực thi hành động xóa.";
                response = StatusCode(200, Json(new { code = 4, message = mess }));
            }

            return response;
        }
    }
}
