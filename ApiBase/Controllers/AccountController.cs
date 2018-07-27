using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Net.Http.Headers;
using System.Security.Claims;
using System.Threading.Tasks;
using ApiBase.Models.AdminViewModels;
using ApiBase.Models.BusinessAccess;
using ApiBase.Models.DB;
using DBBase.EntitysObject;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Hosting;
using Microsoft.AspNetCore.Mvc;

// For more information on enabling Web API for empty projects, visit https://go.microsoft.com/fwlink/?LinkID=397860

namespace ApiBase.Controllers
{
    [Route("api/[controller]")]
    public class AccountController : Controller
    {
        private IHostingEnvironment _hostingEnvironment;

        // GET: api/<controller>
        // get login user profile
        [HttpGet, Authorize]
        public IActionResult Get()
        {
            UserModels sv = new UserModels();
            IActionResult response = null;
            var identity = (ClaimsIdentity)User.Identity;
            IEnumerable<Claim> claims = identity.Claims;
            var userLogin = claims.FirstOrDefault(c => c.Type == ClaimTypes.Email).Value;

            var userInfor = sv.GetUserInforByEmail(userLogin);
            if(userInfor != null)
            {
                response = Json(userInfor);
            }
            else
            {
                response = Json(new { code = Constant.NotExist, message = Constant.MessageNotExist });
            }            

            return response;
        }

        // GET: api/<controller>/getUserDetail
        [HttpGet("getUserDetail")]
        [Authorize(Roles = "Admin")]
        public IActionResult GetUserDetail(string userName)
        {
            UserModels sv = new UserModels();
            IActionResult response = null;
                       
            var userDetail = sv.GetUserbyUserName(userName);
            if (userDetail != null)
            {
                userDetail.Password = string.Empty;
                response = Json(userDetail);
            }
            else
            {
                response = Json(new { code = Constant.NotExist, message = Constant.MessageNotExist });
            }

            return response;
        }

        // GET: api/<controller>
        // get login user profile
        [HttpGet("getUserInforDetail")]
        [Authorize(Roles = "Admin")]
        public IActionResult getUserInforDetail(string userName)
        {
            UserModels sv = new UserModels();
            IActionResult response = null;
        
            var userInfor = sv.GetUserInforByEmail(userName);
            if (userInfor != null)
            {
                response = Json(userInfor);
            }
            else
            {
                response = Json(new { code = Constant.NotExist, message = Constant.MessageNotExist });
            }

            return response;
        }

        [HttpGet("listUser"), Authorize(Roles = "Admin")]
        public IActionResult ListUser(string type, string search, int? pageIndex, int? pageSize, string orderBy, string orderType)
        {
            IActionResult response = null;
            BaseClass baseClass = new BaseClass();
            UserModels userModels = new UserModels();
            RoleModels roleModels = new RoleModels();
            User cuser = new User();

            var mess = string.Empty;
            var listUserView = new AdminListUserView();
            var isOk = true;

            string lang = LanguageModels.ActiveLanguage().LangCultureName;

            type = type ?? string.Empty;

            if (type == string.Empty)
            {
                isOk = false;
                response = Json(new { code = Constant.NotExist, message = Constant.MessageNotExist });
            }

            if (!isOk)
            {
                return response;
            }
            
            if (pageIndex == null || pageIndex == 0)
            {
                pageIndex = 1;
            }            

            if (pageSize == null)
            {
                pageSize = 25;
            }

            if (string.IsNullOrEmpty(orderBy) || string.IsNullOrEmpty(orderType))
            {
                orderBy = "Username";
                orderType = "asc";
            }

            listUserView.ListUser = userModels.AdminGetAllUser(type, lang, search, (int)pageIndex, (int)pageSize, orderBy, orderType, out int total_record);
            listUserView.CateType = roleModels.GetRoleByRole(type);
            listUserView.PageIndex = (int)pageIndex;
            listUserView.PageSize = (int)pageSize;
            listUserView.TotalPage = total_record > 0 ? (int)System.Math.Ceiling((double)total_record / (double)pageSize) : 0;
            listUserView.TotalRecord = total_record;

            response = Json(listUserView);

            return response;
        }

