using System;
using System.Collections.Generic;
using System.Linq;
using System.Security.Claims;
using System.Threading.Tasks;
using ApiBase.Models.AdminViewModels;
using ApiBase.Models.BusinessAccess;
using ApiBase.Models.DB;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;

// For more information on enabling Web API for empty projects, visit https://go.microsoft.com/fwlink/?LinkID=397860

namespace ApiBase.Controllers
{
    [Route("api/[controller]")]
    public class AdminPageController : Controller
    {
        // GET: api/<controller>/listUserPage
        [HttpGet("listUserPage"), Authorize(Roles = "Admin")]
        public IActionResult ListUserPage(string type, string search, int? parentId, int? pageIndex, int? pageSize, string orderBy, string orderType)
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
            var listPageView = new AdminListPageView();
            int total_record = 0;
            var isOk = true;

            string lang = LanguageModels.ActiveLanguage().LangCultureName;

            type = type ?? string.Empty;

            if (parentId == null)
            {
                parentId = -1; // get all
            }

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

            if (pageSize == null)
            {
                pageSize = 30;
            }

            if (string.IsNullOrEmpty(orderBy) || string.IsNullOrEmpty(orderType))
            {
                orderBy = "Title";
                orderType = "asc";
            }
           
            listPageView.ListUserPage = userModels.AdminGetAllPage(type, lang, search, (int)parentId, (int)pageIndex, (int)pageSize, orderBy, orderType, out total_record);
            listPageView.CateType = roleModels.GetRoleByRole(type);
            listPageView.PageIndex = (int)pageIndex;
            listPageView.PageSize = (int)pageSize;
            listPageView.TotalPage = total_record > 0 ? (int)System.Math.Ceiling((double)total_record / (double)pageSize) : 0;

            response = Json(listPageView);

            return response;
        }

