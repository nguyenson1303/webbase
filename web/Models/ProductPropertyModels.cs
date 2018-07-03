namespace Web.Models
{
    using System;
    using System.Collections.Generic;
    using System.Linq;
    using Web.Data;
    using Webdiyer.WebControls.Mvc;

    /// <summary>
    /// Product Property Models
    /// </summary>
    public class ProductPropertyModels
    {
        /// <summary>
        /// Initializes a new instance of the <see cref="ProductPropertyModels"/> class.
        /// </summary>
        public ProductPropertyModels()
        : this(new DefaultCacheProvider())
        {
        }

        /// <summary>
        /// Initializes a new instance of the <see cref="ProductPropertyModels"/> class.
        /// </summary>
        /// <param name="cacheProvider">The cache provider.</param>
        public ProductPropertyModels(ICacheProvider cacheProvider)
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
        /// Add the specified object.
        /// </summary>
        /// <param name="productProperty">product property object.</param>
        /// <returns>Add the specified</returns>
        public bool Add(C_ProductProperty productProperty)
        {
            using (var data = new Entities())
            {
                bool rt = false;
                try
                {
                    data.C_ProductProperty.Add(productProperty);
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
        /// Admins the get all property by pro identifier.
        /// </summary>
        /// <param name="pro_id">The pro identifier.</param>
        /// <param name="type">The type.</param>
        /// <param name="page_index">The page index.</param>
        /// <param name="page_size">The page size.</param>
        /// <param name="order_by">The order by.</param>
        /// <param name="order_type">Type of the order.</param>
        /// <param name="total">The total.</param>
        /// <returns>Admins the get all property</returns>
        public PagedList<C_ProductProperty> AdminGetAllPropertyByProID(int pro_id, string type, int page_index, int page_size, string order_by, string order_type, out int total)
        {
            using (var data = new Entities())
            {
                try
                {
                    var c_pro = data.C_ProductProperty.Where(p => p.ProductID == pro_id && p.Type == type).AsQueryable<C_ProductProperty>();

                    total = c_pro.Count();

                    if (!string.IsNullOrEmpty(order_by) && !string.IsNullOrEmpty(order_type))
                    {
                        Type sortByPropType = typeof(C_ProductProperty).GetProperty(order_by).PropertyType;
                        ////calling the extension method using reflection
                        c_pro = typeof(MyExtensions).GetMethod("CustomSort").MakeGenericMethod(new Type[] { typeof(C_ProductProperty), sortByPropType })
                                .Invoke(c_pro, new object[] { c_pro, order_by, order_type }) as IQueryable<C_ProductProperty>;
                    }
                    else
                    {
                        ////if  orderBy null set default is OrderDisplay
                        c_pro = c_pro.OrderByDescending(p => p.ProID);
                    }

                    return c_pro.ToPagedList(page_index, page_size);
                }
                catch (Exception)
                {
                    total = 0;
                    return null;
                }
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
        /// <returns>status delete product property</returns>
        public bool Delete(int id)
        {
            using (var data = new Entities())
            {
                bool rt;
                try
                {
                    var c_gen = data.C_ProductProperty.Where(p => p.ProID == id).FirstOrDefault();
                    if (c_gen != null)
                    {
                        data.C_ProductProperty.Remove(c_gen);
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
        /// Deletes the by product identifier.
        /// </summary>
        /// <param name="id">The identifier.</param>
        /// <returns>status delete bu product identity</returns>
        public bool DeleteByProductID(int id)
        {
            using (var data = new Entities())
            {
                bool rt;
                try
                {
                    var c_gen = data.C_ProductProperty.Where(p => p.ProductID == id).ToList();
                    if (c_gen != null)
                    {
                        foreach (var it in c_gen)
                        {
                            data.C_ProductProperty.Remove(it);
                        }

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

        ////public bool Add(int id, string name, string value, string type)
        ////{
        ////    using (var data = new Entities())
        ////    {
        ////        bool rt = false;
        ////        try
        ////        {
        ////            C_ProductProperty it = new C_ProductProperty();
        ////            it.ProductID = id;
        ////            it.Name = name;
        ////            it.Value = value;
        ////            it.Type = type;
        ////            data.C_ProductProperty.Add(it);
        ////            data.SaveChanges();
        ////            rt = true;
        ////        }
        ////        catch (Exception)
        ////        {
        ////            rt = false;
        ////        }
        ////        return rt;
        ////    }
        ////}

        /// <summary>
        /// Edits the specified product Property Object.
        /// </summary>
        /// <param name="propertyObject">product Property Object.</param>
        /// <returns>status edit property</returns>
        public bool Edit(C_ProductProperty propertyObject)
        {
            using (var data = new Entities())
            {
                bool rt = false;
                try
                {
                    var c_gen = data.C_ProductProperty.Where(p => p.ProID == propertyObject.ProID).FirstOrDefault();
                    c_gen.Name = propertyObject.Name;
                    c_gen.Value = propertyObject.Value;
                    c_gen.ProductID = propertyObject.ProductID;
                    c_gen.Type = propertyObject.Type;

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
        /// Gets all.
        /// </summary>
        /// <param name="id">The identifier.</param>
        /// <returns>List all product property</returns>
        public List<C_ProductProperty> GetAll(int id)
        {
            using (var data = new Entities())
            {
                try
                {
                    var c_gen = data.C_ProductProperty.Where(p => p.ProductID == id).ToList();

                    return c_gen;
                }
                catch (Exception)
                {
                    return null;
                }
            }
        }

        /// <summary>
        /// Gets the property by identifier.
        /// </summary>
        /// <param name="proId">The pro identifier.</param>
        /// <returns>Product Property</returns>
        public C_ProductProperty GetPropertyByID(int proId)
        {
            using (var data = new Entities())
            {
                try
                {
                    var c_gen = data.C_ProductProperty.Where(p => p.ProID == proId).FirstOrDefault();

                    return c_gen;
                }
                catch (Exception)
                {
                    return null;
                }
            }
        }

        /// <summary>
        /// Gets the name of the property by product identifier and.
        /// </summary>
        /// <param name="id">The identifier.</param>
        /// <param name="name">The name.</param>
        /// <returns>property by product</returns>
        public C_ProductProperty GetPropertyByProductIdAndName(int id, string name)
        {
            using (var data = new Entities())
            {
                try
                {
                    var c_gen = data.C_ProductProperty.Where(p => p.ProductID == id && p.Name == name).FirstOrDefault();
                    return c_gen;
                }
                catch (Exception)
                {
                    return null;
                }
            }
        }

        /// <summary>
        /// Gets the property by product identifier and pro identifier.
        /// </summary>
        /// <param name="id">The identifier.</param>
        /// <param name="pId">The p identifier.</param>
        /// <returns>property by product</returns>
        public C_ProductProperty GetPropertyByProductIdAndProID(int id, int pId)
        {
            using (var data = new Entities())
            {
                try
                {
                    var c_gen = data.C_ProductProperty.Where(p => p.ProductID == id && p.ProID == pId).FirstOrDefault();

                    return c_gen;
                }
                catch (Exception)
                {
                    return null;
                }
            }
        }

        /// <summary>
        /// Gets the type of the property by.
        /// </summary>
        /// <param name="id">The identifier.</param>
        /// <param name="type">The type.</param>
        /// <returns>the type of the property</returns>
        public List<C_ProductProperty> GetPropertyByType(int id, string type)
        {
            using (var data = new Entities())
            {
                try
                {
                    var c_gen = data.C_ProductProperty.Where(p => p.ProductID == id && p.Type == type).ToList();
                    return c_gen;
                }
                catch (Exception)
                {
                    return null;
                }
            }
        }

        /// <summary>
        /// Gets the type of the property by.
        /// </summary>
        /// <param name="type">The type.</param>
        /// <returns>the type of the property</returns>
        public List<C_ProductProperty> GetPropertyByType(string type)
        {
            using (var data = new Entities())
            {
                try
                {
                    //// First, check the cache
                    List<C_ProductProperty> c_gen = this.Cache.Get(type) as List<C_ProductProperty>;

                    if (c_gen == null)
                    {
                        c_gen = new List<C_ProductProperty>();
                        var lst = (from pp in data.C_ProductProperty
                                   group pp by new { pp.Type, pp.Value, pp.Name } into gpp 
                                    select new { Type = gpp.Key.Type, Name = gpp.Key.Name, Value = gpp.Key.Value }).Where(c => c.Type == type).ToList();

                        if (lst.Count > 0)
                        {
                            foreach (var it in lst)
                            {
                                C_ProductProperty c_p = new C_ProductProperty();
                                c_p.Name = it.Name;
                                c_p.Value = it.Value;
                                c_p.Type = it.Type;
                                c_p.ProID = 999999;
                                c_p.ProductID = 999999;
                                c_gen.Add(c_p);
                            }
                        }

                        if (c_gen.Any())
                        {
                            //// Put this data into the cache for 10 minutes
                            this.Cache.Set(type, c_gen, int.Parse(Util.GetConfigValue(CommonGlobal.TimeCache, "10")));
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
    }
}