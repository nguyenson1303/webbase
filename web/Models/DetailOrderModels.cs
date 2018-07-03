namespace Web.Models
{
    using System;
    using System.Collections.Generic;
    using System.Linq;
    using Web.Data;

    /// <summary>
    /// Detail Order Models
    /// </summary>
    public class DetailOrderModels
    {
        /// <summary>
        /// Initializes a new instance of the <see cref="DetailOrderModels"/> class.
        /// </summary>
        public DetailOrderModels()
        {
        }

        /// <summary>
        /// Removes all detail order.
        /// </summary>
        /// <param name="code">The code.</param>
        /// <returns></returns>
        public bool RemoveAllDetailOrder(string code) {
            using (var data = new Entities())
            {
                bool rt;
                try
                {
                    data.DetailOrders.RemoveRange(data.DetailOrders.Where(x => x.Code == code));
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
        /// Adds the detail order.
        /// </summary>
        /// <param name="item">detail order item</param>
        /// <returns>Add Detail Order</returns>
        public bool AddDetailOrder(DetailOrder item)
        {
            using (var data = new Entities())
            {
                bool rt;
                try
                {
                    data.DetailOrders.Add(item);
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
        /// Gets all order detail.
        /// </summary>
        /// <param name="code">The code.</param>
        /// <returns>Gets all order detail</returns>
        public List<DetailOrder> GetAllOrderDetail(string code)
        {
            using (var data = new Entities())
            {
                try
                {
                    var c_gen = data.DetailOrders.Where(p => p.Code == code).ToList<DetailOrder>();
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