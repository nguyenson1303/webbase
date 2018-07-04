using System.Collections.Generic;
using System.Linq;
using System.Security.Claims;
using ApiBase.Model;
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
                    menuItem.home = parent.Path == "dashboard" ? true : false;
                    menuItem.group = false;

                    List<UserPage> lstChild = userModels.GetListUserPageByParrentID(parent.Id);
                    bool isChild = false;
                    List<AdminMenu> menuChild = new List<AdminMenu>();
                    if (lstChild.Any())
                    {
                        foreach (var child in lstChild)
                        {
                            AdminMenu menuItemChild = new AdminMenu();
                            menuItemChild.title = child.Title;
                            menuItemChild.icon = child.Icon;
                            menuItemChild.link = string.IsNullOrEmpty(child.Path) ? string.Empty : child.Path;
                            menuItemChild.home = false;
                            menuItem.group = false;

                            var isShow = UserModels.CheckPermission(userLogin, menuItemChild.link, child.TypeAction, child.Tye);
                            if (isShow)
                            {
                                menuChild.Add(menuItemChild);
                                isChild = true;
                            }
                        }
                    }

                    if (isChild)
                    {
                        menuItem.children = menuChild;
                    }


                    adminMenu.Add(menuItem);
                }
            }

            return Json(adminMenu);
        }

        // GET api/<controller>/5
        [HttpGet("{id}")]
        public string Get(int id)
        {
            return "value";
        }

        // POST api/<controller>
        [HttpPost]
        public void Post([FromBody]string value)
        {
        }

        // PUT api/<controller>/5
        [HttpPut("{id}")]
        public void Put(int id, [FromBody]string value)
        {
        }

        // DELETE api/<controller>/5
        [HttpDelete("{id}")]
        public void Delete(int id)
        {
        }
    }
}
