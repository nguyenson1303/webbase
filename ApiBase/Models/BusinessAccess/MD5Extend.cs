namespace ApiBase.Models.BusinessAccess
{
    using System;
    using System.Security.Cryptography;
    using System.Text;

    /// <summary>
    /// MD5 Extend
    /// </summary>
    public class MD5Extend
    {
        /// <summary>
        /// Initializes a new instance of the <see cref="MD5Extend"/> class.
        /// </summary>
        public MD5Extend()
        {
        }

        /// <summary>
        /// Encodes the password.
        /// </summary>
        /// <param name="originalPassword">The original password.</param>
        /// <returns>Encode Password</returns>
        public static string EncodePassword(string originalPassword)
        {
            ////Declarations
            byte[] originalBytes;
            byte[] encodedBytes;
            MD5CryptoServiceProvider md5;
            ////Instantiate MD5CryptoServiceProvider, get bytes for original password and compute hash (encoded password)
            md5 = new MD5CryptoServiceProvider();
            originalBytes = ASCIIEncoding.Default.GetBytes(originalPassword);
            encodedBytes = md5.ComputeHash(originalBytes);
            string rt;
            ////Convert encoded bytes back to a 'readable' string
            rt = BitConverter.ToString(encodedBytes);
            rt = rt.Replace("-", string.Empty);

            return rt;
        }
    }
}