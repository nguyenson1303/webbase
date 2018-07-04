namespace ApiBase.Models.BusinessAccess
{
    using ApiBase.Models.DB;
    using System;
    using System.Collections.Generic;
    using System.Linq;

    /// <summary>
    /// Product Images Models
    /// </summary>
    public class ProductImagesModels
    {
        /// <summary>
        /// Initializes a new instance of the <see cref="ProductImagesModels"/> class.
        /// </summary>
        public ProductImagesModels()
        {
        }

        /// <summary>
        /// Add the images.
        /// </summary>
        /// <param name="image">image object.</param>
        /// <returns>status add images</returns>
        public bool Add_Images(ImageProducts image)
        {
            using (var data = new themanorContext())
            {
                bool rt;
                try
                {
                    data.ImageProducts.Add(image);
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
        /// Admins the get all image product by pro identifier.
        /// </summary>
        /// <param name="pro_id">The pro identifier.</param>
        /// <param name="page_index">The page index.</param>
        /// <param name="page_size">The page size.</param>
        /// <param name="order_by">The order by.</param>
        /// <param name="order_type">Type of the order.</param>
        /// <param name="total">The total.</param>
        /// <returns>PagedList Image Product</returns>
        public List<ImageProducts> AdminGetAllImageProductByProID(int pro_id, int page_index, int page_size, string order_by, string order_type, out int total)
        {
            using (var data = new themanorContext())
            {
                try
                {
                    var c_pro = data.ImageProducts.Where(p => p.MaSp == pro_id).AsQueryable<ImageProducts>();

                    total = c_pro.Count();

                    if (!string.IsNullOrEmpty(order_by) && !string.IsNullOrEmpty(order_type))
                    {
                        Type sortByPropType = typeof(ImageProducts).GetProperty(order_by).PropertyType;
                        ////calling the extension method using reflection
                        c_pro = typeof(MyExtensions).GetMethod("CustomSort").MakeGenericMethod(new Type[] { typeof(ImageProducts), sortByPropType })
                                .Invoke(c_pro, new object[] { c_pro, order_by, order_type }) as IQueryable<ImageProducts>;
                    }
                    else
                    {
                        ////if  orderBy null set default is OrderDisplay
                        c_pro = c_pro.OrderByDescending(p => p.Id);
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
        /// Delete the images.
        /// </summary>
        /// <param name="id">The identifier.</param>
        /// <returns>status delete image</returns>
        public bool Delete_Images(int id)
        {
            using (var data = new themanorContext())
            {
                bool rt;
                try
                {
                    var c_gen = data.ImageProducts.Where(p => p.Id == id).FirstOrDefault();
                    if (c_gen != null)
                    {
                        data.ImageProducts.Remove(c_gen);
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
        /// Delete the images by product identifier.
        /// </summary>
        /// <param name="id">The identifier.</param>
        /// <returns>status delete image by product identity</returns>
        public bool Delete_Images_By_Product_ID(int id)
        {
            using (var data = new themanorContext())
            {
                bool rt;
                try
                {
                    var c_gen = data.ImageProducts.Where(p => p.MaSp == id).ToList();
                    if (c_gen != null)
                    {
                        foreach (var it in c_gen)
                        {
                            data.ImageProducts.Remove(it);
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

        /// <summary>
        /// Gets the image by identifier.
        /// </summary>
        /// <param name="id">The identifier.</param>
        /// <returns>Image Product</returns>
        public ImageProducts GetImageById(int id)
        {
            using (var data = new themanorContext())
            {
                try
                {
                    var c_gen = data.ImageProducts.Where(p => p.Id == id).FirstOrDefault();
                    return c_gen;
                }
                catch (Exception)
                {
                    return null;
                }
            }
        }

        /// <summary>
        /// Gets the LST imageby ma sp.
        /// </summary>
        /// <param name="id">The identifier.</param>
        /// <returns>List Image Product</returns>
        public List<ImageProducts> GetLstImagebyProductId(int id)
        {
            using (var data = new themanorContext())
            {
                try
                {
                    var c_gen = data.ImageProducts.Where(p => p.MaSp == id).ToList();
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