namespace ApiBase.Models.BusinessAccess
{
    using ApiBase.Models.DB;
    using System;
    using System.Collections;
    using System.Collections.Generic;
    using System.Linq;

    /// <summary>
    /// Post Models
    /// </summary>
    public class PostModels
    {
        /// <summary>
        /// Initializes a new instance of the <see cref="PostModels"/> class.
        /// </summary>
        public PostModels()
        {
        }

        /// <summary>
        /// Adds the specified post.
        /// </summary>
        /// <param name="post">post object.</param>
        /// <returns>identity post add</returns>
        public int Add(Post post)
        {
            using (var data = new themanorContext())
            {
                int rt = 0;
                try
                {
                    data.Post.Add(post);
                    data.SaveChanges();
                    rt = post.PostId;
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
            using (var data = new themanorContext())
            {
                bool rt;
                try
                {
                    var c_gen = data.Post.Where(p => p.PostId == id).FirstOrDefault();
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
        /// Deletes the specified identifier.
        /// </summary>
        /// <param name="id">The identifier.</param>
        /// <returns>status Delete</returns>
        public bool Delete(int id)
        {
            using (var data = new themanorContext())
            {
                bool rt;
                try
                {
                    var c_gen = data.Post.Where(p => p.PostId == id).FirstOrDefault();
                    if (c_gen != null)
                    {
                        data.Post.Remove(c_gen);
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
        public int Edit(Post post)
        {
            using (var data = new themanorContext())
            {
                int rt = 0;
                try
                {
                    var c_gen = data.Post.Where(p => p.PostId == post.PostId).FirstOrDefault();
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
                    c_gen.CatelogId = post.CatelogId;
                    c_gen.Approve = post.Approve;

                    data.SaveChanges();
                    rt = post.PostId;
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
        public Post GetbyID(int id)
        {
            using (var data = new themanorContext())
            {
                try
                {
                    var c_gen = data.Post.Where(p => p.PostId == id).FirstOrDefault();
                    return c_gen;
                }
                catch (Exception)
                {
                    return new Post();
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
        /// <param name="page_size">The page site.</param>
        /// <param name="order_by">The order by.</param>
        /// <param name="order_type">Type of the order.</param>
        /// <param name="total">The total.</param>
        /// <returns>Get List Post All</returns>
        public List<Post> GetListPostAll(string lang, string cate_type, int? cate_id, string search, string tag, string param, int page_index, int page_size, string order_by, string order_type, out int total)
        {
            using (var data = new themanorContext())
            {
                try
                {
                    //// First, check the cache
                    IQueryable<Post> list = null;
                    if (list == null)
                    {
                        if (string.IsNullOrEmpty(search))
                        {
                            search = string.Empty;
                        }

                        if (cate_id == null || cate_id == 0)
                        {
                            list = (from p in data.Post
                                    join c in data.Catalog on p.CatelogId equals c.CatalogId
                                    where c.Type == cate_type && p.Lang.Trim().ToLower() == lang.Trim().ToLower() && p.Approve == true && p.PostName.Contains(search) && p.Title.Contains(search) && p.Summary.Contains(search) && p.PostContent.Contains(search)
                                    select p).OrderBy(p => p.OrderDisplay).AsQueryable<Post>();
                        }
                        else
                        {
                            list = (from p in data.Post
                                    join c in data.Catalog on p.CatelogId equals c.CatalogId
                                    where c.CatalogId == cate_id && c.Type == cate_type && p.Lang.Trim().ToLower() == lang.Trim().ToLower() && p.Approve == true && p.PostName.Contains(search) && p.Title.Contains(search) && p.Summary.Contains(search) && p.PostContent.Contains(search)
                                    select p).OrderBy(p => p.OrderDisplay).AsQueryable<Post>();
                        }

                        if (!string.IsNullOrEmpty(tag))
                        {
                            list = (from p in list
                                    join t in data.PostTag on p.PostId equals t.PostId
                                    where t.Link == tag
                                    select p).AsQueryable<Post>();
                        }

                        total = list.Count();

                        if (!string.IsNullOrEmpty(order_by) && !string.IsNullOrEmpty(order_type))
                        {
                            Type sortByPropType = typeof(Post).GetProperty(order_by).PropertyType;
                            ////calling the extension method using reflection
                            list = typeof(MyExtensions).GetMethod("CustomSort").MakeGenericMethod(new Type[] { typeof(Post), sortByPropType })
                                   .Invoke(list, new object[] { list, order_by, order_type }) as IQueryable<Post>;
                        }
                        else
                        {
                            ////if  orderBy null set default is OrderDisplay
                            list = list.OrderByDescending(p => p.OrderDisplay);
                        }
                                               
                    }
                    else
                    {
                        total = 0;
                    }

                    return list.Skip((page_index-1) * page_size).Take(page_size).ToList();
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
        /// <param name="page_size">The page site.</param>
        /// <param name="order_by">The order by.</param>
        /// <param name="order_type">Type of the order.</param>
        /// <param name="total">The total.</param>
        /// <returns>Get List Post All</returns>
        public List<Post> GetListPostAll(string lang, string cate_type, int? cate_id, string search, int page_index, int page_size, string order_by, string order_type, out int total)
        {
            try
            {
                List<Post> lstPost = new List<Post>();
                if (cate_id == null || cate_id == 0)
                {
                    lstPost = this.ListAll(cate_type, lang).ToList();
                }
                else
                {
                    lstPost = this.ListAll(cate_type, lang).Where(p => p.CatelogId == cate_id).ToList();
                }

                if (!string.IsNullOrEmpty(search))
                {
                    lstPost = lstPost.Where(p => p.PostName.ToLower().Contains(search.ToLower())).ToList();
                }

                total = lstPost.Count();

                return lstPost.Skip((page_index-1) * page_size).Take(page_size).ToList();
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
        public List<Post> GetListPostView(ArrayList list)
        {
            using (var data = new themanorContext())
            {
                try
                {
                    List<Post> returnList = new List<Post>();

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
        public List<Post> GetOthers(int id, int cate, string lang, int number)
        {
            using (var data = new themanorContext())
            {
                var c_gen = new List<Post>();
                try
                {
                    if (cate <= 0)
                    {
                        c_gen = (from p in data.Post
                                 where p.Lang.Trim().ToLower() == lang.Trim().ToLower() && p.PostId != id
                                 select p).OrderByDescending(p => p.DateModified).OrderByDescending(p => p.IsHot).OrderBy(p => p.OrderDisplay).Take(number).ToList<Post>();
                    }
                    else
                    {
                        c_gen = (from p in data.Post
                                 where p.CatelogId == cate && p.Lang.Trim().ToLower() == lang.Trim().ToLower() && p.PostId != id
                                 select p).OrderByDescending(p => p.DateModified).OrderByDescending(p => p.IsHot).OrderBy(p => p.OrderDisplay).Take(number).ToList<Post>();
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
        public Post GetPostByIDNotApprove(int id)
        {
            using (var data = new themanorContext())
            {
                try
                {
                    var c_gen = data.Post.Where(p => p.PostId == id && (p.Approve == false || p.Approve == null)).FirstOrDefault();
                    return c_gen;
                }
                catch (Exception)
                {
                    return new Post();
                }
            }
        }

        /// <summary>
        /// Lists all.
        /// </summary>
        /// <param name="type">The type.</param>
        /// <param name="lang">The language.</param>
        /// <returns>List All</returns>
        public List<Post> ListAll(string type, string lang)
        {
            using (var data = new themanorContext())
            {
                try
                {
                    var c_gen = (from p in data.Post
                                 join c in data.Catalog on p.CatelogId equals c.CatalogId
                                 where c.Type == type && p.Lang.Trim().ToLower() == lang.Trim().ToLower()
                                 select p).OrderByDescending(p => p.DateModified).OrderBy(p => p.OrderDisplay).ToList<Post>();
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
        public List<Post> ListByCateNotApprove(int id, string lang)
        {
            using (var data = new themanorContext())
            {
                try
                {
                    var c_gen = (from p in data.Post
                                 join c in data.Catalog on p.CatelogId equals c.CatalogId
                                 where c.CatalogId == id && p.Lang.Trim().ToLower() == lang.Trim().ToLower() && (p.Approve == false || p.Approve == null)
                                 select p).OrderByDescending(p => p.DateModified).OrderBy(p => p.OrderDisplay).ToList<Post>();
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
        public List<Post> Top10Type(string type, string lang)
        {
            using (var data = new themanorContext())
            {
                try
                {
                    var c_gen = (from p in data.Post
                                 join c in data.Catalog on p.CatelogId equals c.CatalogId
                                 where c.Type == type && p.Lang.Trim().ToLower() == lang.Trim().ToLower()
                                 select p).OrderByDescending(p => p.DateModified).OrderBy(p => p.OrderDisplay).Take(10).ToList<Post>();
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
        public List<Post> TopByCate(int id, string lang)
        {
            using (var data = new themanorContext())
            {
                try
                {
                    var c_gen = (from p in data.Post
                                 join c in data.Catalog on p.CatelogId equals c.CatalogId
                                 where c.CatalogId == id && p.Lang.Trim().ToLower() == lang.Trim().ToLower()
                                 select p).OrderByDescending(p => p.DateModified).OrderBy(p => p.OrderDisplay).Take(10).ToList<Post>();
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
        public List<Post> TopByType(string type, string lang)
        {
            using (var data = new themanorContext())
            {
                try
                {
                    var c_gen = (from p in data.Post
                                 join c in data.Catalog on p.CatelogId equals c.CatalogId
                                 where c.Type == type && p.Lang.Trim().ToLower() == lang.Trim().ToLower()
                                 select p).OrderByDescending(p => p.DateModified).OrderBy(p => p.OrderDisplay).ToList<Post>();
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
        public List<Post> TopPostHot(string type, string lang, int number)
        {
            using (var data = new themanorContext())
            {
                try
                {
                    //// First, check the cache
                    List<Post> c_gen = new List<Post>();

                    if (c_gen == null)
                    {
                        c_gen = (from p in data.Post
                                 join c in data.Catalog on p.CatelogId equals c.CatalogId
                                 where c.Type == type && p.Lang.Trim().ToLower() == lang.Trim().ToLower() && p.IsHot == true && p.Approve == true
                                 select p).OrderByDescending(p => p.DateModified).OrderByDescending(p => p.IsHot).OrderBy(p => p.OrderDisplay).Take(number).ToList<Post>();
                        
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
        public List<Post> TopPostHot(string type, int? cate_id, string lang, int number)
        {
            using (var data = new themanorContext())
            {
                try
                {
                    //// First, check the cache
                    List<Post> c_gen = null; ////Cache.Get(CommonGlobal.POST + type + lang + number) as List<Post>;

                    if (c_gen == null)
                    {
                        if (cate_id != null)
                        {
                            c_gen = (from p in data.Post
                                     join c in data.Catalog on p.CatelogId equals c.CatalogId
                                     where c.Type == type && p.Lang.Trim().ToLower() == lang.Trim().ToLower() && p.IsHot == true && p.Approve == true && c.CatalogId == cate_id
                                     select p).OrderByDescending(p => p.DateModified).OrderByDescending(p => p.IsHot).OrderBy(p => p.OrderDisplay).Take(number).ToList<Post>();
                        }
                        else
                        {
                            c_gen = (from p in data.Post
                                     join c in data.Catalog on p.CatelogId equals c.CatalogId
                                     where c.Type == type && p.Lang.Trim().ToLower() == lang.Trim().ToLower() && p.IsHot == true && p.Approve == true
                                     select p).OrderByDescending(p => p.DateModified).OrderByDescending(p => p.IsHot).OrderBy(p => p.OrderDisplay).Take(number).ToList<Post>();
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
        public Post TopType(string type, string lang)
        {
            using (var data = new themanorContext())
            {
                try
                {
                    var c_gen = (from p in data.Post
                                 join c in data.Catalog on p.CatelogId equals c.CatalogId
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