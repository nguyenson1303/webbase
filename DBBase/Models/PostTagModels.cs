namespace DBBase.Models
{
    using DBBase.Data;
    using System;
    using System.Collections.Generic;
    using System.Linq;

    /// <summary>
    /// Post Tag Models
    /// </summary>
    public class PostTagModels
    {
        /// <summary>
        /// Add the tag.
        /// </summary>
        /// <param name="tag">tag object.</param>
        /// <returns>Add the Tag</returns>
        public bool Add_Tag(C_PostTag tag)
        {
            using (var data = new Entities())
            {
                bool rt;
                try
                {
                    data.C_PostTag.Add(tag);
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
        /// <returns>Delete Tag</returns>
        public bool Delete_Tag(int id)
        {
            using (var data = new Entities())
            {
                bool rt;
                try
                {
                    var c_gen = data.C_PostTag.Where(p => p.PostID == id).FirstOrDefault();
                    if (c_gen != null)
                    {
                        data.C_PostTag.Remove(c_gen);
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
        /// <returns>Edit Tag</returns>
        public bool Edit_Tag(C_PostTag tag)
        {
            using (var data = new Entities())
            {
                bool rt;
                try
                {
                    var c_gen = data.C_PostTag.Where(p => p.PostTagID == tag.PostTagID).FirstOrDefault();
                    c_gen.PostID = tag.PostID;
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
        /// Gets all.
        /// </summary>
        /// <returns>Get All</returns>
        public List<C_PostTag> GetAll()
        {
            using (var data = new Entities())
            {
                try
                {
                    var c_gen = (from t in data.C_PostTag
                                 group t by new { t.Tag, t.Link } into g
                                 select new C_PostTag { Tag = g.Key.Tag, Link = g.Key.Link }).ToList();
                    return c_gen;
                }
                catch (Exception)
                {
                    return null;
                }
            }
        }

        /// <summary>
        /// Gets the tag by identifier.
        /// </summary>
        /// <param name="id">The identifier.</param>
        /// <returns>get Tag by ID</returns>
        public List<C_PostTag> GetTagbyID(int id)
        {
            using (var data = new Entities())
            {
                try
                {
                    var c_gen = data.C_PostTag.Where(p => p.PostID == id).ToList();
                    return c_gen;
                }
                catch (Exception)
                {
                    return new List<C_PostTag>();
                }
            }
        }

        /// <summary>
        /// Gets the tag by link.
        /// </summary>
        /// <param name="link">The link.</param>
        /// <returns>Get Tag By Link</returns>
        public C_PostTag GetTagByLink(string link)
        {
            List<C_PostTag> lstTag = this.GetAll().FindAll(
                                         delegate(C_PostTag tag)
            {
                return tag.Link.Contains(link);
            });

            if (lstTag.Count > 0)
            {
                C_PostTag tagreturn = lstTag[0];

                return tagreturn;
            }
            else
            {
                return new C_PostTag();
            }
        }
    }
}