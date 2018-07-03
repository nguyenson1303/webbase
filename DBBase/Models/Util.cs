namespace DBBase.Models
{
    using System;
    using System.Collections;
    using System.Configuration;
    using System.Diagnostics;
    using System.Globalization;
    using System.IO;
    using System.Text;
    using System.Text.RegularExpressions;
    using System.Web;

    /// <summary>
    /// tool for string object
    /// </summary>
    public class Util
    {
        // update : 5/April/2018
        static Regex MobileCheck = new Regex(@"(android|bb\d+|meego).+mobile|avantgo|bada\/|blackberry|blazer|compal|elaine|fennec|hiptop|iemobile|ip(hone|od)|iris|kindle|lge |maemo|midp|mmp|mobile.+firefox|netfront|opera m(ob|in)i|palm( os)?|phone|p(ixi|re)\/|plucker|pocket|psp|series(4|6)0|symbian|treo|up\.(browser|link)|vodafone|wap|windows ce|xda|xiino", RegexOptions.IgnoreCase | RegexOptions.Multiline | RegexOptions.Compiled);
        static Regex MobileVersionCheck = new Regex(@"1207|6310|6590|3gso|4thp|50[1-6]i|770s|802s|a wa|abac|ac(er|oo|s\-)|ai(ko|rn)|al(av|ca|co)|amoi|an(ex|ny|yw)|aptu|ar(ch|go)|as(te|us)|attw|au(di|\-m|r |s )|avan|be(ck|ll|nq)|bi(lb|rd)|bl(ac|az)|br(e|v)w|bumb|bw\-(n|u)|c55\/|capi|ccwa|cdm\-|cell|chtm|cldc|cmd\-|co(mp|nd)|craw|da(it|ll|ng)|dbte|dc\-s|devi|dica|dmob|do(c|p)o|ds(12|\-d)|el(49|ai)|em(l2|ul)|er(ic|k0)|esl8|ez([4-7]0|os|wa|ze)|fetc|fly(\-|_)|g1 u|g560|gene|gf\-5|g\-mo|go(\.w|od)|gr(ad|un)|haie|hcit|hd\-(m|p|t)|hei\-|hi(pt|ta)|hp( i|ip)|hs\-c|ht(c(\-| |_|a|g|p|s|t)|tp)|hu(aw|tc)|i\-(20|go|ma)|i230|iac( |\-|\/)|ibro|idea|ig01|ikom|im1k|inno|ipaq|iris|ja(t|v)a|jbro|jemu|jigs|kddi|keji|kgt( |\/)|klon|kpt |kwc\-|kyo(c|k)|le(no|xi)|lg( g|\/(k|l|u)|50|54|\-[a-w])|libw|lynx|m1\-w|m3ga|m50\/|ma(te|ui|xo)|mc(01|21|ca)|m\-cr|me(rc|ri)|mi(o8|oa|ts)|mmef|mo(01|02|bi|de|do|t(\-| |o|v)|zz)|mt(50|p1|v )|mwbp|mywa|n10[0-2]|n20[2-3]|n30(0|2)|n50(0|2|5)|n7(0(0|1)|10)|ne((c|m)\-|on|tf|wf|wg|wt)|nok(6|i)|nzph|o2im|op(ti|wv)|oran|owg1|p800|pan(a|d|t)|pdxg|pg(13|\-([1-8]|c))|phil|pire|pl(ay|uc)|pn\-2|po(ck|rt|se)|prox|psio|pt\-g|qa\-a|qc(07|12|21|32|60|\-[2-7]|i\-)|qtek|r380|r600|raks|rim9|ro(ve|zo)|s55\/|sa(ge|ma|mm|ms|ny|va)|sc(01|h\-|oo|p\-)|sdk\/|se(c(\-|0|1)|47|mc|nd|ri)|sgh\-|shar|sie(\-|m)|sk\-0|sl(45|id)|sm(al|ar|b3|it|t5)|so(ft|ny)|sp(01|h\-|v\-|v )|sy(01|mb)|t2(18|50)|t6(00|10|18)|ta(gt|lk)|tcl\-|tdg\-|tel(i|m)|tim\-|t\-mo|to(pl|sh)|ts(70|m\-|m3|m5)|tx\-9|up(\.b|g1|si)|utst|v400|v750|veri|vi(rg|te)|vk(40|5[0-3]|\-v)|vm40|voda|vulc|vx(52|53|60|61|70|80|81|83|85|98)|w3c(\-| )|webc|whit|wi(g |nc|nw)|wmlb|wonu|x700|yas\-|your|zeto|zte\-", RegexOptions.IgnoreCase | RegexOptions.Multiline | RegexOptions.Compiled);

        /// <summary>
        /// Initializes a new instance of the <see cref="Util"/> class.
        /// </summary>
        public Util()
        {
        }

        //public static bool FBrowserIsMobile()
        //{
        //    Debug.Assert(HttpContext.Current != null);

        //    if (HttpContext.Current.Request != null && HttpContext.Current.Request.ServerVariables["HTTP_USER_AGENT"] != null)
        //    {
        //        var u = HttpContext.Current.Request.ServerVariables["HTTP_USER_AGENT"].ToString();

        //        if (u.Length < 4)
        //            return false;

        //        if (MobileCheck.IsMatch(u) || MobileVersionCheck.IsMatch(u.Substring(0, 4)))
        //            return true;
        //    }

        //    return false;
        //}

        /// <summary>
        /// Checks the exist in array.
        /// </summary>
        /// <param name="productId">The product identifier.</param>
        /// <param name="listSP">The list product.</param>
        /// <returns>Check Exist In Array</returns>
        public static bool CheckExistInArray(string productId, ArrayList listSP)
        {
            bool r = false;
            if (listSP.Count > 0)
            {
                foreach (var sp in listSP)
                {
                    if (sp.ToString() == productId.ToString())
                    {
                        r = true;
                    }
                }
            }                

            return r;
        }

        /// <summary>
        /// Converts to un sign3.
        /// </summary>
        /// <param name="s">The s.</param>
        /// <returns>convert To UnSign3</returns>
        public static string ConvertToUnSign3(string s)
        {
            Regex regex = new Regex("\\p{IsCombiningDiacriticalMarks}+");
            string temp = s.Normalize(NormalizationForm.FormD);

            return regex.Replace(temp, string.Empty).Replace('\u0111', 'd').Replace('\u0110', 'D');
        }

        /// <summary>
        /// Gets the configuration value.
        /// </summary>
        /// <param name="key">The key.</param>
        /// <param name="default_value">The default value.</param>
        /// <returns>get Config Value</returns>
        //public static string GetConfigValue(string key, string default_value)
        //{
        //    try
        //    {
        //        var appSettings = ConfigurationManager.AppSettings;
        //        string result = appSettings[key] ?? "Not Found";

        //        return result;
        //    }
        //    catch (ConfigurationErrorsException)
        //    {
        //        return default_value;
        //    }
        //}

        ////public ResourceManager getResource()
        ////{
        ////    ResourceManager rm=null;
        ////    string lang = string.Empty;
        ////    HttpCookie oCookie = HttpContext.Current.Request.Cookies["lang"];
        ////    if (oCookie != null && oCookie.Value != null)
        ////    {
        ////        lang = oCookie.Value;
        ////    }
        ////    else
        ////    {
        ////        lang = "vn";
        ////        HttpContext.Current.Response.Cookies["lang"].Value = lang;
        ////        HttpContext.Current.Response.Cookies["lang"].Expires = DateTime.Now.AddYears(1);
        ////    }
        ////    switch (lang)
        ////    {
        ////        case "en":
        ////            rm = new ResourceManager(typeof(Resources.lang_en));
        ////            break;
        ////        case "vn":
        ////            rm = new ResourceManager(typeof(Resources.lang));
        ////            break;
        ////    }
        ////    return rm;
        ////}

        /// <summary>
        /// Gets the domain.
        /// </summary>
        /// <returns>Get Domain</returns>
        //public static string GetDomain()
        //{
        //    string domain = ConfigurationManager.AppSettings["Domain"].ToString();

        //    return domain;
        //}

        /// <summary>
        /// Gets the language.
        /// </summary>
        /// <returns>Get Lang</returns>
        //public static string GetLang()
        //{
        //    string lang = "vi";
        //    try
        //    {
        //        if (HttpContext.Current.Request.Cookies["CurrentLanguage"] != null && HttpContext.Current.Request.Cookies["CurrentLanguage"].Value != null)
        //        {
        //            lang = HttpContext.Current.Request.Cookies["CurrentLanguage"].Value.ToString(); ////HttpContext.Current.Request["lang"].ToString();
        //        }
        //        else if (!string.IsNullOrEmpty(System.Web.HttpContext.Current.Request.QueryString["lang"]))
        //        {
        //            lang = System.Web.HttpContext.Current.Request.QueryString["lang"];
        //        }
        //        else
        //        {
        //            lang = "vi";
        //        }
        //    }
        //    catch (NullReferenceException)
        //    {
        //        lang = "vi";
        //    }
        //    catch (Exception ex)
        //    {
        //        throw ex;
        //    }

        //    return lang;
        //}

        /// <summary>
        /// Reads the user visited.
        /// </summary>
        /// <param name="filename">The filename.</param>
        /// <returns>Read User Visited</returns>
        /// <exception cref="Exception">Exception file not found</exception>
        public static int ReadUserVisited(string filename)
        {
            int visited = 0;
            FileInfo info = new FileInfo(filename);
            if (info.Exists)
            {
                StreamReader re = File.OpenText(filename);

                string input = string.Empty;
                while ((input = re.ReadLine()) != null)
                {
                    visited = int.Parse(input);
                }

                re.Close();
            }
            else
            {
                throw new Exception("File khong ton tai");
            }

            return visited;
        }

        /// <summary>
        /// Saves the user visited.
        /// </summary>
        /// <param name="fileName">Name of the file.</param>
        /// <param name="number">The number.</param>
        public static void SaveUserVisited(string fileName, int number)
        {
            TextWriter tw = new StreamWriter(fileName, false);

            //// write a line of text to the file
            tw.WriteLine(number.ToString());
            //// close the stream
            tw.Close();
        }

        /// <summary>
        /// To the query.
        /// </summary>
        /// <param name="stringQuery">The s.</param>
        /// <returns>new query</returns>
        public static string ToQuery(string stringQuery)
        {
            string sRt = string.Empty;
            try
            {
                if (stringQuery != null)
                {
                    string strPaten = "0123456789";
                    int p;
                    p = stringQuery.Length;
                    for (int i = 0; i < p; i++)
                    {
                        for (int j = 0; j < 10; j++)
                        {
                            if (stringQuery[i] == strPaten[j])
                            {
                                sRt = sRt + stringQuery[i];
                                break;
                            }
                        }
                    }
                }
            }
            catch
            {
            }

            return sRt;
        }

        ///// <summary>
        ///// Translates the specified text.
        ///// </summary>
        ///// <param name="text">The text.</param>
        ///// <returns>Translate language</returns>
        //public static string Translate(string text)
        //{
        //    return HttpContext.GetGlobalResourceObject("lang", text, (CultureInfo)HttpContext.Current.Session["Culture"]).ToString();
        //}

        /// <summary>
        /// Unix the time stamp to date time.
        /// </summary>
        /// <param name="unixTimeStamp">The unix time stamp.</param>
        /// <returns>Unix TimeStamp To DateTime</returns>
        public static DateTime UnixTimeStampToDateTime(double unixTimeStamp)
        {
            //// Unix timestamp is seconds past epoch
            System.DateTime unixDateTime = new DateTime(1970, 1, 1, 0, 0, 0, 0, System.DateTimeKind.Utc);
            unixDateTime = unixDateTime.AddSeconds(unixTimeStamp).ToLocalTime();

            return unixDateTime;
        }
    }
}