using ApiBase.Models.AdminViewModels;
using ApiBase.Models.BusinessAccess;
using ApiBase.Models.DB;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Hosting;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.Rendering;
using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Security.Claims;
using System.Text;

// For more information on enabling Web API for empty projects, visit https://go.microsoft.com/fwlink/?LinkID=397860

namespace ApiBase.Controllers
{
    [Route("api/[controller]")]
    public class AdminCatelogController : Controller
    {
        private IHostingEnvironment _hostingEnvironment;

        // GET: api/values
        [HttpGet, Authorize(Roles = "Admin")]
        public IActionResult Get(int? parent, int? cateId, string type, string lang, string search, int? pageIndex, int? pageSize, string orderBy, string orderType)
        {
            IActionResult response = null;
            var identity = (ClaimsIdentity)User.Identity;
            IEnumerable<Claim> claims = identity.Claims;
            var userLogin = claims.FirstOrDefault(c => c.Type == ClaimTypes.Email).Value;

            CatalogModels cateModels = new CatalogModels();
            Catalog cate = new Catalog();
            StringBuilder sb = new StringBuilder();
            List<SelectListItem> listSelectCatalog = new List<SelectListItem>();
            BaseClass baseClass = new BaseClass();
            var listCatalogView = new AdminListCatalogView();
            var isOk = true;

            /////type is get type catalog
            /////ex   : SP - product
            /////     : TT - news
            /////     : CL - collection
            /////     : LB - lookbook
            /////     : GL - gallery
            /////parent is parent id
            type = type ?? CommonGlobal.CateProduct;

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

            parent = parent ?? 0;

            if (string.IsNullOrEmpty(lang))
            {
                lang = LanguageModels.ActiveLanguage().LangCultureName;
            }

            if (string.IsNullOrEmpty(orderBy) || string.IsNullOrEmpty(orderType))
            {
                orderBy = "OrderDisplay";
                orderType = "asc";
            }

            if (parent != 0)
            {
                cate = cateModels.GetbyID((int)parent);
                listCatalogView.CategoryName = cate.CategoryName;
            }

            listCatalogView.PageListCatalog = cateModels.GetAllCatalogByParentID((int)parent, type, lang, search, (int)pageIndex, (int)pageSize, orderBy, orderType, out int totalRecord);
            listCatalogView.CateType = CommonGlobal.GetCatalogTypeName(type);
            listCatalogView.PageIndex = (int)pageIndex;
            listCatalogView.PageSize = (int)pageSize;
            listCatalogView.TotalPage = totalRecord > 0 ? (int)System.Math.Ceiling((double)totalRecord / (double)pageSize) : 0;
            listCatalogView.TotalRecord = totalRecord;

            response = Json(listCatalogView);

            return response;
        }

        // GET api/values/5
        [HttpGet("{cateId}"), Authorize(Roles = "Admin")]
        public IActionResult Get(int? cateId, int? parent, string type, string lang)
        {
            IActionResult response = null;
            UserModels sv = new UserModels();
            var identity = (ClaimsIdentity)User.Identity;
            IEnumerable<Claim> claims = identity.Claims;
            var userLogin = claims.FirstOrDefault(c => c.Type == ClaimTypes.Email).Value;

            CatalogModels cateModels = new CatalogModels();
            Catalog cate = new Catalog();
            StringBuilder sb = new StringBuilder();
            List<SelectListItem> listSelectCatalog = new List<SelectListItem>();
            BaseClass baseClass = new BaseClass();
            var catalogView = new AdminCatalogView();

            type = type ?? CommonGlobal.CateProduct;

            cateId = cateId ?? 0;

            if (string.IsNullOrEmpty(lang))
            {
                lang = LanguageModels.ActiveLanguage().LangCultureName;
            }

            cate = cateModels.GetbyID((int)cateId);
            catalogView.Lang = cate.Lang ?? lang;
            catalogView.CatalogId = cate.CatalogId;
            catalogView.CategoryName = cate.CategoryName;
            catalogView.ImagePath = cate.ImagePath;
            catalogView.Intro = cate.Intro;
            catalogView.MoreInfo = cate.MoreInfo;
            catalogView.Keyword = cate.Keyword;
            catalogView.Description = cate.Description;
            catalogView.Title = cate.Title;
            catalogView.Link = cate.Link;
            catalogView.Parent = cate.ParentId ?? 0;
            catalogView.Show = cate.Show ?? false;
            catalogView.OrderDisplay = (int)cate.OrderDisplay;
            catalogView.Type = type;

            response = Json(catalogView);

            return response;
        }

