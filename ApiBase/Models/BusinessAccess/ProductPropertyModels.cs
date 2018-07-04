namespace ApiBase.Models.BusinessAccess
{
    using ApiBase.Models.DB;
    using System;
    using System.Collections.Generic;
    using System.Linq;

    /// <summary>
    /// Product Property Models
    /// </summary>
    public class ProductPropertyModels
    {
        /// <summary>
        /// Initializes a new instance of the <see cref="ProductPropertyModels"/> class.
        /// </summary>
        public ProductPropertyModels()
        {
        }

        /// <summary>
        /// Add the specified object.
        /// </summary>
        /// <param name="productProperty">product property object.</param>
        /// <returns>Add the specified</returns>
        public bool Add(ProductProperty productProperty)
        {
            using (var data = new themanorContext())
            {
                bool rt = false;
                try
                {
                    data.ProductProperty.Add(productProperty);
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
        public List<ProductProperty> AdminGetAllPropertyByProID(int pro_id, string type, int page_index, int page_size, string order_by, string order_type, out int total)
        {
            using (var data = new themanorContext())
            {
                try
                {
                    var c_pro = data.ProductProperty.Where(p => p.ProductId == pro_id && p.Type == type).AsQueryable<ProductProperty>();

                    total = c_pro.Count();

                    if (!string.IsNullOrEmpty(order_by) && !string.IsNullOrEmpty(order_type))
                    {
                        Type sortByPropType = typeof(ProductProperty).GetProperty(order_by).PropertyType;
                        ////calling the extension method using reflection
                        c_pro = typeof(MyExtensions).GetMethod("CustomSort").MakeGenericMethod(new Type[] { typeof(ProductProperty), sortByPropType })
                                .Invoke(c_pro, new object[] { c_pro, order_by, order_type }) as IQueryable<ProductProperty>;
                    }
                    else
                    {
                        ////if  orderBy null set default is OrderDisplay
                        c_pro = c_pro.OrderByDescending(p => p.ProId);
                    }

                    return c_pro.Skip(page_index * page_size).Take(page_size).ToList();
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
        /// <returns>status delete product property</returns>
        public bool Delete(int id)
        {
            using (var data = new themanorContext())
            {
                bool rt;
                try
                {
                    var c_gen = data.ProductProperty.Where(p => p.ProId == id).FirstOrDefault();
                    if (c_gen != null)
                    {
                        data.ProductProperty.Remove(c_gen);
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
            using (var data = new themanorContext())
            {
                bool rt;
                try
                {
                    var c_gen = data.ProductProperty.Where(p => p.ProductId == id).ToList();
                    if (c_gen != null)
                    {
                        foreach (var it in c_gen)
                        {
                            data.ProductProperty.Remove(it);
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
        ////    using (var data = new themanorContext())
        ////    {
        ////        bool rt = false;
        ////        try
        ////        {
        ////            ProductProperty it = new ProductProperty();
        ////            it.ProductID = id;
        ////            it.Name = name;
        ////            it.Value = value;
        ////            it.Type = type;
        ////            data.ProductProperty.Add(it);
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
        public bool Edit(ProductProperty propertyObject)
        {
            using (var data = new themanorContext())
            {
                bool rt = false;
                try
                {
                    var c_gen = data.ProductProperty.Where(p => p.ProId == propertyObject.ProId).FirstOrDefault();
                    c_gen.Name = propertyObject.Name;
                    c_gen.Value = propertyObject.Value;
                    c_gen.ProductId = propertyObject.ProductId;
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
        public List<ProductProperty> GetAll(int id)
        {
            using (var data = new themanorContext())
            {
                try
                {
                    var c_gen = data.ProductProperty.Where(p => p.ProductId == id).ToList();

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
        public ProductProperty GetPropertyByID(int proId)
        {
            using (var data = new themanorContext())
            {
                try
                {
                    var c_gen = data.ProductProperty.Where(p => p.ProId == proId).FirstOrDefault();

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
        public ProductProperty GetPropertyByProductIdAndName(int id, string name)
        {
            using (var data = new themanorContext())
            {
                try
                {
                    var c_gen = data.ProductProperty.Where(p => p.ProductId == id && p.Name == name).FirstOrDefault();
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
        public ProductProperty GetPropertyByProductIdAndProID(int id, int pId)
        {
            using (var data = new themanorContext())
            {
                try
                {
                    var c_gen = data.ProductProperty.Where(p => p.ProductId == id && p.ProId == pId).FirstOrDefault();

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
        public List<ProductProperty> GetPropertyByType(int id, string type)
        {
            using (var data = new themanorContext())
            {
                try
                {
                    var c_gen = data.ProductProperty.Where(p => p.ProductId == id && p.Type == type).ToList();
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
        public List<ProductProperty> GetPropertyByType(string type)
        {
            using (var data = new themanorContext())
            {
                try
                {
                    //// First, check the cache
                    List<ProductProperty> c_gen = new List<ProductProperty>();

                    if (c_gen == null)
                    {
                        c_gen = new List<ProductProperty>();
                        var lst = (from pp in data.ProductProperty
                                   group pp by new { pp.Type, pp.Value, pp.Name } into gpp 
                                    select new { Type = gpp.Key.Type, Name = gpp.Key.Name, Value = gpp.Key.Value }).Where(c => c.Type == type).ToList();

                        if (lst.Count > 0)
                        {
                            foreach (var it in lst)
                            {
                                ProductProperty c_p = new ProductProperty();
                                c_p.Name = it.Name;
                                c_p.Value = it.Value;
                                c_p.Type = it.Type;
                                c_p.ProId = 999999;
                                c_p.ProductId = 999999;
                                c_gen.Add(c_p);
                            }
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