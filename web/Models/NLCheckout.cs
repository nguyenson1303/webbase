namespace Web.Models
{
    using System;
    using System.Collections;
    using System.Web;

    /// <summary>
    /// Ngan Luong Checkout
    /// </summary>
    public class NL_Checkout
    {
        /// <summary>
        /// The merchant site code
        /// </summary>
        private string merchantSiteCode = PaymentConts.NLMerchantSiteCode;

        /// <summary>
        /// The checkout URL
        /// </summary>
        private string nganluongUrl = "https://www.nganluong.vn/checkout.php";

        /// <summary>
        /// The secure pass
        /// </summary>
        private string securePass = PaymentConts.NLSecurePass; ////merchant site password

        /// <summary>
        /// Initializes a new instance of the <see cref="NL_Checkout"/> class.
        /// </summary>
        public NL_Checkout()
        {
            ////
            //// TODO: Add constructor logic here
            ////
        }

        /// <summary>
        /// Builds the checkout URL.
        /// </summary>
        /// <param name="return_url">The return URL.</param>
        /// <param name="receiver">The receiver.</param>
        /// <param name="transaction_info">The transaction information.</param>
        /// <param name="order_code">The order code.</param>
        /// <param name="price">The price.</param>
        /// <returns>Build Checkout Url</returns>
        public string BuildCheckoutUrl(string return_url, string receiver, string transaction_info, string order_code, string price)
        {
            //// Tạo biến secure code
            string secure_code = string.Empty;

            secure_code += this.merchantSiteCode;

            secure_code += " " + HttpUtility.UrlEncode(return_url).ToLower();

            secure_code += " " + receiver;

            secure_code += " " + transaction_info;

            secure_code += " " + order_code;

            secure_code += " " + price;

            secure_code += " " + this.securePass;

            Hashtable ht = new Hashtable();

            ht.Add("merchant_site_code", this.merchantSiteCode);

            ht.Add("return_url", HttpUtility.UrlEncode(return_url).ToLower());

            ht.Add("receiver", receiver);

            ht.Add("transaction_info", transaction_info);

            ht.Add("order_code", order_code);

            ht.Add("price", price);

            ht.Add("secure_code", this.GetMD5Hash(secure_code));

            //// Tạo url redirect
            string redirect_url = this.nganluongUrl;

            if (redirect_url.IndexOf("?") == -1)
            {
                redirect_url += "?";
            }
            else if (redirect_url.Substring(redirect_url.Length - 1, 1) != "?" && redirect_url.IndexOf("&") == -1)
            {
                redirect_url += "&";
            }

            string url = string.Empty;

            //// Duyêt các ph?n tử trong m?ng bam ht1 d? t?o redirect url
            IDictionaryEnumerator en = ht.GetEnumerator();

            while (en.MoveNext())
            {
                if (url == string.Empty)
                {
                    url += en.Key.ToString() + "=" + en.Value.ToString();
                }                    
                else
                {
                    url += "&" + en.Key.ToString() + "=" + en.Value.ToString();
                }                    
            }

            string rdu = redirect_url + url;

            return rdu;
        }

        /// <summary>
        /// Gets the m d5 hash.
        /// </summary>
        /// <param name="input">The input.</param>
        /// <returns>Get MD5 Hash</returns>
        public string GetMD5Hash(string input)
        {
            System.Security.Cryptography.MD5CryptoServiceProvider x = new System.Security.Cryptography.MD5CryptoServiceProvider();

            byte[] bs = System.Text.Encoding.UTF8.GetBytes(input);

            bs = x.ComputeHash(bs);

            System.Text.StringBuilder s = new System.Text.StringBuilder();

            foreach (byte b in bs)
            {
                s.Append(b.ToString("x2").ToLower());
            }

            string md5String = s.ToString();

            return md5String;
        }

        /// <summary>
        /// Verifies the payment URL.
        /// </summary>
        /// <param name="transaction_info">The transaction information.</param>
        /// <param name="order_code">The order code.</param>
        /// <param name="price">The price.</param>
        /// <param name="payment_id">The payment identifier.</param>
        /// <param name="payment_type">Type of the payment.</param>
        /// <param name="error_text">The error text.</param>
        /// <param name="secure_code">The secure code.</param>
        /// <returns>url is valid</returns>
        public bool VerifyPaymentUrl(string transaction_info, string order_code, string price, string payment_id, string payment_type, string error_text, string secure_code)
        {
            //// create verify payment
            string str = string.Empty;

            str += " " + transaction_info;

            str += " " + order_code;

            str += " " + price;

            str += " " + payment_id;

            str += " " + payment_type;

            str += " " + error_text;

            str += " " + this.merchantSiteCode;

            str += " " + this.securePass;

            //// md5
            string verify_secure_code = string.Empty;

            verify_secure_code = this.GetMD5Hash(str);

            if (verify_secure_code == secure_code)
            {
                return true;
            }
            else
            {
                return false;
            }            
        }
    }
}