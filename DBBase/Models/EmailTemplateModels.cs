namespace DBBase.Models
{
    using DBBase.Data;
    using System;
    using System.Collections.Generic;
    using System.Linq;

    /// <summary>
    /// Email Template Models
    /// </summary>
    public class EmailTemplateModels
    {
        /// <summary>
        /// Initializes a new instance of the <see cref="EmailTemplateModels"/> class.
        /// </summary>
        public EmailTemplateModels()
        {
        }

        /// <summary>
        /// Add the specified it.
        /// </summary>
        /// <param name="template">email template.</param>
        /// <returns>the Add</returns>
        public int Add(C_EmailTemplate template)
        {
            using (var data = new Entities())
            {
                int rt = 0;
                try
                {
                    data.C_EmailTemplate.Add(template);
                    data.SaveChanges();
                    rt = template.id;
                }
                catch (Exception)
                {
                    rt = 0;
                }

                return rt;
            }
        }

        /// <summary>
        /// All the email template.
        /// </summary>
        /// <returns>All Email Template</returns>
        public List<C_EmailTemplate> AllEmailTemplate()
        {
            using (var data = new Entities())
            {
                try
                {
                    var lstEmail = data.C_EmailTemplate.ToList();
                    return lstEmail;
                }
                catch (Exception)
                {
                    return null;
                }
            }
        }

        /// <summary>
        /// Deletes the specified identifier.
        /// </summary>
        /// <param name="id">The identifier.</param>
        /// <returns>Deletes the specified</returns>
        public bool Delete(int id)
        {
            using (var data = new Entities())
            {
                bool rt;
                try
                {
                    var c_gen = data.C_EmailTemplate.Where(p => p.id == id).FirstOrDefault();
                    if (c_gen != null)
                    {
                        data.C_EmailTemplate.Remove(c_gen);
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
        /// Edit the specified template.
        /// </summary>
        /// <param name="template">email template.</param>
        /// <returns>the Edit</returns>
        public int Edit(C_EmailTemplate template)
        {
            using (var data = new Entities())
            {
                int rt = 0;
                try
                {
                    var c_gen = data.C_EmailTemplate.Where(p => p.id == template.id).FirstOrDefault();
                    c_gen.name = template.name;
                    c_gen.template = template.template;
                    data.SaveChanges();
                    rt = template.id;
                }
                catch (Exception)
                {
                    rt = 0;
                }

                return rt;
            }
        }

        /// <summary>
        /// Get the email template by identifier.
        /// </summary>
        /// <param name="id">The identifier.</param>
        /// <returns>Get Email Template By Id</returns>
        public C_EmailTemplate GetEmailTemplateById(int id)
        {
            using (var data = new Entities())
            {
                return data.C_EmailTemplate.Where(m => m.id == id).FirstOrDefault();
            }
        }

        /// <summary>
        /// Gets the list email template all.
        /// </summary>
        /// <param name="page_index">The page index.</param>
        /// <param name="page_size">The page site.</param>
        /// <param name="total">The total.</param>
        /// <returns>Get List Email Template All</returns>
        public List<C_EmailTemplate> GetListEmailTemplateAll(int page_index, int page_size, out int total)
        {
            try
            {
                List<C_EmailTemplate> lstEmailTempate = new List<C_EmailTemplate>();
                lstEmailTempate = this.AllEmailTemplate();
                total = lstEmailTempate.Count();

                return lstEmailTempate.Skip(page_index * page_size).Take(page_size).ToList();
            }
            catch (Exception)
            {
                total = 0;
                return null;
            }
        }

        /// <summary>
        /// Lists the email template.
        /// </summary>
        /// <param name="selected">The selected.</param>
        /// <param name="list_select_catalog">The list select catalog.</param>
        //public void List_email_template(int selected, ref List<SelectListItem> list_select_catalog)
        //{
        //    List<C_EmailTemplate> lstEmailTempate = this.AllEmailTemplate();
        //    foreach (C_EmailTemplate cata in lstEmailTempate)
        //    {
        //        list_select_catalog.Add(new SelectListItem { Selected = selected == cata.id ? true : false, Text = cata.name.ToString(), Value = cata.id.ToString() });
        //    }
        //}
    }
}