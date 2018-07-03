namespace Web
{
    using System;
    using System.Web.Services;
    using Web.Data;
    using Web.Models;

    /// <summary>
    /// To allow this Web Service to be called from script, using ASP.NET AJAX, uncomment the following line.
    /// </summary>
    /// <seealso cref="System.Web.Services.WebService" />
    [WebService(Namespace = "https://www.nganluong.vn/")]
    [WebServiceBinding(ConformsTo = WsiProfiles.BasicProfile1_1)]
    [System.ComponentModel.ToolboxItem(false)]
    public class Nganluong : System.Web.Services.WebService
    {
        /// <summary>
        /// The secure pass
        /// </summary>
        private string securepass = PaymentConts.NLSecurePass; ////Mật khẩu giao tiếp api

        /// <summary>
        /// Initializes a new instance of the <see cref="Nganluong"/> class.
        /// </summary>
        public Nganluong()
        {
            ////Uncomment the following line if using designed components
            ////InitializeComponent();
        }

        /// <summary>
        /// Gets the m d5 hash.
        /// </summary>
        /// <param name="input">The input.</param>
        /// <returns>string md5</returns>
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
        /// Updates the order.
        /// </summary>
        /// <param name="transaction_info">The transaction information.</param>
        /// <param name="order_code">The order code.</param>
        /// <param name="payment_id">The payment identifier.</param>
        /// <param name="payment_type">Type of the payment.</param>
        /// <param name="secure_code">The secure code.</param>
        /// <returns>status Order</returns>
        [WebMethod]
        public bool UpdateOrder(string transaction_info, string order_code, string payment_id, string payment_type, string secure_code)
        {
            OrderModels orderModels = new OrderModels();
            ////Get Invoice by Order_code
            C_Invoices invoice = orderModels.GetInvoicesbyOrderCode(order_code);
            ////Create Payment
            C_Payment payment = new C_Payment();

            string secure_code_ws = this.GetMD5Hash(transaction_info + " " + order_code + " " + payment_id + " " + payment_type + " " + this.securepass);
            if (secure_code == secure_code_ws)
            {
                payment.Amount = 0;
                payment.CreateDate = DateTime.Now;
                payment.InvoiceID = invoice.id;
                payment.Payment_type = int.Parse(payment_type);  //// 1 - Thanh toán bằng số dư TK NgânLượng.vn; 2 – Thanh toán bằng tiền mặt hoặc qua NH
                payment.TranscactionStatus = string.Empty; ////1 – Giao dịch mới tạo, chưa thanh toán;
                ////2 – Đã thanh toán, đang bị tạm giữ;
                ////3 – Giao dịch bị huỷ/hoàn trả;
                ////4 – Giao dịch hoàn thành, tiền đã chuyển vào tài khoản NganLuong.vn của người nhận (trường hợp thanh toán ngay hoặc thanh toán tạm giữ nhưng người mua đã phê chuẩn)
                payment.TransactionInfor = CommonGlobal.PaygateNganLuong + " - call services auto update - please check page NganluongResult - payment status undifined";
                payment.PaymentMenthod = string.Empty; ////1 – Thanh toán ngay, 2 – Thanh toán tạm giữ
                payment.Customer_name = string.Empty;
                payment.Customer_email = string.Empty;
                payment.Customer_phone = string.Empty;

                orderModels.Add_Payment(payment);

                var orders = orderModels.GetOrdersbyCode(order_code);
                orders.Payment = CommonGlobal.PaymentFull.ToString();
                orders.LName = CommonGlobal.PaygateNganLuong;
                orderModels.Edit_Orders(orders);
                return true;
            }
            else
            {
                ////Payment fail no create invoice and payment
                var orders = orderModels.GetOrdersbyCode(order_code);
                orders.Payment = CommonGlobal.PaymentFail.ToString();
                orders.LName = CommonGlobal.PaygateNganLuong;
                orderModels.Edit_Orders(orders);
                return false;
            }
        }
    }
}