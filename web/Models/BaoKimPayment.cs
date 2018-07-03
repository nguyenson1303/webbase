namespace Web.Models
{
    using System;
    using System.Collections;
    using System.Collections.Specialized;
    using System.Web;

    /////**
    //// *
    //// *Phiên bản: 0.1
    //// *Tên lớp: BaoKimPayment
    //// *Chức năng: Tích hợp thanh toán qua baokim.vn cho các merchant site có đăng ký API
    //// *- Xây dựng URL chuyển thông tin tới baokim.vn để xử lý việc thanh toán cho merchant site.
    //// *- Xác thực tính chính xác của thông tin đơn hàng được gửi về từ baokim.vn.
    //// */

    /// <summary>
    /// the Bao Kim Payment
    /// </summary>
    public class BaoKimPayment
    {
        ////URL checkout của BaoKim.vn

        /// <summary>
        /// The bao kim URL
        /// </summary>
        private string baokimUrl = PaymentConts.BKUrl; //// "https://www.baokim.vn/payment/customize_payment/order";

        ////Mã merchant site

        /// <summary>
        /// The merchant identifier
        /// </summary>
        private string merchantId = PaymentConts.BKMerchantSiteCode; ////Thay bằng mã merchant site bạn đã đăng ký trên BaoKim.vn

        ////Mật khẩu bảo mật

        /// <summary>
        /// The secure pass
        /// </summary>
        private string securePass = PaymentConts.BKSecurePass; ////Thay bằng mật khẩu giao tiếp giữa website của bạn với BaoKim.vn

        /////**
        //// * Hàm xây dựng url chuyển đến BaoKim.vn thực hiện thanh toán, trong đó có tham số mã hóa (còn gọi là public key)
        //// * @param $order_id:Mã đơn hàng
        //// * @param $business:Email tài khoản người bán
        //// * @param $total_amount:Giá trị đơn hàng
        //// * @param $shipping_fee:Phí vận chuyển
        //// * @param $tax_fee:Thuế
        //// * @param $order_description:Mô tả đơn hàng
        //// * @param $url_success:Url trả về khi thanh toán thành công
        //// * @param $url_cancel:Url trả về khi hủy thanh toán
        //// * @param $url_detail:Url chi tiết đơn hàng
        //// * @return url cần tạo
        //// */

        /// <summary>
        /// Creates the request URL.
        /// </summary>
        /// <param name="order_id">The order identifier.</param>
        /// <param name="business">The business.</param>
        /// <param name="total_amount">The total amount.</param>
        /// <param name="shipping_fee">The shipping fee.</param>
        /// <param name="tax_fee">The tax fee.</param>
        /// <param name="order_description">The order description.</param>
        /// <param name="url_success">The URL success.</param>
        /// <param name="url_cancel">The URL cancel.</param>
        /// <param name="url_detail">The URL detail.</param>
        /// <returns>create RequestUrl</returns>
        public string CreateRequestUrl(string order_id, string business, string total_amount, string shipping_fee, string tax_fee, string order_description, string url_success, string url_cancel, string url_detail)
        {
            Hashtable order_params = new Hashtable();
            order_params.Add("merchant_id", this.merchantId);
            order_params.Add("order_id", order_id);
            order_params.Add("business", business);
            order_params.Add("total_amount", total_amount);
            order_params.Add("shipping_fee", shipping_fee);
            order_params.Add("tax_fee", tax_fee);
            order_params.Add("order_description", order_description);
            order_params.Add("url_success", url_success);
            order_params.Add("url_cancel", url_cancel);
            order_params.Add("url_detail", url_detail);

            ////Sắp xếp các tham số theo key để tiến hành mã hóa
            ICollection keyCollection = order_params.Keys;
            string[] keys = new string[keyCollection.Count];
            keyCollection.CopyTo(keys, 0);
            Array.Sort(keys);

            ////Mã hóa tạo checksum
            string str_combined = this.securePass;
            foreach (string key in keys)
            {
                object value = order_params[key];
                str_combined += value.ToString();
            }

            string checksum = this.GetMD5Hash(str_combined).ToUpper();

            ////Tạo url redirect
            string redirect_url = this.baokimUrl;

            if (redirect_url.IndexOf("?") == -1)
            {
                redirect_url += "?";
            }
            else if (redirect_url.Substring(redirect_url.Length - 1, 1) != "?" && redirect_url.IndexOf("&") == -1)
            {
                redirect_url += "&";
            }

            string url_params = string.Empty;
            foreach (string key in keys)
            {
                object value = order_params[key];
                if (url_params == string.Empty)
                {
                    url_params += key.ToString() + "=" + HttpContext.Current.Server.UrlEncode(value.ToString());
                }
                else
                {
                    url_params += "&" + key.ToString() + "=" + HttpContext.Current.Server.UrlEncode(value.ToString());
                }
            }

            url_params += "&checksum=" + checksum;

            return redirect_url + url_params;
        }

        /**
         * Hàm thực hiện xác minh tính chính xác thông tin trả về từ BaoKim.vn
         * @param $_GET chứa tham số trả về trên url
         * @return true nếu thông tin là chính xác, false nếu thông tin không chính xác
         */

        /// <summary>
        /// Verifies the response URL.
        /// </summary>
        /// <param name="get_params">The get parameters.</param>
        /// <returns>verify ResponseUrl</returns>
        public bool VerifyResponseUrl(NameValueCollection get_params)
        {
            ////Sắp xếp các phần tử trong mảng tham số trả về theo key để mã hóa
            ICollection keyCollection = get_params.Keys;
            string[] keys = new string[keyCollection.Count];
            keyCollection.CopyTo(keys, 0);
            Array.Sort(keys);

            string str_combined = this.securePass;
            string checksum = string.Empty;
            foreach (string key in keys)
            {
                if (string.Compare(key, "checksum", true) != 0)
                {
                    object value = get_params[key];
                    str_combined += value.ToString();
                }
                else
                {
                    checksum = get_params[key].ToString();
                }
            }

            ////Mã hóa tạo check sum, so sánh với checksum gửi về từ BaoKim.vn
            string verify_checksum = this.GetMD5Hash(str_combined);

            if (string.Compare(verify_checksum, checksum, true) == 0)
            {
                return true;
            }

            return false;
        }

        /**
         * Hàm thực hiện việc mã hóa, tạo khóa trên đường dẫn
         * @param messages xâu gốc
         * @return kết quả mã hóa
         * @throws Exception
         */

        /// <summary>
        /// Gets the m d5 hash.
        /// </summary>
        /// <param name="input">The input.</param>
        /// <returns>Get MD5 Hash</returns>
        private string GetMD5Hash(string input)
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
    }
}