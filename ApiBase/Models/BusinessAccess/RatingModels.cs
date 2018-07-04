namespace ApiBase.Models.BusinessAccess
{
    using ApiBase.Models.DB;
    using System;
    using System.Collections.Generic;
    using System.Linq;

    /// <summary>
    /// Rating Models
    /// </summary>
    public class RatingModels
    {
        /// <summary>
        /// Adds the specified rating.
        /// </summary>
        /// <param name="rating">rating object.</param>
        /// <returns>Adds the specified</returns>
        public bool Add(Rating rating)
        {
            using (var data = new themanorContext())
            {
                bool rt;
                try
                {
                    var is_exist_rating = data.Rating.Where(p => p.ItemId == rating.ItemId && p.Ip == rating.Ip && p.Email == rating.Email).ToList();
                    if (!is_exist_rating.Any())
                    {
                        data.Rating.Add(rating);
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
        /// Admins the get all rating by product identifier.
        /// </summary>
        /// <param name="pro_id">The pro identifier.</param>
        /// <param name="search">The search.</param>
        /// <param name="page_index">The page index.</param>
        /// <param name="page_size">The page size.</param>
        /// <param name="order_by">The order by.</param>
        /// <param name="order_type">Type of the order.</param>
        /// <param name="total">The total.</param>
        /// <returns>Admins the get all rating by product</returns>
        public List<Rating> AdminGetAllRatingByProductId(int pro_id, string search, int page_index, int page_size, string order_by, string order_type, out int total)
        {
            using (var data = new themanorContext())
            {
                try
                {
                    IQueryable<Rating> c_gen = null;
                    if (!string.IsNullOrEmpty(search))
                    {
                        c_gen = (from p in data.Rating
                                 where p.ItemId == pro_id && (p.Name.Contains(search) || p.Email.Contains(search) || p.Contents.Contains(search))
                                 select p).OrderByDescending(p => p.RatingId).AsQueryable<Rating>();
                    }
                    else
                    {
                        c_gen = data.Rating.Where(p => p.ItemId == pro_id).OrderByDescending(p => p.RatingId).AsQueryable<Rating>();
                    }

                    total = c_gen.Count();

                    if (!string.IsNullOrEmpty(order_by) && !string.IsNullOrEmpty(order_type))
                    {
                        Type sortByPropType = typeof(Rating).GetProperty(order_by).PropertyType;
                        ////calling the extension method using reflection
                        c_gen = typeof(MyExtensions).GetMethod("CustomSort").MakeGenericMethod(new Type[] { typeof(Rating), sortByPropType })
                                .Invoke(c_gen, new object[] { c_gen, order_by, order_type }) as IQueryable<Rating>;
                    }
                    else
                    {
                        ////if  orderBy null set default is ID
                        c_gen = c_gen.OrderByDescending(p => p.RatingId);
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
        /// Deletes the specified identifier.
        /// </summary>
        /// <param name="id">The identifier.</param>
        /// <returns>Deletes the Rating</returns>
        public bool Delete(int id)
        {
            using (var data = new themanorContext())
            {
                bool rt;
                try
                {
                    var c_gen = data.Rating.Where(p => p.RatingId == id).FirstOrDefault();
                    if (c_gen != null)
                    {
                        data.Rating.Remove(c_gen);
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
        /// Deletes the by item identifier.
        /// </summary>
        /// <param name="id">The identifier.</param>
        /// <returns>Deletes the by item</returns>
        public bool DeleteByItemID(int id)
        {
            using (var data = new themanorContext())
            {
                bool rt;
                try
                {
                    var c_gen = data.Rating.Where(p => p.ItemId == id).FirstOrDefault();
                    if (c_gen != null)
                    {
                        data.Rating.Remove(c_gen);
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
        /// Gets the by identifier.
        /// </summary>
        /// <param name="id">The identifier.</param>
        /// <returns>Gets the by id</returns>
        public Rating GetByID(int id)
        {
            using (var data = new themanorContext())
            {
                try
                {
                    var c_gen = data.Rating.Where(p => p.RatingId == id).FirstOrDefault();
                    return c_gen;
                }
                catch (Exception)
                {
                    return new Rating();
                }
            }
        }

        /// <summary>
        /// Get the list rating by item.
        /// </summary>
        /// <param name="item_id">The item identifier.</param>
        /// <returns>the list rating</returns>
        public List<Rating> GetListRatingByItem(int item_id)
        {
            using (var data = new themanorContext())
            {
                try
                {
                    var c_gen = data.Rating.Where(p => p.ItemId == item_id).Take(10).ToList();
                    return c_gen;
                }
                catch
                {
                    return new List<Rating>();
                }
            }
        }

        /// <summary>
        /// Get the list rating last.
        /// </summary>
        /// <returns>the list rating last</returns>
        public List<Rating> GetListRatingLast()
        {
            using (var data = new themanorContext())
            {
                try
                {
                    var c_gen = data.Rating.OrderByDescending(p => p.RatingId).Take(10).ToList();

                    return c_gen;
                }
                catch
                {
                    return new List<Rating>();
                }
            }
        }

        /// <summary>
        /// Gets the rating sum for item.
        /// </summary>
        /// <param name="item_id">The item identifier.</param>
        /// <returns>the rating sum for item</returns>
        public int GetRatingSumforItem(int item_id)
        {
            using (var data = new themanorContext())
            {
                try
                {
                    var sum_gen = data.Rating.Where(p => p.ItemId == item_id).Sum(p => p.Rating1).Value;

                    return sum_gen;
                }
                catch
                {
                    return 0;
                }
            }
        }

        /// <summary>
        /// Gets the rating total for item.
        /// </summary>
        /// <param name="item_id">The item identifier.</param>
        /// <returns>the rating total</returns>
        public int GetRatingTotalforItem(int item_id)
        {
            using (var data = new themanorContext())
            {
                try
                {
                    var total_gen = data.Rating.Where(p => p.ItemId == item_id).Count();

                    return total_gen;
                }
                catch
                {
                    return 0;
                }
            }
        }
    }
}