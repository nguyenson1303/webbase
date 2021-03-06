﻿namespace Web.Models
{
    using System;
    using System.Collections.Generic;
    using System.Linq;
    using System.Web;
    using System.Web.Mvc;

    using Web.Data;

    using Webdiyer.WebControls.Mvc;

    /// <summary>
    /// Catalog Models
    /// </summary>
    public class CatalogModels
    {
        /// <summary>
        /// Initializes a new instance of the <see cref="CatalogModels"/> class.
        /// </summary>
        public CatalogModels()
        : this(new DefaultCacheProvider())
        {
        }

        /// <summary>
        /// Initializes a new instance of the <see cref="CatalogModels"/> class.
        /// </summary>
        /// <param name="cacheProvider">The cache provider.</param>
        public CatalogModels(ICacheProvider cacheProvider)
        {
            this.Cache = cacheProvider;
        }

        /// <summary>
        /// Gets or sets the cache.
        /// </summary>
        /// <value>
        /// The cache.
        /// </value>
        public ICacheProvider Cache
        {
            get;
            set;
        }

        /// <summary>
        /// Adds the specified catalog object.
        /// </summary>
        /// <param name="catalog">catalog object</param>
        /// <returns>catalog identity</returns>
        public int Add(C_Catalog catalog)
        {
            using (var data = new Entities())
            {
                int rt = 0;
                try
                {
                    data.C_Catalog.Add(catalog);
                    data.SaveChanges();
                    rt = catalog.CatalogID;
                }
                catch (Exception)
                {
                    rt = 0;
                }

                return rt;
            }
        }

        /// <summary>
        /// Clears the cache.
        /// </summary>
        /// <param name="key">The key.</param>
        public void ClearCache(string key)
        {
            this.Cache.Invalidate(key);
        }

        /// <summary>
        /// Deletes the specified identifier.
        /// </summary>
        /// <param name="id">The identifier.</param>
        /// <returns>the Delete</returns>
        public bool Delete(int id)
        {
            using (var data = new Entities())
            {
                bool rt;
                try
                {
                    var c_gen = data.C_Catalog.Where(p => p.CatalogID == id).FirstOrDefault();
                    if (c_gen != null)
                    {
                        data.C_Catalog.Remove(c_gen);
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
        public int Edit(C_Catalog catalogObject)
        {
            using (var data = new Entities())
            {
                int rt = 0;
                try
                {
                    var c_gen = data.C_Catalog.Where(p => p.CatalogID == catalogObject.CatalogID).FirstOrDefault();
                    c_gen.ParentID = catalogObject.ParentID;
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
                    data.SaveChanges();
                    rt = catalogObject.CatalogID;
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
        /// <param name="page_index">The page index.</param>
        /// <param name="page_size">The page size.</param>
        /// <param name="order_by">The order by.</param>
        /// <param name="order_type">Type of the order.</param>
        /// <param name="total">The total.</param>
        /// <returns>get All Catalog By ParentID</returns>
        public PagedList<C_Catalog> GetAllCatalogByParentID(int parent, string type, string lang, string search, int page_index, int page_size, string order_by, string order_type, out int total)
        {
            using (var data = new Entities())
            {
                try
                {
                    int level = 0;
                    List<C_Catalog> list_select_catalog = new List<C_Catalog>();
                    this.List_catalog_parent_width_parent_name(0, level, (int)parent, type, lang, ref list_select_catalog);

                    IQueryable<C_Catalog> c_gen = list_select_catalog.AsQueryable<C_Catalog>();
                    if (!string.IsNullOrEmpty(search))
                    {
                        c_gen = c_gen.Where(p => p.CategoryName.Contains(search) || p.Link.Contains(search)).AsQueryable<C_Catalog>();
                    }

                    total = c_gen.Count();

                    return c_gen.ToPagedList(page_index, page_size);
                }
                catch (Exception)
                {
                    total = 0;
                    return null;
                }
            }
        }

        /// <summary>
        /// Get by the identifier.
        /// </summary>
        /// <param name="id">The identifier.</param>
        /// <returns>get by ID</returns>
        public C_Catalog GetbyID(int id)
        {
            using (var data = new Entities())
            {
                try
                {
                    var c_gen = data.C_Catalog.Where(p => p.CatalogID == id).FirstOrDefault();
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
        public C_Catalog GetbyLink(string link)
        {
            using (var data = new Entities())
            {
                try
                {
                    var c_gen = data.C_Catalog.Where(p => p.Link == link).FirstOrDefault();
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
        public List<C_Catalog> GetbyParentID(int id, string type, string lang)
        {
            using (var data = new Entities())
            {
                try
                {
                    List<C_Catalog> c_gen = new List<C_Catalog>();
                    if (!string.IsNullOrEmpty(type))
                    {
                        c_gen = data.C_Catalog.Where(p => p.ParentID == id && p.Type == type && p.Lang.Trim() == lang).ToList();
                    }
                    else
                    {
                        c_gen = data.C_Catalog.Where(p => p.ParentID == id && (p.Type == CommonGlobal.CateProduct || p.Type == CommonGlobal.CateCollection) && p.Lang.Trim() == lang).ToList();
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
        public List<C_Catalog> GetbyParentID(int id, string type, string lang, int number)
        {
            using (var data = new Entities())
            {
                try
                {
                    int level = 0;
                    List<C_Catalog> list_select_catalog = new List<C_Catalog>();
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
        public List<C_Catalog> GetbyParentWithoutCate(int id, string type, string lang, string without)
        {
            using (var data = new Entities())
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
        public List<C_Catalog> GetCatalogForProductHot(string lang)
        {
            using (var data = new Entities())
            {
                List<C_Catalog> list_catalog = new List<C_Catalog>();
                try
                {
                    var list_gen = data.f_Catalog_GetByProductHot(lang).ToList();
                    foreach (var it in list_gen)
                    {
                        C_Catalog c_gen = new C_Catalog();
                        c_gen.CatalogID = it.CatalogID;
                        c_gen.CategoryName = it.CategoryName;
                        c_gen.Description = it.Description;
                        c_gen.ImagePath = it.ImagePath;
                        c_gen.Intro = it.Intro;
                        c_gen.Keyword = it.Keyword;
                        c_gen.Lang = it.Lang;
                        c_gen.Link = it.Link;
                        c_gen.MoreInfo = it.MoreInfo;
                        c_gen.OrderDisplay = it.OrderDisplay;
                        c_gen.ParentID = it.ParentID;
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
            using (var data = new Entities())
            {
                int rt = 0;
                try
                {
                    rt = data.f_Catalog_GetParent(idChild);
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
        public List<C_Catalog> GetListNamebyListId(string arr_id, string cate_type)
        {
            using (var data = new Entities())
            {
                try
                {
                    var arrs = arr_id.Split(',').Select(int.Parse).ToList();
                    var c_gen = data.C_Catalog.Where(p => arrs.Contains(p.CatalogID) && p.Type == cate_type).ToList();
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
            using (var data = new Entities())
            {
                try
                {
                    var c_gen = data.C_Catalog.Where(p => p.Type == type).OrderByDescending(p => p.OrderDisplay).Take(1).FirstOrDefault();
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
        public List<C_Catalog> GetMenubyParentID(int id, string type, string lang)
        {
            using (var data = new Entities())
            {
                try
                {
                    var c_gen = data.C_Catalog.Where(p => p.ParentID == id && p.Type == type && p.Lang.Trim() == lang && p.Show == true).OrderBy(p => p.OrderDisplay).ToList();
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
            List<C_Catalog> catalog = this.GetbyParentID(parent, type, lang);
            if (parent == 0)
            {
                list_select_catalog.Add(new SelectListItem { Selected = selected == parent ? true : false, Text = "Không thuộc mục nào", Value = "0" });
            }
            else
            {
                level++;
            }

            foreach (C_Catalog cata in catalog)
            {
                if (parent == 0)
                {
                    list_select_catalog.Add(new SelectListItem { Selected = selected == cata.CatalogID ? true : false, Text = cata.CategoryName.ToString(), Value = cata.CatalogID.ToString() });
                }
                else
                {
                    list_select_catalog.Add(new SelectListItem { Selected = selected == cata.CatalogID ? true : false, Text = this.ReplaceSpace(level) + cata.CategoryName.ToString(), Value = cata.CatalogID.ToString() });
                }

                this.List_catalog_parent(cata.CatalogID, level, selected, type, lang, ref list_select_catalog);
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
        public void List_catalog_parent_no_append_name(int parent, int level, int selected, string type, string lang, ref List<C_Catalog> list_select_catalog)
        {
            ////CatalogModels cateModels = new CatalogModels();
            List<C_Catalog> catalog = this.GetbyParentID(parent, type, lang);
            if (parent == 0)
            {
            }
            else
            {
                level++;
            }

            foreach (C_Catalog cata in catalog)
            {
                list_select_catalog.Add(cata);
                this.List_catalog_parent_no_append_name(cata.CatalogID, level, selected, type, lang, ref list_select_catalog);
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
        /// <param name="list_select_catalog">The list select catalog.</param>
        public void List_catalog_parent_width_parent_name(int parent, int level, int selected, string type, string lang, ref List<C_Catalog> list_select_catalog)
        {
            ////CatalogModels cateModels = new CatalogModels();
            if(selected != 0)
            {
                parent = selected;
            }
            List<C_Catalog> catalog = this.GetbyParentID(parent, type, lang);
            if (parent == 0)
            {
            }
            else
            {
                level++;
            }

            foreach (C_Catalog cata in catalog)
            {
                if (parent == 0)
                {
                    list_select_catalog.Add(cata);
                    ////list_select_catalog.Add(new SelectListItem { Selected = (selected == cata.CatalogID ? true : false), Text = cata.CategoryName.ToString(), Value = cata.CatalogID.ToString() });
                }
                else
                {
                    ////get parent category
                    var pa = GetbyID((int)cata.ParentID);
                    cata.CategoryName = pa.CategoryName + " > " + cata.CategoryName.ToString();
                    list_select_catalog.Add(cata);
                    ////list_select_catalog.Add(new SelectListItem { Selected = (selected == cata.CatalogID ? true : false), Text = pa.CategoryName + " > " + cata.CategoryName.ToString(), Value = cata.CatalogID.ToString() });
                }

                this.List_catalog_parent_width_parent_name(cata.CatalogID, level, cata.CatalogID, type, lang, ref list_select_catalog);
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