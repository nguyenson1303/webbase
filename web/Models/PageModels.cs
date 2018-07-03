namespace Web.Models
{
    using System;
    using System.Collections.Generic;
    using System.Linq;
    using Web.Data;
    using Webdiyer.WebControls.Mvc;

    /// <summary>
    /// Page Models
    /// </summary>
    public class PageModels
    {
        /// <summary>
        /// Initializes a new instance of the <see cref="PageModels"/> class.
        /// </summary>
        public PageModels()
        {
        }

        /// <summary>
        /// Adds the specified page.
        /// </summary>
        /// <param name="page">page object.</param>
        /// <returns>the Add</returns>
        public int Add(C_Pages page)
        {
            using (var data = new Entities())
            {
                int rt = 0;
                try
                {
                    data.C_Pages.Add(page);
                    data.SaveChanges();
                    rt = page.PageID;
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
            using (var data = new Entities())
            {
                bool rt;
                try
                {
                    var c_gen = data.C_Pages.Where(p => p.PageID == id).FirstOrDefault();
                    if (c_gen != null)
                    {
                        data.C_Pages.Remove(c_gen);
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
        /// Edits the specified page.
        /// </summary>
        /// <param name="page">page object.</param>
        /// <returns>the Edit</returns>
        public int Edit(C_Pages page)
        {
            using (var data = new Entities())
            {
                int rt = 0;
                try
                {
                    var c_gen = data.C_Pages.Where(p => p.PageID == page.PageID).FirstOrDefault();
                    c_gen.Title = page.Title;
                    c_gen.Summary = page.Summary;
                    c_gen.Show = page.Show;
                    c_gen.PageName = page.PageName;
                    c_gen.PageContent = page.PageContent;
                    c_gen.OrderDisplay = page.OrderDisplay;
                    c_gen.ImagePath = page.ImagePath;
                    c_gen.Link = page.Link;
                    c_gen.Lang = page.Lang;
                    c_gen.Keyword = page.Keyword;
                    c_gen.Description = page.Description;
                    c_gen.DateModified = page.DateModified;

                    data.SaveChanges();
                    rt = page.PageID;
                }
                catch (Exception)
                {
                    rt = 0;
                }

                return rt;
            }
        }

        /// <summary>
        /// Gets all page static.
        /// </summary>
        /// <param name="lang">The language.</param>
        /// <returns>Get All Page Static</returns>
        public List<C_Pages> GetAllPageStatic(string lang)
        {
            using (var data = new Entities())
            {
                try
                {
                    var c_gen = data.C_Pages.Where(p => p.Show == true && (p.Lang.Trim().ToLower() == lang.Trim().ToLower())).OrderBy(p => p.OrderDisplay).ToList();
                    return c_gen;
                }
                catch (Exception)
                {
                    return null;
                }
            }
        }

        /// <summary>
        /// Gets all page static admin.
        /// </summary>
        /// <param name="lang">The language.</param>
        /// <param name="search">The search.</param>
        /// <param name="page_index">The page index.</param>
        /// <param name="page_size">The page size.</param>
        /// <param name="order_by">The order by.</param>
        /// <param name="order_type">Type of the order.</param>
        /// <param name="total">The total.</param>
        /// <returns>Get All Page Static Admin</returns>
        public PagedList<C_Pages> GetAllPageStaticAdmin(string lang, string search, int page_index, int page_size, string order_by, string order_type, out int total)
        {
            using (var data = new Entities())
            {
                try
                {
                    IQueryable<C_Pages> c_gen = data.C_Pages.Where(p => p.Show == true && p.Lang.Trim().ToLower() == lang.Trim().ToLower()).AsQueryable<C_Pages>();
                    if (!string.IsNullOrEmpty(search))
                    {
                        c_gen = c_gen.Where(p => p.PageName.Contains(search) || p.Link.Contains(search)).AsQueryable<C_Pages>();
                    }

                    total = c_gen.Count();

                    if (!string.IsNullOrEmpty(order_by) && !string.IsNullOrEmpty(order_type))
                    {
                        Type sortByPropType = typeof(C_Pages).GetProperty(order_by).PropertyType;
                        ////calling the extension method using reflection
                        c_gen = typeof(MyExtensions).GetMethod("CustomSort").MakeGenericMethod(new Type[] { typeof(C_Pages), sortByPropType })
                                .Invoke(c_gen, new object[] { c_gen, order_by, order_type }) as IQueryable<C_Pages>;
                    }
                    else
                    {
                        ////if  orderBy null set default is OrderDisplay
                        c_gen = c_gen.OrderByDescending(p => p.OrderDisplay);
                    }

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
        /// <returns>Get by ID</returns>
        public C_Pages GetbyID(int id)
        {
            using (var data = new Entities())
            {
                try
                {
                    var c_gen = data.C_Pages.Where(p => p.PageID == id).FirstOrDefault();
                    return c_gen;
                }
                catch (Exception)
                {
                    return new C_Pages();
                }
            }
        }

        /// <summary>
        /// Gets the maximum order display.
        /// </summary>
        /// <returns>Get Max Order Display</returns>
        public int GetMaxOrderDisplay()
        {
            using (var data = new Entities())
            {
                try
                {
                    var c_gen = data.C_Pages.OrderByDescending(p => p.OrderDisplay).Take(1).FirstOrDefault();
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
        /// Lists the specified language.
        /// </summary>
        /// <param name="lang">The language.</param>
        /// <returns>List page</returns>
        public List<C_Pages> List(string lang)
        {
            using (var data = new Entities())
            {
                try
                {
                    var c_gen = data.C_Pages.Where(p => p.Lang.Trim().ToLower() == lang.Trim().ToLower()).OrderBy(p => p.OrderDisplay).ToList();
                    return c_gen;
                }
                catch (Exception)
                {
                    return null;
                }
            }
        }
    }
}