        // POST api/values
        [HttpPost, Authorize(Roles = "Admin")]
        public IActionResult Post([FromBody]AdminCatalogView adminCatalogView)
        {
            IActionResult response = null;
            CatalogModels cateModels = new CatalogModels();
            Catalog cate = new Catalog();
            StringBuilder sb = new StringBuilder();
            BaseClass baseClass = new BaseClass();
            UserModels userModels = new UserModels();
            var mess = string.Empty;
            int rt = 0;
            bool is_valid = true;

            var identity = (ClaimsIdentity)User.Identity;
            IEnumerable<Claim> claims = identity.Claims;

            var userLogin = claims.FirstOrDefault(c => c.Type == ClaimTypes.Email).Value;
            
            string type = string.Empty;

            List<SelectListItem> listSelectCatalog = new List<SelectListItem>();

            ////validation server
            if (string.IsNullOrEmpty(adminCatalogView.CategoryName))
            {
                is_valid = false;
                mess = Constant.MessageDataEmpty;
                response = Json(new { code = Constant.Empty, message = mess, field = "category" });
            }

            if (!is_valid)
            {
                return response;
            }

            cate.CategoryName = adminCatalogView.CategoryName;
            cate.Description = string.IsNullOrEmpty(adminCatalogView.Description) == false ? adminCatalogView.Description : string.Empty;
            cate.Keyword = string.IsNullOrEmpty(adminCatalogView.Keyword) == false ? adminCatalogView.Keyword : string.Empty;
            if (!string.IsNullOrEmpty(adminCatalogView.Title))
            {
                cate.Title = adminCatalogView.Title;
            }
            else
            {
                cate.Title = adminCatalogView.CategoryName;
                adminCatalogView.Title = cate.Title;
            }

            cate.Intro = string.IsNullOrEmpty(adminCatalogView.Intro) == false ? adminCatalogView.Intro : string.Empty;
            cate.MoreInfo = string.IsNullOrEmpty(adminCatalogView.MoreInfo) == false ? adminCatalogView.MoreInfo : string.Empty;
            cate.Lang = adminCatalogView.Lang;
            cate.OrderDisplay = adminCatalogView.OrderDisplay;
            cate.ParentId = adminCatalogView.Parent;
            cate.Show = adminCatalogView.Show;            
            cate.Link = CommonGlobal.CompleteLink(adminCatalogView.CategoryName);
            cate.Type = adminCatalogView.Type;
            cate.ImagePath = adminCatalogView.ImagePath;

            rt = cateModels.Add(cate);

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

        // Put api/values
        [HttpPut("{id}"), Authorize(Roles = "Admin")]
        public IActionResult Put(int id, [FromBody]AdminCatalogView adminCatalogView)
        {
            IActionResult response = null;
            CatalogModels cateModels = new CatalogModels();
            Catalog cate = new Catalog();
            StringBuilder sb = new StringBuilder();
            BaseClass baseClass = new BaseClass();
            UserModels userModels = new UserModels();
            var mess = string.Empty;
            int rt = 0;
            bool is_valid = true;

            var identity = (ClaimsIdentity)User.Identity;
            IEnumerable<Claim> claims = identity.Claims;
            var userLogin = claims.FirstOrDefault(c => c.Type == ClaimTypes.Email).Value;
           
            string type = string.Empty;

            ////validation server
            if (string.IsNullOrEmpty(adminCatalogView.CategoryName))
            {
                is_valid = false;
                mess = Constant.MessageDataEmpty;
                response = Json(new { code = Constant.Empty, message = mess, field = "category" });
            }

            if (!is_valid)
            {
                return response;
            }

            cate.CatalogId = id;
            cate.CategoryName = adminCatalogView.CategoryName;
            cate.Description = string.IsNullOrEmpty(adminCatalogView.Description) == false ? adminCatalogView.Description : string.Empty;
            cate.Keyword = string.IsNullOrEmpty(adminCatalogView.Keyword) == false ? adminCatalogView.Keyword : string.Empty;
            if (!string.IsNullOrEmpty(adminCatalogView.Title))
            {
                cate.Title = adminCatalogView.Title;
            }
            else
            {
                cate.Title = adminCatalogView.CategoryName;
            }

            cate.Intro = string.IsNullOrEmpty(adminCatalogView.Intro) == false ? adminCatalogView.Intro : string.Empty;
            cate.MoreInfo = string.IsNullOrEmpty(adminCatalogView.MoreInfo) == false ? adminCatalogView.MoreInfo : string.Empty;
            cate.Lang = adminCatalogView.Lang;
            cate.OrderDisplay = adminCatalogView.OrderDisplay;
            cate.ParentId = adminCatalogView.Parent;
            cate.Show = adminCatalogView.Show;
            cate.Link = CommonGlobal.CompleteLink(adminCatalogView.CategoryName);
            cate.Type = adminCatalogView.Type;
            cate.ImagePath = adminCatalogView.ImagePath;
                       
            rt = cateModels.Edit(cate);

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

        // DELETE api/values/5
        [HttpDelete("{cateId}"), Authorize(Roles = "Admin")]
        public IActionResult Delete(int? cateId)
        {
            IActionResult response = null;
            string mess = string.Empty;
            UserModels userModels = new UserModels();

            var identity = (ClaimsIdentity)User.Identity;
            IEnumerable<Claim> claims = identity.Claims;
            var userLogin = claims.FirstOrDefault(c => c.Type == ClaimTypes.Email).Value;

            CatalogModels cateModels = new CatalogModels();
            Catalog cate = new Catalog();

            cate = cateModels.GetbyID((int)cateId);
            if (cate != null)
            {                
                ////delete category
                bool rt = cateModels.Delete((int)cateId);

                if (rt)
                {
                    //// delete image category
                    if (!string.IsNullOrEmpty(cate.ImagePath))
                    {
                        string webRootPath = _hostingEnvironment.WebRootPath;
                        string fileDelete = Path.Combine(webRootPath, cate.ImagePath);
                        if (System.IO.File.Exists(fileDelete))
                        {
                            System.IO.File.Delete(fileDelete);
                        }

                        string fileDelete2 = Path.Combine(webRootPath, cate.ImagePath.Replace("sc_small_", "sc_full_"));
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
    }
}
