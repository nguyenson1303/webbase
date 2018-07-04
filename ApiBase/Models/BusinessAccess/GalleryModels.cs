namespace ApiBase.Models.BusinessAccess
{
    using ApiBase.Models.DB;
    using System;
    using System.Collections.Generic;
    using System.Linq;

    /// <summary>
    /// Gallery Models
    /// </summary>
    public class GalleryModels
    {
        /// <summary>
        /// Initializes a new instance of the <see cref="GalleryModels"/> class.
        /// </summary>
        public GalleryModels()
        {
        }

        /// <summary>
        /// Adds the images.
        /// </summary>
        /// <param name="albumImage">images of album.</param>
        /// <returns>images identity</returns>
        public bool Add_Images(ImageAlbums albumImage)
        {
            using (var data = new themanorContext())
            {
                bool rt;
                try
                {
                    data.ImageAlbums.Add(albumImage);
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
        /// Admins the get all image gallery.
        /// </summary>
        /// <param name="parent">The parent.</param>
        /// <param name="type">The type.</param>
        /// <param name="lang">The language.</param>
        /// <param name="page_index">The page index.</param>
        /// <param name="page_size">The page size.</param>
        /// <param name="order_by">The order by.</param>
        /// <param name="order_type">Type of the order.</param>
        /// <param name="total">The total.</param>
        /// <returns>admin Get All Image Gallery</returns>
        public List<ImageAlbums> AdminGetAllImageGallery(int parent, string type, string lang, int page_index, int page_size, string order_by, string order_type, out int total)
        {
            using (var data = new themanorContext())
            {
                try
                {
                    IQueryable<ImageAlbums> c_gen = null;
                    if (parent > 0)
                    {
                        c_gen = (from p in data.ImageAlbums
                                 join c in data.Catalog on p.CatalogId equals c.CatalogId
                                 where c.Type == type && c.CatalogId == parent && c.Lang.Trim().ToLower() == lang
                                 select p).OrderByDescending(p => p.Id).AsQueryable<ImageAlbums>();
                    }
                    else
                    {
                        c_gen = (from p in data.ImageAlbums
                                 join c in data.Catalog on p.CatalogId equals c.CatalogId
                                 where c.Type == type && c.Lang.Trim().ToLower() == lang
                                 select p).OrderByDescending(p => p.Id).AsQueryable<ImageAlbums>();
                    }

                    total = c_gen.Count();

                    if (!string.IsNullOrEmpty(order_by) && !string.IsNullOrEmpty(order_type))
                    {
                        Type sortByPropType = typeof(ImageAlbums).GetProperty(order_by).PropertyType;
                        ////calling the extension method using reflection
                        c_gen = typeof(MyExtensions).GetMethod("CustomSort").MakeGenericMethod(new Type[] { typeof(ImageAlbums), sortByPropType })
                                .Invoke(c_gen, new object[] { c_gen, order_by, order_type }) as IQueryable<ImageAlbums>;
                    }
                    else
                    {
                        ////if  orderBy null set default is ID
                        c_gen = c_gen.OrderByDescending(p => p.Id);
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
        /// Deletes the images.
        /// </summary>
        /// <param name="id">The identifier.</param>
        /// <returns> Delete Images </returns>
        public bool Delete_Images(int id)
        {
            using (var data = new themanorContext())
            {
                bool rt;
                try
                {
                    var c_gen = data.ImageAlbums.Where(p => p.Id == id).FirstOrDefault();
                    if (c_gen != null)
                    {
                        data.ImageAlbums.Remove(c_gen);
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
        /// <returns>Get Image By Id</returns>
        public ImageAlbums GetImageById(int id)
        {
            using (var data = new themanorContext())
            {
                try
                {
                    var c_gen = data.ImageAlbums.Where(p => p.Id == id).FirstOrDefault();
                    return c_gen;
                }
                catch (Exception)
                {
                    return null;
                }
            }
        }

        /// <summary>
        /// Get the list image by category.
        /// </summary>
        /// <param name="catalogID">The catalog identifier.</param>
        /// <returns>Get List Image by Category</returns>
        public List<ImageAlbums> GetListImagebyCategory(int catalogID)
        {
            using (var data = new themanorContext())
            {
                try
                {
                    var c_gen = data.ImageAlbums.Where(p => p.CatalogId == catalogID).ToList();
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