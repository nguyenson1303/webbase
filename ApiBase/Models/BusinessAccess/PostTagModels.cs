namespace ApiBase.Models.BusinessAccess
{
    using ApiBase.Models.DB;
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
        public bool Add_Tag(PostTag tag)
        {
            using (var data = new themanorContext())
            {
                bool rt;
                try
                {
                    data.PostTag.Add(tag);
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
            using (var data = new themanorContext())
            {
                bool rt;
                try
                {
                    var c_gen = data.PostTag.Where(p => p.PostId == id).FirstOrDefault();
                    if (c_gen != null)
                    {
                        data.PostTag.Remove(c_gen);
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
        public bool Edit_Tag(PostTag tag)
        {
            using (var data = new themanorContext())
            {
                bool rt;
                try
                {
                    var c_gen = data.PostTag.Where(p => p.PostTagId == tag.PostTagId).FirstOrDefault();
                    c_gen.PostId = tag.PostId;
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
        public List<PostTag> GetAll()
        {
            using (var data = new themanorContext())
            {
                try
                {
                    var c_gen = (from t in data.PostTag
                                 group t by new { t.Tag, t.Link } into g
                                 select new PostTag { Tag = g.Key.Tag, Link = g.Key.Link }).ToList();
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
        public List<PostTag> GetTagbyID(int id)
        {
            using (var data = new themanorContext())
            {
                try
                {
                    var c_gen = data.PostTag.Where(p => p.PostId == id).ToList();
                    return c_gen;
                }
                catch (Exception)
                {
                    return new List<PostTag>();
                }
            }
        }

        /// <summary>
        /// Gets the tag by link.
        /// </summary>
        /// <param name="link">The link.</param>
        /// <returns>Get Tag By Link</returns>
        public PostTag GetTagByLink(string link)
        {
            List<PostTag> lstTag = this.GetAll().FindAll(
                                         delegate(PostTag tag)
            {
                return tag.Link.Contains(link);
            });

            if (lstTag.Count > 0)
            {
                PostTag tagreturn = lstTag[0];

                return tagreturn;
            }
            else
            {
                return new PostTag();
            }
        }
    }
}