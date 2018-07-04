namespace ApiBase.Models.BusinessAccess
{
    using ApiBase.Models.DB;
    using System;
    using System.Collections.Generic;
    using System.Linq;

    /// <summary>
    /// Link Models
    /// </summary>
    public class LinkModels
    {
        /// <summary>
        /// Initializes a new instance of the <see cref="LinkModels"/> class.
        /// </summary>
        public LinkModels()
        {
        }

        /// <summary>
        /// Adds the specified link.
        /// </summary>
        /// <param name="link">link object.</param>
        /// <returns>the Add</returns>
        public int Add(Link link)
        {
            using (var data = new themanorContext())
            {
                int rt = 0;
                try
                {
                    data.Link.Add(link);
                    data.SaveChanges();
                    rt = link.Id;
                }
                catch (Exception)
                {
                    rt = 0;
                }

                return rt;
            }
        }

        /// <summary>
        /// Admins the get all link ad.
        /// </summary>
        /// <param name="type">The type.</param>
        /// <param name="lang">The language.</param>
        /// <param name="search">The search.</param>
        /// <param name="page_index">The page index.</param>
        /// <param name="page_size">The page size.</param>
        /// <param name="order_by">The order by.</param>
        /// <param name="order_type">Type of the order.</param>
        /// <param name="total">The total.</param>
        /// <returns>admin Get All LinkAd</returns>
        public List<Link> AdminGetAllLinkAd(string type, string lang, string search, int page_index, int page_size, string order_by, string order_type, out int total)
        {
            using (var data = new themanorContext())
            {
                try
                {
                    IQueryable<Link> c_gen = null;
                    if (!string.IsNullOrEmpty(search))
                    {
                        c_gen = (from p in data.Link
                                 where p.Type == type && p.Lang.Trim().ToLower() == lang
                                 && (p.Title.Contains(search) || p.Summary.Contains(search))
                                 select p).OrderByDescending(p => p.OrderDisplay).AsQueryable<Link>();
                    }
                    else
                    {
                        c_gen = (from p in data.Link
                                 where p.Type == type && p.Lang.Trim().ToLower() == lang
                                 select p).OrderByDescending(p => p.OrderDisplay).AsQueryable<Link>();
                    }

                    total = c_gen.Count();

                    if (!string.IsNullOrEmpty(order_by) && !string.IsNullOrEmpty(order_type))
                    {
                        Type sortByPropType = typeof(Link).GetProperty(order_by).PropertyType;
                        ////calling the extension method using reflection
                        c_gen = typeof(MyExtensions).GetMethod("CustomSort").MakeGenericMethod(new Type[] { typeof(Link), sortByPropType })
                                .Invoke(c_gen, new object[] { c_gen, order_by, order_type }) as IQueryable<Link>;
                    }
                    else
                    {
                        ////if  orderBy null set default is ID
                        c_gen = c_gen.OrderBy(p => p.OrderDisplay);
                    }

                    return c_gen.Skip(page_index * page_size).Take(page_size).ToList();
                }
                catch (Exception)
                {
                    total = 0;
                    return null;
                }
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
                    var c_gen = data.Link.Where(p => p.Id == id).FirstOrDefault();
                    if (c_gen != null)
                    {
                        data.Link.Remove(c_gen);
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
        /// Gets the by identifier.
        /// </summary>
        /// <param name="id">The identifier.</param>
        /// <returns>Get By ID</returns>
        public Link GetByID(int id)
        {
            using (var data = new themanorContext())
            {
                try
                {
                    var c_gen = data.Link.Where(p => p.Id == id).FirstOrDefault();
                    return c_gen;
                }
                catch (Exception)
                {
                    return new Link();
                }
            }
        }

        /// <summary>
        /// Gets the type of the by.
        /// </summary>
        /// <param name="linkType">Type of the link.</param>
        /// <param name="lang">The language.</param>
        /// <returns>Get By Type</returns>
        public List<Link> GetByType(string linkType, string lang)
        {
            using (var data = new themanorContext())
            {
                try
                {
                    var c_gen = data.Link.Where(p => p.Type == linkType && p.Lang.Trim().ToLower() == lang.Trim().ToLower()).OrderBy(p => p.OrderDisplay).ToList();
                    return c_gen;
                }
                catch (Exception)
                {
                    return null;
                }
            }
        }

        /// <summary>
        /// Gets the by type top.
        /// </summary>
        /// <param name="linkType">Type of the link.</param>
        /// <param name="top">The top.</param>
        /// <param name="lang">The language.</param>
        /// <returns>Get By Type Top</returns>
        public List<Link> GetByTypeTop(string linkType, int top, string lang)
        {
            using (var data = new themanorContext())
            {
                try
                {
                    //// First, check the cache
                    List<Link> c_gen = null; ////Cache.Get(nType) as List<Link>;

                    if (c_gen == null)
                    {
                        c_gen = data.Link.Where(p => p.Type == linkType && p.Lang.Trim().ToLower() == lang.Trim().ToLower()).OrderBy(p => p.OrderDisplay).Take(top).ToList();

                        ////if (c_gen.Any())
                        ////{
                        ////    //// Put this data into the cache for 10 minutes
                        ////    Cache.Set(nType, c_gen, int.Parse(Util.getConfigValue(CommonGlobal.TIME_CACHE, "0")));
                        ////}
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
                    var c_gen = data.Link.Where(p => p.Type == type).OrderByDescending(p => p.OrderDisplay).Take(1).FirstOrDefault();
                    if (c_gen != null)
                    {
                        return (c_gen.OrderDisplay ?? 0) + 1;
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
        /// Lists the brand.
        /// </summary>
        /// <param name="selected">The selected.</param>
        /// <param name="type">The type.</param>
        /// <param name="lang">The language.</param>
        /// <param name="list_selected">The list selected.</param>
        //public void List_brand(string selected, string type, string lang, ref List<SelectListItem> list_selected)
        //{
        //    using (var data = new themanorContext())
        //    {
        //        List<Link> catalog = (from p in data.Link
        //                                where p.Type == type && p.Lang.Trim().ToLower() == lang
        //                                select p).OrderByDescending(p => p.OrderDisplay).ToList();
        //        foreach (Link cata in catalog)
        //        {
        //            list_selected.Add(new SelectListItem { Selected = selected == cata.Title ? true : false, Text = cata.Title.ToString(), Value = cata.Title.ToString() });
        //        }
        //    }
        //}

        /// <summary>
        /// Lists the brand full.
        /// </summary>
        /// <param name="selected">The selected.</param>
        /// <param name="type">The type.</param>
        /// <param name="lang">The language.</param>
        /// <returns>list brand full</returns>
        public List<Link> List_brand_full(string selected, string type, string lang)
        {
            using (var data = new themanorContext())
            {
                List<Link> catalog = (from p in data.Link
                                        where p.Type == type && p.Lang.Trim().ToLower() == lang
                                        select p).OrderByDescending(p => p.OrderDisplay).ToList();
                return catalog;
            }
        }

        /// <summary>
        /// Update the specified link.
        /// </summary>
        /// <param name="link">link object.</param>
        /// <returns>the Update</returns>
        public int Update(Link link)
        {
            using (var data = new themanorContext())
            {
                int rt = 0;
                try
                {
                    var c_gen = data.Link.Where(p => p.Id == link.Id).FirstOrDefault();
                    c_gen.Title = link.Title;
                    c_gen.Link1 = link.Link1;
                    c_gen.LinkContent = link.LinkContent;
                    c_gen.Summary = link.Summary;
                    c_gen.Lang = link.Lang;
                    c_gen.ImagePath = link.ImagePath;
                    c_gen.OrderDisplay = link.OrderDisplay;
                    c_gen.Type = link.Type;

                    data.SaveChanges();
                    rt = link.Id;
                }
                catch (Exception)
                {
                    rt = 0;
                }

                return rt;
            }
        }
    }
}