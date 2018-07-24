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
        public IActionResult ListUserPage(string type, string search, int? parentId, string orderBy, string orderType)
        {
            IActionResult response = null;
            BaseClass baseClass = new BaseClass();
            UserModels userModels = new UserModels();
            RoleModels roleModels = new RoleModels();
            User cuser = new User();

            var mess = string.Empty;
            var listPageView = new AdminListPageView();
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

            if (string.IsNullOrEmpty(orderBy) || string.IsNullOrEmpty(orderType))
            {
                orderBy = "Title";
                orderType = "asc";
            }

            listPageView.ListUserPage = userModels.AdminGetAllPageFullTree(type, lang, search, (int)parentId);
            listPageView.CateType = roleModels.GetRoleByRole(type);           

            response = Json(listPageView);

            return response;
        }

        // GET: api/<controller>/listUserPageTree
        [HttpGet("listUserPageTree"), Authorize(Roles = "Admin")]
        public IActionResult ListUserPageTree(string type, int parentId, int id)
        {
            IActionResult response = null;
            BaseClass baseClass = new BaseClass();
            UserModels userModels = new UserModels();
            RoleModels roleModels = new RoleModels();
            User cuser = new User();
            List<UserPageTree> userPageTrees = new List<UserPageTree>();

            var mess = string.Empty;
            List<UserPage> listUserPage = new List<UserPage>();
            int total_record = 0;
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


            listUserPage = userModels.AdminGetAllPage(type, lang, "", -1, 1, 10000, "", "", out total_record);

            // create root
            UserPageTree userPageTree;
            if (parentId == 0)
            {
                userPageTree = new UserPageTree { Id = "0", Parent = "#", Text = "Page cha", State = new UserPageTreeOption { Selected = true, Opened = true , Disabled = false} };
            }
            else
            {
                userPageTree = new UserPageTree { Id = "0", Parent = "#", Text = "Page cha", State = new UserPageTreeOption { Selected = false, Opened = true, Disabled = false } };
            }
            
            userPageTrees.Add(userPageTree);

            // create child
            foreach (var item in listUserPage)
            {
                var idChild = "";
                var parent = "";
                parent = item.ParentId.ToString();
                idChild = item.Id.ToString();
                UserPageTree userPTree;
                var disabled = false;

                if (item.Id == id)
                {
                    disabled = true;

                }

                if (item.Id == parentId)
                {
                    userPTree = new UserPageTree { Id = idChild, Parent = parent, Text = item.Title, State = new UserPageTreeOption { Selected = true, Opened = true, Disabled = disabled } };
                }
                else
                {
                    userPTree = new UserPageTree { Id = idChild, Parent = parent, Text = item.Title, State = new UserPageTreeOption { Selected = false, Opened = false, Disabled = disabled } };
                }

                userPageTrees.Add(userPTree);
            }

            response = Json(userPageTrees);

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

        // POST api/<controller>
        [HttpPost("validateAdminPage")]
        [Authorize(Roles = "Admin")]
        public IActionResult ValidateAdminPage([FromBody]AdminUserPageView userPageView)
        {
            IActionResult response = null;
            UserModels userModels = new UserModels();
            var mess = string.Empty;
            string rt = string.Empty;
            bool is_valid = true;

            ////validation server
            if (string.IsNullOrEmpty(userPageView.Title))
            {
                is_valid = false;
                if (mess == string.Empty)
                {
                    mess = Constant.MessageDataEmpty;
                    response = Json(new { code = Constant.Empty, message = mess, field = "title" });
                }
            }

            ////validation server
            if (string.IsNullOrEmpty(userPageView.Path))
            {
                is_valid = false;
                if (mess == string.Empty)
                {
                    mess = Constant.MessageDataEmpty;
                    response = Json(new { code = Constant.Empty, message = mess, field = "path" });
                }
            }

            if (is_valid)
            {
                response = Json(new { code = Constant.Success, message = Constant.MessageOk });
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

        // updateStatusAdminPage api/<controller>/5
        [HttpPut("updateStatusAdminPage/{id}/{isShow}")]
        [Authorize(Roles = "Admin")]
        public IActionResult UpdateStatus(int id, Boolean isShow)
        {
            IActionResult response = null;
            UserModels userModels = new UserModels();
            UserPage userPage = null;
            var mess = string.Empty;
            int rt = 0;
            var userPageView = new UserPage();
            userPageView = userModels.GetUserPagebyId(id);

            ////check permission update
            userPage = new UserPage
            {
                Title = userPageView.Title,
                IsShow = isShow,
                Tye = userPageView.Tye,
                ParentId = userPageView.ParentId,
                OrderDisplay = userPageView.OrderDisplay,
                Icon = userPageView.Icon,
                Path = userPageView.Path,
                Breadcrumb = userPageView.Breadcrumb,
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