        [HttpGet("listUserPermission"), Authorize(Roles = "Admin")]
        public IActionResult ListUserPermission(string userName)
        {
            IActionResult response = null;
            BaseClass baseClass = new BaseClass();
            UserModels userModels = new UserModels();
            RoleModels roleModels = new RoleModels();
            User cuser = new User();

            var mess = string.Empty;

            var identity = (ClaimsIdentity)User.Identity;
            IEnumerable<Claim> claims = identity.Claims;
            var userLogin = claims.FirstOrDefault(c => c.Type == ClaimTypes.Email).Value;
          
            List<PagePermission> lstPagePermission = userModels.GetListPermissionByUser(userName);

            response = Json(lstPagePermission);

            return response;
        }

        [HttpPost("saveUserPermission")]
        [Authorize(Roles = "Admin")]
        public IActionResult SaveUserPermission([FromBody]AdminSaveUserPermissionView saveView)
        {
            UserModels sv = new UserModels();
            IActionResult response = null;

            if(saveView.ListPermission.Count() > 0)
            {
                foreach(var item in saveView.ListPermission)
                {
                    UserPermission up = new UserPermission
                    {
                        PageId = item.PageId,
                        User = item.UserName,
                        // TypeActionId = item.ListActionId
                    };
                    sv.UpdatePermission(up);
                }
            }

            response = Json(new { code = Constant.Success, message = Constant.MessageUpdateCompleted });

            return response;
        }

