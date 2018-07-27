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
        public int Edit(Catalog catalogObject)
        {
            using (var data = new themanorContext())
            {
                int rt = 0;
                try
                {
                    var c_gen = data.Catalog.Where(p => p.CatalogId == catalogObject.CatalogId).FirstOrDefault();
                    c_gen.ParentId = catalogObject.ParentId;
                    c_gen.CategoryName = catalogObject.CategoryName;
                    c_gen.ImagePath = catalogObject.ImagePath;
                    c_gen.Link = catalogObject.Link;
                    c_gen.Intro = catalogObject.Intro;
                    c_gen.MoreInfo = catalogObject.MoreInfo;
                    c_gen.Keyword = catalogObject.Keyword;
                    c_gen.Description = catalogObject.Description;
                    c_gen.Title = catalogObject.Title;
                    c_gen.Type = catalogObject.Type;
                    c_gen.OrderDisplay = catalogObject.OrderDisplay;
                    c_gen.Show = catalogObject.Show;
                    c_gen.Lang = catalogObject.Lang;
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
        public List<Catalog> GetAllCatalogByParentID(int parent, string type, string lang, string search, int pageIndex, int pageSize, string orderBy, string orderType, out int total)
        {
            using (var data = new themanorContext())
            {
                try
                {
                    int level = 0;
                    List<Catalog> listSelectCatalog = new List<Catalog>();
                    this.ListCatalogParentWidthParentName(0, level, (int)parent, type, lang, ref listSelectCatalog);

                    IQueryable<Catalog> c_gen = listSelectCatalog.AsQueryable<Catalog>();
                    if (!string.IsNullOrEmpty(search))
                    {
                        c_gen = c_gen.Where(p => p.CategoryName.Contains(search) || p.Link.Contains(search)).AsQueryable<Catalog>();
                    }

                    total = c_gen.Count();

                    return c_gen.Skip((pageIndex - 1) * pageSize).Take(pageSize).ToList<Catalog>();
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
                    IQueryable<Catalog> c_gen = null;
                    if (parentId != -1)
                    {
                        c_gen = (from p in data.Catalog
                                 where p.ParentId == (int)parentId 
                                 select p).AsQueryable<Catalog>();
                    }
                    else
                    {
                        c_gen = (from p in data.Catalog
                                 select p).AsQueryable<Catalog>();
                    }

                    if (!string.IsNullOrEmpty(type))
                    {
                        c_gen = c_gen.Where(p => p.Type == type).AsQueryable<Catalog>();
                    }

                    recursiveCatalogList = new List<AdminListCatalog>();

                    this.RecursiveDataAllPage(c_gen.ToList(), level);

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

        public void RecursiveDataAllPage(List<Catalog> list, int level)
        {
            using (var data = new themanorContext())
            {
                if (list != null)
                {
                    foreach (var item in list)
                    {
                        AdminListCatalog alug = new AdminListCatalog
                        {
                            CatalogId = item.CatalogId,
                            ParentId = item.ParentId,
                            CategoryName = item.CategoryName,
                            Link = item.Link,
                            ImagePath = item.ImagePath,
                            Intro = item.Intro,
                            MoreInfo = item.MoreInfo,
                            Lang = item.Lang,
                            Show = item.Show,
                            Keyword = item.Keyword,
                            Description = item.Description,
                            Title = item.Title,
                            Type = item.Type,
                            OrderDisplay = item.OrderDisplay,
                            CreateDate = item.CreateDate,
                            ModifyDate = item.ModifyDate,
                            Level = level,
                            ClassLevel = "level" + level
                        };

                        recursiveCatalogList.Add(alug);

                        var listChild = (from p in data.Catalog
                                         where p.ParentId == alug.CatalogId
                                         select p).ToList<Catalog>();

                        if (listChild.Count > 0)
                        {
                            RecursiveDataAllPage(listChild, (level + 1));
                        }
                    }
                }

            }
        }

        private List<AdminListCatalog> recursiveCatalogList = new List<AdminListCatalog>();

        /// <summary>
        /// Get by the identifier.
        /// </summary>
        /// <param name="id">The identifier.</param>
        /// <returns>get by ID</returns>
        public Catalog GetbyID(int id)
        {
            using (var data = new themanorContext())
            {
                try
                {
                    var c_gen = data.Catalog.Where(p => p.CatalogId == id).FirstOrDefault();
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
        public Catalog GetbyLink(string link)
        {
            using (var data = new themanorContext())
            {
                try
                {
                    var c_gen = data.Catalog.Where(p => p.Link == link).FirstOrDefault();
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
        public List<Catalog> GetbyParentID(int id, string type, string lang)
        {
            using (var data = new themanorContext())
            {
                try
                {
                    List<Catalog> c_gen = new List<Catalog>();
                    if (!string.IsNullOrEmpty(type))
                    {
                        c_gen = data.Catalog.Where(p => p.ParentId == id && p.Type == type && p.Lang.Trim() == lang).ToList();
                    }
                    else
                    {
                        c_gen = data.Catalog.Where(p => p.ParentId == id && (p.Type == CommonGlobal.CateProduct || p.Type == CommonGlobal.CateCollection) && p.Lang.Trim() == lang).ToList();
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
        public List<Catalog> GetbyParentID(int id, string type, string lang, int number)
        {
            using (var data = new themanorContext())
            {
                try
                {
                    int level = 0;
                    List<Catalog> list_select_catalog = new List<Catalog>();
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
        public List<Catalog> GetbyParentWithoutCate(int id, string type, string lang, string without)
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
        public List<Catalog> GetCatalogForProductHot(string lang)
        {
            using (var data = new themanorContext())
            {
                List<Catalog> list_catalog = new List<Catalog>();
                try
                {
                    //var list_gen = data.f_Catalog_GetByProductHot(lang).ToList();

                    var Lang = new SqlParameter("@Lang", lang);

                    var list_gen = data.Catalog.FromSql("EXECUTE _Catalog_GetByProductHot  @Lang", Lang).ToList();

                    foreach (var it in list_gen)
                    {
                        Catalog c_gen = new Catalog();
                        c_gen.CatalogId = it.CatalogId;
                        c_gen.CategoryName = it.CategoryName;
                        c_gen.Description = it.Description;
                        c_gen.ImagePath = it.ImagePath;
                        c_gen.Intro = it.Intro;
                        c_gen.Keyword = it.Keyword;
                        c_gen.Lang = it.Lang;
                        c_gen.Link = it.Link;
                        c_gen.MoreInfo = it.MoreInfo;
                        c_gen.OrderDisplay = it.OrderDisplay;
                        c_gen.ParentId = it.ParentId;
                        c_gen.Show = it.Show;
                        c_gen.Title = it.Title;
                        c_gen.Type = it.Type;
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
        public List<Catalog> GetMenubyParentID(int id, string type, string lang)
        {
            using (var data = new themanorContext())
            {
                try
                {
                    var c_gen = data.Catalog.Where(p => p.ParentId == id && p.Type == type && p.Lang.Trim() == lang && p.Show == true).OrderBy(p => p.OrderDisplay).ToList();
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
            List<Catalog> catalog = this.GetbyParentID(parent, type, lang);
            if (parent == 0)
            {
                list_select_catalog.Add(new SelectListItem { Selected = selected == parent ? true : false, Text = "Không thuộc mục nào", Value = "0" });
            }
            else
            {
                level++;
            }

            foreach (Catalog cata in catalog)
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
        public void List_catalog_parent_no_append_name(int parent, int level, int selected, string type, string lang, ref List<Catalog> list_select_catalog)
        {
            ////CatalogModels cateModels = new CatalogModels();
            List<Catalog> catalog = this.GetbyParentID(parent, type, lang);
            if (parent == 0)
            {
            }
            else
            {
                level++;
            }

            foreach (Catalog cata in catalog)
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
        public void ListCatalogParentWidthParentName(int parent, int level, int selected, string type, string lang, ref List<Catalog> listSelectCatalog)
        {
            ////CatalogModels cateModels = new CatalogModels();
            if (selected != 0)
            {
                parent = selected;
            }
            List<Catalog> catalog = this.GetbyParentID(parent, type, lang);
            if (parent == 0)
            {
            }
            else
            {
                level++;
            }

            foreach (Catalog cata in catalog)
            {
                if (parent == 0)
                {
                    listSelectCatalog.Add(cata);
                    ////list_select_catalog.Add(new SelectListItem { Selected = (selected == cata.CatalogID ? true : false), Text = cata.CategoryName.ToString(), Value = cata.CatalogID.ToString() });
                }
                else
                {
                    ////get parent category
                    var pa = GetbyID((int)cata.ParentId);
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