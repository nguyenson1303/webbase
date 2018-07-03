namespace Web.Controllers
{
    using System;
    using System.Collections;
    using System.IO;
    using System.Net;
    using System.Text;
    using System.Web;
    using System.Web.Mvc;
    using System.Web.Script.Serialization;
    using System.Xml;

    using NLog;
    using Web.Data;
    using Web.Models;
    using Web.ViewModels;

    /// <summary>
    /// cart Controller
    /// </summary>
    public class CartController : BaseController
    {
        /// <summary>
        /// The logger
        /// </summary>
        private static Logger logger = LogManager.GetCurrentClassLogger();

        /// <summary>
        /// Adds to cart.
        /// </summary>
        /// <param name="id">The identifier.</param>
        /// <param name="no">The no.</param>
        /// <param name="listProperties">The list properties.</param>
        /// <returns>Add to cart</returns>
        public ActionResult Add_to_cart(string id, string no, string listProperties)
        {
            CommonGlobal globals = new CommonGlobal();
            OrderList shoppingCart = default(OrderList);
            ProductModels proModels = new ProductModels();
            if (HttpContext.Session["shoppingcart"] != null)
            {
                shoppingCart = (OrderList)HttpContext.Session["shoppingcart"];
            }
            else
            {
                shoppingCart = new OrderList();
            }

            if (!string.IsNullOrEmpty(id))
            {
                if (string.IsNullOrEmpty(no))
                {
                    no = "1";
                }

                int pro_id = Convert.ToInt32(id);
                C_Product product = proModels.GetProductById(pro_id);
                if (product.ProductID != 0)
                {
                    try
                    {
                        OrderItem it = new OrderItem();
                        it.ProductID = pro_id;
                        it.Quatity = Convert.ToInt32(no);
                        it.Price = (double)product.PriceNew;
                        it.Name = product.ProductName;
                        it.ImagePath = CommonGlobal.GetImage(product.ImagePath);
                        it.ProductName = product.ProductName;
                        it.ProductLink = product.Link;
                        it.Summary = product.Summary;
                        it.Property = listProperties;
                        it.Property_detail = string.Empty;
                        shoppingCart.Add(it);
                        HttpContext.Session["shoppingcart"] = shoppingCart;
                    }
                    catch (Exception)
                    {
                    }
                }
            }

            foreach (OrderItem it in shoppingCart.Values)
            {
                if (it.Property.Length > 1)
                {
                    it.Property_detail = this.SetProperty(it.ProductID, it.Property);
                }
            }

            var jsonSerialiser = new JavaScriptSerializer();
            var json = jsonSerialiser.Serialize(shoppingCart.Values);
            var results = shoppingCart.SubTotal_Format_money + "|" + shoppingCart.Tax_Format_money + "|" + shoppingCart.ShippFee_Format_money + "|" + shoppingCart.Total_string + "|" + shoppingCart.Total_Format_money + "|" + shoppingCart.Count + "|" + json;

            return this.Json(results);
        }

        /// <summary>
        /// the Bao kim BPN.
        /// </summary>
        /// <returns>the Bao Kim BPN</returns>
        public ActionResult BaoKimBPN()
        {
            OrderModels orderModels = new OrderModels();
            WebInfoModels web_infor = new Models.WebInfoModels();
            DetailOrderModels detailsv = new DetailOrderModels();

            /////Bao Kim check BPN return
            try
            {
                ////Dia chi chay that
                string strLive = "https://www.baokim.vn/bpn/verify";
                HttpWebRequest req = (HttpWebRequest)WebRequest.Create(strLive);

                ////Set values for the request back
                req.Method = "POST";
                req.ContentType = "application/x-www-form-urlencoded";
                byte[] param = Request.BinaryRead(HttpContext.Request.ContentLength);
                string strRequest = Encoding.ASCII.GetString(param);
                ////log.Info("strRequest: " + strRequest);
                req.ContentLength = strRequest.Length;

                StreamWriter streamOut = new StreamWriter(req.GetRequestStream(), System.Text.Encoding.ASCII);
                streamOut.Write(strRequest);
                streamOut.Close();
                StreamReader streamIn = new StreamReader(req.GetResponse().GetResponseStream());
                string strResponse = streamIn.ReadLine();
                streamIn.Close();

                string orderID = Request["order_id"]; ////mã đơn hàng đã thanh toán
                string transactionID = Request["transaction_id"];
                string transaction_status = Request["transaction_status"]; ////trạng thái thanh toán
                string created_on = string.Empty;
                string payment_type = string.Empty;
                string total_amount = string.Empty;
                string net_amount = string.Empty;
                string fee_amount = string.Empty;
                string merchant_id = string.Empty;
                string customer_name = string.Empty;
                string customer_email = string.Empty;
                string customer_phone = string.Empty;
                string checksum = string.Empty;

                created_on = Request.QueryString["created_on"];
                payment_type = Request.QueryString["payment_type"];
                transaction_status = Request.QueryString["transaction_status"];
                total_amount = Request.QueryString["total_amount"];
                net_amount = Request.QueryString["net_amount"];
                fee_amount = Request.QueryString["fee_amount"];
                merchant_id = Request.QueryString["merchant_id"];
                customer_name = Request.QueryString["customer_name"];
                customer_email = Request.QueryString["customer_email"];
                customer_phone = Request.QueryString["customer_phone"];
                checksum = Request.QueryString["checksum"];

                var orders = orderModels.GetOrdersbyCode(orderID);
                logger.Info("Bao Kim check BPN return.Date:" + DateTime.Now + ";order:" + orderID); //// log
                ////log.Info("strResponse: " + strResponse);
                if (strResponse == "VERIFIED")
                {
                    ////string status = "Đã Thanh Toán";
                    if (transaction_status == "4")
                    {
                        ////cập nhật trạng thái đơn hàng
                        orders.Payment = CommonGlobal.PaymentFull.ToString();
                        orders.LName = CommonGlobal.PaygateBaokim;
                        orderModels.Edit_Orders(orders);

                        ////Get Invoice by Order_code
                        C_Invoices invoice = orderModels.GetInvoicesbyOrderCode(orderID);

                        ////Create Payment
                        C_Payment payment = new C_Payment();
                        payment.InvoiceID = invoice.id;
                        payment.PaymentMenthod = transactionID;
                        payment.CreateDate = Util.UnixTimeStampToDateTime(long.Parse(created_on));
                        payment.Payment_type = int.Parse(payment_type);
                        payment.TranscactionStatus = transaction_status;
                        payment.Amount = float.Parse(total_amount);
                        payment.Net_amount = float.Parse(net_amount);
                        payment.Fee_amount = float.Parse(fee_amount);
                        payment.Merchant_id = int.Parse(merchant_id);
                        payment.Customer_name = customer_name;
                        payment.Customer_email = customer_email;
                        payment.Customer_phone = customer_phone;
                        orderModels.Add_Payment(payment);

                        logger.Info("Đơn hàng đã được thanh toán thành công qua Bảo Kim (VERIFIED).Date:" + DateTime.Now + ";transaction_status:" + transaction_status); ////log
                    }
                }
                else if (strResponse == "INVALID")
                {
                    ////thong tin khong hop le. Log lai de theo doi
                    orders.Payment = CommonGlobal.PaymentFail.ToString();
                    orders.LName = CommonGlobal.PaygateBaokim;
                    orderModels.Edit_Orders(orders);

                    logger.Info("Đơn hàng thanh toán thất bại (Không hợp lê) qua Bảo Kim (VERIFIED).Date:" + DateTime.Now + ";transaction_status:" + transaction_status); ////log
                }                
            }
            catch (Exception)
            {
                ////log.Error(ex);
            }

            return this.PartialView("../page/BaoKimBPN");
        }

        /// <summary>
        /// the Bao kim result fail.
        /// </summary>
        /// <returns>the Bao Kim Result Fail</returns>
        public ActionResult BaoKimResultFail()
        {
            OrderModels orderModels = new OrderModels();
            WebInfoModels web_infor = new Models.WebInfoModels();
            DetailOrderModels detailsv = new DetailOrderModels();
            var order_view = new Order_register_view();

            string strbreadcrumbs = string.Empty;
            ViewBag.Title = App_GlobalResources.Lang.strPayment + " | " + GeneralModels.GetContent(CommonGlobal.PageName, this.Lang);

            strbreadcrumbs += string.Format("<li>" + App_GlobalResources.Lang.strPayment + "</li>");
            ViewBag.str_breadcrumbs = strbreadcrumbs;

            ViewBag.heading = App_GlobalResources.Lang.strPayment;

            this.AddMeta(CommonGlobal.Keyword, App_GlobalResources.Lang.strPayment);
            this.AddMeta(CommonGlobal.Description, App_GlobalResources.Lang.strPayment);

            var check = false;
            /**
                 * order_id             :Mã hóa đơn thanh toán submit lên baokim.vn
                 * transaction_id       :Mã giao dịch thanh toán trên baokim.vn
                 * created_on           :Thời điểm tạo giao dịch trên hệ thống baokim.vn
                 * payment_type         :Hình thức thanh toán:
                                        1: thanh toán ngay
                                        2: thanh toán an toàn
                 *
                 * transaction_status   :Trạng thái giao dịch
                 *                          1: giao dịch chưa xác minh OTP
                                            2: giao dịch đã xác minh OTP
                                            4: giao dịch hoàn thành
                                            5: giao dịch bị hủy
                                            6: giao dịch bị từ chối nhận tiền
                                            7: giao dịch hết hạn
                                            8: giao dịch thất bại
                                            12: giao dịch bị đóng băng
                                            13: giao dịch bị tạm giữ (thanh toán an toàn)
                                            X: các trạng thái giao dịch khác
                 * total_amount           :Tổng số tiền người mua thanh toán (có thể bao gồm thêm phí khi thanh toán qua internet banking, phí chuyển tiền...)
                 * net_amount             :Số tiền người bán thực nhận
                 * fee_amount             :Phí dịch vụ baokim thu
                 * merchant_id            :Mã website tích hợp
                 * customer_name          :Tên người thanh toán
                 * customer_email         :Email người thanh toán
                 * customer_phone         :Số điện thoại người thanh toán
                 * customer_address       :Địa chỉ người thanh toán
                 * checksum               :Mã checksum để xác minh thông tin trả về là chính xác

                 */
            string order_id = string.Empty;
            string transaction_id = string.Empty;
            string created_on = string.Empty;
            string payment_type = string.Empty;
            string transaction_status = string.Empty;
            string total_amount = string.Empty;
            string net_amount = string.Empty;
            string fee_amount = string.Empty;
            string merchant_id = string.Empty;
            string customer_name = string.Empty;
            string customer_email = string.Empty;
            string customer_phone = string.Empty;
            string checksum = string.Empty;

            order_id = Request.QueryString["order_id"];
            transaction_id = Request.QueryString["transaction_id"];
            created_on = Request.QueryString["created_on"];
            payment_type = Request.QueryString["payment_type"];
            transaction_status = Request.QueryString["transaction_status"];
            total_amount = Request.QueryString["total_amount"];
            net_amount = Request.QueryString["net_amount"];
            fee_amount = Request.QueryString["fee_amount"];
            merchant_id = Request.QueryString["merchant_id"];
            customer_name = Request.QueryString["customer_name"];
            customer_email = Request.QueryString["customer_email"];
            customer_phone = Request.QueryString["customer_phone"];
            checksum = Request.QueryString["checksum"];

            BaoKimPayment baokim = new BaoKimPayment();
            check = baokim.VerifyResponseUrl(Request.QueryString);

            logger.Info("Bảo Kim payment return .Date:" + DateTime.Now + ";verifyPaymentUrl:" + check + ";order:" + order_id); ////log

            var orders = orderModels.GetOrdersbyCode(order_id);
            order_view.Email = orders.Email;
            order_view.Name = orders.Name;
            order_view.Phone = orders.Phone;
            order_view.Address = orders.Address;
            order_view.Gender = orders.Gender;
            order_view.Sub_total = CommonGlobal.FormatMoney(orders.Total);
            order_view.Content = orders.Note;
            order_view.Order_code = order_id;

            var list_order_detail = detailsv.GetAllOrderDetail(order_id);
            if (list_order_detail.Count > 0)
            {
                order_view.ShoppingCart = new ArrayList(list_order_detail.ToArray());
            }

            //// send email to client and send email to admin sales
            var strBody_email_client = GeneralModels.GetContent(CommonGlobal.EmailOrderPaymentChangeStatus, Lang).ToString(); ////get from email template
            strBody_email_client = strBody_email_client.Replace("{domain}", Util.GetConfigValue("Domain", Request.UserHostName).ToString());
            strBody_email_client = strBody_email_client.Replace("{email}", web_infor.GetContent(CommonGlobal.Email).ToString());
            strBody_email_client = strBody_email_client.Replace("{store_name}", GeneralModels.GetContent(CommonGlobal.PageName, Lang).ToString());
            strBody_email_client = strBody_email_client.Replace("{order_date}", orders.CreateDate.ToString());
            strBody_email_client = strBody_email_client.Replace("{order_status}", CommonGlobal.OrderStart.ToString());
            strBody_email_client = strBody_email_client.Replace("{order_id}", order_id);
            strBody_email_client = strBody_email_client.Replace("{order_name}", orders.Name.ToString());
            strBody_email_client = strBody_email_client.Replace("{order_address}", orders.Address.ToString());
            strBody_email_client = strBody_email_client.Replace("{order_content}", orders.Note != null ? orders.Note.ToString() : string.Empty);
            strBody_email_client = strBody_email_client.Replace("{order_phone}", orders.Phone.ToString());
            strBody_email_client = strBody_email_client.Replace("{order_email}", orders.Email.ToString());

            var strOrderDetail = string.Empty;
            StringBuilder sb = new StringBuilder();
            foreach (var it in list_order_detail)
            {
                sb.Append("<tr>");
                sb.Append("    <td width=\"42\" valign=\"top\" style=\"width: 31.5pt; border: solid silver 1.0pt; border-top: none; padding: .05in .05in .05in .05in\">");
                sb.Append("        <p class=\"MsoNormal\" align=\"center\" style=\"text-align: center; line-height: normal\">");
                sb.Append("            <span style=\"font-size: 10.0pt; font-family: Arial\">" + it.Quantity + "</span>");
                sb.Append("        </p>");
                sb.Append("    </td>");
                sb.Append("    <td width=\"412\" valign=\"top\" style=\"width: 309.0pt; border-top: none; border-left: none; border-bottom: solid silver 1.0pt; border-right: solid silver 1.0pt; padding: .05in .05in .05in .05in\">");
                sb.Append("        <p class=\"MsoNormal\" style=\"line-height: normal\">");
                sb.Append("            <span style=\"font-size: 10.0pt; font-family: Arial\">" + it.ProductName + "&nbsp;&nbsp;" + it.Propertices + "</span>");
                sb.Append("        </p>");
                sb.Append("    </td>");
                sb.Append("    <td width=\"84\" valign=\"top\" style=\"width: 63.0pt; border-top: none; border-left: none; border-bottom: solid silver 1.0pt; border-right: solid silver 1.0pt; padding: .05in .05in .05in .05in\">");
                sb.Append("        <p class=\"MsoNormal\" align=\"center\" style=\"text-align: center; line-height: normal\">");
                sb.Append("            <span style=\"font-size: 10.0pt; font-family: Arial\">" + CommonGlobal.FormatMoney(it.Price.ToString()) + "</span>");
                sb.Append("        </p>");
                sb.Append("    </td>");
                sb.Append("    <td width=\"86\" valign=\"top\" style=\"width: 64.5pt; border-top: none; border-left: none; border-bottom: solid silver 1.0pt; border-right: solid silver 1.0pt; padding: .05in .05in .05in .05in\">");
                sb.Append("        <p class=\"MsoNormal\" align=\"right\" style=\"text-align: right; line-height: normal\">");
                sb.Append("            <span style=\"font-size: 10.0pt; font-family: Arial\">" + CommonGlobal.FormatMoney((it.Price * it.Quantity).ToString()) + "</span>");
                sb.Append("        </p>");
                sb.Append("    </td>");
                sb.Append("</tr>");
            }

            strOrderDetail = sb.ToString();
            strBody_email_client = strBody_email_client.Replace("{order_list}", strOrderDetail.ToString());
            strBody_email_client = strBody_email_client.Replace("{order_total}", CommonGlobal.FormatMoney(orders.Total.ToString()));

            ////Get Invoice by Order_code
            C_Invoices invoice = orderModels.GetInvoicesbyOrderCode(order_id);

            ////Create Payment
            C_Payment payment = new C_Payment();
            payment.InvoiceID = invoice.id;
            payment.PaymentMenthod = transaction_id;
            payment.CreateDate = Util.UnixTimeStampToDateTime(long.Parse(created_on));
            payment.Payment_type = int.Parse(payment_type);
            payment.TranscactionStatus = transaction_status;
            payment.Amount = float.Parse(total_amount);
            payment.Net_amount = float.Parse(net_amount);
            payment.Fee_amount = float.Parse(fee_amount);
            payment.Merchant_id = int.Parse(merchant_id);
            payment.Customer_name = customer_name;
            payment.Customer_email = customer_email;
            payment.Customer_phone = customer_phone;
            orderModels.Add_Payment(payment);
            logger.Info("Hệ thống tạo payment của Bảo Kim .Date:" + DateTime.Now + ";order:" + order_id); ////log
            orders.Payment = CommonGlobal.PaymentFail.ToString();
            orders.LName = CommonGlobal.PaygateBaokim;
            orderModels.Edit_Orders(orders);

            order_view.Message = "<p>Đơn hàng của quý khách thanh toán không thành công trên Bảo Kim.</br>Xin vui lòng thử lại hoặc liên hệ nhân viên của chúng tôi để được hướng dẫn.</br> Trân trọng!</p>";
            strBody_email_client = strBody_email_client.Replace("{payment_status}", CommonGlobal.PaymentFailText);
            logger.Info("Đơn hàng đã được thanh toán thất bại qua Bảo Kim .Date:" + DateTime.Now + ";transaction_status:" + transaction_status); ////log
            return this.PartialView("../page/BaoKimResultFail", order_view);
        }

        /// <summary>
        /// Baokim result success.
        /// </summary>
        /// <returns>BaoKim Result Success</returns>
        public ActionResult BaoKimResultSuccess()
        {
            OrderModels orderModels = new OrderModels();
            WebInfoModels web_infor = new Models.WebInfoModels();
            DetailOrderModels detailsv = new DetailOrderModels();
            var order_view = new Order_register_view();

            string strbreadcrumbs = string.Empty;
            ViewBag.Title = App_GlobalResources.Lang.strPayment + " | " + GeneralModels.GetContent(CommonGlobal.PageName, this.Lang);

            strbreadcrumbs += string.Format("<li>" + App_GlobalResources.Lang.strPayment + "</li>");
            ViewBag.str_breadcrumbs = strbreadcrumbs;

            ViewBag.heading = App_GlobalResources.Lang.strPayment;

            this.AddMeta(CommonGlobal.Keyword, App_GlobalResources.Lang.strPayment);
            this.AddMeta(CommonGlobal.Description, App_GlobalResources.Lang.strPayment);

            var check = false;
            /**
                 * order_id             :Mã hóa đơn thanh toán submit lên baokim.vn
                 * transaction_id       :Mã giao dịch thanh toán trên baokim.vn
                 * created_on           :Thời điểm tạo giao dịch trên hệ thống baokim.vn
                 * payment_type         :Hình thức thanh toán:
                                        1: thanh toán ngay
                                        2: thanh toán an toàn
                 *
                 * transaction_status   :Trạng thái giao dịch
                 *                          1: giao dịch chưa xác minh OTP
                                            2: giao dịch đã xác minh OTP
                                            4: giao dịch hoàn thành
                                            5: giao dịch bị hủy
                                            6: giao dịch bị từ chối nhận tiền
                                            7: giao dịch hết hạn
                                            8: giao dịch thất bại
                                            12: giao dịch bị đóng băng
                                            13: giao dịch bị tạm giữ (thanh toán an toàn)
                                            X: các trạng thái giao dịch khác
                 * total_amount           :Tổng số tiền người mua thanh toán (có thể bao gồm thêm phí khi thanh toán qua internet banking, phí chuyển tiền...)
                 * net_amount             :Số tiền người bán thực nhận
                 * fee_amount             :Phí dịch vụ baokim thu
                 * merchant_id            :Mã website tích hợp
                 * customer_name          :Tên người thanh toán
                 * customer_email         :Email người thanh toán
                 * customer_phone         :Số điện thoại người thanh toán
                 * customer_address       :Địa chỉ người thanh toán
                 * checksum               :Mã checksum để xác minh thông tin trả về là chính xác

                 */
            string order_id = string.Empty;
            string transaction_id = string.Empty;
            string created_on = string.Empty;
            string payment_type = string.Empty;
            string transaction_status = string.Empty;
            string total_amount = string.Empty;
            string net_amount = string.Empty;
            string fee_amount = string.Empty;
            string merchant_id = string.Empty;
            string customer_name = string.Empty;
            string customer_email = string.Empty;
            string customer_phone = string.Empty;
            string checksum = string.Empty;

            order_id = Request.QueryString["order_id"];
            transaction_id = Request.QueryString["transaction_id"];
            created_on = Request.QueryString["created_on"];
            payment_type = Request.QueryString["payment_type"];
            transaction_status = Request.QueryString["transaction_status"];
            total_amount = Request.QueryString["total_amount"];
            net_amount = Request.QueryString["net_amount"];
            fee_amount = Request.QueryString["fee_amount"];
            merchant_id = Request.QueryString["merchant_id"];
            customer_name = Request.QueryString["customer_name"];
            customer_email = Request.QueryString["customer_email"];
            customer_phone = Request.QueryString["customer_phone"];
            checksum = Request.QueryString["checksum"];

            BaoKimPayment baokim = new BaoKimPayment();
            check = baokim.VerifyResponseUrl(Request.QueryString);

            logger.Info("Bảo Kim payment return .Date:" + DateTime.Now + ";verifyPaymentUrl:" + check + ";order:" + order_id); ////log

            var orders = orderModels.GetOrdersbyCode(order_id);
            order_view.Email = orders.Email;
            order_view.Name = orders.Name;
            order_view.Phone = orders.Phone;
            order_view.Address = orders.Address;
            order_view.Gender = orders.Gender;
            order_view.Sub_total = CommonGlobal.FormatMoney(orders.Total);
            order_view.Content = orders.Note;
            order_view.Order_code = order_id;

            var list_order_detail = detailsv.GetAllOrderDetail(order_id);
            if (list_order_detail.Count > 0)
            {
                order_view.ShoppingCart = new ArrayList(list_order_detail.ToArray());
            }

            //// send email to client and send email to admin sales
            var strBody_email_client = GeneralModels.GetContent(CommonGlobal.EmailOrderPaymentChangeStatus, Lang).ToString(); ////get from email template
            strBody_email_client = strBody_email_client.Replace("{domain}", Util.GetConfigValue("Domain", Request.UserHostName).ToString());
            strBody_email_client = strBody_email_client.Replace("{email}", web_infor.GetContent(CommonGlobal.Email).ToString());
            strBody_email_client = strBody_email_client.Replace("{store_name}", GeneralModels.GetContent(CommonGlobal.PageName, Lang).ToString());
            strBody_email_client = strBody_email_client.Replace("{order_date}", orders.CreateDate.ToString());
            strBody_email_client = strBody_email_client.Replace("{order_status}", CommonGlobal.OrderStart.ToString());
            strBody_email_client = strBody_email_client.Replace("{order_id}", order_id);
            strBody_email_client = strBody_email_client.Replace("{order_name}", orders.Name.ToString());
            strBody_email_client = strBody_email_client.Replace("{order_address}", orders.Address.ToString());
            strBody_email_client = strBody_email_client.Replace("{order_content}", orders.Note != null ? orders.Note.ToString() : string.Empty);
            strBody_email_client = strBody_email_client.Replace("{order_phone}", orders.Phone.ToString());
            strBody_email_client = strBody_email_client.Replace("{order_email}", orders.Email.ToString());

            var strOrderDetail = string.Empty;
            StringBuilder sb = new StringBuilder();
            foreach (var it in list_order_detail)
            {
                sb.Append("<tr>");
                sb.Append("    <td width=\"42\" valign=\"top\" style=\"width: 31.5pt; border: solid silver 1.0pt; border-top: none; padding: .05in .05in .05in .05in\">");
                sb.Append("        <p class=\"MsoNormal\" align=\"center\" style=\"text-align: center; line-height: normal\">");
                sb.Append("            <span style=\"font-size: 10.0pt; font-family: Arial\">" + it.Quantity + "</span>");
                sb.Append("        </p>");
                sb.Append("    </td>");
                sb.Append("    <td width=\"412\" valign=\"top\" style=\"width: 309.0pt; border-top: none; border-left: none; border-bottom: solid silver 1.0pt; border-right: solid silver 1.0pt; padding: .05in .05in .05in .05in\">");
                sb.Append("        <p class=\"MsoNormal\" style=\"line-height: normal\">");
                sb.Append("            <span style=\"font-size: 10.0pt; font-family: Arial\">" + it.ProductName + "&nbsp;&nbsp;" + it.Propertices + "</span>");
                sb.Append("        </p>");
                sb.Append("    </td>");
                sb.Append("    <td width=\"84\" valign=\"top\" style=\"width: 63.0pt; border-top: none; border-left: none; border-bottom: solid silver 1.0pt; border-right: solid silver 1.0pt; padding: .05in .05in .05in .05in\">");
                sb.Append("        <p class=\"MsoNormal\" align=\"center\" style=\"text-align: center; line-height: normal\">");
                sb.Append("            <span style=\"font-size: 10.0pt; font-family: Arial\">" + CommonGlobal.FormatMoney(it.Price.ToString()) + "</span>");
                sb.Append("        </p>");
                sb.Append("    </td>");
                sb.Append("    <td width=\"86\" valign=\"top\" style=\"width: 64.5pt; border-top: none; border-left: none; border-bottom: solid silver 1.0pt; border-right: solid silver 1.0pt; padding: .05in .05in .05in .05in\">");
                sb.Append("        <p class=\"MsoNormal\" align=\"right\" style=\"text-align: right; line-height: normal\">");
                sb.Append("            <span style=\"font-size: 10.0pt; font-family: Arial\">" + CommonGlobal.FormatMoney((it.Price * it.Quantity).ToString()) + "</span>");
                sb.Append("        </p>");
                sb.Append("    </td>");
                sb.Append("</tr>");
            }

            strOrderDetail = sb.ToString();
            strBody_email_client = strBody_email_client.Replace("{order_list}", strOrderDetail.ToString());
            strBody_email_client = strBody_email_client.Replace("{order_total}", CommonGlobal.FormatMoney(orders.Total.ToString()));
            if (check)
            {
                ////Get Invoice by Order_code
                C_Invoices invoice = orderModels.GetInvoicesbyOrderCode(order_id);

                ////Create Payment
                C_Payment payment = new C_Payment();
                payment.InvoiceID = invoice.id;
                payment.PaymentMenthod = transaction_id;
                payment.CreateDate = Util.UnixTimeStampToDateTime(long.Parse(created_on));
                payment.Payment_type = int.Parse(payment_type);
                payment.TranscactionStatus = transaction_status;
                payment.Amount = float.Parse(total_amount);
                payment.Net_amount = float.Parse(net_amount);
                payment.Fee_amount = float.Parse(fee_amount);
                payment.Merchant_id = int.Parse(merchant_id);
                payment.Customer_name = customer_name;
                payment.Customer_email = customer_email;
                payment.Customer_phone = customer_phone;
                orderModels.Add_Payment(payment);
                logger.Info("Hệ thống tạo payment của Bảo Kim .Date:" + DateTime.Now + ";order:" + order_id); ////log
                if (transaction_status == "4")
                {
                    ////cập nhật trạng thái đơn hàng

                    orders.Payment = CommonGlobal.PaymentFull.ToString();
                    orders.LName = CommonGlobal.PaygateBaokim;
                    orderModels.Edit_Orders(orders);
                    logger.Info("Đơn hàng đã được thanh toán thành công qua Bảo Kim .Date:" + DateTime.Now + ";transaction_status:" + transaction_status); ////log
                    order_view.Message = "<p>Đơn hàng của quý khách đã được thanh toán thành công thông qua cổng thanh toán Bảo kim.</br>Chúng tôi sẽ chuyển hàng trong thời gian sớm nhất.</br> Trân trọng!</p>";
                    strBody_email_client = strBody_email_client.Replace("{payment_status}", CommonGlobal.PaymentFullText);
                }
            }

            strBody_email_client = strBody_email_client.Replace("{payment_gate}", CommonGlobal.PaygateBaokim);
            strBody_email_client = strBody_email_client.Replace("{payment_content}", order_view.Message); ////Message payment content

            try
            {
                CommonGlobal.SendMail(orders.Email, App_GlobalResources.Lang.strSubjectPaymentStatus + " " + Util.GetConfigValue("Domain", Request.UserHostName).ToString() + "(" + order_id + ")", strBody_email_client);

                ////send email to admin about order
                CommonGlobal.SendMail(web_infor.GetContent(CommonGlobal.Email), App_GlobalResources.Lang.strSubjectPaymentFromClient + " " + orders.Name + "(" + order_id + ")", strBody_email_client);
            }
            catch (Exception ex)
            {
                logger.Error("Hệ thống Không thể gửi email .Date:" + DateTime.Now + ";Message:" + ex.Message + ";User:" + Session["mem"].ToString()); //// log
            }

            return this.PartialView("../page/BaoKimResultSuccess", order_view);
        }

        /// <summary>
        /// the Bao kim the check out.
        /// </summary>
        /// <param name="order">The order.</param>
        /// <returns>the Bao Kim CheckOut</returns>
        public ActionResult BKCheckOut(string order)
        {
            OrderModels orderModels = new OrderModels();
            if (string.IsNullOrEmpty(order))
            {
                return this.HttpNotFound();
            }
            else
            {
                order = HttpUtility.HtmlDecode(order);
            }

            if (!this.CheckMemberlogin())
            {
                return this.RedirectToAction("login", "account", new { return_url = Url.Action("payment", "cart", new { order = order }) });
            }
            else
            {
                logger.Info(Session["mem"].ToString() + " sử dụng Bảo Kim payment.Date:" + DateTime.Now + ";order:" + order); //// log
                C_User usr = new C_User();
                UserModels sv = new UserModels();
                usr = sv.GetUserbyUserName(Session["mem"].ToString());

                var orders = orderModels.GetOrdersbyCode(order, usr.Username);
                if (orders == null)
                {
                    return this.RedirectToAction("payment", "cart", new { order = order });
                }
                else
                {
                    ////Create Invoice when call payment
                    C_Invoices invoice = new C_Invoices();
                    invoice.OrderCode = orders.Code;
                    invoice.Status = 1;
                    invoice.InvoiceContent = null;
                    invoice.CreateDate = DateTime.Now;
                    orderModels.Add_Invoices(invoice);

                    var bk = new BaoKimPayment();
                    string order_id = orders.Code; ////mã đơn hàng
                    string business = PaymentConts.BKBusiness; ////email bảo kim nhận tiền
                    string total_amount = orders.Total;
                    string shipping_fee = "0"; ////phí vận chuyển
                    string tax_fee = "0"; ////thuế khác
                    string order_description = string.Empty; ////mo ta đơn hàng
                    string url_success = Util.GetConfigValue("Domain", Request.UserHostName) + "/" + Url.Action("BaoKimResultSuccess", "cart"); ////url trả về khi thanh toán thành công
                    string url_cancel = Util.GetConfigValue("Domain", Request.UserHostName) + "/" + Url.Action("BaoKimResultFail", "cart"); ////url trả về khi thanh toán thất bại
                    string url_detail = string.Empty;
                    string url;
                    url = bk.CreateRequestUrl(order_id, business, total_amount, shipping_fee, tax_fee, order_description, url_success, url_cancel, url_detail);

                    logger.Info(Session["mem"].ToString() + " đã tạo Invoice và gọi payment gate Bảo Kim.Date:" + DateTime.Now + ";order:" + orders.Code); ////log

                    return this.Redirect(url);
                }
            }
        }

        /// <summary>
        /// Carts this instance.
        /// </summary>
        /// <returns>the Cart</returns>
        public ActionResult Cart()
        {
            /////list shopping cart
            string strBread;
            ViewBag.Title = App_GlobalResources.Lang.strCart + " | " + GeneralModels.GetContent(CommonGlobal.PageName, this.Lang);
            strBread = "<li>" + App_GlobalResources.Lang.strCart + "</li>";
            ViewBag.str_breadcrumbs = strBread;
            ViewBag.heading = App_GlobalResources.Lang.strCart + "<i class=\"ion-ios-cart-outline\"></i>";

            this.AddMeta(CommonGlobal.Keyword, App_GlobalResources.Lang.strCart);
            this.AddMeta(CommonGlobal.Description, App_GlobalResources.Lang.strCart);

            return this.PartialView("../page/cart");
        }

        /// <summary>
        /// Carts the full.
        /// </summary>
        /// <returns>Cart full</returns>
        [ChildActionOnly]
        public ActionResult Cart_full()
        {
            CommonGlobal globals = new CommonGlobal();
            var cart_view = new ViewModels.Cart_mini_view();
            OrderList shoppingCart = default(OrderList);
            shoppingCart = (OrderList)Session["shoppingcart"];

            cart_view.FeeShip = shoppingCart != null ? CommonGlobal.FormatMoney(shoppingCart.Fee.ToString()) : "0 đ";
            cart_view.Tax = shoppingCart != null ? CommonGlobal.FormatMoney(shoppingCart.Tax.ToString()) : "0 đ";
            cart_view.Total = shoppingCart != null ? CommonGlobal.FormatMoney(shoppingCart.Total.ToString()) : "0 đ";
            cart_view.TotalString = shoppingCart != null ? globals.ConvertNumberToChar(long.Parse(shoppingCart.Total.ToString())) : "0 đ";
            cart_view.SubTotal = shoppingCart != null ? CommonGlobal.FormatMoney(shoppingCart.SubTotal.ToString()) : "0 đ";
            cart_view.ItemCount = shoppingCart != null ? shoppingCart.Count.ToString() : "0";
            cart_view.ContentShipping = GeneralModels.GetContent(CommonGlobal.ContentShipping, this.Lang);
            if (shoppingCart != null && shoppingCart.Values.Count > 0)
            {
                cart_view.ShoppingCart = new ArrayList(shoppingCart.Values); 
            }

            return this.PartialView("../control/cart_full", cart_view);
        }

        /// <summary>
        /// Carts the mini.
        /// </summary>
        /// <returns>Cart mini</returns>
        [ChildActionOnly]
        public ActionResult Cart_mini()
        {
            var cart_view = new ViewModels.Cart_mini_view();
            OrderList shoppingCart = default(OrderList);
            shoppingCart = (OrderList)Session["shoppingcart"];

            cart_view.Total = shoppingCart != null ? CommonGlobal.FormatMoney(shoppingCart.Total.ToString()) : "0 đ";
            cart_view.SubTotal = shoppingCart != null ? CommonGlobal.FormatMoney(shoppingCart.SubTotal.ToString()) : "0 đ";
            cart_view.ItemCount = shoppingCart != null ? shoppingCart.Count.ToString() : "0";
            if (shoppingCart != null && shoppingCart.Values.Count > 0)
            {
                cart_view.ShoppingCart = new ArrayList(shoppingCart.Values);
            }

            return this.PartialView("../control/cart_mini", cart_view);
        }

        /// <summary>
        /// Ngan luong the result.
        /// </summary>
        /// <returns>Ngan luong Result</returns>
        public ActionResult NganluongResult()
        {
            OrderModels orderModels = new OrderModels();
            WebInfoModels web_infor = new Models.WebInfoModels();
            DetailOrderModels detailsv = new DetailOrderModels();
            var order_view = new Order_register_view();

            string strbreadcrumbs = string.Empty;
            ViewBag.Title = App_GlobalResources.Lang.strPayment + " | " + GeneralModels.GetContent(CommonGlobal.PageName, this.Lang);

            strbreadcrumbs += string.Format(App_GlobalResources.Lang.strPayment);
            ViewBag.str_breadcrumbs = strbreadcrumbs;

            ViewBag.heading = App_GlobalResources.Lang.strPayment;

            this.AddMeta(CommonGlobal.Keyword, App_GlobalResources.Lang.strPayment);
            this.AddMeta(CommonGlobal.Description, App_GlobalResources.Lang.strPayment);

            /////Ngan Luong return
            var check = false;
            string transaction_info = Request.QueryString["transaction_info"];
            string order_code = Request.QueryString["order_code"];
            string payment_id = Request.QueryString["payment_id"];
            string payment_type = Request.QueryString["payment_type"];
            string secure_code = Request.QueryString["secure_code"];
            string price = Request.QueryString["price"];
            string error_text = Request.QueryString["error_text"];
            NL_Checkout nl = new NL_Checkout();
            check = nl.VerifyPaymentUrl(transaction_info, order_code, price, payment_id, payment_type, error_text, secure_code);

            logger.Info("Ngân Lượng payment return .Date:" + DateTime.Now + ";verifyPaymentUrl:" + check + ";order:" + order_code); ////log

            var orders = orderModels.GetOrdersbyCode(order_code);
            order_view.Email = orders.Email;
            order_view.Name = orders.Name;
            order_view.Phone = orders.Phone;
            order_view.Address = orders.Address;
            order_view.Gender = orders.Gender;
            order_view.Sub_total = CommonGlobal.FormatMoney(orders.Total);
            order_view.Content = orders.Note;
            order_view.Order_code = order_code;

            var list_order_detail = detailsv.GetAllOrderDetail(order_code);
            if (list_order_detail.Count > 0)
            {
                order_view.ShoppingCart = new ArrayList(list_order_detail.ToArray());
            }

            //// send email to client and send email to admin sales
            var strBody_email_client = GeneralModels.GetContent(CommonGlobal.EmailOrderPaymentChangeStatus, Lang).ToString(); ////get from email template
            strBody_email_client = strBody_email_client.Replace("{domain}", Util.GetConfigValue("Domain", Request.UserHostName).ToString());
            strBody_email_client = strBody_email_client.Replace("{email}", web_infor.GetContent(CommonGlobal.Email).ToString());
            strBody_email_client = strBody_email_client.Replace("{store_name}", GeneralModels.GetContent(CommonGlobal.PageName, Lang).ToString());
            strBody_email_client = strBody_email_client.Replace("{order_date}", orders.CreateDate.ToString());
            strBody_email_client = strBody_email_client.Replace("{order_status}", CommonGlobal.OrderStart.ToString());
            strBody_email_client = strBody_email_client.Replace("{order_id}", order_code);
            strBody_email_client = strBody_email_client.Replace("{order_name}", orders.Name.ToString());
            strBody_email_client = strBody_email_client.Replace("{order_address}", orders.Address.ToString());
            strBody_email_client = strBody_email_client.Replace("{order_content}", orders.Note != null ? orders.Note.ToString() : string.Empty);
            strBody_email_client = strBody_email_client.Replace("{order_phone}", orders.Phone.ToString());
            strBody_email_client = strBody_email_client.Replace("{order_email}", orders.Email.ToString());

            var strOrderDetail = string.Empty;
            StringBuilder sb = new StringBuilder();
            foreach (var it in list_order_detail)
            {
                sb.Append("<tr>");
                sb.Append("    <td width=\"42\" valign=\"top\" style=\"width: 31.5pt; border: solid silver 1.0pt; border-top: none; padding: .05in .05in .05in .05in\">");
                sb.Append("        <p class=\"MsoNormal\" align=\"center\" style=\"text-align: center; line-height: normal\">");
                sb.Append("            <span style=\"font-size: 10.0pt; font-family: Arial\">" + it.Quantity + "</span>");
                sb.Append("        </p>");
                sb.Append("    </td>");
                sb.Append("    <td width=\"412\" valign=\"top\" style=\"width: 309.0pt; border-top: none; border-left: none; border-bottom: solid silver 1.0pt; border-right: solid silver 1.0pt; padding: .05in .05in .05in .05in\">");
                sb.Append("        <p class=\"MsoNormal\" style=\"line-height: normal\">");
                sb.Append("            <span style=\"font-size: 10.0pt; font-family: Arial\">" + it.ProductName + "&nbsp;&nbsp;" + it.Propertices + "</span>");
                sb.Append("        </p>");
                sb.Append("    </td>");
                sb.Append("    <td width=\"84\" valign=\"top\" style=\"width: 63.0pt; border-top: none; border-left: none; border-bottom: solid silver 1.0pt; border-right: solid silver 1.0pt; padding: .05in .05in .05in .05in\">");
                sb.Append("        <p class=\"MsoNormal\" align=\"center\" style=\"text-align: center; line-height: normal\">");
                sb.Append("            <span style=\"font-size: 10.0pt; font-family: Arial\">" + CommonGlobal.FormatMoney(it.Price.ToString()) + "</span>");
                sb.Append("        </p>");
                sb.Append("    </td>");
                sb.Append("    <td width=\"86\" valign=\"top\" style=\"width: 64.5pt; border-top: none; border-left: none; border-bottom: solid silver 1.0pt; border-right: solid silver 1.0pt; padding: .05in .05in .05in .05in\">");
                sb.Append("        <p class=\"MsoNormal\" align=\"right\" style=\"text-align: right; line-height: normal\">");
                sb.Append("            <span style=\"font-size: 10.0pt; font-family: Arial\">" + CommonGlobal.FormatMoney((it.Price * it.Quantity).ToString()) + "</span>");
                sb.Append("        </p>");
                sb.Append("    </td>");
                sb.Append("</tr>");
            }

            strOrderDetail = sb.ToString();
            strBody_email_client = strBody_email_client.Replace("{order_list}", strOrderDetail.ToString());
            strBody_email_client = strBody_email_client.Replace("{order_total}", CommonGlobal.FormatMoney(orders.Total.ToString()));

            ////Get Invoice by Order_code
            C_Invoices invoice = orderModels.GetInvoicesbyOrderCode(order_code);

            ////Create Payment
            C_Payment payment = new C_Payment();

            //// (String transaction_info, String order_code, String price, String payment_id, String payment_type, String error_text, String secure_code)
            if (check)
            {
                string error_code = string.Empty;
                string transaction_error_code = string.Empty;
                string order_code_ngan_luong = string.Empty;
                string transaction_info_ngan_luong = string.Empty;
                string payment_id_ngan_luong = string.Empty;
                string amount = string.Empty;
                string transaction_type = string.Empty;
                string payment_type_ngan_luong = string.Empty;
                string payer_fullname = string.Empty;
                string payer_email = string.Empty;
                string payer_mobile = string.Empty;
                string delivary_address = string.Empty;
                string created_time = string.Empty;
                string paid_time = string.Empty;
                string transaction_status = string.Empty;

                ////Call NGANLUONG_API check order
                var nganluong_api = new NGANLUONG_API.NGANLUONG_APIPortTypeClient();
                string param_str = "<ORDERS><TOTAL>1</TOTAL><ORDER><ORDER_CODE>" + order_code + "</ORDER_CODE><PAYMENT_ID>" + payment_id + "</PAYMENT_ID></ORDER></ORDERS>";
                string str = string.Empty;
                str += " " + PaymentConts.NLMerchantSiteCode;
                str += " " + param_str;
                str += " " + PaymentConts.NLSecurePass;
                //// Encode
                string verify_secure_code = string.Empty;
                verify_secure_code = nl.GetMD5Hash(str);
                var results = nganluong_api.checkOrder(PaymentConts.NLMerchantSiteCode, param_str, verify_secure_code);
                if (!string.IsNullOrEmpty(results))
                {
                    XmlDocument xml = new XmlDocument();
                    xml.LoadXml(results); //// suppose that myXmlString contains "<Names>...</Names>"

                    ////error code
                    XmlNodeList parentList = xml.SelectNodes("/RESULT");
                    foreach (XmlNode xn in parentList)
                    {
                        error_code = xn["ERROR_CODE"].InnerText; ////00, truy vấn được xử lý; 01: Thông tin truy vấn không đúng hoặc không được phép truy cập
                    }

                    if (error_code == "00")
                    {
                        XmlNodeList noteList = xml.SelectNodes("/RESULT/TRANSACTION");
                        foreach (XmlNode xn in noteList)
                        {
                            transaction_error_code = xn["TRANSACTION_ERROR_CODE"].InnerText; ////Mã lỗi GD
                            order_code_ngan_luong = xn["ORDER_CODE"].InnerText; ////Mã hóa đơn
                            transaction_info_ngan_luong = xn["TRANSACTION_INFO"].InnerText; ////Thông tin thêm về GD
                            payment_id_ngan_luong = xn["PAYMENT_ID"].InnerText; ////Mã GD tại NganLuong.vn
                            amount = xn["AMOUNT"].InnerText; ////Tổng số tiền đã thanh toán
                            transaction_type = xn["TRANSACTION_TYPE"].InnerText; ////Loại giao dịch
                            payment_type_ngan_luong = xn["PAYMENT_TYPE"].InnerText; ////Kiểu thanh toán
                            payer_fullname = xn["PAYER_FULLNAME"].InnerText; ////Họ tên người thanh toán
                            payer_email = xn["PAYER_EMAIL"].InnerText; ////Email người thanh toán
                            payer_mobile = xn["PAYER_MOBILE"].InnerText; ////Số điện thoại người thanh toán
                            delivary_address = xn["DELIVERY_ADDRESS"].InnerText; ////Địa chỉ giao hàng
                            created_time = xn["CREATED_TIME"].InnerText; ////Thời gian phát sinh giao dịch
                            paid_time = xn["PAID_TIME"].InnerText; ////Thời gian thanh toán
                            transaction_status = xn["TRANSACTION_STATUS"].InnerText; ////Trạng thái giao dịch
                        }
                    }
                }

                payment.Amount = double.Parse(amount);
                payment.CreateDate = DateTime.Parse(paid_time);
                payment.InvoiceID = invoice.id;
                payment.Payment_type = int.Parse(payment_type_ngan_luong);  //// 1 - Thanh toán bằng số dư TK NgânLượng.vn; 2 – Thanh toán bằng tiền mặt hoặc qua NH
                payment.TranscactionStatus = transaction_status; ////1 – Giao dịch mới tạo, chưa thanh toán;
                ////2 – Đã thanh toán, đang bị tạm giữ;
                ////3 – Giao dịch bị huỷ/hoàn trả;
                ////4 – Giao dịch hoàn thành, tiền đã chuyển vào tài khoản NganLuong.vn của người nhận (trường hợp thanh toán ngay hoặc thanh toán tạm giữ nhưng người mua đã phê chuẩn)
                payment.TransactionInfor = transaction_error_code;
                payment.PaymentMenthod = transaction_type; ////1 – Thanh toán ngay, 2 – Thanh toán tạm giữ
                payment.Customer_name = payer_fullname;
                payment.Customer_email = payer_email;
                payment.Customer_phone = payer_mobile;

                orderModels.Add_Payment(payment);
                logger.Info("Hệ thống tạo payment của Ngân Lượng .Date:" + DateTime.Now + ";order:" + order_code); ////log

                if (error_code == "00" && transaction_error_code == "00" && (transaction_status == "2" || transaction_status == "4"))
                {
                    ////paid sucess
                    orders.Payment = CommonGlobal.PaymentFull.ToString();
                    orders.LName = CommonGlobal.PaygateNganLuong;
                    orderModels.Edit_Orders(orders);
                    logger.Info("Đơn hàng đã được thanh toán thành công qua Ngân Lượng .Date:" + DateTime.Now + ";TRANSACTION_STATUS:" + transaction_status); ////log
                    order_view.Message = "<p>Đơn hàng của quý khách đã được thanh toán thành công thông qua cổng thanh toán Ngân Lượng.</br>Chúng tôi sẽ chuyển hàng trong thời gian sớm nhất.</br> Trân trọng !</p>";
                    strBody_email_client = strBody_email_client.Replace("{payment_status}", CommonGlobal.PaymentFullText);
                }
                else
                {
                    orders.Payment = CommonGlobal.PaymentFail.ToString();
                    orders.LName = CommonGlobal.PaygateNganLuong;
                    orderModels.Edit_Orders(orders);
                    logger.Info("Đơn hàng thanh toán thất bại qua Ngân Lượng .Date:" + DateTime.Now + ";TRANSACTION_STATUS:" + transaction_status); ////log
                    order_view.Message = "<p>Đơn hàng của quý khách thanh toán không thành công trên Ngân Lượng.</br>Xin vui lòng thử lại hoặc liên hệ nhân viên của chúng tôi để được hướng dẫn.</br> Trân trọng !</p>";
                    strBody_email_client = strBody_email_client.Replace("{payment_status}", CommonGlobal.PaymentFailText);
                }
            }
            else
            {
                orders.Payment = CommonGlobal.PaymentFail.ToString();
                orders.LName = CommonGlobal.PaygateNganLuong;
                orderModels.Edit_Orders(orders);
                logger.Info("Đơn hàng thanh toán thất bại qua Ngân Lượng .Date:" + DateTime.Now + ";verifyPaymentUrl:" + check + ";order:" + order_code); ////log
                order_view.Message = "<p>Đơn hàng của quý khách thanh toán không thành công trên Ngân Lượng.</br>Xin vui lòng thử lại hoặc liên hệ nhân viên của chúng tôi để được hướng dẫn.</br> Trân trọng !</p>";
                strBody_email_client = strBody_email_client.Replace("{payment_status}", CommonGlobal.PaymentFailText);
            }

            strBody_email_client = strBody_email_client.Replace("{payment_gate}", CommonGlobal.PaygateNganLuong);
            strBody_email_client = strBody_email_client.Replace("{payment_content}", order_view.Message); ////Message payment content

            try
            {
                CommonGlobal.SendMail(orders.Email, App_GlobalResources.Lang.strSubjectPaymentStatus + " " + Util.GetConfigValue("Domain", Request.UserHostName).ToString() + "(" + order_code + ")", strBody_email_client);

                ////send email to admin about order
                CommonGlobal.SendMail(web_infor.GetContent(CommonGlobal.Email), App_GlobalResources.Lang.strSubjectPaymentFromClient + " " + orders.Name + "(" + order_code + ")", strBody_email_client);
            }
            catch (Exception ex)
            {
                logger.Error("Hệ thống Không thể gửi email .Date:" + DateTime.Now + ";Message:" + ex.Message + ";User:" + Session["mem"].ToString()); //// log
            }

            return this.PartialView("../page/NganluongResult", order_view);
        }

        /// <summary>
        /// Ngan luong the check out.
        /// </summary>
        /// <param name="order">The order.</param>
        /// <returns>the payment tool Ngan Luong CheckOut</returns>
        public ActionResult NLCheckOut(string order)
        {
            OrderModels orderModels = new OrderModels();
            if (string.IsNullOrEmpty(order))
            {
                return this.HttpNotFound();
            }
            else
            {
                order = HttpUtility.HtmlDecode(order);
            }

            if (!this.CheckMemberlogin())
            {
                return this.RedirectToAction("login", "account", new { return_url = Url.Action("payment", "cart", new { order = order }) });
            }
            else
            {
                logger.Info(Session["mem"].ToString() + " sử dụng Ngân Lượng payment.Date:" + DateTime.Now + ";order:" + order); //// log
                C_User usr = new C_User();
                UserModels sv = new UserModels();
                usr = sv.GetUserbyUserName(this.Session["mem"].ToString());

                var orders = orderModels.GetOrdersbyCode(order, usr.Username);
                if (orders == null)
                {
                    return this.RedirectToAction("payment", "cart", new { order = order });
                }
                else
                {
                    ////Create Invoice when call payment
                    C_Invoices invoice = new C_Invoices();
                    invoice.OrderCode = orders.Code;
                    invoice.Status = 1;
                    invoice.InvoiceContent = null;
                    invoice.CreateDate = DateTime.Now;
                    orderModels.Add_Invoices(invoice);

                    ////Call funtion payment on NL
                    string return_url = Util.GetConfigValue("Domain", Request.UserHostName) + "/" + Url.Action("NganluongResult", "cart");
                    string transaction_info = App_GlobalResources.Lang.strName + ": " + orders.Name + " " + App_GlobalResources.Lang.strOrder + ": " + orders.Code;
                    string order_code = orders.Code;
                    string receiver = PaymentConts.NLReceiverAccount;
                    string price = orders.Total;
                    NL_Checkout nl = new NL_Checkout();
                    string url;
                    url = nl.BuildCheckoutUrl(return_url, receiver, transaction_info, order_code, price);

                    logger.Info(Session["mem"].ToString() + " đã tạo Invoice và gọi payment gate Ngân Lượng.Date:" + DateTime.Now + ";order:" + orders.Code);

                    return this.Redirect(url);
                }
            }
        }

        /// <summary>
        /// Orders this instance.
        /// </summary>
        /// <returns>the order</returns>
        [AcceptVerbs(HttpVerbs.Get)]
        public ActionResult Order()
        {
            /////order
            string strbreadcrumbs = string.Empty;
            ViewBag.Title = App_GlobalResources.Lang.strOrder + " | " + GeneralModels.GetContent(CommonGlobal.PageName, this.Lang);

            strbreadcrumbs = string.Format("<li><a href=\"" + Url.Action("cart", "cart") + "\">" + App_GlobalResources.Lang.strCart + "</a></li>");
            strbreadcrumbs += string.Format("<li>" + App_GlobalResources.Lang.strOrder + "</li>");
            ViewBag.str_breadcrumbs = strbreadcrumbs;

            ViewBag.heading = App_GlobalResources.Lang.strOrder;

            this.AddMeta(CommonGlobal.Keyword, App_GlobalResources.Lang.strOrder);
            this.AddMeta(CommonGlobal.Description, App_GlobalResources.Lang.strOrder);
            if (!this.CheckMemberlogin())
            {
                return this.RedirectToAction("login", "account", new { return_url = Url.Action("order", "cart") });
            }
            else
            {
                C_UserInfo iit = new C_UserInfo();
                CommonGlobal globals = new CommonGlobal();
                C_User usr = new C_User();
                var order_view = new Order_register_view();
                UserModels sv = new UserModels();
                usr = sv.GetUserbyUserName(Session["mem"].ToString());
                iit = sv.GetUserInforByEmail(usr.Username);

                order_view.Parent_action = HttpContext.Request.RequestContext.RouteData.Values["action"].ToString();
                order_view.Parent_controller = HttpContext.Request.RequestContext.RouteData.Values["controller"].ToString();
                order_view.ContentShipping = GeneralModels.GetContent(CommonGlobal.ContentShipping, this.Lang);
                order_view.Message = string.Empty;
                if (usr == null)
                {
                    return this.RedirectToAction("login", "account", new { return_url = Url.Action("order", "cart") });
                }
                else
                {
                    order_view.Email = usr.Username;
                }

                if (iit == null)
                {
                    return this.RedirectToAction("my_account", "account", new { return_url = Url.Action("order", "cart") });
                }
                else
                {
                    order_view.Name = iit.FName;
                    order_view.Address = iit.Address;
                    order_view.Phone = iit.Phone;
                }

                OrderList shoppingCart = default(OrderList);
                shoppingCart = (OrderList)Session["shoppingcart"];

                order_view.FeeShip = shoppingCart != null ? CommonGlobal.FormatMoney(shoppingCart.Fee.ToString()) : "0 đ";
                order_view.Tax = shoppingCart != null ? CommonGlobal.FormatMoney(shoppingCart.Tax.ToString()) : "0 đ";
                order_view.Total = shoppingCart != null ? CommonGlobal.FormatMoney(shoppingCart.Total.ToString()) : "0 đ";
                order_view.Sub_total = shoppingCart != null ? CommonGlobal.FormatMoney(shoppingCart.SubTotal.ToString()) : "0 đ";
                order_view.Total_string = shoppingCart != null ? globals.ConvertNumberToChar(long.Parse(shoppingCart.Total.ToString())) : string.Empty;
                order_view.ItemCount = shoppingCart != null ? shoppingCart.Count.ToString() : "0";
                if (shoppingCart != null && shoppingCart.Values.Count > 0)
                {
                    order_view.ShoppingCart = new ArrayList(shoppingCart.Values);
                }

                return this.PartialView("../page/order", order_view);
            }
        }

        /// <summary>
        /// Orders the specified collection.
        /// </summary>
        /// <param name="collection">The collection.</param>
        /// <returns>the order</returns>
        [AcceptVerbs(HttpVerbs.Post)]
        public ActionResult Order(FormCollection collection)
        {
            CommonGlobal globals = new CommonGlobal();
            OrderModels orderModels = new OrderModels();
            WebInfoModels web_infor = new Models.WebInfoModels();

            OrderList shoppingCart = default(OrderList);
            shoppingCart = (OrderList)Session["shoppingcart"];

            var order_view = new Order_register_view();
            this.TryUpdateModel(order_view);

            ////int ido = 0;
            string order_code = string.Empty;
            order_view.Parent_action = HttpContext.Request.RequestContext.RouteData.Values["action"].ToString();
            order_view.Parent_controller = HttpContext.Request.RequestContext.RouteData.Values["controller"].ToString();
            order_view.ContentShipping = GeneralModels.GetContent(CommonGlobal.ContentShipping, this.Lang);
            bool rt = false;

            if (HttpContext.Session["captchastring"] == null && HttpUtility.HtmlDecode(order_view.Code) != HttpContext.Session["captchastring"].ToString())
            {
                order_view.Message = App_GlobalResources.Lang.messCaptcha;
                order_view.Sub_total = shoppingCart != null ? CommonGlobal.FormatMoney(shoppingCart.SubTotal.ToString()) : "0 đ";
                order_view.ItemCount = shoppingCart != null ? shoppingCart.Count.ToString() : "0";
                if (shoppingCart != null && shoppingCart.Values.Count > 0)
                {
                    order_view.ShoppingCart = new ArrayList(shoppingCart.Values);
                }

                return this.PartialView("../page/order", order_view);
            }
            else
            {
                ////get order from session
                if (this.Session["OrderNew"] == null)
                {
                    order oit = new order();
                    oit.Name = order_view.Name;
                    oit.Email = order_view.Email;
                    if (shoppingCart != null)
                    {
                        oit.Total = shoppingCart.Total.ToString();
                    }
                    else
                    {
                        oit.Total = "0";
                    }

                    oit.Address = order_view.Address;
                    oit.Gender = order_view.Gender;
                    oit.Phone = order_view.Phone;
                    ////oit.Fax = order_view.phone;
                    oit.Note = order_view.Content;
                    oit.Shipping = string.Empty;
                    oit.Payment = CommonGlobal.PaymentStart.ToString();
                    oit.CreateDate = DateTime.Now;
                    oit.City = string.Empty;
                    oit.Recive = string.Empty;
                    oit.Status = true;
                    oit.Process = CommonGlobal.OrderProcessStart;
                    oit.UserCreate = Session["mem"].ToString();
                    oit.Code = orderModels.GetOrderCodeUnique();

                    try
                    {
                        order_code = orderModels.Add_Orders(oit);
                        this.Orderdetail(order_code);
                        logger.Info(Session["mem"].ToString() + " Tạo đơn hàng thành công order_code: " + order_code);
                        rt = true;
                    }
                    catch (Exception ex)
                    {
                        order_view.Message = ex.Message;
                        order_view.Sub_total = shoppingCart != null ? CommonGlobal.FormatMoney(shoppingCart.SubTotal.ToString()) : "0 đ";
                        order_view.Total = shoppingCart != null ? CommonGlobal.FormatMoney(shoppingCart.Total.ToString()) : "0 đ";
                        order_view.Tax = shoppingCart != null ? CommonGlobal.FormatMoney(shoppingCart.Tax.ToString()) : "0 đ";
                        order_view.FeeShip = shoppingCart != null ? CommonGlobal.FormatMoney(shoppingCart.Fee.ToString()) : "0 đ";
                        order_view.Total_string = shoppingCart != null ? globals.ConvertNumberToChar(long.Parse(shoppingCart.Total.ToString())) : " ";
                        order_view.ItemCount = shoppingCart != null ? shoppingCart.Count.ToString() : "0";
                        if (shoppingCart != null && shoppingCart.Values.Count > 0)
                        {
                            order_view.ShoppingCart = new ArrayList(shoppingCart.Values);
                        }

                        logger.Error(Session["mem"].ToString() + " Tạo đơn hàng thất bại .Date:" + DateTime.Now + ";Message:" + ex.Message); ////
                    }
                }
                else
                {
                    ////get order from Session
                    order_code = this.Session["OrderNew"] != null ? this.Session["OrderNew"].ToString() : string.Empty;
                }

                if (rt == true)
                {
                    //// send email to client and send email to admin sales
                    var strBody_email_client = GeneralModels.GetContent(CommonGlobal.EmailOrderConfirm, Lang).ToString(); ////get from email template
                    strBody_email_client = strBody_email_client.Replace("{domain}", Util.GetConfigValue("Domain", Request.UserHostName).ToString());
                    strBody_email_client = strBody_email_client.Replace("{email}", web_infor.GetContent(CommonGlobal.Email).ToString());
                    strBody_email_client = strBody_email_client.Replace("{store_name}", GeneralModels.GetContent(CommonGlobal.PageName, Lang).ToString());
                    strBody_email_client = strBody_email_client.Replace("{order_date}", DateTime.Now.ToShortDateString().ToString());
                    strBody_email_client = strBody_email_client.Replace("{order_status}", CommonGlobal.OrderStart.ToString());
                    strBody_email_client = strBody_email_client.Replace("{payment_status}", CommonGlobal.PaymentStartText);
                    strBody_email_client = strBody_email_client.Replace("{order_id}", order_code);
                    strBody_email_client = strBody_email_client.Replace("{order_name}", order_view.Name.ToString());
                    strBody_email_client = strBody_email_client.Replace("{order_address}", order_view.Address.ToString());
                    strBody_email_client = strBody_email_client.Replace("{order_content}", order_view.Content != null ? order_view.Content.ToString() : string.Empty);
                    strBody_email_client = strBody_email_client.Replace("{order_phone}", order_view.Phone.ToString());
                    strBody_email_client = strBody_email_client.Replace("{order_email}", order_view.Email.ToString());

                    var strOrderDetail = string.Empty;
                    StringBuilder sb = new StringBuilder();
                    var shopping_cart_list = new ArrayList(shoppingCart.Values);
                    foreach (OrderItem it in shopping_cart_list)
                    {
                        sb.Append("<tr>");
                        sb.Append("    <td width=\"42\" valign=\"top\" style=\"width: 31.5pt; border: solid silver 1.0pt; border-top: none; padding: .05in .05in .05in .05in\">");
                        sb.Append("        <p class=\"MsoNormal\" align=\"center\" style=\"text-align: center; line-height: normal\">");
                        sb.Append("            <span style=\"font-size: 10.0pt; font-family: Arial\">" + it.Quatity + "</span>");
                        sb.Append("        </p>");
                        sb.Append("    </td>");
                        sb.Append("    <td width=\"412\" valign=\"top\" style=\"width: 309.0pt; border-top: none; border-left: none; border-bottom: solid silver 1.0pt; border-right: solid silver 1.0pt; padding: .05in .05in .05in .05in\">");
                        sb.Append("        <p class=\"MsoNormal\" style=\"line-height: normal\">");
                        sb.Append("            <span style=\"font-size: 10.0pt; font-family: Arial\">" + it.ProductName + "&nbsp;&nbsp;" + it.Property_detail + "</span>");
                        sb.Append("        </p>");
                        sb.Append("    </td>");
                        sb.Append("    <td width=\"84\" valign=\"top\" style=\"width: 63.0pt; border-top: none; border-left: none; border-bottom: solid silver 1.0pt; border-right: solid silver 1.0pt; padding: .05in .05in .05in .05in\">");
                        sb.Append("        <p class=\"MsoNormal\" align=\"center\" style=\"text-align: center; line-height: normal\">");
                        sb.Append("            <span style=\"font-size: 10.0pt; font-family: Arial\">" + CommonGlobal.FormatMoney(it.Price.ToString()) + "</span>");
                        sb.Append("        </p>");
                        sb.Append("    </td>");
                        sb.Append("    <td width=\"86\" valign=\"top\" style=\"width: 64.5pt; border-top: none; border-left: none; border-bottom: solid silver 1.0pt; border-right: solid silver 1.0pt; padding: .05in .05in .05in .05in\">");
                        sb.Append("        <p class=\"MsoNormal\" align=\"right\" style=\"text-align: right; line-height: normal\">");
                        sb.Append("            <span style=\"font-size: 10.0pt; font-family: Arial\">" + CommonGlobal.FormatMoney((it.Price * it.Quatity).ToString()) + "</span>");
                        sb.Append("        </p>");
                        sb.Append("    </td>");
                        sb.Append("</tr>");
                    }

                    strOrderDetail = sb.ToString();
                    strBody_email_client = strBody_email_client.Replace("{order_list}", strOrderDetail.ToString());
                    strBody_email_client = strBody_email_client.Replace("{order_tax}", CommonGlobal.FormatMoney(shoppingCart.Tax.ToString()));
                    strBody_email_client = strBody_email_client.Replace("{fee_ship}", CommonGlobal.FormatMoney(shoppingCart.Fee.ToString()));
                    strBody_email_client = strBody_email_client.Replace("{order_total}", CommonGlobal.FormatMoney(shoppingCart.Total.ToString()));

                    try
                    {
                        CommonGlobal.SendMail(order_view.Email, App_GlobalResources.Lang.strSubjectOrderConfirm + " " + Util.GetConfigValue("Domain", Request.UserHostName).ToString() + "(" + order_code + ")", strBody_email_client);

                        ////send email to admin about order
                        CommonGlobal.SendMail(web_infor.GetContent(CommonGlobal.Email), App_GlobalResources.Lang.strSubjectNewOrderClient + " " + order_view.Name, strBody_email_client);
                    }
                    catch (Exception ex)
                    {
                        logger.Error(Session["mem"].ToString() + " Tạo đơn hàng thành công nhưng không thể gửi email .Date:" + DateTime.Now + ";Message:" + ex.Message); ////
                    }

                    ////add order cookies
                    this.Session["OrderNew"] = order_code;
                    return this.RedirectToAction("payment", "cart", new { order = order_code });
                }
                else
                {
                    return this.PartialView("../page/order", order_view);
                }
            }
        }

        /// <summary>
        /// Orders the success.
        /// </summary>
        /// <param name="order">The order.</param>
        /// <returns>order success</returns>
        [AcceptVerbs(HttpVerbs.Get)]
        public ActionResult Order_success(string order)
        {
            OrderModels orderModels = new OrderModels();
            WebInfoModels web_infor = new Models.WebInfoModels();
            DetailOrderModels detailsv = new DetailOrderModels();
            var order_view = new Order_register_view();

            string strbreadcrumbs = string.Empty;
            ViewBag.Title = App_GlobalResources.Lang.strPayment + " | " + GeneralModels.GetContent(CommonGlobal.PageName, this.Lang);

            strbreadcrumbs += string.Format("<li>" + App_GlobalResources.Lang.strPayment + "</li>");
            ViewBag.str_breadcrumbs = strbreadcrumbs;

            ViewBag.heading = App_GlobalResources.Lang.strPayment;

            this.AddMeta(CommonGlobal.Keyword, App_GlobalResources.Lang.strPayment);
            this.AddMeta(CommonGlobal.Description, App_GlobalResources.Lang.strPayment);
            if (!this.CheckMemberlogin())
            {
                return this.RedirectToAction("login", "account", new { return_url = Url.Action("order_success", "cart", new { order = order }) });
            }
            else
            {
                var orders = orderModels.GetOrdersbyCode(order, Session["mem"].ToString());
                order_view.Email = orders.Email;
                order_view.Name = orders.Name;
                order_view.Phone = orders.Phone;
                order_view.Address = orders.Address;
                order_view.Gender = orders.Gender;
                order_view.Sub_total = CommonGlobal.FormatMoney(orders.Total);
                order_view.Content = orders.Note;
                order_view.Order_code = order;

                var list_order_detail = detailsv.GetAllOrderDetail(order);
                if (list_order_detail.Count > 0)
                {
                    order_view.ShoppingCart = new ArrayList(list_order_detail.ToArray());
                }

                ////Không tạo invoice khi chưa thanh toán
                logger.Info(Session["mem"].ToString() + " Đã tạo order và chưa thanh toán .Date:" + DateTime.Now + ";order:" + order); ////log
                order_view.Message = "<p>Đơn hàng của quý khách đã được tạo thành công.</br>Nhân viên của chúng tôi sẽ liên lạc với quý khách theo số điện thoại đã cung cấp để chuyển hàng trong thời gian sớm nhất.</br> Trân trọng !</p>";

                ////clear shoppingCart
                OrderList shoppingcart = new OrderList();
                shoppingcart.ClearCart();

                ////clear order cookies
                this.Session["OrderNew"] = null;

                return this.PartialView("../page/order_success", order_view);
            }
        }

        /// <summary>
        /// Payments the specified order.
        /// </summary>
        /// <param name="order">The order.</param>
        /// <returns>the payment</returns>
        [AcceptVerbs(HttpVerbs.Get)]
        public ActionResult Payment(string order)
        {
            /////order
            DetailOrderModels detailsv = new DetailOrderModels();
            OrderModels orderModels = new OrderModels();
            string strbreadcrumbs = string.Empty;
            ViewBag.Title = App_GlobalResources.Lang.strPayment + " | " + GeneralModels.GetContent(CommonGlobal.PageName, this.Lang);

            strbreadcrumbs += string.Format("<li>" + App_GlobalResources.Lang.strPayment + "</li>");
            ViewBag.str_breadcrumbs = strbreadcrumbs;

            ViewBag.heading = App_GlobalResources.Lang.strPayment;

            this.AddMeta(CommonGlobal.Keyword, App_GlobalResources.Lang.strPayment);
            this.AddMeta(CommonGlobal.Description, App_GlobalResources.Lang.strPayment);
            if (!this.CheckMemberlogin())
            {
                return this.RedirectToAction("login", "account", new { return_url = Url.Action("payment", "cart", new { order = order }) });
            }
            else
            {
                if (string.IsNullOrEmpty(order))
                {
                    return this.HttpNotFound();
                }

                C_User usr = new C_User();
                var order_view = new Order_register_view();
                order_view.Parent_action = HttpContext.Request.RequestContext.RouteData.Values["action"].ToString();
                order_view.Parent_controller = HttpContext.Request.RequestContext.RouteData.Values["controller"].ToString();
                order_view.ContentShipping = GeneralModels.GetContent(CommonGlobal.ContentShipping, this.Lang);
                UserModels sv = new UserModels();
                usr = sv.GetUserbyUserName(Session["mem"].ToString());

                var orders = orderModels.GetOrdersbyCode(order, usr.Username);
                if (orders == null)
                {
                    order_view.Message = App_GlobalResources.Lang.messOrderNotFound;

                    return this.PartialView("../page/payment", order_view);
                }

                order_view.Message = string.Empty;
                order_view.Email = orders.Email;
                order_view.Name = orders.Name;
                order_view.Phone = orders.Phone;
                order_view.Address = orders.Address;
                order_view.Gender = orders.Gender;
                order_view.Sub_total = CommonGlobal.FormatMoney(orders.Total);
                order_view.Content = orders.Note;
                order_view.Order_code = order;

                var list_order_detail = detailsv.GetAllOrderDetail(order);
                if (list_order_detail.Count > 0)
                {
                    order_view.ShoppingCart = new ArrayList(list_order_detail.ToArray());
                }

                ////clear shoppingCart
                OrderList shoppingcart = new OrderList();
                shoppingcart.ClearCart();

                ////clear order cookies
                this.Session["OrderNew"] = null;

                return this.PartialView("../page/payment", order_view);
            }
        }

        /// <summary>
        /// Removes from cart.
        /// </summary>
        /// <param name="key">The key.</param>
        /// <returns>remove from cart</returns>
        public ActionResult Remove_from_cart(string key)
        {
            CommonGlobal globals = new CommonGlobal();
            OrderList shoppingCart = default(OrderList);
            ProductModels proModels = new ProductModels();
            if (HttpContext.Session["shoppingcart"] != null)
            {
                shoppingCart = (OrderList)HttpContext.Session["shoppingcart"];
            }
            else
            {
                shoppingCart = new OrderList();
            }

            if (!string.IsNullOrEmpty(key))
            {
                shoppingCart.Remove(key);
            }

            var jsonSerialiser = new JavaScriptSerializer();
            var json = jsonSerialiser.Serialize(shoppingCart.Values);
            var results = shoppingCart.SubTotal_Format_money + "|" + shoppingCart.Tax_Format_money + "|" + shoppingCart.ShippFee_Format_money + "|" + shoppingCart.Total_string + "|" + shoppingCart.Total_Format_money + "|" + shoppingCart.Count + "|" + json;

            return this.Json(results);
        }

        /// <summary>
        /// Updates the product number cart.
        /// </summary>
        /// <param name="key">The key.</param>
        /// <param name="no">The no.</param>
        /// <returns>Update product number cart</returns>
        public ActionResult Update_product_number_cart(string key, string no)
        {
            CommonGlobal globals = new CommonGlobal();
            OrderList shoppingCart = default(OrderList);
            ProductModels proModels = new ProductModels();
            if (HttpContext.Session["shoppingcart"] != null)
            {
                shoppingCart = (OrderList)HttpContext.Session["shoppingcart"];
            }
            else
            {
                shoppingCart = new OrderList();
            }

            if (!string.IsNullOrEmpty(key))
            {
                shoppingCart.DefaultProp(key).Quatity = Convert.ToInt32(no);
            }

            var jsonSerialiser = new JavaScriptSerializer();
            var json = jsonSerialiser.Serialize(shoppingCart.Values);
            var results = shoppingCart.SubTotal_Format_money + "|" + shoppingCart.Tax_Format_money + "|" + shoppingCart.ShippFee_Format_money + "|" + shoppingCart.Total_string + "|" + shoppingCart.Total_Format_money + "|" + shoppingCart.Count + "|" + json;

            return this.Json(results);
        }

        /// <summary>
        /// Gets the property order items.
        /// </summary>
        /// <param name="id">The identifier.</param>
        /// <param name="listProperties">The list properties.</param>
        /// <returns>get Property Order Items</returns>
        private string GetPropertyOrderItems(int id, string listProperties)
        {
            string values = string.Empty;
            ProductPropertyModels sv = new ProductPropertyModels();
            string[] arrName;
            if (!string.IsNullOrEmpty(listProperties) && listProperties.Contains(","))
            {
                arrName = listProperties.Split(',');
                if (arrName[0].Trim() != "Undefined" && arrName[0].Trim() != "undefined")
                {
                    C_ProductProperty co = sv.GetPropertyByProductIdAndProID(id, int.Parse(arrName[0] ?? "0"));
                    if (co != null)
                    {
                        values = values + co.Name;
                    }
                }

                values = values + ",";

                if (arrName[1].Trim() != "Undefined" && arrName[1].Trim() != "undefined")
                {
                    C_ProductProperty si = sv.GetPropertyByProductIdAndProID(id, int.Parse(arrName[1] ?? "0"));
                    if (si != null)
                    {
                        values = values + si.Value;
                    }
                }
            }

            values = values + string.Empty;

            return values;
        }

        /// <summary>
        /// Order detail the specified order code.
        /// </summary>
        /// <param name="order_code">The order code.</param>
        private void Orderdetail(string order_code)
        {
            DetailOrderModels sv = new DetailOrderModels();
            DetailOrder it = new DetailOrder();
            OrderList shoppingcart = new OrderList();
            shoppingcart = (OrderList)Session["shoppingcart"];
            if (shoppingcart != null)
            {
                ArrayList shoppingCartList = new ArrayList(shoppingcart.Values);
                foreach (OrderItem its in shoppingCartList)
                {
                    it.ProductName = its.Name;
                    it.Code = order_code;
                    it.ProductID = its.ProductID;
                    it.Quantity = its.Quatity;
                    it.Price = its.Price;
                    it.TotalPrice = its.Quatity * its.Price;
                    it.Propertices = its.Property.Length > 1 ? this.GetPropertyOrderItems(its.ProductID, its.Property) : string.Empty;
                    sv.AddDetailOrder(it);
                }
            }
        }

        /// <summary>
        /// Sets the property.
        /// </summary>
        /// <param name="id">The identifier.</param>
        /// <param name="listProperties">The list properties.</param>
        /// <returns>set Property</returns>
        private string SetProperty(int id, string listProperties)
        {
            string values = string.Empty;
            ProductPropertyModels sv = new ProductPropertyModels();
            string[] arrName;
            if (!string.IsNullOrEmpty(listProperties) && listProperties.Contains(","))
            {
                arrName = listProperties.Split(',');
                if (arrName[0].Trim() != "Undefined" && arrName[0].Trim() != "undefined")
                {
                    C_ProductProperty co = sv.GetPropertyByProductIdAndProID(id, int.Parse(arrName[0] ?? "0"));
                    if (co != null)
                    {
                        values = values + "<span style=\"background-color:" + co.Value + ";width:10px;height:10px;border: 1px solid #333\" title=\"" + co.Name + "\">&nbsp;&nbsp;&nbsp;&nbsp;</span>";
                    }
                }

                values = values + "&nbsp;";

                if (arrName[1].Trim() != "Undefined" && arrName[1].Trim() != "undefined")
                {
                    C_ProductProperty si = sv.GetPropertyByProductIdAndProID(id, int.Parse(arrName[1] ?? "0"));
                    if (si != null)
                    {
                        values = values + "<span>" + si.Value + "</span>";
                    }
                }
            }

            values = values + string.Empty;

            return values;
        }
    }
}