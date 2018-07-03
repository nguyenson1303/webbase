namespace Web.Models
{
    using System;
    using System.Collections.Generic;
    using System.Linq;
    using Web.Data;

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
        public bool Add_Tag(C_ProductTag tag)
        {
            using (var data = new Entities())
            {
                bool rt;
                try
                {
                    data.C_ProductTag.Add(tag);
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
            using (var data = new Entities())
            {
                bool rt;
                try
                {
                    var c_gen = data.C_ProductTag.Where(p => p.ProductID == id).FirstOrDefault();
                    if (c_gen != null)
                    {
                        data.C_ProductTag.Remove(c_gen);
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
        public bool Edit_Tag(C_ProductTag tag)
        {
            using (var data = new Entities())
            {
                bool rt;
                try
                {
                    var c_gen = data.C_ProductTag.Where(p => p.ProductTagID == tag.ProductTagID).FirstOrDefault();
                    c_gen.ProductID = tag.ProductID;
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
        public List<C_ProductTag> GetAll()
        {
            using (var data = new Entities())
            {
                try
                {
                    List<C_ProductTag> lst = new List<C_ProductTag>();
                    var c_gen = (from t in data.C_ProductTag
                                 group t by new { t.Tag, t.Link } into g
                                 select new { Tag = g.Key.Tag, Link = g.Key.Link }).ToList();
                    if (c_gen.Count > 0)
                    {
                        foreach (var it in c_gen)
                        {
                            C_ProductTag tag = new C_ProductTag();
                            tag.Tag = it.Tag;
                            tag.Link = it.Link;
                            tag.ProductTagID = 99999999;
                            tag.ProductID = 99999999;
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
        public List<C_ProductTag> GetTagbyID(int id)
        {
            using (var data = new Entities())
            {
                try
                {
                    var c_gen = data.C_ProductTag.Where(p => p.ProductID == id).ToList<C_ProductTag>();

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
        public C_ProductTag GetTagByLink(string link)
        {
            List<C_ProductTag> lstTag = this.GetAll().FindAll(delegate(C_ProductTag tag)
            {
                return tag.Link.Contains(link);
            });
            if (lstTag.Count > 0)
            {
                C_ProductTag tagreturn = lstTag[0];

                return tagreturn;
            }
            else
            {
                return new C_ProductTag();
            }
        }

        /// <summary>
        /// Gets the top tag.
        /// </summary>
        /// <returns>top 20</returns>
        public List<C_ProductTag> GetTopTag()
        {
            using (var data = new Entities())
            {
                try
                {
                    var c_gen = (from t in data.C_ProductTag
                                 group t by new { t.Tag, t.Link } into g
                                 let count = g.Count()
                                             orderby count descending
                                             select new C_ProductTag { Tag = g.Key.Tag, Link = g.Key.Link }).ToList();

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