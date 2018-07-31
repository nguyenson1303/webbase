namespace ApiBase.Models.BusinessAccess
{
    using System;
    using System.Collections.Generic;
    using System.Data.SqlClient;
    using System.Linq;
    using ApiBase.Models.DB;
    using Microsoft.EntityFrameworkCore;
    using Microsoft.AspNetCore.Mvc.Rendering;
    using System.Web;
    using ApiBase.Model.AdminViewModels;

    /// <summary>
    /// Catalog Models
    /// </summary>
    public class CatalogModels
    {
        /// <summary>
        /// Initializes a new instance of the <see cref="CatalogModels"/> class.
        /// </summary>
        public CatalogModels()
        {
        }

        /// <summary>
        /// Adds the specified catalog object.
        /// </summary>
        /// <param name="catalog">catalog object</param>
        /// <returns>catalog identity</returns>
        public int Add(Catalog catalog)
        {
            using (var data = new themanorContext())
            {
                int rt = 0;
                try
                {
                    data.Catalog.Add(catalog);
                    data.SaveChanges();
                    rt = catalog.CatalogId;
                }
                catch (Exception)
                {
                    rt = 0;
                }

                return rt;
            }
        }

        /// <summary>
        /// Deletes the specified identifier.
        /// </summary>
        /// <param name="id">The identifier.</param>
        /// <returns>the Delete</returns>
        public bool Delete(int id)
        {
            using (var data = new themanorContext())
            {
                bool rt;
                try
                {
                    var c_gen = data.Catalog.Where(p => p.CatalogId == id).FirstOrDefault();
                    if (c_gen != null)
                    {
                        data.Catalog.Remove(c_gen);
                        data.SaveChanges();
                        rt = true;
                    }
                    else
                    {
                        rt = false;
                    }
                }
                catch (Exception)
                {
                    rt = false;
                }

                return rt;
            }
        }

        /// <summary>
        /// Edits the specified it.
        /// </summary>
        /// <param name="catalogObject">catalog Object.</param>
        /// <returns>the Edit</returns>
        public int Edit(Catalog catalogObject, CatalogDetail catalogDetail)
        {
            using (var data = new themanorContext())
            {
                int rt = 0;
                try
                {
                    var c_gen = data.Catalog.Where(p => p.CatalogId == catalogObject.CatalogId).FirstOrDefault();
                    var c_genDetail = data.CatalogDetail.Where(x => x.CatalogId == catalogObject.CatalogId && x.Lang == catalogDetail.Lang).FirstOrDefault();
                    c_gen.ParentId = catalogObject.ParentId;
                    c_genDetail.CategoryName = catalogDetail.CategoryName;
                    c_gen.ImagePath = catalogObject.ImagePath;
                    c_genDetail.Link = catalogDetail.Link;
                    c_genDetail.Intro = catalogDetail.Intro;
                    c_genDetail.MoreInfo = catalogDetail.MoreInfo;
                    c_genDetail.Keyword = catalogDetail.Keyword;
                    c_genDetail.Description = catalogDetail.Description;
                    c_genDetail.Title = catalogDetail.Title;
                    c_gen.Type = catalogObject.Type;
                    c_gen.OrderDisplay = catalogObject.OrderDisplay;
                    c_gen.Show = catalogObject.Show;
                    c_genDetail.Lang = catalogDetail.Lang;
                    c_gen.ModifyDate = catalogObject.ModifyDate;
                    data.SaveChanges();
                    rt = catalogObject.CatalogId;
                }
                catch (Exception)
                {
                    rt = 0;
                }

                return rt;
            }
        }

        /// <summary>
        /// Gets all catalog by parent identifier.
        /// </summary>
        /// <param name="parent">The parent.</param>
        /// <param name="type">The type.</param>
        /// <param name="lang">The language.</param>
        /// <param name="search">The search.</param>
        /// <param name="pageIndex">The page index.</param>
        /// <param name="pageSize">The page size.</param>
        /// <param name="orderBy">The order by.</param>
        /// <param name="orderType">Type of the order.</param>
        /// <param name="total">The total.</param>
        /// <returns>get All Catalog By ParentID</returns>
        public List<AdminListCatalog> GetAllCatalogByParentID(int parent, string type, string lang, string search, int pageIndex, int pageSize, string orderBy, string orderType, out int total)
        {
            using (var data = new themanorContext())
            {
                try
                {
                    int level = 0;
                    List<AdminListCatalog> listSelectCatalog = new List<AdminListCatalog>();
                    this.ListCatalogParentWidthParentName(0, level, (int)parent, type, lang, ref listSelectCatalog);

                    IQueryable<AdminListCatalog> c_gen = listSelectCatalog.AsQueryable<AdminListCatalog>();
                    if (!string.IsNullOrEmpty(search))
                    {
                        c_gen = c_gen.Where(p => p.CategoryName.Contains(search) || p.Link.Contains(search)).AsQueryable<AdminListCatalog>();
                    }

                    total = c_gen.Count();

                    return c_gen.Skip((pageIndex - 1) * pageSize).Take(pageSize).ToList<AdminListCatalog>();
                }
                catch (Exception)
                {
                    total = 0;
                    return null;
                }
            }
        }

        public List<AdminListCatalog> AdminGetAllCatalogFullTree(string type, string lang, string search, int parentId, int pageIndex, int pageSize, out int total)
        {
            using (var data = new themanorContext())
            {
                try
                {
                    int level = 1;
                    IQueryable<AdminListCatalog> c_gen = null;
                    if (parentId != -1)
                    {
                        c_gen = (from a in data.Catalog
                                 join b in data.CatalogDetail on a.CatalogId equals b.CatalogId
                                 where a.ParentId == (int)parentId && b.Lang == lang
                                 select new AdminListCatalog {
                                     CatalogId = a.CatalogId,
                                     CategoryName = b.CategoryName,
                                     ClassLevel = "",
                                     CreateDate = a.CreateDate,
                                     Description = b.Description,
                                     ImagePath = a.ImagePath,
                                     Intro = b.Intro,
                                     Keyword = b.Keyword,
                                     Lang = b.Lang,
                                     Level = 0,
                                     Link = b.Link,
                                     ModifyDate = a.ModifyDate,
                                     MoreInfo = b.MoreInfo,
                                     OrderDisplay = a.OrderDisplay,
                                     ParentId = a.ParentId,
                                     Show = a.Show,
                                     Title = b.Title,
                                     Type = a.Type
                                 }).AsQueryable<AdminListCatalog>();
                    }
                    else
                    {
                        c_gen = (from a in data.Catalog
                                 join b in data.CatalogDetail on a.CatalogId equals b.CatalogId
                                 where b.Lang == lang
                                 select new AdminListCatalog
                                 {
                                     CatalogId = a.CatalogId,
                                     CategoryName = b.CategoryName,
                                     ClassLevel = "",
                                     CreateDate = a.CreateDate,
                                     Description = b.Description,
                                     ImagePath = a.ImagePath,
                                     Intro = b.Intro,
                                     Keyword = b.Keyword,
                                     Lang = b.Lang,
                                     Level = 0,
                                     Link = b.Link,
                                     ModifyDate = a.ModifyDate,
                                     MoreInfo = b.MoreInfo,
                                     OrderDisplay = a.OrderDisplay,
                                     ParentId = a.ParentId,
                                     Show = a.Show,
                                     Title = b.Title,
                                     Type = a.Type
                                 }).AsQueryable<AdminListCatalog>();
                    }

                    if (!string.IsNullOrEmpty(type))
                    {
                        c_gen = c_gen.Where(p => p.Type == type).AsQueryable<AdminListCatalog>();
                    }

                    recursiveCatalogList = new List<AdminListCatalog>();

                    // this.RecursiveDataAllPage(c_gen.ToList(), level);

                    if (!string.IsNullOrEmpty(search))
                    {
                        recursiveCatalogList = recursiveCatalogList.Where(p => p.CategoryName.Contains(search)).ToList();
                    }

                    total = recursiveCatalogList.ToList().Count();

                    return recursiveCatalogList.Skip((pageIndex - 1) * pageSize).Take(pageSize).ToList();
                }
                catch (Exception)
                {
                    total = 0;
                    return null;
                }
            }
        }

        //public void RecursiveDataAllPage(List<Catalog> list, int level)
        //{
        //    using (var data = new themanorContext())
        //    {
        //        if (list != null)
        //        {
        //            foreach (var item in list)
        //            {
        //                AdminListCatalog alug = new AdminListCatalog
        //                {
        //                    CatalogId = item.CatalogId,
        //                    ParentId = item.ParentId,
        //                    CategoryName = item.CategoryName,
        //                    Link = item.Link,
        //                    ImagePath = item.ImagePath,
        //                    Intro = item.Intro,
        //                    MoreInfo = item.MoreInfo,
        //                    Lang = item.Lang,
        //                    Show = item.Show,
        //                    Keyword = item.Keyword,
        //                    Description = item.Description,
        //                    Title = item.Title,
        //                    Type = item.Type,
        //                    OrderDisplay = item.OrderDisplay,
        //                    CreateDate = item.CreateDate,
        //                    ModifyDate = item.ModifyDate,
        //                    Level = level,
        //                    ClassLevel = "level" + level
        //                };

        //                recursiveCatalogList.Add(alug);

        //                var listChild = (from p in data.Catalog
        //                                 where p.ParentId == alug.CatalogId
        //                                 select p).ToList<Catalog>();

        //                if (listChild.Count > 0)
        //                {
        //                    RecursiveDataAllPage(listChild, (level + 1));
        //                }
        //            }
        //        }

        //    }
        //}

        private List<AdminListCatalog> recursiveCatalogList = new List<AdminListCatalog>();

        /// <summary>
        /// Get by the identifier.
        /// </summary>
        /// <param name="id">The identifier.</param>
        /// <returns>get by ID</returns>
        public AdminListCatalog GetbyID(int id, string lang)
        {
            using (var data = new themanorContext())
            {
                try
                {
                    var c_gen = (from a in data.Catalog
                                 join b in data.CatalogDetail on a.CatalogId equals b.CatalogId
                                 where a.CatalogId == id && b.Lang == lang
                                 select new AdminListCatalog
                                 {
                                     CatalogId = a.CatalogId,
                                     CategoryName = b.CategoryName,
                                     ClassLevel = "",
                                     CreateDate = a.CreateDate,
                                     Description = b.Description,
                                     ImagePath = a.ImagePath,
                                     Intro = b.Intro,
                                     Keyword = b.Keyword,
                                     Lang = b.Lang,
                                     Level = 0,
                                     Link = b.Link,
                                     ModifyDate = a.ModifyDate,
                                     MoreInfo = b.MoreInfo,
                                     OrderDisplay = a.OrderDisplay,
                                     ParentId = a.ParentId,
                                     Show = a.Show,
                                     Title = b.Title,
                                     Type = a.Type
                                 }).FirstOrDefault();
                    return c_gen;
                }
                catch (Exception)
                {
                    return null;
                }
            }
        }

        /// <summary>
        /// Get by the link.
        /// </summary>
        /// <param name="link">The link.</param>
        /// <returns>get by Link</returns>
        public AdminListCatalog GetbyLink(string link)
        {
            using (var data = new themanorContext())
            {
                try
                {
                    var c_gen = (from a in data.Catalog
                                 join b in data.CatalogDetail on a.CatalogId equals b.CatalogId
                                 where b.Link == link
                                 select new AdminListCatalog
                                 {
                                     CatalogId = a.CatalogId,
                                     CategoryName = b.CategoryName,
                                     ClassLevel = "",
                                     CreateDate = a.CreateDate,
                                     Description = b.Description,
                                     ImagePath = a.ImagePath,
                                     Intro = b.Intro,
                                     Keyword = b.Keyword,
                                     Lang = b.Lang,
                                     Level = 0,
                                     Link = b.Link,
                                     ModifyDate = a.ModifyDate,
                                     MoreInfo = b.MoreInfo,
                                     OrderDisplay = a.OrderDisplay,
                                     ParentId = a.ParentId,
                                     Show = a.Show,
                                     Title = b.Title,
                                     Type = a.Type
                                 }).FirstOrDefault();
                    return c_gen;
                }
                catch (Exception)
                {
                    return null;
                }
            }
        }

        /// <summary>
        /// Get by the parent identifier.
        /// </summary>
        /// <param name="id">The identifier.</param>
        /// <param name="type">The type.</param>
        /// <param name="lang">The language.</param>
        /// <returns>get by ParentID</returns>
        public List<AdminListCatalog> GetbyParentID(int id, string type, string lang)
        {
            using (var data = new themanorContext())
            {
                try
                {
                    List<AdminListCatalog> c_gen = new List<AdminListCatalog>();
                    if (!string.IsNullOrEmpty(type))
                    {
                        c_gen = (from a in data.Catalog
                                 join b in data.CatalogDetail on a.CatalogId equals b.CatalogId
                                 where a.ParentId == id && a.Type == type && b.Lang == lang
                                 select new AdminListCatalog
                                 {
                                     CatalogId = a.CatalogId,
                                     CategoryName = b.CategoryName,
                                     ClassLevel = "",
                                     CreateDate = a.CreateDate,
                                     Description = b.Description,
                                     ImagePath = a.ImagePath,
                                     Intro = b.Intro,
                                     Keyword = b.Keyword,
                                     Lang = b.Lang,
                                     Level = 0,
                                     Link = b.Link,
                                     ModifyDate = a.ModifyDate,
                                     MoreInfo = b.MoreInfo,
                                     OrderDisplay = a.OrderDisplay,
                                     ParentId = a.ParentId,
                                     Show = a.Show,
                                     Title = b.Title,
                                     Type = a.Type
                                 }).ToList();
                    }
                    else
                    {
                        c_gen = (from a in data.Catalog
                                 join b in data.CatalogDetail on a.CatalogId equals b.CatalogId
                                 where a.ParentId == id && (a.Type == CommonGlobal.CateProduct || a.Type == CommonGlobal.CateCollection) && b.Lang == lang
                                 select new AdminListCatalog
                                 {
                                     CatalogId = a.CatalogId,
                                     CategoryName = b.CategoryName,
                                     ClassLevel = "",
                                     CreateDate = a.CreateDate,
                                     Description = b.Description,
                                     ImagePath = a.ImagePath,
                                     Intro = b.Intro,
                                     Keyword = b.Keyword,
                                     Lang = b.Lang,
                                     Level = 0,
                                     Link = b.Link,
                                     ModifyDate = a.ModifyDate,
                                     MoreInfo = b.MoreInfo,
                                     OrderDisplay = a.OrderDisplay,
                                     ParentId = a.ParentId,
                                     Show = a.Show,
                                     Title = b.Title,
                                     Type = a.Type
                                 }).ToList();
                    }

                    return c_gen;
                }
                catch (Exception)
                {
                    return null;
                }
            }
        }

        /// <summary>
        /// Get by the parent identifier.
        /// </summary>
        /// <param name="id">The identifier.</param>
        /// <param name="type">The type.</param>
        /// <param name="lang">The language.</param>
        /// <param name="number">The number.</param>
        /// <returns>get by ParentID</returns>
        public List<AdminListCatalog> GetbyParentID(int id, string type, string lang, int number)
        {
            using (var data = new themanorContext())
            {
                try
                {
                    int level = 0;
                    List<AdminListCatalog> list_select_catalog = new List<AdminListCatalog>();
                    this.List_catalog_parent_no_append_name(0, level, id, type, lang, ref list_select_catalog);

                    if (number > 0)
                    {
                        return list_select_catalog.Take(number).ToList();
                    }
                    else
                    {
                        return list_select_catalog.ToList();
                    }
                }
                catch (Exception)
                {
                    return null;
                }
            }
        }

        /// <summary>
        /// Get by the parent without cate.
        /// </summary>
        /// <param name="id">The identifier.</param>
        /// <param name="type">The type.</param>
        /// <param name="lang">The language.</param>
        /// <param name="without">The without.</param>
        /// <returns>get by Parent Without Cate</returns>
        public List<AdminListCatalog> GetbyParentWithoutCate(int id, string type, string lang, string without)
        {
            using (var data = new themanorContext())
            {
                try
                {
                    return this.GetbyParentID(0, type, lang).Where(p => p.Show == true && p.CategoryName != without).ToList();
                }
                catch (Exception)
                {
                    return null;
                }
            }
        }

        /// <summary>
        /// Gets the catalog for product hot.
        /// </summary>
        /// <param name="lang">The language.</param>
        /// <returns>get Catalog For Product Hot</returns>
        public List<AdminListCatalog> GetCatalogForProductHot(string lang)
        {
            using (var data = new themanorContext())
            {
                List<AdminListCatalog> list_catalog = new List<AdminListCatalog>();
                try
                {
                    //var list_gen = data.f_Catalog_GetByProductHot(lang).ToList();

                    var Lang = new SqlParameter("@Lang", lang);
                    DbSet<AdminListCatalog> list_record = null;

                    var list_gen = list_record.FromSql("EXECUTE _Catalog_GetByProductHot  @Lang", Lang).ToList();

                    foreach (var it in list_gen)
                    {
                        AdminListCatalog c_gen = new AdminListCatalog
                        {
                            CatalogId = it.CatalogId,
                            CategoryName = it.CategoryName,
                            Description = it.Description,
                            ImagePath = it.ImagePath,
                            Intro = it.Intro,
                            Keyword = it.Keyword,
                            Lang = it.Lang,
                            Link = it.Link,
                            MoreInfo = it.MoreInfo,
                            OrderDisplay = it.OrderDisplay,
                            ParentId = it.ParentId,
                            Show = it.Show,
                            Title = it.Title,
                            Type = it.Type
                        };
                        list_catalog.Add(c_gen);
                    }

                    return list_catalog;
                }
                catch (Exception)
                {
                    return null;
                }
            }
        }

        /// <summary>
        /// Gets the catalog parent identifier.
        /// </summary>
        /// <param name="idChild">The identifier child.</param>
        /// <returns>get Catalog ParentID</returns>
        public int GetCatalogParentID(int idChild)
        {
            using (var data = new themanorContext())
            {
                int rt = 0;
                try
                {
                    //rt = data.f_Catalog_GetParent(idChild);

                    var CatalogID = new SqlParameter("@CatalogID", idChild);

                    rt = data.Database.ExecuteSqlCommand("_Catalog_GetParent  @CatalogID", CatalogID);
                }
                catch (Exception)
                {
                    rt = 0;
                }

                return rt;
            }
        }

        /// <summary>
        /// Gets the list name by list identifier.
        /// </summary>
        /// <param name="arr_id">The array identifier.</param>
        /// <param name="cate_type">Type of the cate.</param>
        /// <returns>get List Name by List Id</returns>
        public List<Catalog> GetListNamebyListId(string arr_id, string cate_type)
        {
            using (var data = new themanorContext())
            {
                try
                {
                    var arrs = arr_id.Split(',').Select(int.Parse).ToList();
                    var c_gen = data.Catalog.Where(p => arrs.Contains(p.CatalogId) && p.Type == cate_type).ToList();
                    return c_gen;
                }
                catch (Exception)
                {
                    return null;
                }
            }
        }

        /// <summary>
        /// Gets the maximum order display.
        /// </summary>
        /// <param name="type">The type.</param>
        /// <returns>Get Max Order Display</returns>
        public int GetMaxOrderDisplay(string type)
        {
            using (var data = new themanorContext())
            {
                try
                {
                    var c_gen = data.Catalog.Where(p => p.Type == type).OrderByDescending(p => p.OrderDisplay).Take(1).FirstOrDefault();
                    if (c_gen != null)
                    {
                        return c_gen.OrderDisplay ?? 0 + 1;
                    }
                    else
                    {
                        return 1;
                    }
                }
                catch (Exception)
                {
                    return 1;
                }
            }
        }

        /// <summary>
        /// Gets the menu by parent identifier.
        /// </summary>
        /// <param name="id">The identifier.</param>
        /// <param name="type">The type.</param>
        /// <param name="lang">The language.</param>
        /// <returns>get Menu by Parent ID</returns>
        public List<AdminListCatalog> GetMenubyParentID(int id, string type, string lang)
        {
            using (var data = new themanorContext())
            {
                try
                {
                    var c_gen = (from a in data.Catalog
                     join b in data.CatalogDetail on a.CatalogId equals b.CatalogId
                     where a.ParentId == id && b.Lang == lang && a.Show == true
                     select new AdminListCatalog
                     {
                         CatalogId = a.CatalogId,
                         CategoryName = b.CategoryName,
                         ClassLevel = "",
                         CreateDate = a.CreateDate,
                         Description = b.Description,
                         ImagePath = a.ImagePath,
                         Intro = b.Intro,
                         Keyword = b.Keyword,
                         Lang = b.Lang,
                         Level = 0,
                         Link = b.Link,
                         ModifyDate = a.ModifyDate,
                         MoreInfo = b.MoreInfo,
                         OrderDisplay = a.OrderDisplay,
                         ParentId = a.ParentId,
                         Show = a.Show,
                         Title = b.Title,
                         Type = a.Type
                     }).OrderBy(p => p.OrderDisplay).ToList();

                    return c_gen;
                }
                catch (Exception)
                {
                    return null;
                }
            }
        }

        /// <summary>
        /// Lists the catalog parent.
        /// </summary>
        /// <param name="parent">The parent.</param>
        /// <param name="level">The level.</param>
        /// <param name="selected">The selected.</param>
        /// <param name="type">The type.</param>
        /// <param name="lang">The language.</param>
        /// <param name="list_select_catalog">The list select catalog.</param>
        public void List_catalog_parent(int parent, int level, int selected, string type, string lang, ref List<SelectListItem> list_select_catalog)
        {
            ////CatalogModels cateModels = new CatalogModels();
            List<AdminListCatalog> catalog = this.GetbyParentID(parent, type, lang);
            if (parent == 0)
            {
                list_select_catalog.Add(new SelectListItem { Selected = selected == parent ? true : false, Text = "Không thuộc mục nào", Value = "0" });
            }
            else
            {
                level++;
            }

            foreach (AdminListCatalog cata in catalog)
            {
                if (parent == 0)
                {
                    list_select_catalog.Add(new SelectListItem { Selected = selected == cata.CatalogId ? true : false, Text = cata.CategoryName.ToString(), Value = cata.CatalogId.ToString() });
                }
                else
                {
                    list_select_catalog.Add(new SelectListItem { Selected = selected == cata.CatalogId ? true : false, Text = this.ReplaceSpace(level) + cata.CategoryName.ToString(), Value = cata.CatalogId.ToString() });
                }

                this.List_catalog_parent(cata.CatalogId, level, selected, type, lang, ref list_select_catalog);
            }
        }

        /// <summary>
        /// Lists the name of the catalog parent no append.
        /// </summary>
        /// <param name="parent">The parent.</param>
        /// <param name="level">The level.</param>
        /// <param name="selected">The selected.</param>
        /// <param name="type">The type.</param>
        /// <param name="lang">The language.</param>
        /// <param name="list_select_catalog">The list select catalog.</param>
        public void List_catalog_parent_no_append_name(int parent, int level, int selected, string type, string lang, ref List<AdminListCatalog> list_select_catalog)
        {
            ////CatalogModels cateModels = new CatalogModels();
            List<AdminListCatalog> catalog = this.GetbyParentID(parent, type, lang);
            if (parent == 0)
            {
            }
            else
            {
                level++;
            }

            foreach (AdminListCatalog cata in catalog)
            {
                list_select_catalog.Add(cata);
                this.List_catalog_parent_no_append_name(cata.CatalogId, level, selected, type, lang, ref list_select_catalog);
            }
        }

        /// <summary>
        /// Lists the name of the catalog parent width parent.
        /// </summary>
        /// <param name="parent">The parent.</param>
        /// <param name="level">The level.</param>
        /// <param name="selected">The selected.</param>
        /// <param name="type">The type.</param>
        /// <param name="lang">The language.</param>
        /// <param name="listSelectCatalog">The list select catalog.</param>
        public void ListCatalogParentWidthParentName(int parent, int level, int selected, string type, string lang, ref List<AdminListCatalog> listSelectCatalog)
        {
            ////CatalogModels cateModels = new CatalogModels();
            if (selected != 0)
            {
                parent = selected;
            }
            List<AdminListCatalog> catalog = this.GetbyParentID(parent, type, lang);
            if (parent == 0)
            {
            }
            else
            {
                level++;
            }

            foreach (AdminListCatalog cata in catalog)
            {
                if (parent == 0)
                {
                    listSelectCatalog.Add(cata);
                    ////list_select_catalog.Add(new SelectListItem { Selected = (selected == cata.CatalogID ? true : false), Text = cata.CategoryName.ToString(), Value = cata.CatalogID.ToString() });
                }
                else
                {
                    ////get parent category
                    var pa = GetbyID((int)cata.ParentId, lang);
                    cata.CategoryName = pa.CategoryName + " > " + cata.CategoryName.ToString();
                    listSelectCatalog.Add(cata);
                    ////list_select_catalog.Add(new SelectListItem { Selected = (selected == cata.CatalogID ? true : false), Text = pa.CategoryName + " > " + cata.CategoryName.ToString(), Value = cata.CatalogID.ToString() });
                }

                this.ListCatalogParentWidthParentName(cata.CatalogId, level, cata.CatalogId, type, lang, ref listSelectCatalog);
            }
        }

        /// <summary>
        /// replace the space.
        /// </summary>
        /// <param name="count">The count.</param>
        /// <returns>the Space</returns>
        public string ReplaceSpace(int count)
        {
            string rt = string.Empty;
            for (int i = 0; i < count; i++)
            {
                rt = rt + HttpUtility.HtmlDecode("--");
            }

            return rt;
        }
    }
}