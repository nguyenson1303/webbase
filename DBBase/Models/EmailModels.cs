namespace DBBase.Models
{
    using DBBase.Data;
    using System;
    using System.Collections.Generic;
    using System.Linq;

    /// <summary>
    /// Email Models
    /// </summary>
    public class EmailModels
    {
        /// <summary>
        /// Initializes a new instance of the <see cref="EmailModels"/> class.
        /// </summary>
        public EmailModels()
        {
        }

        /// <summary>
        /// Add the email.
        /// </summary>
        /// <param name="email">the email.</param>
        /// <returns>Add the email</returns>
        public string Add_Email(C_Email email)
        {
            using (var data = new Entities())
            {
                string rt = string.Empty;
                try
                {
                    data.C_Email.Add(email);
                    data.SaveChanges();
                    rt = email.name;
                }
                catch (Exception)
                {
                    rt = string.Empty;
                }

                return rt;
            }
        }

        /// <summary>
        /// All the email.
        /// </summary>
        /// <returns>All the email</returns>
        public List<C_Email> AllEmail()
        {
            using (var data = new Entities())
            {
                try
                {
                    var lstEmail = data.C_Email.ToList();
                    return lstEmail;
                }
                catch (Exception)
                {
                    return null;
                }
            }
        }

        /// <summary>
        /// Deletes the specified email identifier.
        /// </summary>
        /// <param name="email_id">The email identifier.</param>
        /// <returns>Deletes the specified email</returns>
        public bool Delete(int email_id)
        {
            using (var data = new Entities())
            {
                bool rt;
                try
                {
                    var c_gen = data.C_Email.Where(p => p.id == email_id).FirstOrDefault();
                    if (c_gen != null)
                    {
                        data.C_Email.Remove(c_gen);
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
        /// Gets the email.
        /// </summary>
        /// <param name="email">The email.</param>
        /// <returns>Gets the email</returns>
        public C_Email GetEmail(string name, string phone)
        {
            using (var data = new Entities())
            {
                try
                {
                    var objEmail = data.C_Email.SingleOrDefault(e => e.email == name && e.phone == phone);
                    return objEmail;
                }
                catch (Exception)
                {
                    return null;
                }
            }
        }

        /// <summary>
        /// Gets the email by identifier.
        /// </summary>
        /// <param name="email_id">The email identifier.</param>
        /// <returns>Gets the email</returns>
        public C_Email GetEmailById(int email_id)
        {
            using (var data = new Entities())
            {
                try
                {
                    var objEmail = data.C_Email.SingleOrDefault(e => e.id == email_id);
                    return objEmail;
                }
                catch (Exception)
                {
                    return null;
                }
            }
        }

        /// <summary>
        /// Gets the list email.
        /// </summary>
        /// <param name="page_index">The page index.</param>
        /// <param name="page_site">The page site.</param>
        /// <param name="total">The total.</param>
        /// <returns> Gets the list email</returns>
        public List<C_Email> GetListEmail(int page_index, int page_size,  out int total)
        {
            try
            {
                List<C_Email> lstEmail = new List<C_Email>();
                lstEmail = this.AllEmail();
                total = lstEmail.Count();

                return lstEmail.Skip(page_index * page_size).Take(page_size).ToList();
            }
            catch (Exception)
            {
                total = 0;
                return null;
            }
        }
    }
}