        [HttpPost("changePassword")]
        [Authorize]
        public IActionResult ChangePassword([FromBody]ChangePasswordView login)
        {
            UserModels sv = new UserModels();
            IActionResult response = null;

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
                        response = Json(new { code = Constant.Success, message = Constant.MessageUpdateCompleted });
                    }
                    else
                    {
                        response = Json(new { code = Constant.Fail, message = Constant.MessageConfirmPassword });
                    }
                }
            }
            else
            {
                response = Json(new { code = Constant.NotExist, message = Constant.MessageNotExist });
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

            user = new User
            {
                Username = userView.Username,
                Online = userView.Online,
                Role = userView.Role,
                Password = MD5Extend.EncodePassword(userView.Password),
                Ip = userView.Ip,
                LastLogin = null
            };

            rt = userModels.AddUser(user, userView);

            if (rt.Length > 0)
            {
                response = Json(new { code = Constant.Success, message = Constant.MessageCreateCompleted });
            }
            else
            {
                response = Json(new { code = Constant.Fail, message = Constant.MessageCreateUncompleted });
            }

            return response;
        }

        // POST api/<controller>
        [HttpPost("validateUser")]
        [Authorize(Roles = "Admin")]
        public IActionResult ValidateUser([FromBody]AdminUserValidateView userView)
        {
            IActionResult response = null;
            UserModels userModels = new UserModels();
            User user = new User();
            var mess = string.Empty;
            string rt = string.Empty;
            bool is_valid = true;
            if (userView.IsCreate)
            {
                if (!string.IsNullOrEmpty(userView.Username))
                {
                    user = userModels.GetUserbyUserName(userView.Username);

                    if (user != null)
                    {
                        is_valid = false;
                        if (mess == string.Empty)
                        {
                            response = Json(new { code = Constant.Duplicate, message = Constant.MessageDuplicate, field = "username" });
                        }
                    }
                }
            }

            ////validation server
            if (string.IsNullOrEmpty(userView.Username))
            {
                is_valid = false;
                if (mess == string.Empty)
                {
                    mess = Constant.MessageDataEmpty;
                    response = Json(new { code = Constant.Empty, message = mess, field = "username" });
                }
            }

            ////UserName duplicate Admin
            if (userView.Username == "Admin")
            {
                is_valid = false;
                if (mess == string.Empty)
                {
                    mess = Constant.MessageNotValid;
                    response = Json(new { code = Constant.Fail, message = mess, field = "username" });
                }
            }

            if (userView.IsCreate)
            {
                // validation password
                if (string.IsNullOrEmpty(userView.Password))
                {
                    is_valid = false;
                    if (mess == string.Empty)
                    {
                        mess = Constant.MessageDataEmpty;
                        response = Json(new { code = Constant.Empty, message = mess, field = "password" });
                    }
                }

                if (string.IsNullOrEmpty(userView.ConfirmPassword))
                {
                    is_valid = false;
                    if (mess == string.Empty)
                    {
                        mess = Constant.MessageDataEmpty;
                        response = Json(new { code = Constant.Empty, message = mess, field = "confirmPassword" });
                    }
                }

                if (userView.Password != userView.ConfirmPassword)
                {
                    is_valid = false;
                    if (mess == string.Empty)
                    {
                        mess = Constant.MessageConfirmPassword;
                        response = Json(new { code = Constant.Fail, message = mess, field = "confirmPassword" });
                    }
                }
            }            

            if (userModels.GetRolebyId(userView.Role) == null)
            {
                is_valid = false;
                if (mess == string.Empty)
                {
                    mess = Constant.MessageNotExist;
                    response = Json(new { code = Constant.NotExist, message = mess, field = "role" });
                }
            }

            if (is_valid)
            {
                response = Json(new { code = Constant.Success, message = Constant.MessageOk });
            }

            return response;
        }

        // POST api/<controller>
        [HttpPost("validateChangePassword")]
        [Authorize]
        public IActionResult ValidateChangePassword([FromBody]ChangePasswordView passwordView)
        {
            IActionResult response = null;
            UserModels userModels = new UserModels();
            User user = new User();
            var mess = string.Empty;
            string rt = string.Empty;
            bool is_valid = true;

            if (string.IsNullOrEmpty(passwordView.OldPassword))
            {
                is_valid = false;
                if (mess == string.Empty)
                {
                    mess = Constant.MessageDataEmpty;
                    response = Json(new { code = Constant.Empty, message = mess, field = "oldPassword" });
                }
            }

            if (string.IsNullOrEmpty(passwordView.Password))
            {
                is_valid = false;
                if (mess == string.Empty)
                {
                    mess = Constant.MessageDataEmpty;
                    response = Json(new { code = Constant.Empty, message = mess, field = "password" });
                }
            }

            if (string.IsNullOrEmpty(passwordView.ConfirmPassword))
            {
                is_valid = false;
                if (mess == string.Empty)
                {
                    mess = Constant.MessageDataEmpty;
                    response = Json(new { code = Constant.Empty, message = mess, field = "confirmPassword" });
                }
            }

            if (passwordView.Password != passwordView.ConfirmPassword)
            {
                is_valid = false;
                if (mess == string.Empty)
                {
                    mess = Constant.MessageConfirmPassword;
                    response = Json(new { code = Constant.Fail, message = mess, field = "confirmPassword" });
                }
            }
                      
            if (is_valid)
            {
                response = Json(new { code = Constant.Success, message = Constant.MessageOk });
            }

            return response;
        }

        // PUT api/<controller>/email
        [HttpPut("{userName}")]
        [Authorize(Roles = "Admin")]
        public IActionResult Put(string userName, [FromBody]AdminEditUserView userView)
        {
            IActionResult response = null;
            UserModels userModels = new UserModels();
            User user = null;
            var mess = string.Empty;
            string rt = string.Empty;       

            if (!string.IsNullOrEmpty(userName))
            {
                user = userModels.GetUserbyUserName(userName);
            }

            if (user != null)
            {
                user.Online = userView.Online;
                user.Role = userView.Role;
                user.Ip = userView.Ip;

                rt = userModels.UpdateUser(userName, user);
            }

            if (rt.Length > 0)
            {
                response = Json(new { code = Constant.Success, message = Constant.MessageUpdateCompleted });
            }
            else
            {
                response = Json(new { code = Constant.Fail, message = Constant.MessageUpdateUncompleted });
            }

            return response;
        }
        
        // PUT api/<controller>/email
        [HttpPut("updateUserInfor/{userName}")]
        [Authorize]
        public IActionResult UpdateUserInfor(string userName, [FromBody]AdminEditUserInforView userView)
        {
            IActionResult response = null;
            UserModels userModels = new UserModels();
            BaseClass baseClass = new BaseClass();
            UserInfo infor = null;
            var mess = string.Empty;
            string rt = string.Empty;
            bool is_valid = true;

            if (!string.IsNullOrEmpty(userName))
            {
                infor = userModels.GetUserInforByEmail(userName);
            }

            if (!is_valid)
            {
                return response;
            }

            if (infor != null)
            {
                infor.Email = userName;
                infor.Fname = userView.Fname;
                infor.Lname = userView.Lname;
                infor.Phone = userView.Phone;
                infor.Address = userView.Address;
                if (!string.IsNullOrEmpty(userView.Birthday)) {
                    infor.Birthday = DateTime.Parse(userView.Birthday);
                }
                infor.Avatar = userView.Avatar;
                infor.FullName = userView.FullName;

                rt = userModels.UpdateUserInfor(userName, infor);
            }

            if (rt.Length > 0)
            {
                response = Json(new { code = Constant.Success, message = Constant.MessageUpdateCompleted });
            }
            else
            {
                response = Json(new { code = Constant.Fail, message = Constant.MessageUpdateUncompleted });
            }

            return response;
        }

        // DELETE api/<controller>/email
        [HttpDelete("{userName}")]
        [Authorize(Roles = "Admin")]
        public IActionResult Delete(string userName)
        {
            IActionResult response = null;
            string mess = string.Empty;
            UserModels userModels = new UserModels();

            User cuser = userModels.GetUserbyUserName(userName);
            UserInfo userInfo = userModels.GetUserInforByEmail(userName);

            if (cuser != null)
            {
                //// delete user
                bool rt = userModels.DeleteUser(userName);                

                if (rt)
                {
                    //// delete avatar file
                    if (!string.IsNullOrEmpty(userInfo.Avatar) && userInfo.Avatar.Contains("/"))
                    {
                        string webRootPath = _hostingEnvironment.WebRootPath;
                        string fileDelete = Path.Combine(webRootPath, userInfo.Avatar.Replace("/", "\\"));
                        if (System.IO.File.Exists(fileDelete))
                        {
                            System.IO.File.Delete(fileDelete);
                        }

                        string fileDelete2 = Path.Combine(webRootPath, userInfo.Avatar.Replace("/", "\\").Replace("sc_small_", "sc_full_"));
                        if (System.IO.File.Exists(fileDelete2))
                        {
                            System.IO.File.Delete(fileDelete2);
                        }
                    }

                    response = Json(new { code = Constant.Success, message = Constant.MessageDeleteCompleted });
                }
                else
                {
                    response = Json(new { code = Constant.Fail, message = Constant.MessageDeleteUncompleted });
                }
            }
            else
            {
                response = Json(new { code = Constant.NotExist, message = Constant.MessageNotExist });
            }

            return response;
        }

        // POST api/<controller>
        [HttpPost("checkPermission")]
        [Authorize(Roles = "Admin")]
        public IActionResult CheckPermission([FromBody]AdminCheckPermissionView checkView)
        {
            IActionResult response = null;
            UserModels userModels = new UserModels();

            var identity = (ClaimsIdentity)User.Identity;
            IEnumerable<Claim> claims = identity.Claims;
            var userLogin = claims.FirstOrDefault(c => c.Type == ClaimTypes.Email).Value;

             var action = userModels.GetActionByActionName(checkView.TypeAct);

             string typeAct = action != null ? action.Id.ToString() : string.Empty;

            ////check permission update
            if (UserModels.CheckPermission(userLogin, checkView.Path, typeAct, checkView.Type))
            {
                response = Json(new { code = Constant.PermissionAccessCode, message = Constant.MessagePermissionAccess });
            }
            else
            {
                response = Json(new { code = Constant.PermissionDeniedCode, message = Constant.MessagePermissionDenied });
            }

            return response;
        }

    }
}
