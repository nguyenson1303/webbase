using System.Collections.Generic;
using System.Linq;
using System.Security.Claims;
using ApiBase.Models.BusinessAccess;
using ApiBase.Models.DB;
using ApiBase.Models.ViewModels;
using DBBase.EntitysObject;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;
using Web.Areas.Admin.ViewModels;
using ApiBase.Models.BusinessAccess;

// For more information on enabling Web API for empty projects, visit https://go.microsoft.com/fwlink/?LinkID=397860

namespace ApiBase.Controllers
{
    [Route("api/[controller]")]
    public class AccountController : Controller
    {
        // GET: api/<controller>
        [HttpGet]
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

            //if (user_name != null && type_act != null && type_act == CommonGlobal.Delete)
            //{
            //    ////check permission delete
            //    if (UserModels.CheckPermission(userLogin, path, type_act, type ?? string.Empty))
            //    {
            //        cuser = userModels.GetUserbyUserName(user_name);
            //        if (cuser != null)
            //        {
            //            ////delete user
            //            bool rt = userModels.Delete_User(user_name);
            //            if (rt)
            //            {
            //                listUserView.Message = "Bạn đã xóa " + user_name;
            //            }
            //            else
            //            {
            //                listUserView.Message = "Xóa không thành công";
            //            }
            //        }
            //        else
            //        {
            //            listUserView.Message = "Không tìm thấy  : " + user_name;
            //        }
            //    }
            //    else
            //    {
            //        listUserView.Message = " Bạn không có quyền thực thi hành động xóa.";
            //    }
            //}

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
                        sv.UpdateUser(user);
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
            
            if (!string.IsNullOrEmpty(userView.Username) && userView.Type_act == CommonGlobal.Edit)
            {
                // update
            }
            else
            {
                // create new
                // validation password
                if (string.IsNullOrEmpty(userView.Password))
                {
                    is_valid = false;
                    if (mess == string.Empty)
                    {
                        mess = "Bạn phải nhập mật khẩu";
                        response = StatusCode(200, Json(new { code = 4, message = mess }));
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
            }
           
            if (!is_valid)
            {
                return response;
            }

            user = new User();
            user.Username = userView.Username;
            user.Online = userView.Online;

            if (user.Online == true)
            {
                userView.Online = true;
                userView.Online_text = "checked='checked'";
            }
            else
            {
                userView.Online = false;
                userView.Online_text = string.Empty;
            }

            if (!string.IsNullOrEmpty(userView.Username) && userView.Type_act == CommonGlobal.Edit)
            {
                rt = userModels.UpdateUser(user);
            }
            else
            {
                user.Role = 1;
                user.Password = MD5Extend.EncodePassword(userView.Password);
                user.Ip = "not login";
                user.Online = true;
                user.LastLogin = null;
                rt = userModels.Add_User(user);
            }

            if (rt.Length > 0)
            {
                mess = "Cập nhật thành công!";
                userView.Username = rt;
                userView.Type_act = CommonGlobal.Edit;
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
        [HttpDelete("{id}")]
        public void Delete(int id)
        {
        }
    }
}
