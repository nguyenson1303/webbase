﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Security.Claims;
using ApiBase.Models.AdminViewModels;
using ApiBase.Models.BusinessAccess;
using ApiBase.Models.DB;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;

// For more information on enabling Web API for empty projects, visit https://go.microsoft.com/fwlink/?LinkID=397860

namespace ApiBase.Controllers
{
    [Route("api/[controller]")]
    public class AdminPageActionController : Controller
    {
        // GET: api/<controller>/listUserPageAction
        [HttpGet("listUserPageAction"), Authorize(Roles = "Admin")]
        public IActionResult ListUserPageAction(string type, string search, int? pageId, int? pageIndex, int? pageSize, string orderBy, string orderType)
        {
            IActionResult response = null;
            BaseClass baseClass = new BaseClass();
            UserModels userModels = new UserModels();
            RoleModels roleModels = new RoleModels();
            User cuser = new User();

            var mess = string.Empty;
            var listPageActionView = new AdminListPageActionView();
            var isOk = true;

            string lang = LanguageModels.ActiveLanguage().LangCultureName;

            type = type ?? string.Empty;


            if (pageId == null)
            {
                pageId = 0;
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
                pageSize = 25;
            }

            if (string.IsNullOrEmpty(orderBy) || string.IsNullOrEmpty(orderType))
            {
                orderBy = "actionName";
                orderType = "asc";
            }

            listPageActionView.ListUserPageAction = userModels.AdminGetAllPageAction(type, lang, search, (int)pageId, (int)pageIndex, (int)pageSize, orderBy, orderType, out int total_record);
            listPageActionView.CateType = roleModels.GetRoleByRole(type);
            listPageActionView.PageIndex = (int)pageIndex;
            listPageActionView.PageSize = (int)pageSize;
            listPageActionView.TotalPage = total_record > 0 ? (int)System.Math.Ceiling((double)total_record / (double)pageSize) : 0;
            listPageActionView.TotalRecord = total_record;
            response = Json(listPageActionView);

            return response;
        }

        // GET: api/<controller>/listUserPageAction
        // get list action on page id (action for commond page and action for only page)
        [HttpGet("listUserPageActionByPageId"), Authorize(Roles = "Admin")]
        public IActionResult ListUserPageActionByPageId(string type, int pageId)
        {
            IActionResult response = null;
            BaseClass baseClass = new BaseClass();
            UserModels userModels = new UserModels();
            RoleModels roleModels = new RoleModels();
            User cuser = new User();

            var mess = string.Empty;
            var isOk = true;

            string lang = LanguageModels.ActiveLanguage().LangCultureName;

            type = type ?? "Admin";

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

            List<UserPageAction> listAllPageAction = userModels.AdminGetAllPageAction(type, lang, pageId);

            response = Json(listAllPageAction);

            return response;
        }

        // GET api/<controller>/5
        [HttpGet("{id}")]
        [Authorize(Roles = "Admin")]
        public IActionResult Get(int id)
        {
            UserModels sv = new UserModels();
            IActionResult response = null;
            UserPageAction userPageAction = sv.GetUserPageActionbyId(id);

            if (userPageAction != null)
            {
                response = Json(userPageAction);
            }
            else
            {
                response = Json(new { code = Constant.NotExist, message = Constant.MessageNotExist });
            }

            return response;
        }

        // POST api/<controller>
        // create action detail
        [HttpPost]
        [Authorize(Roles = "Admin")]
        public IActionResult Post([FromBody]AdminUserPageActionView userPageActionView)
        {
            IActionResult response = null;
            UserModels userModels = new UserModels();
            UserPageAction userPageAction = null;
            var mess = string.Empty;
            int rt = 0;

            var identity = (ClaimsIdentity)User.Identity;
            IEnumerable<Claim> claims = identity.Claims;
            var userLogin = claims.FirstOrDefault(c => c.Type == ClaimTypes.Email).Value;

            userPageAction = new UserPageAction
            {
                ActionName = userPageActionView.ActionName,
                ActionDescription = userPageActionView.ActionDescription,
                ActionStatus = userPageActionView.ActionStatus,
                CreateDate = DateTime.Now,
                ModifyDate = DateTime.Now,
                ActionPage = userPageActionView.ActionPage
            };

            rt = userModels.AddUserPageAction(userPageAction);

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
        [HttpPost("validateAdminPageAction")]
        [Authorize(Roles = "Admin")]
        public IActionResult ValidateAdminPageAction([FromBody]AdminUserPageActionView userPageActionView)
        {
            IActionResult response = null;
            UserModels userModels = new UserModels();
            var mess = string.Empty;
            string rt = string.Empty;
            bool is_valid = true;
            UserPageAction userPageAction = null;

            if(userPageActionView.IsCreate)
            {
                if (!string.IsNullOrEmpty(userPageActionView.ActionName))
                {
                    userPageAction = userModels.GetUserPageActionbyActionName(userPageActionView.ActionName);

                    if (userPageAction != null)
                    {
                        is_valid = false;
                        if (mess == string.Empty)
                        {
                            response = Json(new { code = Constant.Duplicate, message = Constant.MessageDuplicate, field = "actionName" });
                        }
                    }
                }
            }

            ////validation server
            if (string.IsNullOrEmpty(userPageActionView.ActionName))
            {
                is_valid = false;
                if (mess == string.Empty)
                {
                    mess = Constant.MessageDataEmpty;
                    response = Json(new { code = Constant.Empty, message = Constant.MessageDataEmpty, field = "actionName" });
                }
            }

            ////validation server
            if (string.IsNullOrEmpty(userPageActionView.ActionDescription))
            {
                is_valid = false;
                if (mess == string.Empty)
                {
                    mess = Constant.MessageDataEmpty;
                    response = Json(new { code = Constant.Empty, message = Constant.MessageDataEmpty, field = "actionDescription" });
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
        public IActionResult Put(int id, [FromBody]AdminUserPageActionView userPageActionView)
        {
            IActionResult response = null;
            UserModels userModels = new UserModels();
            UserPageAction userPageAction = null;
            var mess = string.Empty;
            int rt = 0;

            userPageAction = new UserPageAction
            {
                ActionName = userPageActionView.ActionName,
                ActionDescription = userPageActionView.ActionDescription,
                ActionStatus = userPageActionView.ActionStatus,
                ModifyDate = DateTime.Now,
                ActionPage = userPageActionView.ActionPage
            };

            rt = userModels.UpdateUserPageAction(id, userPageAction);

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

            UserPageAction userPageAction = userModels.GetUserPageActionbyId(id);
            string[] listActionNameCanNotDelete = new string[] { CommonGlobal.View, CommonGlobal.Add, CommonGlobal.Delete, CommonGlobal.Edit };
            if (userPageAction != null && !listActionNameCanNotDelete.Contains(userPageAction.ActionName))
            {
                //// delete UserPageAction
                bool rt = userModels.DeleteUserPageAction(userPageAction.Id);
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
