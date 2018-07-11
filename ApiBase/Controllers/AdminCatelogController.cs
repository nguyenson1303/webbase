using ApiBase.Models.AdminViewModels;
using ApiBase.Models.BusinessAccess;
using ApiBase.Models.DB;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.Rendering;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Security.Claims;
using System.Text;

// For more information on enabling Web API for empty projects, visit https://go.microsoft.com/fwlink/?LinkID=397860

namespace ApiBase.Controllers
{
    [Route("api/[controller]")]
    public class AdminCatelogController : Controller
    {
        // GET: api/values
        [HttpGet, Authorize(Roles = "Admin")]
        public IActionResult Get(int? parent, int? cateId, string path, string type, string typeAct, string lang, string search, int? page, int? page_size, string order_by, string order_type)
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
            int totalRecord = 0;
            int level = 0;


                /////type is get type catalog
                /////ex   : SP - product
                /////     : TT - news
                /////     : CL - collection
                /////     : LB - lookbook
                /////     : GL - gallery
                /////parent is parent id
                type = type ?? CommonGlobal.CateProduct;

                path = path ?? "/api/adminCatelog/listCatelog";

                page = page ?? 1;

                parent = parent ?? 0;

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
                    order_by = "OrderDisplay";
                    order_type = "asc";
                }

                if (parent != 0)
                {
                    cate = cateModels.GetbyID((int)parent);
                    listCatalogView.Category_name = cate.CategoryName;
                }

            ////check permission update
            if (UserModels.CheckPermission(userLogin, path, typeAct, type))
            {
                listCatalogView.Type = type;
                listCatalogView.Cate_type = CommonGlobal.GetCatalogTypeName(type);
                listCatalogView.Parent = (int)parent;
                listCatalogView.Lang = lang;
                listCatalogView.Type_act = typeAct;

                ////list page size and paging
                listCatalogView.Page = (int)page;
                listCatalogView.Page_size = (int)page_size;

                ////list catalog
                listCatalogView.Page_list_catalog = cateModels.GetAllCatalogByParentID((int)parent, type, lang, search, (int)page, (int)page_size, order_by, order_type, out totalRecord);
                listCatalogView.Search = search;
                listCatalogView.Order_by = order_by;
                listCatalogView.Order_type = order_type;
                listCatalogView.Total_record = totalRecord;

                ////acton and parent action
                listCatalogView.Path = path;

                response = Json(listCatalogView);
            }
            else
            {
                response = Json(new { code = Constant.PermissionDeniedCode, message = Constant.MessagePermissionDenied });
            }

