namespace ApiBase.Models.BusinessAccess
{
    using ApiBase.Models.DB;
    using Microsoft.EntityFrameworkCore;
    using System;
    using System.Data.SqlClient;
    using System.Linq;

    /// <summary>
    /// Web Info Models
    /// </summary>
    public class WebInfoModels
    {
        /// <summary>
        /// Initializes a new instance of the <see cref="WebInfoModels"/> class.
        /// </summary>
        public WebInfoModels()
        {
        }

        /// <summary>
        /// Adds the specified it.
        /// </summary>
        /// <param name="webInformation">web Information.</param>
        /// <returns>Add Cache</returns>
        public bool Add(WebInfo webInformation)
        {
            using (var data = new themanorContext())
            {
                bool rt;
                try
                {
                    data.WebInfo.Add(webInformation);
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
        /// Deletes the specified web information.
        /// </summary>
        /// <param name="webInfo">The web information.</param>
        /// <returns>Delete Cache</returns>
        public bool Delete(string webInfo)
        {
            using (var data = new themanorContext())
            {
                bool rt;
                try
                {
                    var c_gen = data.WebInfo.Where(p => p.GeneralName == webInfo).FirstOrDefault();
                    if (c_gen != null)
                    {
                        data.WebInfo.Remove(c_gen);
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
        /// Edits the specified it.
        /// </summary>
        /// <param name="webInformation">web Information.</param>
        /// <returns>Edit Cache</returns>
        public bool Edit(WebInfo webInformation)
        {
            using (var data = new themanorContext())
            {
                bool rt;
                try
                {
                    var c_gen = data.WebInfo.Where(p => p.GeneralId == webInformation.GeneralId).FirstOrDefault();
                    c_gen.GeneralName = webInformation.GeneralName;
                    c_gen.GeneralContent = webInformation.GeneralContent;
                    c_gen.Datemodified = webInformation.Datemodified;
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
        /// Gets the content.
        /// </summary>
        /// <param name="name">The name.</param>
        /// <returns>Gets the content</returns>
        public string GetContent(string name)
        {
            using (var data = new themanorContext())
            {
                try
                {
                    WebInfo c_gen = null;
                    //// First, check the cache
                    ////WebInfo c_gen = Cache.Get(name) as WebInfo;

                    if (c_gen == null)
                    {
                        c_gen = data.WebInfo.Where(p => p.GeneralName == name).FirstOrDefault();

                        ////if (c_gen != null)
                        ////{
                        ////    //// Put this data into the cache for 10 minutes
                        ////    Cache.Set(name, c_gen, int.Parse(Util.getConfigValue(CommonGlobal.TIME_CACHE, "0")));
                        ////}
                    }

                    return c_gen.GeneralContent;
                }
                catch (Exception)
                {
                    return string.Empty;
                }
            }
        }

        /// <summary>
        /// Gets the web information.
        /// </summary>
        /// <param name="name">The name.</param>
        /// <returns>Gets the web information</returns>
        public WebInfo GetWebInfo(string name)
        {
            using (var data = new themanorContext())
            {
                try
                {
                    var c_gen = data.WebInfo.Where(p => p.GeneralName == name).FirstOrDefault();
                    return c_gen;
                }
                catch (Exception)
                {
                    return new WebInfo();
                }
            }
        }

        /// <summary>
        /// Updates the specified it.
        /// </summary>
        /// <param name="webInformation">web Information.</param>
        /// <returns>Updates the specified</returns>
        public bool Update(WebInfo webInformation)
        {
            using (var data = new themanorContext())
            {
                bool rt;
                try
                {
                    var GeneralName = new SqlParameter("@GeneralName", webInformation.GeneralName);
                    var GeneralContent = new SqlParameter("@GeneralContent", webInformation.GeneralContent);
                    var Datemodified = new SqlParameter("@Datemodified", webInformation.Datemodified);

                    data.Database.ExecuteSqlCommand("_WebInfo_Update  @GeneralName, @GeneralContent, @Datemodified", GeneralName, GeneralContent, Datemodified);

                    //data.f_WebInfo_Update(webInformation.GeneralName, webInformation.GeneralContent, webInformation.Datemodified);
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