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
        public IActionResult ListUser(string user_name, string path, string type_act, string type, string lang, string search, int? page, int? page_size, string order_by, string order_type)
        {
            BaseClass baseClass = new BaseClass();
            UserModels userModels = new UserModels();
            RoleModels roleModels = new RoleModels();
            User cuser = new User();

            var identity = (ClaimsIdentity)User.Identity;
            IEnumerable<Claim> claims = identity.Claims;
            var userLogin = claims.FirstOrDefault(c => c.Type == ClaimTypes.Email).Value;

            var listUserView = new AdminListUserView();
            int total_record = 0;

            type = type ?? string.Empty;

            path = string.IsNullOrEmpty(path) ? "/account/listUser" : string.Empty;

            if (type == string.Empty)
            {
                listUserView.Message = "Chúng tôi không tìm thấy danh sách bạn yêu cầu";
            }
            
            if (page == null || page == 0)
            {
                page = 1;
            }            

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
                order_by = "Username";
                order_type = "asc";
            }

            listUserView.Type = type;
            listUserView.Cate_type = roleModels.GetRoleByRole(type);
            listUserView.Lang = lang;
            listUserView.Type_act = type_act;

            ////list language
            listUserView.List_language = baseClass.ListSelectLanguage(lang);
            ////list page size and paging
            listUserView.List_page_size = baseClass.GetSizePagingPublic((int)page_size);
            listUserView.Page = (int)page;
            listUserView.Page_size = (int)page_size;
            ////list catalog
            listUserView.Page_list_user = userModels.AdminGetAllUser(type, lang, search, (int)page, (int)page_size, order_by, order_type, out total_record);
            listUserView.Search = search;
            listUserView.Order_by = order_by;
            listUserView.Order_type = order_type;
            listUserView.Total_record = total_record;

            return Json(listUserView);
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

            if(user != null)
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

            return response;
        }

        //// GET api/<controller>/abc@gmail.com
        //[HttpGet("{email}")]
        //public UserInfo Get(string email)
        //{
        //    UserModels sv = new UserModels();
        //    UserInfo iit = new UserInfo();

        //    iit = sv.GetUserInforByEmail(email);
        //    return iit;
        //}

        //// POST api/<controller>
        //// register new user
        //[HttpPost]
        //public void Post([FromBody]Register_view register_view)
        //{

        //}

        //// PUT api/<controller>/5
        //// update account infor by id
        //[HttpPut("{email}")]
        //public bool Put(string email, [FromBody]Register_view register_view)
        //{
        //    UserModels sv = new UserModels();
        //    User it = new User();
        //    UserInfo iit = new UserInfo();

        //    bool infors = false;

        //    iit.FName = register_view.FirstName;
        //    iit.Email = register_view.Email;
        //    iit.Address = register_view.Address;
        //    if (!string.IsNullOrEmpty(register_view.Birthday))
        //    {
        //        iit.Birthday = DateTime.Parse(register_view.Birthday);
        //    }

        //    iit.Phone = register_view.Phone;

        //    infors = sv.Add_User_Infor(iit);
        //    if (infors)
        //    {
        //        return true;
        //    }
        //    else
        //    {
        //        return false;
        //    }
        //}

        // DELETE api/<controller>/5

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

            string type_act = action != null ? action.Id.ToString() : string.Empty;

            string type = string.Empty;

            ////check permission delete
            if (UserModels.CheckPermission(userLogin, path, type_act, type))
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
