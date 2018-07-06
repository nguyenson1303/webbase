using System.Collections.Generic;
using System.Linq;
using System.Security.Claims;
using ApiBase.Models.AdminViewModels;
using ApiBase.Models.BusinessAccess;
using ApiBase.Models.DB;
using DBBase.EntitysObject;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;

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
            var isOk = true;

            type = type ?? string.Empty;

            string path = "/api/account/listUser";

            var action = userModels.GetActionByActionName(CommonGlobal.View);

            string typeAct = action != null ? action.Id.ToString() : string.Empty;

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
                listUserView.ListUser = userModels.AdminGetAllUser(type, lang, search, (int)pageIndex, (int)pageSize, orderBy, orderType, out total_record);
                listUserView.CateType = roleModels.GetRoleByRole(type);
                listUserView.PageIndex = (int)pageIndex;
                listUserView.PageSize = (int)pageSize;                
                listUserView.TotalPage = total_record > 0 ? (int)System.Math.Ceiling((double)total_record / (double)pageSize) : 0;

                response = Json(listUserView);
            }
            else
            {
                response = Json(new { code = Constant.PermissionDeniedCode, message = Constant.MessagePermissionDenied });
            }                        

            return response;
        }

        [HttpGet("listUserPermission"), Authorize(Roles = "Admin")]
        public IActionResult listUserPermission(string type, int? pageIndex, int? pageSize)
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
            var permissionView = new AdminListUserPermissionView();
            int totalRecord = 0;
            var isOk = true;

            type = type ?? string.Empty;

            string path = "/api/account/listUserPermission";

            var action = userModels.GetActionByActionName(CommonGlobal.Edit);

            string typeAct = action != null ? action.Id.ToString() : string.Empty;

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
                // fix get all page permission
                pageSize = 1000; 
            }

            ////check permission update
            if (UserModels.CheckPermission(userLogin, path, typeAct, type))
            {
                List<PagePermission> lstPagePermission = userModels.GetListPermissionByUser(userLogin, (int)pageIndex, (int)pageSize, out totalRecord);                
                permissionView.List_permission = lstPagePermission.Skip(((int)pageIndex - 1) * (int)pageSize).Take((int)pageSize).ToList();
                permissionView.PageIndex = (int)pageIndex;
                permissionView.PageSize = (int)pageSize;
                permissionView.TotalPage = totalRecord > 0 ? (int)System.Math.Ceiling((double)totalRecord / (double)pageSize) : 0;
                response = Json(permissionView);
            }
            else
            {
                response = Json(new { code = Constant.PermissionDeniedCode, message = Constant.MessagePermissionDenied });
            }

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
                        response = Json(new { code = Constant.Duplicate, message = Constant.MessageDuplicate });
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
                    mess = Constant.MessageDataEmpty;
                    response = Json(new { code = Constant.Empty, message = mess });
                }
            }

            if (string.IsNullOrEmpty(userView.ConfirmPassword))
            {
                is_valid = false;
                if (mess == string.Empty)
                {
                    mess = Constant.MessageDataEmpty;
                    response = Json(new { code = Constant.Empty, message = mess });
                }
            }

            if (userView.Password != userView.ConfirmPassword)
            {
                is_valid = false;
                if (mess == string.Empty)
                {
                    mess = Constant.MessageConfirmPassword;
                    response = Json(new { code = Constant.Fail, message = mess });
                }
            }

            if(userModels.GetRolebyId(userView.Role) == null)
            {
                is_valid = false;
                if (mess == string.Empty)
                {
                    mess = Constant.MessageNotExist;
                    response = Json(new { code = Constant.NotExist, message = mess });
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
                userView.Username = rt;
                response = Json(new { code = Constant.Success, message = Constant.MessageCreateCompleted });
            }
            else
            {
                response = Json(new { code = Constant.Fail, message = Constant.MessageCreateUncompleted });
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
                    mess = Constant.MessageDataEmpty;
                    response = Json(new { code = Constant.Empty, message = mess });
                }
            }

            ////UserName duplicate Admin
            if (userView.Username == "Admin")
            {
                is_valid = false;
                if (mess == string.Empty)
                {
                    mess = Constant.MessageNotValid;
                    response = Json(new { code = Constant.NotValid, message = mess });
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
                    userView.Username = rt;
                    response = Json(new { code = Constant.Success, message = Constant.MessageUpdateCompleted });
                }
                else
                {
                    response = Json(new { code = Constant.Fail, message = Constant.MessageUpdateUncompleted });
                }
            }
            else
            {
                response = Json(new { code = Constant.PermissionDeniedCode, message = Constant.MessagePermissionDenied });
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
            }
            else
            {
                mess = " Bạn không có quyền thực thi hành động xóa.";
                response = Json(new { code = Constant.PermissionDeniedCode, message = Constant.MessagePermissionDenied });
            }

            return response;
        }
    }
}