        // GET api/<controller>/5
        [HttpGet("{id}")]
        [Authorize(Roles = "Admin")]
        public IActionResult Get(int id)
        {
            UserModels sv = new UserModels();
            IActionResult response = null;
            UserPage userPage = sv.GetUserPagebyId(id);

            var identity = (ClaimsIdentity)User.Identity;
            IEnumerable<Claim> claims = identity.Claims;
            var userLogin = claims.FirstOrDefault(c => c.Type == ClaimTypes.Email).Value;

            string type = "Admin";

            var action = sv.GetActionByActionName(CommonGlobal.View);

            string typeAct = action != null ? action.Id.ToString() : string.Empty;

            ////check permission update
            if (userPage != null)
            {
                response = Json(userPage);
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
        public IActionResult Post([FromBody]AdminUserPageView userPageView)
        {
            IActionResult response = null;
            UserModels userModels = new UserModels();
            UserPage userPage = null;
            var mess = string.Empty;
            int rt = 0;
            bool is_valid = true;

            var identity = (ClaimsIdentity)User.Identity;
            IEnumerable<Claim> claims = identity.Claims;
            var userLogin = claims.FirstOrDefault(c => c.Type == ClaimTypes.Email).Value;

            var action = userModels.GetActionByActionName(CommonGlobal.Add);

            string typeAct = action != null ? action.Id.ToString() : string.Empty;

            string type = string.Empty;           

            ////validation server
            if (string.IsNullOrEmpty(userPageView.Title))
            {
                is_valid = false;
                if (mess == string.Empty)
                {
                    mess = Constant.MessageDataEmpty;
                    response = StatusCode(200, Json(new { code = Constant.Empty, message = mess, field = "Title" }));
                }
            }

            ////validation server
            if (string.IsNullOrEmpty(userPageView.Path))
            {
                is_valid = false;
                if (mess == string.Empty)
                {
                    mess = Constant.MessageDataEmpty;
                    response = StatusCode(200, Json(new { code = Constant.Empty, message = mess, field = "Path" }));
                }
            }

            if (!is_valid)
            {
                return response;
            }

            ////check permission update
            userPage = new UserPage
            {
                Title = userPageView.Title,
                IsShow = userPageView.IsShow,
                Tye = userPageView.Tye,
                ParentId = userPageView.ParentId,
                OrderDisplay = userPageView.OrderDisplay,
                Icon = userPageView.Icon,
                Path = userPageView.Path,
                Breadcrumb = userPageView.Breadcrumb,
                TypeActionId = userPageView.TypeActionId,
                ModifyDate = DateTime.Now,
                CreateDate = DateTime.Now
            };

            rt = userModels.AddUserPage(userPage);

            if (rt > 0)
            {
                response = Json(new { code = Constant.Success, message = Constant.MessageCreateCompleted });
            }
            else
            {
                response = Json(new { code = Constant.Fail, message = Constant.MessageCreateUncompleted });
            }

            return response;
        }

        // PUT api/<controller>/5
        [HttpPut("{id}")]
        [Authorize(Roles = "Admin")]
        public IActionResult Put(int id, [FromBody]AdminUserPageView userPageView)
        {
            IActionResult response = null;
            UserModels userModels = new UserModels();
            UserPage userPage = null;
            var mess = string.Empty;
            int rt = 0;
            bool is_valid = true;

            var identity = (ClaimsIdentity)User.Identity;
            IEnumerable<Claim> claims = identity.Claims;
            var userLogin = claims.FirstOrDefault(c => c.Type == ClaimTypes.Email).Value;

            var action = userModels.GetActionByActionName(CommonGlobal.Edit);

            string typeAct = action != null ? action.Id.ToString() : string.Empty;

            string type = string.Empty;

            ////validation server
            if (string.IsNullOrEmpty(userPageView.Title))
            {
                is_valid = false;
                if (mess == string.Empty)
                {
                    mess = Constant.MessageDataEmpty;
                    response = StatusCode(200, Json(new { code = Constant.Empty, message = mess, field = "Title" }));
                }
            }

            ////validation server
            if (string.IsNullOrEmpty(userPageView.Path))
            {
                is_valid = false;
                if (mess == string.Empty)
                {
                    mess = Constant.MessageDataEmpty;
                    response = StatusCode(200, Json(new { code = Constant.Empty, message = mess, field = "Path" }));
                }
            }

            if (!is_valid)
            {
                return response;
            }

            ////check permission update
            userPage = new UserPage
            {
                Title = userPageView.Title,
                IsShow = userPageView.IsShow,
                Tye = userPageView.Tye,
                ParentId = userPageView.ParentId,
                OrderDisplay = userPageView.OrderDisplay,
                Icon = userPageView.Icon,
                Path = userPageView.Path,
                Breadcrumb = userPageView.Breadcrumb,
                TypeActionId = userPageView.TypeActionId,
                ModifyDate = DateTime.Now
            };

            rt = userModels.UpdateUserPage(id, userPage);

            if (rt > 0)
            {
                response = Json(new { code = Constant.Success, message = Constant.MessageUpdateCompleted });
            }
            else
            {
                response = Json(new { code = Constant.Fail, message = Constant.MessageUpdateUncompleted });
            }

            return response;
        }

        // DELETE api/<controller>/5
        [HttpDelete("{id}")]
        [Authorize(Roles = "Admin")]
        public IActionResult Delete(int id)
        {
            IActionResult response = null;
            string mess = string.Empty;
            UserModels userModels = new UserModels();

            var identity = (ClaimsIdentity)User.Identity;
            IEnumerable<Claim> claims = identity.Claims;
            var userLogin = claims.FirstOrDefault(c => c.Type == ClaimTypes.Email).Value;

            var action = userModels.GetActionByActionName(CommonGlobal.Delete);

            string typeAct = action != null ? action.Id.ToString() : string.Empty;

            string type = string.Empty;

            ////check permission delete
            UserPage userPage = userModels.GetUserPagebyId(id);
            if (userPage != null)
            {
                //// delete UserPageAction
                bool rt = userModels.DeleteUserPage(userPage.Id);
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

            return response;
        }
    }
}