            return response;
        }

        // GET api/values/5
        [HttpGet("{cateId}"), Authorize(Roles = "Admin")]
        public IActionResult Get(int? cateId, int? parent, string type, string path, string lang, string typeAct)
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
            path = path ?? "api/adminCatalog/";
            cateId = cateId ?? 0;


            if (string.IsNullOrEmpty(lang))
            {
                lang = LanguageModels.ActiveLanguage().LangCultureName;
            }

            var action = sv.GetActionByActionName(CommonGlobal.View);

            typeAct = action != null ? action.Id.ToString() : string.Empty;

            if (UserModels.CheckPermission(userLogin, path, typeAct, type))
            {
               cate = cateModels.GetbyID((int)cateId);
               catalogView.Lang = cate.Lang ?? lang;
               catalogView.Cate_id = cate.CatalogId;
               catalogView.Category_name = cate.CategoryName;
               catalogView.ImagePath = cate.ImagePath;
               catalogView.Intro = cate.Intro;
               catalogView.MoreInfo = cate.MoreInfo;
               catalogView.Keyword = cate.Keyword;
               catalogView.Description = cate.Description;
               catalogView.Title = cate.Title;
               catalogView.Link = cate.Link;
               catalogView.Parent = cate.ParentId ?? 0;
               if ((cate.Show ?? false) == true)
               {
                   catalogView.Show = true;
                   catalogView.Show_text = "checked='checked'";
               }
               else
               {
                   catalogView.Show = false;
                   catalogView.Show_text = string.Empty;
               }

               catalogView.OrderDisplay = (int)cate.OrderDisplay;
               catalogView.Type = type;
               catalogView.Type_act = typeAct;

                ////action and parent action
                catalogView.Path = path;
            }
            else
            {
                response = Json(new { code = Constant.PermissionDeniedCode, message = Constant.MessagePermissionDenied });
            }

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

            string path = "api/adminCatalog/";

            var action = userModels.GetActionByActionName(CommonGlobal.Add);

            string typeAct = action != null ? action.Id.ToString() : string.Empty;

            string type = string.Empty;

            List<SelectListItem> listSelectCatalog = new List<SelectListItem>();

            ////validation server
            if (string.IsNullOrEmpty(adminCatalogView.Category_name))
            {
                is_valid = false;
                mess = Constant.MessageDataEmpty;
                response = StatusCode(200, Json(new { code = Constant.Empty, message = mess, field = "Category" }));
            }

            if (!is_valid)
            {
                return response;
            }

            ////check permission update
            if (UserModels.CheckPermission(userLogin, path, typeAct, type))
            {
                cate.CategoryName = adminCatalogView.Category_name;
                cate.Description = string.IsNullOrEmpty(adminCatalogView.Description) == false ? adminCatalogView.Description : string.Empty;
                cate.Keyword = string.IsNullOrEmpty(adminCatalogView.Keyword) == false ? adminCatalogView.Keyword : string.Empty;
                if (!string.IsNullOrEmpty(adminCatalogView.Title))
                {
                    cate.Title = adminCatalogView.Title;
                }
                else
                {
                    cate.Title = adminCatalogView.Category_name;
                    adminCatalogView.Title = cate.Title;
                }

                cate.Intro = string.IsNullOrEmpty(adminCatalogView.Intro) == false ? adminCatalogView.Intro : string.Empty;
                cate.MoreInfo = string.IsNullOrEmpty(adminCatalogView.MoreInfo) == false ? adminCatalogView.MoreInfo : string.Empty;
                cate.Lang = adminCatalogView.Lang;
                cate.OrderDisplay = adminCatalogView.OrderDisplay;
                cate.ParentId = adminCatalogView.Parent;
                cate.Show = adminCatalogView.Show;
                if ((cate.Show ?? false) == true)
                {
                    adminCatalogView.Show = true;
                    adminCatalogView.Show_text = "checked='checked'";
                }
                else
                {
                    adminCatalogView.Show = false;
                    adminCatalogView.Show_text = string.Empty;
                }

                cate.Link = CommonGlobal.CompleteLink(adminCatalogView.Category_name);
                cate.Type = adminCatalogView.Type;

                var imgPathTemp = "images/catalog/" + DateTime.Now.Year.ToString() + "/" + DateTime.Now.Month.ToString() + "/";
                var name_time = DateTime.Now.Day + DateTime.Now.Month + DateTime.Now.Year + DateTime.Now.Hour + DateTime.Now.Minute + string.Empty;

                //if (file_image != null && file_image.ContentLength > 0 && CommonGlobal.IsImage(file_image) == true)
                //{
                //    string image_small = imgPathTemp + "sc_small_" + name_time + "_" + CommonGlobal.CompleteNamefileImages(file_image.FileName);
                //    string image_lager = imgPathTemp + "sc_full_" + name_time + "_" + CommonGlobal.CompleteNamefileImages(file_image.FileName);
                //    ////save image and delete old file
                //    //this.SavephotoCategory(cate.ImagePath, file_image, imgPathTemp, image_small, image_lager);

                //    ////save image and delete old file
                //    this.SavephotoOriginal(cate.ImagePath, file_image, imgPathTemp, image_lager);

                //    ////set image thumb to link catalog
                //    cate.ImagePath = "/" + image_lager;
                //    catalog_view.ImagePath = "/" + image_lager;
                //}
                //else if (string.IsNullOrEmpty(cate.ImagePath))
                //{
                //    cate.ImagePath = "0";
                //}
                //else
                //{
                //    cate.ImagePath = catalog_view.ImagePath;
                //}

                rt = cateModels.Add(cate);

                if (rt > 0)
                {
                    adminCatalogView.Cate_id = rt;
                    adminCatalogView.Cate_type = CommonGlobal.Edit;
                    response = Json(new { code = Constant.Success, message = Constant.MessageCreateCompleted });
                }
                else
                {
                    response = Json(new { code = Constant.Fail, message = Constant.MessageCreateUncompleted });
                }

                return response;
            }
            else
            {
                response = Json(new { code = Constant.PermissionDeniedCode, message = Constant.MessagePermissionDenied });
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

            string path = "api/adminCatalog/";

            var action = userModels.GetActionByActionName(CommonGlobal.Add);

            string typeAct = action != null ? action.Id.ToString() : string.Empty;

            string type = string.Empty;

            ////validation server
            if (string.IsNullOrEmpty(adminCatalogView.Category_name))
            {
                is_valid = false;
                mess = Constant.MessageDataEmpty;
                response = StatusCode(200, Json(new { code = Constant.Empty, message = mess, field = "Category" }));
            }

            if (!is_valid)
            {
                return response;
            }

            ////check permission update
            if (UserModels.CheckPermission(userLogin, path, typeAct, type))
            {
                cate.CatalogId = id;
                cate.CategoryName = adminCatalogView.Category_name;
                cate.Description = string.IsNullOrEmpty(adminCatalogView.Description) == false ? adminCatalogView.Description : string.Empty;
                cate.Keyword = string.IsNullOrEmpty(adminCatalogView.Keyword) == false ? adminCatalogView.Keyword : string.Empty;
                if (!string.IsNullOrEmpty(adminCatalogView.Title))
                {
                    cate.Title = adminCatalogView.Title;
                }
                else
                {
                    cate.Title = adminCatalogView.Category_name;
                    adminCatalogView.Title = cate.Title;
                }

                cate.Intro = string.IsNullOrEmpty(adminCatalogView.Intro) == false ? adminCatalogView.Intro : string.Empty;
                cate.MoreInfo = string.IsNullOrEmpty(adminCatalogView.MoreInfo) == false ? adminCatalogView.MoreInfo : string.Empty;
                cate.Lang = adminCatalogView.Lang;
                cate.OrderDisplay = adminCatalogView.OrderDisplay;
                cate.ParentId = adminCatalogView.Parent;
                cate.Show = adminCatalogView.Show;
                if ((cate.Show ?? false) == true)
                {
                    adminCatalogView.Show = true;
                    adminCatalogView.Show_text = "checked='checked'";
                }
                else
                {
                    adminCatalogView.Show = false;
                    adminCatalogView.Show_text = string.Empty;
                }

                cate.Link = CommonGlobal.CompleteLink(adminCatalogView.Category_name);
                cate.Type = adminCatalogView.Type;

                var imgPathTemp = "images/catalog/" + DateTime.Now.Year.ToString() + "/" + DateTime.Now.Month.ToString() + "/";
                var name_time = DateTime.Now.Day + DateTime.Now.Month + DateTime.Now.Year + DateTime.Now.Hour + DateTime.Now.Minute + string.Empty;

                //if (file_image != null && file_image.ContentLength > 0 && CommonGlobal.IsImage(file_image) == true)
                //{
                //    string image_small = imgPathTemp + "sc_small_" + name_time + "_" + CommonGlobal.CompleteNamefileImages(file_image.FileName);
                //    string image_lager = imgPathTemp + "sc_full_" + name_time + "_" + CommonGlobal.CompleteNamefileImages(file_image.FileName);
                //    ////save image and delete old file
                //    //this.SavephotoCategory(cate.ImagePath, file_image, imgPathTemp, image_small, image_lager);

                //    ////save image and delete old file
                //    this.SavephotoOriginal(cate.ImagePath, file_image, imgPathTemp, image_lager);

                //    ////set image thumb to link catalog
                //    cate.ImagePath = "/" + image_lager;
                //    catalog_view.ImagePath = "/" + image_lager;
                //}
                //else if (string.IsNullOrEmpty(cate.ImagePath))
                //{
                //    cate.ImagePath = "0";
                //}
                //else
                //{
                //    cate.ImagePath = catalog_view.ImagePath;
                //}

                rt = cateModels.Edit(cate);

                if (rt > 0)
                {
                    adminCatalogView.Cate_id = rt;
                    adminCatalogView.Cate_type = CommonGlobal.Edit;
                    response = Json(new { code = Constant.Success, message = Constant.MessageUpdateCompleted });
                }
                else
                {
                    response = Json(new { code = Constant.Fail, message = Constant.MessageUpdateUncompleted });
                }

                return response;
            }
            else
            {
                response = Json(new { code = Constant.PermissionDeniedCode, message = Constant.MessagePermissionDenied });
            }

            return response;
        }

        // DELETE api/values/5
        [HttpDelete("{cateId}"), Authorize(Roles = "Admin")]
        public IActionResult Delete(int? cateId, string type, string path, string lang, string type_act)
        {
            IActionResult response = null;
            string mess = string.Empty;
            UserModels userModels = new UserModels();

            var identity = (ClaimsIdentity)User.Identity;
            IEnumerable<Claim> claims = identity.Claims;
            var userLogin = claims.FirstOrDefault(c => c.Type == ClaimTypes.Email).Value;

            CatalogModels cateModels = new CatalogModels();
            Catalog cate = new Catalog();

            if (UserModels.CheckPermission(userLogin, path, type_act, type))
            {
                cate = cateModels.GetbyID((int)cateId);
                if (cate != null)
                {
                    ////delete old image
                    //if (!string.IsNullOrEmpty(cate.ImagePath))
                    //{
                    //    string strImg = cate.ImagePath;
                    //    strImg = "~" + strImg;
                    //    string fileDelete = Server.MapPath(strImg);
                    //    if (System.IO.File.Exists(fileDelete))
                    //    {
                    //        System.IO.File.Delete(fileDelete);
                    //    }

                    //    string fileDelete2 = Server.MapPath(strImg.Replace("sc_small_", "sc_full_"));
                    //    if (System.IO.File.Exists(fileDelete2))
                    //    {
                    //        System.IO.File.Delete(fileDelete2);
                    //    }
                    //}

                    ////delete category
                    bool rt = cateModels.Delete((int)cateId);
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
                response = Json(new { code = Constant.PermissionDeniedCode, message = Constant.MessagePermissionDenied });
            }

            return response;
        }
    }
}
