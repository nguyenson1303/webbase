namespace ApiBase.Models.BusinessAccess
{
    using ApiBase.Model.AdminViewModels;
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
        public int Edit(PostFull post, string lang)
        {
            using (var data = new themanorContext())
            {
                int rt = 0;
                try
                {
                    var c_gen = (from a in data.Post
                                 join b in data.PostDetail on a.PostId equals b.PostId
                                 where a.PostId == post.PostId && b.Lang == lang
                                 select new PostFull
                                 {
                                     CatalogId = a.CatalogId,
                                     PostId = a.PostId,
                                     PostDetailId = b.PostDetailId,
                                     Title = b.Title,
                                     Summary = b.Summary,
                                     PostName = b.PostName,
                                     PostContent = b.PostContent,
                                     IsHot = a.IsHot,
                                     OrderDisplay = a.OrderDisplay,
                                     ImagePath = a.ImagePath,
                                     Link = b.Link,
                                     Lang = b.Lang,
                                     Keyword = b.Keyword,
                                     Description = b.Description,
                                     DateModified = b.DateModified,
                                     Approve = a.Approve
                                 }).FirstOrDefault();

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
        public PostFull GetbyID(int id, string lang)
        {
            using (var data = new themanorContext())
            {
                try
                {
                    var c_gen = (from a in data.Post
                                 join b in data.PostDetail on a.PostId equals b.PostId
                                 where a.PostId == id && b.Lang == lang
                                 select new PostFull
                                 {
                                     CatalogId = a.CatalogId,
                                     PostId = a.PostId,
                                     PostDetailId = b.PostDetailId,
                                     Title = b.Title,
                                     Summary = b.Summary,
                                     PostName = b.PostName,
                                     PostContent = b.PostContent,
                                     IsHot = a.IsHot,
                                     OrderDisplay = a.OrderDisplay,
                                     ImagePath = a.ImagePath,
                                     Link = b.Link,
                                     Lang = b.Lang,
                                     Keyword = b.Keyword,
                                     Description = b.Description,
                                     DateModified = b.DateModified,
                                     Approve = a.Approve
                                 }).FirstOrDefault();
                    return c_gen;
                }
                catch (Exception)
                {
                    return new PostFull();
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
        public List<PostFull> GetListPostAll(string lang, string cate_type, int? cate_id, string search, string tag, string param, int page_index, int page_size, string order_by, string order_type, out int total)
        {
            using (var data = new themanorContext())
            {
                try
                {
                    //// First, check the cache
                    IQueryable<PostFull> list = null;
                    if (list == null)
                    {
                        if (string.IsNullOrEmpty(search))
                        {
                            search = string.Empty;
                        }

                        if (cate_id == null || cate_id == 0)
                        {
                            list = (from p in data.Post
                                    join b in data.PostDetail on p.PostId equals b.PostId
                                    join c in data.Catalog on p.CatalogId equals c.CatalogId
                                    where c.Type == cate_type && b.Lang.Trim().ToLower() == lang.Trim().ToLower() && p.Approve == true && b.PostName.Contains(search) && b.Title.Contains(search) && b.Summary.Contains(search) && b.PostContent.Contains(search)
                                    select new PostFull
                                    {
                                        CatalogId = p.CatalogId,
                                        PostId = p.PostId,
                                        PostDetailId = b.PostDetailId,
                                        Title = b.Title,
                                        Summary = b.Summary,
                                        PostName = b.PostName,
                                        PostContent = b.PostContent,
                                        IsHot = p.IsHot,
                                        OrderDisplay = p.OrderDisplay,
                                        ImagePath = p.ImagePath,
                                        Link = b.Link,
                                        Lang = b.Lang,
                                        Keyword = b.Keyword,
                                        Description = b.Description,
                                        DateModified = b.DateModified,
                                        Approve = p.Approve
                                    }).OrderBy(p => p.OrderDisplay).AsQueryable<PostFull>();
                        }
                        else
                        {
                            list = (from p in data.Post
                                    join b in data.PostDetail on p.PostId equals b.PostId
                                    join c in data.Catalog on p.CatalogId equals c.CatalogId
                                    where c.CatalogId == cate_id && c.Type == cate_type && b.Lang.Trim().ToLower() == lang.Trim().ToLower() && p.Approve == true && b.PostName.Contains(search) && b.Title.Contains(search) && b.Summary.Contains(search) && b.PostContent.Contains(search)
                                    select new PostFull
                                    {
                                        CatalogId = p.CatalogId,
                                        PostId = p.PostId,
                                        PostDetailId = b.PostDetailId,
                                        Title = b.Title,
                                        Summary = b.Summary,
                                        PostName = b.PostName,
                                        PostContent = b.PostContent,
                                        IsHot = p.IsHot,
                                        OrderDisplay = p.OrderDisplay,
                                        ImagePath = p.ImagePath,
                                        Link = b.Link,
                                        Lang = b.Lang,
                                        Keyword = b.Keyword,
                                        Description = b.Description,
                                        DateModified = b.DateModified,
                                        Approve = p.Approve
                                    }).OrderBy(p => p.OrderDisplay).AsQueryable<PostFull>();
                        }

                        if (!string.IsNullOrEmpty(tag))
                        {
                            list = (from p in list
                                    join t in data.PostTag on p.PostId equals t.PostId
                                    where t.Link == tag
                                    select p).AsQueryable<PostFull>();
                        }

                        total = list.Count();

                        if (!string.IsNullOrEmpty(order_by) && !string.IsNullOrEmpty(order_type))
                        {
                            Type sortByPropType = typeof(Post).GetProperty(order_by).PropertyType;
                            ////calling the extension method using reflection
                            list = typeof(MyExtensions).GetMethod("CustomSort").MakeGenericMethod(new Type[] { typeof(PostFull), sortByPropType })
                                   .Invoke(list, new object[] { list, order_by, order_type }) as IQueryable<PostFull>;
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

                    return list.Skip((page_index - 1) * page_size).Take(page_size).ToList();
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
        public List<PostFull> GetListPostAll(string lang, string cate_type, int? cate_id, string search, int page_index, int page_size, string order_by, string order_type, out int total)
        {
            try
            {
                List<PostFull> lstPost = new List<PostFull>();
                if (cate_id == null || cate_id == 0)
                {
                    lstPost = this.ListAll(cate_type, lang).ToList();
                }
                else
                {
                    lstPost = this.ListAll(cate_type, lang).Where(p => p.CatalogId == cate_id).ToList();
                }

                if (!string.IsNullOrEmpty(search))
                {
                    lstPost = lstPost.Where(p => p.PostName.ToLower().Contains(search.ToLower())).ToList();
                }

                total = lstPost.Count();

                return lstPost.Skip((page_index - 1) * page_size).Take(page_size).ToList();
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
        public List<PostFull> GetListPostView(ArrayList list, string lang)
        {
            using (var data = new themanorContext())
            {
                try
                {
                    List<PostFull> returnList = new List<PostFull>();

                    foreach (var postId in list)
                    {
                        if (postId != null && postId.ToString() != string.Empty)
                        {
                            returnList.Add(this.GetbyID(Convert.ToInt32(postId), lang));
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
        public List<PostFull> GetOthers(int id, int cate, string lang, int number)
        {
            using (var data = new themanorContext())
            {
                var c_gen = new List<PostFull>();
                try
                {
                    if (cate <= 0)
                    {
                        c_gen = (from a in data.Post
                                 join b in data.PostDetail on a.PostId equals b.PostId
                                 where b.Lang.Trim().ToLower() == lang.Trim().ToLower() && a.PostId != id
                                 select new PostFull
                                 {
                                     CatalogId = a.CatalogId,
                                     PostId = a.PostId,
                                     PostDetailId = b.PostDetailId,
                                     Title = b.Title,
                                     Summary = b.Summary,
                                     PostName = b.PostName,
                                     PostContent = b.PostContent,
                                     IsHot = a.IsHot,
                                     OrderDisplay = a.OrderDisplay,
                                     ImagePath = a.ImagePath,
                                     Link = b.Link,
                                     Lang = b.Lang,
                                     Keyword = b.Keyword,
                                     Description = b.Description,
                                     DateModified = b.DateModified,
                                     Approve = a.Approve
                                 }).OrderByDescending(p => p.DateModified).OrderByDescending(p => p.IsHot).OrderBy(p => p.OrderDisplay).Take(number).ToList<PostFull>();
                    }
                    else
                    {
                        c_gen = (from a in data.Post
                                 join b in data.PostDetail on a.PostId equals b.PostId
                                 where a.CatalogId == cate && b.Lang.Trim().ToLower() == lang.Trim().ToLower() && a.PostId != id
                                 select new PostFull
                                 {
                                     CatalogId = a.CatalogId,
                                     PostId = a.PostId,
                                     PostDetailId = b.PostDetailId,
                                     Title = b.Title,
                                     Summary = b.Summary,
                                     PostName = b.PostName,
                                     PostContent = b.PostContent,
                                     IsHot = a.IsHot,
                                     OrderDisplay = a.OrderDisplay,
                                     ImagePath = a.ImagePath,
                                     Link = b.Link,
                                     Lang = b.Lang,
                                     Keyword = b.Keyword,
                                     Description = b.Description,
                                     DateModified = b.DateModified,
                                     Approve = a.Approve
                                 }).OrderByDescending(p => p.DateModified).OrderByDescending(p => p.IsHot).OrderBy(p => p.OrderDisplay).Take(number).ToList<PostFull>();
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
        public PostFull GetPostByIDNotApprove(int id, string lang)
        {
            using (var data = new themanorContext())
            {
                try
                {
                    var c_gen = (from a in data.Post
                                 join b in data.PostDetail on a.PostId equals b.PostId
                                 where a.PostId == id && b.Lang == lang && (a.Approve == false || a.Approve == null)
                    select new PostFull
                                 {
                                     CatalogId = a.CatalogId,
                                     PostId = a.PostId,
                                     PostDetailId = b.PostDetailId,
                                     Title = b.Title,
                                     Summary = b.Summary,
                                     PostName = b.PostName,
                                     PostContent = b.PostContent,
                                     IsHot = a.IsHot,
                                     OrderDisplay = a.OrderDisplay,
                                     ImagePath = a.ImagePath,
                                     Link = b.Link,
                                     Lang = b.Lang,
                                     Keyword = b.Keyword,
                                     Description = b.Description,
                                     DateModified = b.DateModified,
                                     Approve = a.Approve
                                 }).FirstOrDefault();
                    return c_gen;
                }
                catch (Exception)
                {
                    return new PostFull();
                }
            }
        }

        /// <summary>
        /// Lists all.
        /// </summary>
        /// <param name="type">The type.</param>
        /// <param name="lang">The language.</param>
        /// <returns>List All</returns>
        public List<PostFull> ListAll(string type, string lang)
        {
            using (var data = new themanorContext())
            {
                try
                {
                    var c_gen = (from a in data.Post
                                 join b in data.PostDetail on a.PostId equals b.PostId
                                 join c in data.Catalog on a.CatalogId equals c.CatalogId
                                 where c.Type == type && b.Lang.Trim().ToLower() == lang.Trim().ToLower()
                                 select new PostFull
                                 {
                                     CatalogId = a.CatalogId,
                                     PostId = a.PostId,
                                     PostDetailId = b.PostDetailId,
                                     Title = b.Title,
                                     Summary = b.Summary,
                                     PostName = b.PostName,
                                     PostContent = b.PostContent,
                                     IsHot = a.IsHot,
                                     OrderDisplay = a.OrderDisplay,
                                     ImagePath = a.ImagePath,
                                     Link = b.Link,
                                     Lang = b.Lang,
                                     Keyword = b.Keyword,
                                     Description = b.Description,
                                     DateModified = b.DateModified,
                                     Approve = a.Approve
                                 }).OrderByDescending(p => p.DateModified).OrderBy(p => p.OrderDisplay).ToList<PostFull>();
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
        public List<PostFull> ListByCateNotApprove(int id, string lang)
        {
            using (var data = new themanorContext())
            {
                try
                {
                    var c_gen = (from a in data.Post
                                 join b in data.PostDetail on a.PostId equals b.PostId
                                 join c in data.Catalog on a.CatalogId equals c.CatalogId
                                 where c.CatalogId == id && b.Lang.Trim().ToLower() == lang.Trim().ToLower() && (a.Approve == false || a.Approve == null)
                                 select new PostFull
                                 {
                                     CatalogId = a.CatalogId,
                                     PostId = a.PostId,
                                     PostDetailId = b.PostDetailId,
                                     Title = b.Title,
                                     Summary = b.Summary,
                                     PostName = b.PostName,
                                     PostContent = b.PostContent,
                                     IsHot = a.IsHot,
                                     OrderDisplay = a.OrderDisplay,
                                     ImagePath = a.ImagePath,
                                     Link = b.Link,
                                     Lang = b.Lang,
                                     Keyword = b.Keyword,
                                     Description = b.Description,
                                     DateModified = b.DateModified,
                                     Approve = a.Approve
                                 }).OrderByDescending(p => p.DateModified).OrderBy(p => p.OrderDisplay).ToList<PostFull>();
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
        public List<PostFull> Top10Type(string type, string lang)
        {
            using (var data = new themanorContext())
            {
                try
                {
                    var c_gen = (from a in data.Post
                                 join b in data.PostDetail on a.PostId equals b.PostId
                                 join c in data.Catalog on a.CatalogId equals c.CatalogId
                                 where c.Type == type && b.Lang.Trim().ToLower() == lang.Trim().ToLower()
                                 select new PostFull
                                 {
                                     CatalogId = a.CatalogId,
                                     PostId = a.PostId,
                                     PostDetailId = b.PostDetailId,
                                     Title = b.Title,
                                     Summary = b.Summary,
                                     PostName = b.PostName,
                                     PostContent = b.PostContent,
                                     IsHot = a.IsHot,
                                     OrderDisplay = a.OrderDisplay,
                                     ImagePath = a.ImagePath,
                                     Link = b.Link,
                                     Lang = b.Lang,
                                     Keyword = b.Keyword,
                                     Description = b.Description,
                                     DateModified = b.DateModified,
                                     Approve = a.Approve
                                 }).OrderByDescending(p => p.DateModified).OrderBy(p => p.OrderDisplay).Take(10).ToList<PostFull>();
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
        public List<PostFull> TopByCate(int id, string lang)
        {
            using (var data = new themanorContext())
            {
                try
                {
                    var c_gen = (from a in data.Post
                                 join b in data.PostDetail on a.PostId equals b.PostId
                                 join c in data.Catalog on a.CatalogId equals c.CatalogId
                                 where c.CatalogId == id && b.Lang.Trim().ToLower() == lang.Trim().ToLower()
                                 select new PostFull
                                 {
                                     CatalogId = a.CatalogId,
                                     PostId = a.PostId,
                                     PostDetailId = b.PostDetailId,
                                     Title = b.Title,
                                     Summary = b.Summary,
                                     PostName = b.PostName,
                                     PostContent = b.PostContent,
                                     IsHot = a.IsHot,
                                     OrderDisplay = a.OrderDisplay,
                                     ImagePath = a.ImagePath,
                                     Link = b.Link,
                                     Lang = b.Lang,
                                     Keyword = b.Keyword,
                                     Description = b.Description,
                                     DateModified = b.DateModified,
                                     Approve = a.Approve
                                 }).OrderByDescending(p => p.DateModified).OrderBy(p => p.OrderDisplay).Take(10).ToList<PostFull>();
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
        public List<PostFull> TopByType(string type, string lang)
        {
            using (var data = new themanorContext())
            {
                try
                {
                    var c_gen = (from a in data.Post
                                 join b in data.PostDetail on a.PostId equals b.PostId
                                 join c in data.Catalog on a.CatalogId equals c.CatalogId
                                 where c.Type == type && b.Lang.Trim().ToLower() == lang.Trim().ToLower()
                                 select new PostFull
                                 {
                                     CatalogId = a.CatalogId,
                                     PostId = a.PostId,
                                     PostDetailId = b.PostDetailId,
                                     Title = b.Title,
                                     Summary = b.Summary,
                                     PostName = b.PostName,
                                     PostContent = b.PostContent,
                                     IsHot = a.IsHot,
                                     OrderDisplay = a.OrderDisplay,
                                     ImagePath = a.ImagePath,
                                     Link = b.Link,
                                     Lang = b.Lang,
                                     Keyword = b.Keyword,
                                     Description = b.Description,
                                     DateModified = b.DateModified,
                                     Approve = a.Approve
                                 }).OrderByDescending(p => p.DateModified).OrderBy(p => p.OrderDisplay).ToList<PostFull>();
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
        public List<PostFull> TopPostHot(string type, string lang, int number)
        {
            using (var data = new themanorContext())
            {
                try
                {
                    //// First, check the cache
                    List<PostFull> c_gen = new List<PostFull>();

                    if (c_gen == null)
                    {
                        c_gen = (from a in data.Post
                                 join b in data.PostDetail on a.PostId equals b.PostId
                                 join c in data.Catalog on a.CatalogId equals c.CatalogId
                                 where c.Type == type && b.Lang.Trim().ToLower() == lang.Trim().ToLower() && a.IsHot == true && a.Approve == true
                                 select new PostFull
                                 {
                                     CatalogId = a.CatalogId,
                                     PostId = a.PostId,
                                     PostDetailId = b.PostDetailId,
                                     Title = b.Title,
                                     Summary = b.Summary,
                                     PostName = b.PostName,
                                     PostContent = b.PostContent,
                                     IsHot = a.IsHot,
                                     OrderDisplay = a.OrderDisplay,
                                     ImagePath = a.ImagePath,
                                     Link = b.Link,
                                     Lang = b.Lang,
                                     Keyword = b.Keyword,
                                     Description = b.Description,
                                     DateModified = b.DateModified,
                                     Approve = a.Approve
                                 }).OrderByDescending(p => p.DateModified).OrderByDescending(p => p.IsHot).OrderBy(p => p.OrderDisplay).Take(number).ToList<PostFull>();

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
        public List<PostFull> TopPostHot(string type, int? cate_id, string lang, int number)
        {
            using (var data = new themanorContext())
            {
                try
                {
                    //// First, check the cache
                    List<PostFull> c_gen = null; ////Cache.Get(CommonGlobal.POST + type + lang + number) as List<Post>;

                    if (c_gen == null)
                    {
                        if (cate_id != null)
                        {
                            c_gen = (from a in data.Post
                                     join b in data.PostDetail on a.PostId equals b.PostId
                                     join c in data.Catalog on a.CatalogId equals c.CatalogId
                                     where c.Type == type && b.Lang.Trim().ToLower() == lang.Trim().ToLower() && a.IsHot == true && a.Approve == true && c.CatalogId == cate_id
                                     select new PostFull
                                     {
                                         CatalogId = a.CatalogId,
                                         PostId = a.PostId,
                                         PostDetailId = b.PostDetailId,
                                         Title = b.Title,
                                         Summary = b.Summary,
                                         PostName = b.PostName,
                                         PostContent = b.PostContent,
                                         IsHot = a.IsHot,
                                         OrderDisplay = a.OrderDisplay,
                                         ImagePath = a.ImagePath,
                                         Link = b.Link,
                                         Lang = b.Lang,
                                         Keyword = b.Keyword,
                                         Description = b.Description,
                                         DateModified = b.DateModified,
                                         Approve = a.Approve
                                     }).OrderByDescending(p => p.DateModified).OrderByDescending(p => p.IsHot).OrderBy(p => p.OrderDisplay).Take(number).ToList<PostFull>();
                        }
                        else
                        {
                            c_gen = (from a in data.Post
                                     join b in data.PostDetail on a.PostId equals b.PostId
                                     join c in data.Catalog on a.CatalogId equals c.CatalogId
                                     where c.Type == type && b.Lang.Trim().ToLower() == lang.Trim().ToLower() && a.IsHot == true && a.Approve == true
                                     select new PostFull
                                     {
                                         CatalogId = a.CatalogId,
                                         PostId = a.PostId,
                                         PostDetailId = b.PostDetailId,
                                         Title = b.Title,
                                         Summary = b.Summary,
                                         PostName = b.PostName,
                                         PostContent = b.PostContent,
                                         IsHot = a.IsHot,
                                         OrderDisplay = a.OrderDisplay,
                                         ImagePath = a.ImagePath,
                                         Link = b.Link,
                                         Lang = b.Lang,
                                         Keyword = b.Keyword,
                                         Description = b.Description,
                                         DateModified = b.DateModified,
                                         Approve = a.Approve
                                     }).OrderByDescending(p => p.DateModified).OrderByDescending(p => p.IsHot).OrderBy(p => p.OrderDisplay).Take(number).ToList<PostFull>();
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
        public PostFull TopType(string type, string lang)
        {
            using (var data = new themanorContext())
            {
                try
                {
                    var c_gen = (from a in data.Post
                                 join b in data.PostDetail on a.PostId equals b.PostId
                                 join c in data.Catalog on a.CatalogId equals c.CatalogId
                                 where c.Type == type && b.Lang.Trim().ToLower() == lang.Trim().ToLower()
                                 select new PostFull
                                 {
                                     CatalogId = a.CatalogId,
                                     PostId = a.PostId,
                                     PostDetailId = b.PostDetailId,
                                     Title = b.Title,
                                     Summary = b.Summary,
                                     PostName = b.PostName,
                                     PostContent = b.PostContent,
                                     IsHot = a.IsHot,
                                     OrderDisplay = a.OrderDisplay,
                                     ImagePath = a.ImagePath,
                                     Link = b.Link,
                                     Lang = b.Lang,
                                     Keyword = b.Keyword,
                                     Description = b.Description,
                                     DateModified = b.DateModified,
                                     Approve = a.Approve
                                 }).OrderByDescending(p => p.DateModified).OrderBy(p => p.OrderDisplay).Take(1).FirstOrDefault();
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