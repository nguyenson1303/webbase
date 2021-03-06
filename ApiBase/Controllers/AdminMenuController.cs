﻿using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Security.Claims;
using ApiBase.Model.AdminViewModels;
using ApiBase.Models.BusinessAccess;
using ApiBase.Models.DB;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;

// For more information on enabling Web API for empty projects, visit https://go.microsoft.com/fwlink/?LinkID=397860

namespace ApiBase.Controllers
{
    [Route("api/[controller]")]
    public class AdminMenuController : Controller
    {
        // GET: api/<controller>
        [HttpGet, Authorize(Roles = "Admin")]
        public IActionResult Get()
        {
            var identity = (ClaimsIdentity)User.Identity;
            IEnumerable<Claim> claims = identity.Claims;
            var userLogin = claims.FirstOrDefault(c => c.Type == ClaimTypes.Email).Value;

            UserModels userModels = new UserModels();
            List<AdminMenu> adminMenu = new List<AdminMenu>();
            List<UserPage> lstParent = userModels.GetListParentPage();

            if (lstParent.Any())
            {
                foreach (var parent in lstParent)
                {
                    AdminMenu menuItem = new AdminMenu();
                    menuItem.title = parent.Title;
                    menuItem.icon = parent.Icon;
                    menuItem.link = parent.Path;
                    menuItem.type = parent.Tye;
                    menuItem.home = parent.Path == "dashboard" ? true : false;
                    menuItem.group = false;
                    menuItem.queryParams = string.Empty;

                    List<UserPage> lstChild = userModels.GetListUserPageByParrentID(parent.Id);
                    bool isChild = false;
                    List<AdminMenu> menuChild = new List<AdminMenu>();
                    if (lstChild.Any())
                    {
                        foreach (var child in lstChild)
                        {                           
                            var isShow = UserModels.CheckPermissionMenu(userLogin, (string.IsNullOrEmpty(child.Path) ? string.Empty : child.Path), child.Tye);
                            if (isShow)
                            {
                                var path = string.Empty;
                                if (!string.IsNullOrEmpty(child.Path))
                                {
                                    path = child.Path;                                    
                                }

                                AdminMenu menuItemChild = new AdminMenu
                                {
                                    title = child.Title,
                                    icon = child.Icon,
                                    link = path,
                                    type = child.Tye,
                                    home = false,
                                    group = false,
                                    queryParams = string.Empty
                                };
                                menuChild.Add(menuItemChild);
                                isChild = true;
                            }
                        }
                    }

                    if (isChild)
                    {
                        menuItem.children = menuChild;
                        adminMenu.Add(menuItem);
                    }                    
                }
            }

            return Json(adminMenu);
        }        
    }
}
