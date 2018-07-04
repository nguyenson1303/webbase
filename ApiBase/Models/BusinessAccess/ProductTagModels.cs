namespace ApiBase.Models.BusinessAccess
{
    using ApiBase.Models.DB;
    using System;
    using System.Collections.Generic;
    using System.Linq;

    /// <summary>
    /// Product Tag Models
    /// </summary>
    public class ProductTagModels
    {
        /// <summary>
        /// Add the tag.
        /// </summary>
        /// <param name="tag">tag object.</param>
        /// <returns>status add</returns>
        public bool Add_Tag(ProductTag tag)
        {
            using (var data = new themanorContext())
            {
                bool rt;
                try
                {
                    data.ProductTag.Add(tag);
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
        /// Deletes the tag.
        /// </summary>
        /// <param name="id">The identifier.</param>
        /// <returns>status delete</returns>
        public bool Delete_Tag(int id)
        {
            using (var data = new themanorContext())
            {
                bool rt;
                try
                {
                    var c_gen = data.ProductTag.Where(p => p.ProductId == id).FirstOrDefault();
                    if (c_gen != null)
                    {
                        data.ProductTag.Remove(c_gen);
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
        /// Edit the tag.
        /// </summary>
        /// <param name="tag">tag object.</param>
        /// <returns>status edit tag</returns>
        public bool Edit_Tag(ProductTag tag)
        {
            using (var data = new themanorContext())
            {
                bool rt;
                try
                {
                    var c_gen = data.ProductTag.Where(p => p.ProductTagId == tag.ProductTagId).FirstOrDefault();
                    c_gen.ProductId = tag.ProductId;
                    c_gen.Tag = tag.Tag;
                    c_gen.Link = tag.Link;

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
        /// Get all.
        /// </summary>
        /// <returns>List all product tag</returns>
        public List<ProductTag> GetAll()
        {
            using (var data = new themanorContext())
            {
                try
                {
                    List<ProductTag> lst = new List<ProductTag>();
                    var c_gen = (from t in data.ProductTag
                                 group t by new { t.Tag, t.Link } into g
                                 select new { Tag = g.Key.Tag, Link = g.Key.Link }).ToList();
                    if (c_gen.Count > 0)
                    {
                        foreach (var it in c_gen)
                        {
                            ProductTag tag = new ProductTag();
                            tag.Tag = it.Tag;
                            tag.Link = it.Link;
                            tag.ProductTagId = 99999999;
                            tag.ProductId = 99999999;
                            lst.Add(tag);
                        }
                    }

                    return lst;
                }
                catch (Exception)
                {
                    return null;
                }
            }
        }

        /// <summary>
        /// Get the tag by identifier.
        /// </summary>
        /// <param name="id">The identifier.</param>
        /// <returns>List product tag</returns>
        public List<ProductTag> GetTagbyID(int id)
        {
            using (var data = new themanorContext())
            {
                try
                {
                    var c_gen = data.ProductTag.Where(p => p.ProductId == id).ToList<ProductTag>();

                    return c_gen;
                }
                catch (Exception)
                {
                    return null;
                }
            }
        }

        /// <summary>
        /// Gets the tag by link.
        /// </summary>
        /// <param name="link">The link.</param>
        /// <returns>the tag</returns>
        public ProductTag GetTagByLink(string link)
        {
            List<ProductTag> lstTag = this.GetAll().FindAll(delegate(ProductTag tag)
            {
                return tag.Link.Contains(link);
            });
            if (lstTag.Count > 0)
            {
                ProductTag tagreturn = lstTag[0];

                return tagreturn;
            }
            else
            {
                return new ProductTag();
            }
        }

        /// <summary>
        /// Gets the top tag.
        /// </summary>
        /// <returns>top 20</returns>
        public List<ProductTag> GetTopTag()
        {
            using (var data = new themanorContext())
            {
                try
                {
                    var c_gen = (from t in data.ProductTag
                                 group t by new { t.Tag, t.Link } into g
                                 let count = g.Count()
                                             orderby count descending
                                             select new ProductTag { Tag = g.Key.Tag, Link = g.Key.Link }).ToList();

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