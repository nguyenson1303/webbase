namespace Web.Models
{
    using System;
    using System.Collections;
    using System.Collections.Generic;
    using System.Linq;
    using Web.Data;
    using Webdiyer.WebControls.Mvc;

    /// <summary>
    /// Post Models
    /// </summary>
    public class PostModels
    {
        /// <summary>
        /// Initializes a new instance of the <see cref="PostModels"/> class.
        /// </summary>
        public PostModels()
        : this(new DefaultCacheProvider())
        {
        }

        /// <summary>
        /// Initializes a new instance of the <see cref="PostModels"/> class.
        /// </summary>
        /// <param name="cacheProvider">The cache provider.</param>
        public PostModels(ICacheProvider cacheProvider)
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
        /// Adds the specified post.
        /// </summary>
        /// <param name="post">post object.</param>
        /// <returns>identity post add</returns>
        public int Add(C_Post post)
        {
            using (var data = new Entities())
            {
                int rt = 0;
                try
                {
                    data.C_Post.Add(post);
                    data.SaveChanges();
                    rt = post.PostID;
                }
                catch (Exception)
                {
                    rt = 0;
                }

                return rt;
            }
        }

        /// <summary>
        /// Approve the specified identifier.
        /// </summary>
        /// <param name="id">The identifier.</param>
        /// <returns>status Approve</returns>
        public bool Approve(int id)
        {
            using (var data = new Entities())
            {
                bool rt;
                try
                {
                    var c_gen = data.C_Post.Where(p => p.PostID == id).FirstOrDefault();
                    c_gen.Approve = true;

                    data.SaveChanges();
                    rt = true;
                }
                catch (Exception)
                {
                    rt = false;
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
        /// <returns>status Delete</returns>
        public bool Delete(int id)
        {
            using (var data = new Entities())
            {
                bool rt;
                try
                {
                    var c_gen = data.C_Post.Where(p => p.PostID == id).FirstOrDefault();
                    if (c_gen != null)
                    {
                        data.C_Post.Remove(c_gen);
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
        /// Edits the specified post.
        /// </summary>
        /// <param name="post">post object.</param>
        /// <returns>identity post Edit</returns>
        public int Edit(C_Post post)
        {
            using (var data = new Entities())
            {
                int rt = 0;
                try
                {
                    var c_gen = data.C_Post.Where(p => p.PostID == post.PostID).FirstOrDefault();
                    c_gen.Title = post.Title;
                    c_gen.Summary = post.Summary;
                    c_gen.PostName = post.PostName;
                    c_gen.PostContent = post.PostContent;
                    c_gen.IsHot = post.IsHot;
                    c_gen.OrderDisplay = post.OrderDisplay;
                    c_gen.ImagePath = post.ImagePath;
                    c_gen.Link = post.Link;
                    c_gen.Lang = post.Lang;
                    c_gen.Keyword = post.Keyword;
                    c_gen.Description = post.Description;
                    c_gen.DateModified = post.DateModified;
                    c_gen.CatelogID = post.CatelogID;
                    c_gen.Approve = post.Approve;

                    data.SaveChanges();
                    rt = post.PostID;
                }
                catch (Exception)
                {
                    rt = 0;
                }

                return rt;
            }
        }

        /// <summary>
        /// Get by the identifier.
        /// </summary>
        /// <param name="id">The identifier.</param>
        /// <returns>get by ID</returns>
        public C_Post GetbyID(int id)
        {
            using (var data = new Entities())
            {
                try
                {
                    var c_gen = data.C_Post.Where(p => p.PostID == id).FirstOrDefault();
                    return c_gen;
                }
                catch (Exception)
                {
                    return new C_Post();
                }
            }
        }

        /// <summary>
        /// Gets the list post all.
        /// </summary>
        /// <param name="lang">The language.</param>
        /// <param name="cate_type">Type of the cate.</param>
        /// <param name="cate_id">The cate identifier.</param>
        /// <param name="search">The search.</param>
        /// <param name="tag">The tag.</param>
        /// <param name="param">The parameter.</param>
        /// <param name="page_index">The page index.</param>
        /// <param name="page_site">The page site.</param>
        /// <param name="order_by">The order by.</param>
        /// <param name="order_type">Type of the order.</param>
        /// <param name="total">The total.</param>
        /// <returns>Get List Post All</returns>
        public PagedList<C_Post> GetListPostAll(string lang, string cate_type, int? cate_id, string search, string tag, string param, int page_index, int page_site, string order_by, string order_type, out int total)
        {
            using (var data = new Entities())
            {
                try
                {
                    //// First, check the cache
                    IQueryable<C_Post> list = this.Cache.Get(lang + cate_type + (cate_id ?? 0) + search + tag + param + page_index + page_site + order_by + order_type) as IQueryable<C_Post>;
                    if (list == null)
                    {
                        if (string.IsNullOrEmpty(search))
                        {
                            search = string.Empty;
                        }

                        if (cate_id == null || cate_id == 0)
                        {
                            list = (from p in data.C_Post
                                    join c in data.C_Catalog on p.CatelogID equals c.CatalogID
                                    where c.Type == cate_type && p.Lang.Trim().ToLower() == lang.Trim().ToLower() && p.Approve == true && p.PostName.Contains(search) && p.Title.Contains(search) && p.Summary.Contains(search) && p.PostContent.Contains(search)
                                    select p).OrderBy(p => p.OrderDisplay).AsQueryable<C_Post>();
                        }
                        else
                        {
                            list = (from p in data.C_Post
                                    join c in data.C_Catalog on p.CatelogID equals c.CatalogID
                                    where c.CatalogID == cate_id && c.Type == cate_type && p.Lang.Trim().ToLower() == lang.Trim().ToLower() && p.Approve == true && p.PostName.Contains(search) && p.Title.Contains(search) && p.Summary.Contains(search) && p.PostContent.Contains(search)
                                    select p).OrderBy(p => p.OrderDisplay).AsQueryable<C_Post>();
                        }

                        if (!string.IsNullOrEmpty(tag))
                        {
                            list = (from p in list
                                    join t in data.C_PostTag on p.PostID equals t.PostID
                                    where t.Link == tag
                                    select p).AsQueryable<C_Post>();
                        }

                        total = list.Count();

                        if (!string.IsNullOrEmpty(order_by) && !string.IsNullOrEmpty(order_type))
                        {
                            Type sortByPropType = typeof(C_Post).GetProperty(order_by).PropertyType;
                            ////calling the extension method using reflection
                            list = typeof(MyExtensions).GetMethod("CustomSort").MakeGenericMethod(new Type[] { typeof(C_Post), sortByPropType })
                                   .Invoke(list, new object[] { list, order_by, order_type }) as IQueryable<C_Post>;
                        }
                        else
                        {
                            ////if  orderBy null set default is OrderDisplay
                            list = list.OrderByDescending(p => p.OrderDisplay);
                        }

                        if (list.Any())
                        {
                            //// Put this data into the cache for 10 minutes
                            this.Cache.Set(lang + cate_type + (cate_id ?? 0) + search + tag + param + page_index + page_site + order_by + order_type, list, int.Parse(Util.GetConfigValue(CommonGlobal.TimeCache, "10")));
                        }
                    }
                    else
                    {
                        total = 0;
                    }

                    return list.ToPagedList(page_index, page_site);
                }
                catch (Exception)
                {
                    total = 0;
                    return null;
                }
            }
        }

        /// <summary>
        /// Gets the list post all.
        /// </summary>
        /// <param name="lang">The language.</param>
        /// <param name="cate_type">Type of the cate.</param>
        /// <param name="cate_id">The cate identifier.</param>
        /// <param name="search">The search.</param>
        /// <param name="page_index">The page index.</param>
        /// <param name="page_site">The page site.</param>
        /// <param name="order_by">The order by.</param>
        /// <param name="order_type">Type of the order.</param>
        /// <param name="total">The total.</param>
        /// <returns>Get List Post All</returns>
        public PagedList<C_Post> GetListPostAll(string lang, string cate_type, int? cate_id, string search, int page_index, int page_site, string order_by, string order_type, out int total)
        {
            try
            {
                List<C_Post> lstPost = new List<C_Post>();
                if (cate_id == null || cate_id == 0)
                {
                    lstPost = this.ListAll(cate_type, lang).ToList();
                }
                else
                {
                    lstPost = this.ListAll(cate_type, lang).Where(p => p.CatelogID == cate_id).ToList();
                }

                if (!string.IsNullOrEmpty(search))
                {
                    lstPost = lstPost.Where(p => p.PostName.ToLower().Contains(search.ToLower())).ToList();
                }

                total = lstPost.Count();

                return lstPost.AsQueryable().ToPagedList(page_index, page_site);
            }
            catch (Exception)
            {
                total = 0;
                return null;
            }
        }

        /// <summary>
        /// Gets the list post view.
        /// </summary>
        /// <param name="list">The list.</param>
        /// <returns>Get List Post View</returns>
        public List<C_Post> GetListPostView(ArrayList list)
        {
            using (var data = new Entities())
            {
                try
                {
                    List<C_Post> returnList = new List<C_Post>();

                    foreach (var postId in list)
                    {
                        if (postId != null && postId.ToString() != string.Empty)
                        {
                            returnList.Add(this.GetbyID(Convert.ToInt32(postId)));
                        }
                    }

                    return returnList;
                }
                catch
                {
                    return null;
                }
            }
        }

        /// <summary>
        /// Gets the others.
        /// </summary>
        /// <param name="id">The identifier.</param>
        /// <param name="cate">The cate.</param>
        /// <param name="lang">The language.</param>
        /// <param name="number">The number.</param>
        /// <returns>Get Others</returns>
        public List<C_Post> GetOthers(int id, int cate, string lang, int number)
        {
            using (var data = new Entities())
            {
                var c_gen = new List<C_Post>();
                try
                {
                    if (cate <= 0)
                    {
                        c_gen = (from p in data.C_Post
                                 where p.Lang.Trim().ToLower() == lang.Trim().ToLower() && p.PostID != id
                                 select p).OrderByDescending(p => p.DateModified).OrderByDescending(p => p.IsHot).OrderBy(p => p.OrderDisplay).Take(number).ToList<C_Post>();
                    }
                    else
                    {
                        c_gen = (from p in data.C_Post
                                 where p.CatelogID == cate && p.Lang.Trim().ToLower() == lang.Trim().ToLower() && p.PostID != id
                                 select p).OrderByDescending(p => p.DateModified).OrderByDescending(p => p.IsHot).OrderBy(p => p.OrderDisplay).Take(number).ToList<C_Post>();
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
        /// Gets the post by identifier not approve.
        /// </summary>
        /// <param name="id">The identifier.</param>
        /// <returns>get Post by ID Not Approve</returns>
        public C_Post GetPostByIDNotApprove(int id)
        {
            using (var data = new Entities())
            {
                try
                {
                    var c_gen = data.C_Post.Where(p => p.PostID == id && (p.Approve == false || p.Approve == null)).FirstOrDefault();
                    return c_gen;
                }
                catch (Exception)
                {
                    return new C_Post();
                }
            }
        }

        /// <summary>
        /// Lists all.
        /// </summary>
        /// <param name="type">The type.</param>
        /// <param name="lang">The language.</param>
        /// <returns>List All</returns>
        public List<C_Post> ListAll(string type, string lang)
        {
            using (var data = new Entities())
            {
                try
                {
                    var c_gen = (from p in data.C_Post
                                 join c in data.C_Catalog on p.CatelogID equals c.CatalogID
                                 where c.Type == type && p.Lang.Trim().ToLower() == lang.Trim().ToLower()
                                 select p).OrderByDescending(p => p.DateModified).OrderBy(p => p.OrderDisplay).ToList<C_Post>();
                    return c_gen;
                }
                catch (Exception)
                {
                    return null;
                }
            }
        }

        /// <summary>
        /// Lists the by cate not approve.
        /// </summary>
        /// <param name="id">The identifier.</param>
        /// <param name="lang">The language.</param>
        /// <returns>List By Cate Not Approve</returns>
        public List<C_Post> ListByCateNotApprove(int id, string lang)
        {
            using (var data = new Entities())
            {
                try
                {
                    var c_gen = (from p in data.C_Post
                                 join c in data.C_Catalog on p.CatelogID equals c.CatalogID
                                 where c.CatalogID == id && p.Lang.Trim().ToLower() == lang.Trim().ToLower() && (p.Approve == false || p.Approve == null)
                                 select p).OrderByDescending(p => p.DateModified).OrderBy(p => p.OrderDisplay).ToList<C_Post>();
                    return c_gen;
                }
                catch (Exception)
                {
                    return null;
                }
            }
        }

        /// <summary>
        /// Top10s the type.
        /// </summary>
        /// <param name="type">The type.</param>
        /// <param name="lang">The language.</param>
        /// <returns>Top 10 Type</returns>
        public List<C_Post> Top10Type(string type, string lang)
        {
            using (var data = new Entities())
            {
                try
                {
                    var c_gen = (from p in data.C_Post
                                 join c in data.C_Catalog on p.CatelogID equals c.CatalogID
                                 where c.Type == type && p.Lang.Trim().ToLower() == lang.Trim().ToLower()
                                 select p).OrderByDescending(p => p.DateModified).OrderBy(p => p.OrderDisplay).Take(10).ToList<C_Post>();
                    return c_gen;
                }
                catch (Exception)
                {
                    return null;
                }
            }
        }

        /// <summary>
        /// Tops the by cate.
        /// </summary>
        /// <param name="id">The identifier.</param>
        /// <param name="lang">The language.</param>
        /// <returns>Top By Cate</returns>
        public List<C_Post> TopByCate(int id, string lang)
        {
            using (var data = new Entities())
            {
                try
                {
                    var c_gen = (from p in data.C_Post
                                 join c in data.C_Catalog on p.CatelogID equals c.CatalogID
                                 where c.CatalogID == id && p.Lang.Trim().ToLower() == lang.Trim().ToLower()
                                 select p).OrderByDescending(p => p.DateModified).OrderBy(p => p.OrderDisplay).Take(10).ToList<C_Post>();
                    return c_gen;
                }
                catch (Exception)
                {
                    return null;
                }
            }
        }

        /// <summary>
        /// Tops the type of the by.
        /// </summary>
        /// <param name="type">The type.</param>
        /// <param name="lang">The language.</param>
        /// <returns>Top By Type</returns>
        public List<C_Post> TopByType(string type, string lang)
        {
            using (var data = new Entities())
            {
                try
                {
                    var c_gen = (from p in data.C_Post
                                 join c in data.C_Catalog on p.CatelogID equals c.CatalogID
                                 where c.Type == type && p.Lang.Trim().ToLower() == lang.Trim().ToLower()
                                 select p).OrderByDescending(p => p.DateModified).OrderBy(p => p.OrderDisplay).ToList<C_Post>();
                    return c_gen;
                }
                catch (Exception)
                {
                    return null;
                }
            }
        }

        /// <summary>
        /// Tops the post hot.
        /// </summary>
        /// <param name="type">The type.</param>
        /// <param name="lang">The language.</param>
        /// <param name="number">The number.</param>
        /// <returns>Top Post Hot</returns>
        public List<C_Post> TopPostHot(string type, string lang, int number)
        {
            using (var data = new Entities())
            {
                try
                {
                    //// First, check the cache
                    List<C_Post> c_gen = this.Cache.Get(CommonGlobal.Post + type + lang + number) as List<C_Post>;

                    if (c_gen == null)
                    {
                        c_gen = (from p in data.C_Post
                                 join c in data.C_Catalog on p.CatelogID equals c.CatalogID
                                 where c.Type == type && p.Lang.Trim().ToLower() == lang.Trim().ToLower() && p.IsHot == true && p.Approve == true
                                 select p).OrderByDescending(p => p.DateModified).OrderByDescending(p => p.IsHot).OrderBy(p => p.OrderDisplay).Take(number).ToList<C_Post>();

                        if (c_gen.Any())
                        {
                            //// Put this data into the cache for 10 minutes
                            this.Cache.Set(CommonGlobal.Post + type + lang + number, c_gen, int.Parse(Util.GetConfigValue(CommonGlobal.TimeCache, "10")));
                        }
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
        /// Tops the post hot.
        /// </summary>
        /// <param name="type">The type.</param>
        /// <param name="cate_id">The cate identifier.</param>
        /// <param name="lang">The language.</param>
        /// <param name="number">The number.</param>
        /// <returns>Top Post Hot</returns>
        public List<C_Post> TopPostHot(string type, int? cate_id, string lang, int number)
        {
            using (var data = new Entities())
            {
                try
                {
                    //// First, check the cache
                    List<C_Post> c_gen = null; ////Cache.Get(CommonGlobal.POST + type + lang + number) as List<C_Post>;

                    if (c_gen == null)
                    {
                        if (cate_id != null)
                        {
                            c_gen = (from p in data.C_Post
                                     join c in data.C_Catalog on p.CatelogID equals c.CatalogID
                                     where c.Type == type && p.Lang.Trim().ToLower() == lang.Trim().ToLower() && p.IsHot == true && p.Approve == true && c.CatalogID == cate_id
                                     select p).OrderByDescending(p => p.DateModified).OrderByDescending(p => p.IsHot).OrderBy(p => p.OrderDisplay).Take(number).ToList<C_Post>();
                        }
                        else
                        {
                            c_gen = (from p in data.C_Post
                                     join c in data.C_Catalog on p.CatelogID equals c.CatalogID
                                     where c.Type == type && p.Lang.Trim().ToLower() == lang.Trim().ToLower() && p.IsHot == true && p.Approve == true
                                     select p).OrderByDescending(p => p.DateModified).OrderByDescending(p => p.IsHot).OrderBy(p => p.OrderDisplay).Take(number).ToList<C_Post>();
                        }

                        if (c_gen.Any())
                        {
                            //// Put this data into the cache for 10 minutes
                            this.Cache.Set(CommonGlobal.Post + type + lang + number, c_gen, int.Parse(Util.GetConfigValue(CommonGlobal.TimeCache, "0")));
                        }
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
        /// Tops the type.
        /// </summary>
        /// <param name="type">The type.</param>
        /// <param name="lang">The language.</param>
        /// <returns>Top Type</returns>
        public C_Post TopType(string type, string lang)
        {
            using (var data = new Entities())
            {
                try
                {
                    var c_gen = (from p in data.C_Post
                                 join c in data.C_Catalog on p.CatelogID equals c.CatalogID
                                 where c.Type == type && p.Lang.Trim().ToLower() == lang.Trim().ToLower()
                                 select p).OrderByDescending(p => p.DateModified).OrderBy(p => p.OrderDisplay).Take(1).FirstOrDefault();
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