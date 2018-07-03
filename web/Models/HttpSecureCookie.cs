namespace Web.Models
{
    using System.Text;
    using System.Web;
    using System.Web.Security;

    /// <summary>
    /// Http Secure Cookie
    /// </summary>
    public class HttpSecureCookie
    {
        /// <summary>
        /// Clones the cookie.
        /// </summary>
        /// <param name="cookie">The cookie.</param>
        /// <returns>Clone Cookie</returns>
        public static HttpCookie CloneCookie(HttpCookie cookie)
        {
            HttpCookie clonedCookie = new HttpCookie(cookie.Name, cookie.Value);
            clonedCookie.Domain = cookie.Domain;
            clonedCookie.Expires = cookie.Expires;
            clonedCookie.HttpOnly = cookie.HttpOnly;
            clonedCookie.Path = cookie.Path;
            clonedCookie.Secure = cookie.Secure;

            return clonedCookie;
        }

        /// <summary>
        /// Decode the specified cookie.
        /// </summary>
        /// <param name="cookie">The cookie.</param>
        /// <returns>the Decode</returns>
        public static HttpCookie Decode(HttpCookie cookie)
        {
            return Decode(cookie, CookieProtection.All);
        }

        /// <summary>
        /// Decode the specified cookie.
        /// </summary>
        /// <param name="cookie">The cookie.</param>
        /// <param name="cookieProtection">The cookie protection.</param>
        /// <returns>the Decode</returns>
        public static HttpCookie Decode(HttpCookie cookie, CookieProtection cookieProtection)
        {
            HttpCookie decodedCookie = CloneCookie(cookie);
            decodedCookie.Value = Unprotect(cookie.Value, cookieProtection.ToString());
            return decodedCookie;
        }

        /// <summary>
        /// Encodes the specified cookie.
        /// </summary>
        /// <param name="cookie">The cookie.</param>
        /// <returns>the Encode</returns>
        public static HttpCookie Encode(HttpCookie cookie)
        {
            return Encode(cookie, CookieProtection.All);
        }

        /// <summary>
        /// Encode the specified cookie.
        /// </summary>
        /// <param name="cookie">The cookie.</param>
        /// <param name="cookieProtection">The cookie protection.</param>
        /// <returns>the Encode</returns>
        public static HttpCookie Encode(HttpCookie cookie, CookieProtection cookieProtection)
        {
            HttpCookie encodedCookie = CloneCookie(cookie);
            encodedCookie.Value = Protect(cookie.Value, cookieProtection.ToString());
            return encodedCookie;
        }

        /// <summary>
        /// Protect the specified text.
        /// </summary>
        /// <param name="text">The text.</param>
        /// <param name="purpose">The purpose.</param>
        /// <returns>the Protect</returns>
        private static string Protect(string text, string purpose)
        {
            if (string.IsNullOrEmpty(text))
            {
                return null;
            }

            byte[] stream = Encoding.UTF8.GetBytes(text);
            byte[] encodedValue = MachineKey.Protect(stream, purpose);

            return HttpServerUtility.UrlTokenEncode(encodedValue);
        }

        /// <summary>
        /// Unprotects the specified text.
        /// </summary>
        /// <param name="text">The text.</param>
        /// <param name="purpose">The purpose.</param>
        /// <returns>the Unprotect</returns>
        private static string Unprotect(string text, string purpose)
        {
            if (string.IsNullOrEmpty(text))
            {
                return null;
            }

            byte[] stream = HttpServerUtility.UrlTokenDecode(text);
            byte[] decodedValue = MachineKey.Unprotect(stream, purpose);

            return Encoding.UTF8.GetString(decodedValue);
        }
    }
}