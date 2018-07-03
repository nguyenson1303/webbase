namespace Web.Models
{
    using System;
    using System.Linq;
    using Web.Data;
    using Webdiyer.WebControls.Mvc;

    /// <summary>
    /// Log Models
    /// </summary>
    public class LogModels
    {
        /// <summary>
        /// Initializes a new instance of the <see cref="LogModels"/> class.
        /// </summary>
        public LogModels()
        {
        }

        /// <summary>
        /// Delete the specified identifier.
        /// </summary>
        /// <param name="id">The identifier.</param>
        /// <returns>status Delete</returns>
        public bool Delete(int id)
        {
            using (var data = new Entities())
            {
                bool rt;
                try
                {
                    var c_gen = data.Logs.Where(p => p.Id == id).FirstOrDefault();
                    if (c_gen != null)
                    {
                        data.Logs.Remove(c_gen);
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
        /// Gets all log by admin.
        /// </summary>
        /// <param name="from_date">From date.</param>
        /// <param name="to_date">To date.</param>
        /// <param name="search">The search.</param>
        /// <param name="page_index">The page index.</param>
        /// <param name="page_size">The page size.</param>
        /// <param name="order_by">The order by.</param>
        /// <param name="order_type">Type of the order.</param>
        /// <param name="total">The total.</param>
        /// <returns>get All Log By Admin</returns>
        public PagedList<Log> GetAllLogByAdmin(DateTime from_date, DateTime to_date, string search, int page_index, int page_size, string order_by, string order_type, out int total)
        {
            using (var data = new Entities())
            {
                try
                {
                    IQueryable<Log> c_gen = null;
                    c_gen = data.Logs.Where(p => p.EventDateTime >= from_date && p.EventDateTime <= to_date).OrderByDescending(p => p.EventDateTime).AsQueryable<Log>();

                    if (!string.IsNullOrEmpty(search))
                    {
                        c_gen = c_gen.Where(p => p.UserName == search).AsQueryable<Log>();
                    }

                    total = c_gen.Count();

                    return c_gen.ToPagedList(page_index, page_size);
                }
                catch (Exception)
                {
                    total = 0;
                    return null;
                }
            }
        }

        /// <summary>
        /// Get the log by identifier.
        /// </summary>
        /// <param name="id">The identifier.</param>
        /// <returns>get Log by ID</returns>
        public Log GetLogbyID(int id)
        {
            using (var data = new Entities())
            {
                try
                {
                    var c_gen = data.Logs.Where(p => p.Id == id).FirstOrDefault();
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