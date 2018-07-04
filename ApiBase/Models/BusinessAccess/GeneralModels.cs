namespace ApiBase.Models.BusinessAccess
{
    using ApiBase.Models.DB;
    using Microsoft.EntityFrameworkCore;
    using System;
    using System.Data.SqlClient;
    using System.Linq;

    /// <summary>
    /// General Models
    /// </summary>
    public class GeneralModels
    {
        /// <summary>
        /// Initializes a new instance of the <see cref="GeneralModels"/> class.
        /// </summary>
        public GeneralModels()
        {
        }

        /// <summary>
        /// Gets the content.
        /// </summary>
        /// <param name="name">The name.</param>
        /// <param name="lang">The language.</param>
        /// <returns>Get Content</returns>
        public static string GetContent(string name, string lang)
        {
            using (var data = new themanorContext())
            {
                try
                {
                    //if (string.IsNullOrEmpty(lang))
                    //{
                    //    lang = LanguageModels.ActiveLanguage().LangCultureName;
                    //}

                    var c_gen = data.General.Where(p => p.GeneralName == name && p.Lang.Trim().ToLower() == lang.Trim().ToLower() && p.Show == true).FirstOrDefault();

                    return c_gen.GeneralContent ?? string.Empty;
                }
                catch (Exception)
                {
                    return string.Empty;
                }
            }
        }

        /// <summary>
        /// Add the specified it.
        /// </summary>
        /// <param name="general">general object.</param>
        /// <returns>the Add</returns>
        public bool Add(General general)
        {
            using (var data = new themanorContext())
            {
                bool rt;
                try
                {
                    data.General.Add(general);
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
        /// Delete the specified general.
        /// </summary>
        /// <param name="general">The general.</param>
        /// <returns>the Delete</returns>
        public bool Delete(string general)
        {
            using (var data = new themanorContext())
            {
                bool rt;
                try
                {
                    var c_gen = data.General.Where(p => p.GeneralName == general).FirstOrDefault();
                    if (c_gen != null)
                    {
                        data.General.Remove(c_gen);
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
        /// Edit the specified it.
        /// </summary>
        /// <param name="general">general object.</param>
        /// <returns>the Edit</returns>
        public bool Edit(General general)
        {
            using (var data = new themanorContext())
            {
                bool rt;
                try
                {
                    var c_gen = data.General.Where(p => p.GeneralId == general.GeneralId).FirstOrDefault();
                    c_gen.GeneralName = general.GeneralName;
                    c_gen.GeneralContent = general.GeneralContent;
                    c_gen.Datemodified = general.Datemodified;
                    c_gen.Show = general.Show;
                    c_gen.Lang = general.Lang;
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
        /// Gets the general.
        /// </summary>
        /// <param name="name">The name.</param>
        /// <param name="lang">The language.</param>
        /// <returns>get General</returns>
        public General GetGeneral(string name, string lang)
        {
            using (var data = new themanorContext())
            {
                try
                {
                    //if (string.IsNullOrEmpty(lang))
                    //{
                    //    lang = LanguageModels.ActiveLanguage().LangCultureName;
                    //}

                    var c_gen = data.General.Where(p => p.GeneralName == name && p.Lang.Trim().ToLower() == lang.Trim().ToLower()).FirstOrDefault();
                    return c_gen;
                }
                catch (Exception ex)
                {
                    return new General();
                }
            }
        }

        /// <summary>
        /// Update the specified it.
        /// </summary>
        /// <param name="general">general object.</param>
        /// <returns>the Update</returns>
        public bool Update(General general)
        {
            using (var data = new themanorContext())
            {
                bool rt;
                try
                {
                    SqlParameter GeneralName = new SqlParameter();
                    GeneralName.ParameterName = "@Datemodified";
                    GeneralName.Value = general.GeneralName;

                    SqlParameter GeneralContent = new SqlParameter();
                    GeneralContent.ParameterName = "@GeneralContent";
                    GeneralContent.Value = general.GeneralContent;

                    SqlParameter Datemodified = new SqlParameter();
                    Datemodified.ParameterName = "@Datemodified";
                    Datemodified.Value = general.Datemodified;

                    SqlParameter Show = new SqlParameter();
                    Show.ParameterName = "@Show";
                    Show.Value = general.Show;

                    SqlParameter Lang = new SqlParameter();
                    Lang.ParameterName = "@Lang";
                    Lang.Value = general.Show;

                    data.Database.ExecuteSqlCommand("_General_Update  @GeneralName, @GeneralContent, @Datemodified, @Show, @Lang", GeneralName, GeneralContent, Datemodified, Show, Lang);

                    //data.f_General_Update(general.GeneralName, general.GeneralContent, general.Datemodified, general.Show, general.Lang);
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
    }
}