namespace Web.Models
{
    using System;
    using System.Collections.Generic;
    using System.Globalization;
    using System.Linq;
    using System.Web;

    /// <summary>
    /// Language Models
    /// </summary>
    public class LanguageModels
    {
        /// <summary>
        /// The available languages
        /// </summary>
        public static List<Languages> AvailableLanguages = new List<Languages>
        {
            new Languages { LangFullName = "Tiếng Việt", LangCultureName = "vi", LangFlag = "/images/icon/f-vn.png" },
            new Languages { LangFullName = "English", LangCultureName = "en", LangFlag = "/images/icon/f-gb.png" },
            new Languages { LangFullName = "French", LangCultureName = "fr", LangFlag = "/images/icon/f-fr.png" },
        };

        /// <summary>
        /// Actives the language.
        /// </summary>
        /// <returns>Active Language</returns>
        public static Languages ActiveLanguage()
        {
            HttpCookie cookie = HttpContext.Current.Request.Cookies["CurrentLanguage"];
            if (cookie != null && cookie.Value != null)
            {
                var lang = cookie.Value;
                return AvailableLanguages.Where(p => p.LangCultureName == lang).FirstOrDefault();
            }
            else
            {
                return AvailableLanguages.FirstOrDefault();
            }
        }

        /// <summary>
        /// Gets the default language.
        /// </summary>
        /// <returns>Get Default Language</returns>
        public static string GetDefaultLanguage()
        {
            return AvailableLanguages[0].LangCultureName;
        }

        /// <summary>
        /// Determines whether [is language available] [the specified language].
        /// </summary>
        /// <param name="lang">The language.</param>
        /// <returns>
        ///   <c>true</c> if [is language available] [the specified language]; otherwise, <c>false</c>.
        /// </returns>
        public static bool IsLanguageAvailable(string lang)
        {
            return AvailableLanguages.Where(a => a.LangCultureName.Equals(lang)).FirstOrDefault() != null ? true : false;
        }

        /// <summary>
        /// Sets the language.
        /// </summary>
        /// <param name="lang">The language.</param>
        public void SetLanguage(string lang)
        {
            try
            {
                if (!IsLanguageAvailable(lang))
                {
                    lang = GetDefaultLanguage();
                }

                CultureInfo culture = CultureInfo.CreateSpecificCulture(lang);
                System.Threading.Thread.CurrentThread.CurrentUICulture = culture;
                System.Threading.Thread.CurrentThread.CurrentCulture = culture;

                HttpCookie currentUserCookie = HttpContext.Current.Request.Cookies["CurrentLanguage"];
                if (currentUserCookie != null && currentUserCookie.Value != null)
                {
                    HttpContext.Current.Response.Cookies.Remove("CurrentLanguage");
                    currentUserCookie.Expires = DateTime.Now.AddMonths(-6);
                    currentUserCookie.Value = null;
                    HttpContext.Current.Response.SetCookie(currentUserCookie);
                }

                HttpCookie cookie_new = new HttpCookie("CurrentLanguage");
                cookie_new.Value = lang;
                cookie_new.Expires = DateTime.Now.AddMonths(6);
                HttpContext.Current.Response.Cookies.Add(cookie_new);
            }
            catch (Exception)
            {
            }
        }
    }
}