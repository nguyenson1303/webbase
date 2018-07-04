namespace ApiBase.Models.BusinessAccess
{
    using ApiBase.Models.DB;
    using System;
    using System.Collections.Generic;
    using System.Linq;

    /// <summary>
    /// Contact Models
    /// </summary>
    public class ContactModels
    {
        /// <summary>
        /// Adds the specified it.
        /// </summary>
        /// <param name="contactObject">contact Object</param>
        /// <returns>the Add</returns>
        public bool Add(Contact contactObject)
        {
            using (var data = new themanorContext())
            {
                bool rt;
                try
                {
                    data.Contact.Add(contactObject);
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
        /// Admins the get all contact client.
        /// </summary>
        /// <param name="lang">The language.</param>
        /// <param name="search">The search.</param>
        /// <param name="page_index">The page index.</param>
        /// <param name="page_size">The page size.</param>
        /// <param name="order_by">The order by.</param>
        /// <param name="order_type">Type of the order.</param>
        /// <param name="total">The total.</param>
        /// <returns>admin Get All Contact Client</returns>
        public List<Contact> AdminGetAllContactClient(string lang, string search, int page_index, int page_size, string order_by, string order_type, out int total)
        {
            using (var data = new themanorContext())
            {
                try
                {
                    IQueryable<Contact> c_gen = null;
                    if (!string.IsNullOrEmpty(search))
                    {
                        c_gen = (from p in data.Contact
                                 where (p.Name.Contains(search) || p.Contents.Contains(search) || p.Email.Contains(search) || p.Phone.Contains(search))
                                 select p).OrderByDescending(p => p.ContactId).AsQueryable<Contact>();
                    }
                    else
                    {
                        c_gen = data.Contact.OrderByDescending(p => p.ContactId).AsQueryable<Contact>();
                    }

                    total = c_gen.Count();

                    if (!string.IsNullOrEmpty(order_by) && !string.IsNullOrEmpty(order_type))
                    {
                        Type sortByPropType = typeof(Contact).GetProperty(order_by).PropertyType;
                        ////calling the extension method using reflection
                        c_gen = typeof(MyExtensions).GetMethod("CustomSort").MakeGenericMethod(new Type[] { typeof(Contact), sortByPropType })
                                .Invoke(c_gen, new object[] { c_gen, order_by, order_type }) as IQueryable<Contact>;
                    }
                    else
                    {
                        ////if  orderBy null set default is ID
                        c_gen = c_gen.OrderByDescending(p => p.ContactId);
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
        /// <returns>the Delete</returns>
        public bool Delete(int id)
        {
            using (var data = new themanorContext())
            {
                bool rt;
                try
                {
                    var c_gen = data.Contact.Where(p => p.ContactId == id).FirstOrDefault();
                    if (c_gen != null)
                    {
                        data.Contact.Remove(c_gen);
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
        /// <returns>Get By ID</returns>
        public Contact GetByID(int id)
        {
            using (var data = new themanorContext())
            {
                try
                {
                    var c_gen = data.Contact.Where(p => p.ContactId == id).FirstOrDefault();
                    return c_gen;
                }
                catch (Exception)
                {
                    return new Contact();
                }
            }
        }

        /// <summary>
        /// Gets the list contact last.
        /// </summary>
        /// <returns>Get List Contact Last</returns>
        public List<Contact> GetListContactLast()
        {
            using (var data = new themanorContext())
            {
                try
                {
                    var c_gen = data.Contact.OrderByDescending(p => p.Createdate).Take(10).ToList();
                    return c_gen;
                }
                catch
                {
                    return new List<Contact>();
                }
            }
        }
    }
}