namespace Web.Areas.Admin.Controllers
{
    using System;
    using System.Collections;
    using System.IO;
    using System.Linq;
    using System.Text;
    using System.Web.Mvc;
    using Data;
    using iTextSharp.text;
    using iTextSharp.text.html.simpleparser;
    using iTextSharp.text.pdf;
    using Models;
    using NLog;
    using Web.Controllers;
    using Webdiyer.WebControls.Mvc;
    using Web.ViewModels;
    using System.Web;
    using System.Web.Script.Serialization;
    using Web.Models;
    using System.Collections.Generic;

    /// <summary>
    /// Admin Order Controller
    /// </summary>
    /// <seealso cref="Web.Controllers.BaseController" />
    public class AdminOrderController : BaseController
    {
        /// <summary>
        /// The logger
        /// </summary>
        private static Logger logger = LogManager.GetCurrentClassLogger();

        /// <summary>
        /// Changes the order.
        /// </summary>
        /// <param name="code">The code.</param>
        /// <param name="act">The act.</param>
        /// <param name="ctrl">The control.</param>
        /// <param name="type_act">The type act.</param>
        /// <returns>
        /// Change order
        /// </returns>
        [ChildActionOnly]
        [AcceptVerbs(HttpVerbs.Get)]
        public ActionResult Change_order(string code, string act, string ctrl, string type_act)
        {
            OrderModels orderModels = new OrderModels();
            DetailOrderModels detailsv = new DetailOrderModels();
            CommonGlobal globals = new CommonGlobal();
            order corder = new order();
            StringBuilder sb = new StringBuilder();
            var order_view = new Web.Areas.Admin.ViewModels.Order_view();

            if (string.IsNullOrEmpty(act))
            {
                act = Request.QueryString["act"] != null ? Request.QueryString["act"].ToString() : "change_order";
            }

            if (string.IsNullOrEmpty(ctrl))
            {
                ctrl = Request.QueryString["ctrl"] != null ? Request.QueryString["ctrl"].ToString() : "adminOrder";
            }

            if (string.IsNullOrEmpty(code))
            {
                code = Request.QueryString["code"] != null ? RouteData.Values["code"].ToString() : string.Empty;
            }

            if (string.IsNullOrEmpty(type_act))
            {
                type_act = Request.QueryString["type_act"] != null ? Request.QueryString["type_act"].ToString() : CommonGlobal.Add;
                if (string.IsNullOrEmpty(code))
                {
                    type_act = CommonGlobal.Add;
                }
                else
                {
                    type_act = CommonGlobal.Edit;
                }
            }
            
            ////link tab
            sb.Append("<li><a href=\"" + Url.Action("index", "dashboard", new { act = "list_order", ctrl = "adminOrder", page = "1" }) + "\"><span><span>Danh sách mượn</span></span></a></li>");
            if (type_act == CommonGlobal.Edit)
            {
                corder = orderModels.GetOrdersbyCode(code);
                sb.Append("<li class=\"active\"><a href=\"#\"><span><span>" + corder.Code + "</span></span></a></li>");
                order_view.Id = corder.id;
                order_view.Name = corder.Name;
                order_view.Gender = corder.Gender;
                order_view.Phone = corder.Phone;
                order_view.Address = corder.Address;
                order_view.Email = corder.Email;
                order_view.Content = corder.Note;
                order_view.Sub_total = CommonGlobal.FormatMoney(corder.Total);
                order_view.Total_string = globals.ConvertNumberToChar(long.Parse(corder.Total));
                order_view.Payment = corder.Payment ?? "0";
                order_view.Process = corder.Process ?? 0;
                order_view.Payment_status_text = CommonGlobal.GetPaymentStatusString(int.Parse(corder.Payment ?? "0"));
                order_view.Process_status_text = CommonGlobal.GetOrderStatusString(corder.Process ?? 0);
                //order_view.BorrowedDay = corder.BorrowedDay;
                //order_view.PayDay = corder.PayDay;

                var list_order_detail = detailsv.GetAllOrderDetail(corder.Code);
                if (list_order_detail.Count > 0)
                {
                    List<OrderItem> listItem = new List<OrderItem>();
                    int countItem = 0;
                    foreach (var item in list_order_detail) {
                        Web.Models.OrderItem ot = new OrderItem();
                        ot.ProductID = item.ProductID??0;
                        ot.ProductName = item.ProductName;
                        ot.Property = item.Propertices;
                        ot.Quatity = item.Quantity??0;
                        countItem += item.Quantity??0;
                        listItem.Add(ot);
                    }
                    order_view.ShoppingCart = new ArrayList(listItem.ToArray());
                    order_view.Item_count = countItem.ToString();
                }

                //order_view.List_payment_status = GetPaymentStatusSelect(int.Parse(corder.Payment ?? "0")).Where(c => c.Value != CommonGlobal.PaymentAll.ToString()).ToList();
                order_view.List_order_process = GetOrderProcessSelect(corder.Process ?? 0).Where(c => c.Value != CommonGlobal.OrderProcessAll.ToString()).ToList();
            }
            else
            {
                order_view.BorrowedDay = DateTime.Now;
                //order_view.PayDay = DateTime.Now.AddDays(7);

                ////Link tab
                sb.Append("<li class=\"active\"><a href=\"#\"><span><span>Mượn sách mới</span></span></a></li>");

                OrderList shoppingCart = default(OrderList);
                if (Session["shoppingcart"] != null)
                {
                    shoppingCart = (OrderList)Session["shoppingcart"];
                    order_view.ShoppingCart = new ArrayList(shoppingCart.Values);
                    order_view.Item_count = shoppingCart.Count.ToString();
                }                

                //order_view.List_payment_status = GetPaymentStatusSelect(0).Where(c => c.Value != CommonGlobal.PaymentAll.ToString()).ToList();
                order_view.List_order_process = GetOrderProcessSelect(0).Where(c => c.Value != CommonGlobal.OrderProcessAll.ToString()).ToList();
            }

            order_view.Html_link_tab = sb.ToString();
            order_view.Type_act = type_act;
            order_view.Code = code;

            ////action and parent action
            order_view.Act = act;
            order_view.Ctrl = ctrl;
            order_view.Parent_action = HttpContext.Request.RequestContext.RouteData.Values["action"].ToString();
            order_view.Parent_controller = HttpContext.Request.RequestContext.RouteData.Values["controller"].ToString();


            return this.PartialView("../control/change_order", order_view);
        }

        /// <summary>
        /// Changes the order.
        /// </summary>
        /// <param name="collection">The collection.</param>
        /// <returns>
        /// Change order
        /// </returns>
        [ChildActionOnly]
        [AcceptVerbs(HttpVerbs.Post)]
        public ActionResult Change_order(FormCollection collection)
        {
            WebInfoModels web_infor = new WebInfoModels();
            CommonGlobal globals = new CommonGlobal();
            OrderModels orderModels = new OrderModels();
            DetailOrderModels detailsv = new DetailOrderModels();
            order corder = new order();
            StringBuilder sbs = new StringBuilder();
            var order_view = new Web.Areas.Admin.ViewModels.Order_view();
            this.TryUpdateModel(order_view);
            string rt = string.Empty;
            bool ret = false;
            //bool is_valid = true;
            if (!string.IsNullOrEmpty(order_view.Code))
            {
                corder = orderModels.GetOrdersbyCode(order_view.Code);
                if(corder == null)
                {
                    corder = new order();
                }
            }

            ////Link tab
            sbs.Append("<li><a href=\"" + Url.Action("index", "dashboard", new { act = "list_order", ctrl = "adminOrder", page = "1" }) + "\"><span><span>Quản lý kho</span></span></a></li>");
            if (order_view.Code != string.Empty && order_view.Type_act == CommonGlobal.Edit)
            {
                sbs.Append("<li class=\"active\"><a href=\"#\"><span><span>" + corder.Code + "</span></span></a></li>");
            }

            order_view.Html_link_tab = sbs.ToString();

            OrderList shoppingCart = default(OrderList);
            shoppingCart = (OrderList)Session["shoppingcart"];

            
            corder.Name = order_view.Name;
            corder.Email = order_view.Email;
            if (shoppingCart != null)
            {
                corder.Total = shoppingCart.Total.ToString();
            }
            else
            {
                corder.Total = "0";
            }

            corder.Address = order_view.Address;
            corder.Gender = order_view.Gender;
            corder.Phone = order_view.Phone;
            ////corder.Fax = order_view.phone;
            corder.Note = order_view.Content;
            //corder.BorrowedDay = order_view.BorrowedDay;
            

            if (order_view.Code != string.Empty && order_view.Type_act == CommonGlobal.Edit)
            {
                corder.Payment = order_view.Payment;
                corder.Process = order_view.Process;

                //if (order_view.Process == CommonGlobal.OrderProcessComplete)
                //{
                //    corder.PayDay = order_view.PayDay;
                //}                

                rt = orderModels.Edit_Orders(corder);
                //remove all detail old
                //DetailOrderModels sv = new DetailOrderModels();
                //sv.RemoveAllDetailOrder(corder.Code);
                //set new detail
                //this.Orderdetail(rt);
            }
            else
            {                
                corder.Payment = CommonGlobal.PaymentStart.ToString();
                corder.Process = CommonGlobal.OrderProcessStart;
                corder.CreateDate = DateTime.Now;
                corder.UserCreate = Session["mem"].ToString();
                corder.Code = orderModels.GetOrderCodeUnique();
                corder.Shipping = string.Empty;
                corder.City = string.Empty;
                corder.Recive = string.Empty;
                corder.Status = true;

                rt = orderModels.Add_Orders(corder);
                this.Orderdetail(rt);
                
            }

            if (!string.IsNullOrEmpty(rt))
            {
                orderModels.QuantityUpdate(corder);
            }

            if (ret)
            {
                order_view.Message = "Lưu thành công!";
                order_view.Code = rt;
                // order_view.Type_act = CommonGlobal.Edit;
            }
            else
            {
                order_view.Message = "Lưu không thành công!";
            }           

            string return_url = Url.Action("index", "dashboard", new { act = "List_order", ctrl = "AdminOrder", type_act = Web.Models.CommonGlobal.Edit, page = 1, parent = 0 });
            return this.PartialView("../control/redirect", return_url);
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
        /// Exports the document.
        /// </summary>
        /// <param name="type_export">The type export.</param>
        /// <param name="from_date">From date.</param>
        /// <param name="to_date">To date.</param>
        /// <param name="payment">The payment.</param>
        /// <param name="process">The process.</param>
        /// <param name="act">The act.</param>
        /// <param name="ctrl">The control.</param>
        /// <param name="type_act">The type act.</param>
        /// <param name="search">The search.</param>
        /// <param name="page">The page.</param>
        /// <param name="page_size">The page_size.</param>
        /// <param name="order_by">The order by.</param>
        /// <param name="order_type">Type of the order.</param>
        /// <returns>
        /// Export document
        /// </returns>
        [Obsolete]
        public ActionResult Export_document(int? type_export, DateTime? from_date, DateTime? to_date, string payment, int? process, string act, string ctrl, string type_act, string search, int? page, int? page_size, string order_by, string order_type)
        {
            OrderModels orderModels = new OrderModels();
            order corder = new order();
            StringBuilder sb = new StringBuilder();
            var list_order_view = new Web.Areas.Admin.ViewModels.List_order_view();
            int total_record = 0;
            string file_name = string.Empty;

            if (from_date == null)
            {
                from_date = DateTime.Now.AddMonths(-1);
            }

            if (to_date == null)
            {
                to_date = DateTime.Now;
            }

            if (string.IsNullOrEmpty(payment))
            {
                payment = Request.QueryString["Payment"] != null ? Request.QueryString["Payment"].ToString() : "0";
            }

            if (process == null)
            {
                process = Request.QueryString["Process"] != null ? int.Parse(Request.QueryString["Process"].ToString()) : 0;
            }

            if (string.IsNullOrEmpty(act))
            {
                act = Request.QueryString["act"] != null ? Request.QueryString["act"].ToString() : "list_order";
            }

            if (string.IsNullOrEmpty(ctrl))
            {
                ctrl = Request.QueryString["ctrl"] != null ? Request.QueryString["ctrl"].ToString() : "adminOrder";
            }

            if (page == null || page == 0)
            {
                page = Request.QueryString["page"] != null ? Convert.ToInt32(Request.QueryString["page"].ToString()) : 1;
            }

            if (page_size == null)
            {
                page_size = int.Parse(Util.GetConfigValue("NumberPageSizeAdmin", "30"));
            }

            if (string.IsNullOrEmpty(order_by) || string.IsNullOrEmpty(order_type))
            {
                order_by = "CreateDate";
                order_type = "desc";
            }

            if (type_export == null)
            {
                type_export = 1;
            }

            var ms = new MemoryStream();
            Document document = new Document(PageSize.A4, 40, 40, 40, 40);
            PagedList<order> arrAll = orderModels.GetAllOrderByAdmin((DateTime)from_date, (DateTime)to_date, payment, (int)process, search, (int)page, (int)page_size, order_by, order_type, out total_record);
            Response.Buffer = true;
            Response.Clear();

            if (type_export == 1)
            {
                ////export to excel
                Response.AddHeader("Content-Disposition", "attachment; filename=Danh_sach_don_hang_" + from_date + "-" + to_date + ".xls");
                Response.ContentType = "application/ms-excel";
                file_name = "Danh_sach_don_hang_" + from_date + "-" + to_date + ".xls";
            }
            else if (type_export == 2)
            {
                ////export to word
                Response.AddHeader("Content-Disposition", "attachment; filename=Danh_sach_don_hang_" + from_date + "-" + to_date + ".doc");
                Response.ContentType = "application/ms-word";
                file_name = "Danh_sach_don_hang_" + from_date + "-" + to_date + ".doc";
            }
            else if (type_export == 3)
            {
                ////export to pdf
                Response.AddHeader("content-disposition", "attachment; filename=Danh_sach_don_hang_" + from_date + "-" + to_date + ".pdf");
                Response.ContentType = "application/octet-stream";

                ////PdfWriter.GetInstance(document, ms);
                PdfWriter.GetInstance(document, Response.OutputStream);
                document.Open();
                file_name = "Danh_sach_don_hang_" + from_date + "-" + to_date + ".pdf";
            }

            Response.Charset = string.Empty;
            Response.ContentEncoding = Encoding.Unicode;
            Response.BinaryWrite(Encoding.Unicode.GetPreamble());

            sb.Append("<table border=\"0\" cellspacing=\"0\" cellpadding=\"0\" style=\"padding:0px;margin:0px;width:27.7cm\" >");
            sb.Append("<tr>");
            sb.Append("<td colspan=\"7\" style=\"text-align:left;font-weight:bold;padding-bottom:10px;\">");
            sb.Append(Util.GetConfigValue("Domain", Request.UserHostAddress));
            sb.Append("</td>");
            sb.Append("</tr>");
            sb.Append("<tr>");
            sb.Append("<td colspan=\"7\" style=\"text-align:center;text-transform: uppercase;font-weight:bold;\" >DANH SÁCH ĐƠN HÀNG</td>");
            sb.Append("</tr>");

            sb.Append("<tr style=\"background:#555555;color:#FFFFFF;font-weight: bold\">");
            sb.Append("<td style=\"border-right:1px dotted #ccc;border-bottom:1px dotted #ccc;border-top:1px dotted #ccc;border-left:1px dotted #ccc;text-align:center;width:80px;\">STT<br/></td>")
            .Append("<td style=\"border-right:1px dotted #ccc;border-bottom:1px dotted #ccc;text-align:center;border-top:1px dotted #ccc;width:200px;\">Mã<br/></td>")
            .Append("<td style=\"border-right:1px dotted #ccc;border-bottom:1px dotted #ccc;text-align:center;border-top:1px dotted #ccc;width:350px;\">Tên<br/></td>")
            .Append("<td style=\"border-right:1px dotted #ccc;border-bottom:1px dotted #ccc;text-align:center;border-top:1px dotted #ccc;width:200px;\">Ngày tạo</td>")
            .Append("<td style=\"border-right:1px dotted #ccc;border-bottom:1px dotted #ccc;text-align:center;border-top:1px dotted #ccc;width:200px;\">Địa chỉ</td>")
            .Append("<td style=\"border-right:1px dotted #ccc;border-bottom:1px dotted #ccc;text-align:center;border-top:1px dotted #ccc;width:200px;\">Email/Điện thoại</td>")
            .Append("<td style=\"border-right:1px dotted #ccc;border-bottom:1px dotted #ccc;text-align:center;border-top:1px dotted #ccc;width:250px;\">Tổng tiền</td>")
            .Append("<td style=\"border-right:1px dotted #ccc;border-bottom:1px dotted #ccc;text-align:center;border-top:1px dotted #ccc;width:250px;\">Thanh toán</td>")
            .Append("<td style=\"border-right:1px dotted #ccc;border-bottom:1px dotted #ccc;text-align:center;border-top:1px dotted #ccc;width:250px;\">Trạng thái</td>");
            sb.Append("</tr>");
            for (int i = 0; i < arrAll.Count; i++)
            {
                var index = i + 1;
                sb.Append("<tr>");
                sb.Append("<td style=\"border-right:1px dotted #ccc;border-bottom:1px dotted #ccc;text-align:center;border-left:1px dotted #ccc;\">" + index + "</td>");
                sb.Append("<td style=\"border-right:1px dotted #ccc;border-bottom:1px dotted #ccc;text-align:center;\">" + arrAll[i].Code + "</td>");
                sb.Append("<td style=\"border-right:1px dotted #ccc;border-bottom:1px dotted #ccc;text-align:center;\">" + arrAll[i].Name + "</td>");
                sb.Append("<td style=\"border-right:1px dotted #ccc;border-bottom:1px dotted #ccc;text-align:center;\">" + Convert.ToDateTime(arrAll[i].CreateDate).ToString("dd/MM/yyyy") + "</td>");
                sb.Append("<td style=\"border-right:1px dotted #ccc;border-bottom:1px dotted #ccc;text-align:center;\">" + arrAll[i].Address + "</td>");
                sb.Append("<td style=\"border-right:1px dotted #ccc;border-bottom:1px dotted #ccc;text-align:center;\">" + arrAll[i].Email + "/" + arrAll[i].Phone + "</td>");
                sb.Append("<td style=\"border-right:1px dotted #ccc;border-bottom:1px dotted #ccc;text-align:center;\">" + CommonGlobal.FormatMoney(arrAll[i].Total) + "</td>");
                sb.Append("<td style=\"border-right:1px dotted #ccc;border-bottom:1px dotted #ccc;text-align:center;\">" + CommonGlobal.GetPaymentStatusString(int.Parse(arrAll[i].Payment ?? "0")) + "</td>");
                sb.Append("<td style=\"border-right:1px dotted #ccc;border-bottom:1px dotted #ccc;text-align:center;\">" + CommonGlobal.GetOrderStatusString(arrAll[i].Process ?? 0) + "</td>");
                sb.Append("</tr>");
            }

            string test = sb.ToString();
            sb.Append("<tr><td colspan=\"6\" style=\"text-transform:uppercase;padding-top:20px;padding-left:20px;text-align:left;\">Nhân viên thống kê</td></tr>");
            sb.Append("<tr><td colspan=\"6\" style=\"text-transform:uppercase;padding-top:-20px;position: relative;text-align:right;padding-right:20px;\">" + this.Session["mem"] + "</td></tr>");
            sb.Append("</table>");

            if (type_export == 3)
            {
                StringReader str = new StringReader(sb.ToString());
                HTMLWorker htmlworker = new HTMLWorker(document);
                htmlworker.Parse(str);
                PdfWriter.GetInstance(document, Response.OutputStream);

                Response.Flush();
                Response.Close();
                document.Close();

                Response.Write(document);
            }
            else
            {
                Response.Write(sb.ToString());
            }

            Response.End();
            return this.Json("ok");
        }


        /// <summary>
        /// Exports the document.
        /// </summary>
        /// <param name="type_export">The type export.</param>
        /// <param name="from_date">From date.</param>
        /// <param name="to_date">To date.</param>
        /// <param name="payment">The payment.</param>
        /// <param name="process">The process.</param>
        /// <param name="act">The act.</param>
        /// <param name="ctrl">The control.</param>
        /// <param name="type_act">The type act.</param>
        /// <param name="search">The search.</param>
        /// <param name="page">The page.</param>
        /// <param name="page_size">The page_size.</param>
        /// <param name="order_by">The order by.</param>
        /// <param name="order_type">Type of the order.</param>
        /// <returns>
        /// Export document
        /// </returns>
        [Obsolete]
        public ActionResult Export_documentCategory(int? type_export, int? parentId, string type, string lang, string act, string ctrl, string type_act, string search, int? page, int? page_size, string order_by, string order_type)
        {
            CatalogModels cateModels = new CatalogModels();
            C_Catalog catelog = new C_Catalog();
            StringBuilder sb = new StringBuilder();
            var list_order_view = new Web.Areas.Admin.ViewModels.List_order_view();
            int total_record = 0;
            string file_name = string.Empty;

            if (string.IsNullOrEmpty(type))
            {
                type = Request.QueryString["type"] != null ? Request.QueryString["type"].ToString() : CommonGlobal.CateProduct;
            }

            if (parentId == null)
            {
                parentId = Request.QueryString["parentId"] != null ? int.Parse(Request.QueryString["parentId"].ToString()) : 0;
            }

            if (string.IsNullOrEmpty(act))
            {
                act = Request.QueryString["act"] != null ? Request.QueryString["act"].ToString() : "list_order";
            }

            if (string.IsNullOrEmpty(ctrl))
            {
                ctrl = Request.QueryString["ctrl"] != null ? Request.QueryString["ctrl"].ToString() : "adminOrder";
            }

            if (page == null || page == 0)
            {
                page = Request.QueryString["page"] != null ? Convert.ToInt32(Request.QueryString["page"].ToString()) : 1;
            }

            if (page_size == null)
            {
                page_size = int.Parse(Util.GetConfigValue("NumberPageSizeAdmin", "30"));
            }

            if (string.IsNullOrEmpty(order_by) || string.IsNullOrEmpty(order_type))
            {
                order_by = "CreateDate";
                order_type = "desc";
            }

            if (type_export == null)
            {
                type_export = 1;
            }

            if (string.IsNullOrEmpty(lang))
            {
                lang = LanguageModels.ActiveLanguage().LangCultureName;
            }

            var ms = new MemoryStream();
            Document document = new Document(PageSize.A4, 40, 40, 40, 40);
            PagedList<C_Catalog> arrAll = cateModels.GetAllCatalogByParentID((int)parentId, type, lang, search, (int)page, (int)page_size, order_by, order_type, out total_record);
            Response.Buffer = true;
            Response.Clear();

            if (type_export == 1)
            {
                ////export to excel
                Response.AddHeader("Content-Disposition", "attachment; filename=Danh_sach_danh_muc_" + DateTime.Now.ToString("dd/MM/yyyy") + ".xls");
                Response.ContentType = "application/ms-excel";
                file_name = "Danh_sach_danh_muc_" + DateTime.Now.ToString("dd/MM/yyyy") +  ".xls";
            }
            else if (type_export == 2)
            {
                ////export to word
                Response.AddHeader("Content-Disposition", "attachment; filename=Danh_sach_danh_muc_" + DateTime.Now.ToString("dd/MM/yyyy") + ".doc");
                Response.ContentType = "application/ms-word";
                file_name = "Danh_sach_danh_muc_" + DateTime.Now.ToString("dd/MM/yyyy") + ".doc";
            }
            else if (type_export == 3)
            {
                ////export to pdf
                Response.AddHeader("content-disposition", "attachment; filename=Danh_sach_don_hang_" + DateTime.Now.ToString("dd/MM/yyyy") + ".pdf");
                Response.ContentType = "application/octet-stream";

                ////PdfWriter.GetInstance(document, ms);
                PdfWriter.GetInstance(document, Response.OutputStream);
                document.Open();
                file_name = "Danh_sach_danh_muc_" + DateTime.Now.ToString("dd/MM/yyyy") + ".pdf";
            }

            Response.Charset = string.Empty;
            Response.ContentEncoding = Encoding.Unicode;
            Response.BinaryWrite(Encoding.Unicode.GetPreamble());

            sb.Append("<table border=\"0\" cellspacing=\"0\" cellpadding=\"0\" style=\"padding:0px;margin:0px;width:27.7cm\" >");
            sb.Append("<tr>");
            sb.Append("<td colspan=\"7\" style=\"text-align:left;font-weight:bold;padding-bottom:10px;\">");
            sb.Append(Util.GetConfigValue("Domain", Request.UserHostAddress));
            sb.Append("</td>");
            sb.Append("</tr>");
            sb.Append("<tr>");
            sb.Append("<td colspan=\"7\" style=\"text-align:center;text-transform: uppercase;font-weight:bold;\" >DANH SÁCH DANH MỤC</td>");
            sb.Append("</tr>");

            sb.Append("<tr style=\"background:#555555;color:#FFFFFF;font-weight: bold\">");
            sb.Append("<td style=\"border-right:1px dotted #ccc;border-bottom:1px dotted #ccc;border-top:1px dotted #ccc;border-left:1px dotted #ccc;text-align:center;width:80px;\">STT<br/></td>")
            .Append("<td style=\"border-right:1px dotted #ccc;border-bottom:1px dotted #ccc;text-align:center;border-top:1px dotted #ccc;width:350px;\">Tên danh mục<br/></td>")
            .Append("<td style=\"border-right:1px dotted #ccc;border-bottom:1px dotted #ccc;text-align:center;border-top:1px dotted #ccc;width:200px;\">Mô tả</td>");
            sb.Append("</tr>");
            for (int i = 0; i < arrAll.Count; i++)
            {
                var index = i + 1;
                sb.Append("<tr>");
                sb.Append("<td style=\"border-right:1px dotted #ccc;border-bottom:1px dotted #ccc;text-align:center;border-left:1px dotted #ccc;\">" + index + "</td>");
                sb.Append("<td style=\"border-right:1px dotted #ccc;border-bottom:1px dotted #ccc;\">" + arrAll[i].CategoryName + "</td>");
                sb.Append("<td style=\"border-right:1px dotted #ccc;border-bottom:1px dotted #ccc;\">" + arrAll[i].Description + "</td>");
                sb.Append("</tr>");
            }

            string test = sb.ToString();
            sb.Append("<tr><td colspan=\"6\" style=\"text-transform:uppercase;padding-top:20px;padding-left:20px;text-align:left;\">Nhân viên thống kê</td></tr>");
            sb.Append("<tr><td colspan=\"6\" style=\"text-transform:uppercase;padding-top:-20px;position: relative;text-align:right;padding-right:20px;\">" + this.Session["mem"] + "</td></tr>");
            sb.Append("</table>");

            if (type_export == 3)
            {
                StringReader str = new StringReader(sb.ToString());
                HTMLWorker htmlworker = new HTMLWorker(document);
                htmlworker.Parse(str);
                PdfWriter.GetInstance(document, Response.OutputStream);

                Response.Flush();
                Response.Close();
                document.Close();

                Response.Write(document);
            }
            else
            {
                Response.Write(sb.ToString());
            }

            Response.End();
            return this.Json("ok");
        }


        /// <summary>
        /// Exports the document.
        /// </summary>
        /// <param name="type_export">The type export.</param>
        /// <param name="from_date">From date.</param>
        /// <param name="to_date">To date.</param>
        /// <param name="payment">The payment.</param>
        /// <param name="process">The process.</param>
        /// <param name="act">The act.</param>
        /// <param name="ctrl">The control.</param>
        /// <param name="type_act">The type act.</param>
        /// <param name="search">The search.</param>
        /// <param name="page">The page.</param>
        /// <param name="page_size">The page_size.</param>
        /// <param name="order_by">The order by.</param>
        /// <param name="order_type">Type of the order.</param>
        /// <returns>
        /// Export document
        /// </returns>
        [Obsolete]
        public ActionResult Export_documentProduct(int? type_export, int? parent, string type, string lang, string act, string ctrl, string type_act, string search, int? page, int? page_size, string order_by, string order_type, bool? is_show, bool? is_hot, bool? is_promotion)
        {
            ProductModels proModels = new ProductModels();
            CatalogModels cataModels = new CatalogModels();
            C_Product product = new C_Product();
            StringBuilder sb = new StringBuilder();
            var list_order_view = new Web.Areas.Admin.ViewModels.List_order_view();
            int total_record = 0;
            string file_name = string.Empty;

            if (string.IsNullOrEmpty(type))
            {
                type = Request.QueryString["type"] != null ? Request.QueryString["type"].ToString() : CommonGlobal.CateProduct;
            }

            if (parent == null)
            {
                parent = Request.QueryString["parent"] != null ? int.Parse(Request.QueryString["parent"].ToString()) : 0;
            }

            if (string.IsNullOrEmpty(act))
            {
                act = Request.QueryString["act"] != null ? Request.QueryString["act"].ToString() : "list_order";
            }

            if (string.IsNullOrEmpty(ctrl))
            {
                ctrl = Request.QueryString["ctrl"] != null ? Request.QueryString["ctrl"].ToString() : "adminOrder";
            }

            if (page == null || page == 0)
            {
                page = Request.QueryString["page"] != null ? Convert.ToInt32(Request.QueryString["page"].ToString()) : 1;
            }

            if (page_size == null)
            {
                page_size = int.Parse(Util.GetConfigValue("NumberPageSizeAdmin", "30"));
            }

            if (string.IsNullOrEmpty(order_by) || string.IsNullOrEmpty(order_type))
            {
                order_by = "CreateDate";
                order_type = "desc";
            }

            if (type_export == null)
            {
                type_export = 1;
            }

            if (string.IsNullOrEmpty(lang))
            {
                lang = LanguageModels.ActiveLanguage().LangCultureName;
            }

            var ms = new MemoryStream();
            Document document = new Document(PageSize.A4, 40, 40, 40, 40);
            int Total_store = 0;
            int Total_borrow = 0;
            int Total_in_stock = 0;
            PagedList<C_Product> arrAll = proModels.AdminGetAllProductByParentIDALL((int)parent, type, lang, search, (int)page, (int)page_size, order_by, order_type, is_show ?? false, is_hot ?? false, is_promotion ?? false, out total_record, out Total_store, out Total_borrow, out Total_in_stock);
            Response.Buffer = true;
            Response.Clear();

            if (type_export == 1)
            {
                ////export to excel
                Response.AddHeader("Content-Disposition", "attachment; filename=Danh_sach_sach_" + DateTime.Now.ToString("dd/MM/yyyy") + ".xls");
                Response.ContentType = "application/ms-excel";
                file_name = "Danh_sach_sach" + DateTime.Now.ToString("dd/MM/yyyy") + ".xls";
            }
            else if (type_export == 2)
            {
                ////export to word
                Response.AddHeader("Content-Disposition", "attachment; filename=Danh_sach_sach_" + DateTime.Now.ToString("dd/MM/yyyy") + ".doc");
                Response.ContentType = "application/ms-word";
                file_name = "Danh_sach_sach_" + DateTime.Now.ToString("dd/MM/yyyy") + ".doc";
            }
            else if (type_export == 3)
            {
                ////export to pdf
                Response.AddHeader("content-disposition", "attachment; filename=Danh_sach_sach_" + DateTime.Now.ToString("dd/MM/yyyy") + ".pdf");
                Response.ContentType = "application/octet-stream";

                ////PdfWriter.GetInstance(document, ms);
                PdfWriter.GetInstance(document, Response.OutputStream);
                document.Open();
                file_name = "Danh_sach_sach_" + DateTime.Now.ToString("dd/MM/yyyy") + ".pdf";
            }

            Response.Charset = string.Empty;
            Response.ContentEncoding = Encoding.Unicode;
            Response.BinaryWrite(Encoding.Unicode.GetPreamble());

            sb.Append("<table border=\"0\" cellspacing=\"0\" cellpadding=\"0\" style=\"padding:0px;margin:0px;width:27.7cm\" >");
            sb.Append("<tr>");
            sb.Append("<td colspan=\"7\" style=\"text-align:left;font-weight:bold;padding-bottom:10px;\">");
            sb.Append(Util.GetConfigValue("Domain", Request.UserHostAddress));
            sb.Append("</td>");
            sb.Append("</tr>");
            sb.Append("<tr>");
            sb.Append("<td colspan=\"7\" style=\"text-align:center;text-transform: uppercase;font-weight:bold;\" >DANH SÁCH SÁCH</td>");
            sb.Append("</tr>");

            sb.Append("<tr style=\"background:#555555;color:#FFFFFF;font-weight: bold\">");
            sb.Append("<td style=\"border-right:1px dotted #ccc;border-bottom:1px dotted #ccc;border-top:1px dotted #ccc;border-left:1px dotted #ccc;text-align:center;width:80px;\">STT<br/></td>")
            .Append("<td style=\"border-right:1px dotted #ccc;border-bottom:1px dotted #ccc;text-align:left;border-top:1px dotted #ccc;width:150px;\">Mã số<br/></td>")
            .Append("<td style=\"border-right:1px dotted #ccc;border-bottom:1px dotted #ccc;text-align:center;border-top:1px dotted #ccc;width:600px;\">Tên sách</td>")
             .Append("<td style=\"border-right:1px dotted #ccc;border-bottom:1px dotted #ccc;text-align:center;border-top:1px dotted #ccc;width:400px;\">Danh mục</td>");
            //.Append("<td style=\"border-right:1px dotted #ccc;border-bottom:1px dotted #ccc;text-align:center;border-top:1px dotted #ccc;width:200px;\">Tác giả</td>")
            // .Append("<td style=\"border-right:1px dotted #ccc;border-bottom:1px dotted #ccc;text-align:center;border-top:1px dotted #ccc;width:200px;\">Mã nước xuất bản</td>")
            //    .Append("<td style=\"border-right:1px dotted #ccc;border-bottom:1px dotted #ccc;text-align:center;border-top:1px dotted #ccc;width:200px;\">Năm xuất bản</td>");
            sb.Append("</tr>");
            for (int i = 0; i < arrAll.Count; i++)
            {
                var index = i + 1;
                sb.Append("<tr>");
                sb.Append("<td style=\"border-right:1px dotted #ccc;border-bottom:1px dotted #ccc;text-align:center;border-left:1px dotted #ccc;\">" + index + "</td>");
                sb.Append("<td style=\"border-right:1px dotted #ccc;border-bottom:1px dotted #ccc;text-align:left;\">" + arrAll[i].ProductCode + "</td>");
                sb.Append("<td style=\"border-right:1px dotted #ccc;border-bottom:1px dotted #ccc;\">" + arrAll[i].ProductName + "</td>");
                if(arrAll[i].CatalogID == null)
                {
                    sb.Append("<td style=\"border-right:1px dotted #ccc;border-bottom:1px dotted #ccc;\">Không thuộc danh mục nào</td>");
                }
                else
                {
                   if(arrAll[i].CatalogID.Contains(","))
                    {
                        sb.Append("<td style=\"border-right:1px dotted #ccc;border-bottom:1px dotted #ccc;\">");
                        var text = String.Empty;
                        foreach (var item in arrAll[i].CatalogID.Split(','))
                        {
                            var cat = cataModels.GetbyID(int.Parse(item));
                            if (cat != null)
                            {
                                if(String.IsNullOrEmpty(text))
                                {
                                    text += cat.CategoryName;
                                }
                                else
                                {
                                    text += "," + cat.CategoryName;
                                }
                            }
                        }

                        sb.Append(text);
                        sb.Append("</td>");
                    }
                   else
                    {
                            sb.Append("<td style=\"border-right:1px dotted #ccc;border-bottom:1px dotted #ccc;\">" + cataModels.GetbyID(int.Parse(arrAll[i].CatalogID)).CategoryName + "</td>");
                    }
                }
                
                //sb.Append("<td style=\"border-right:1px dotted #ccc;border-bottom:1px dotted #ccc;\">" + arrAll[i].DocAuthor + "</td>");
                //sb.Append("<td style=\"border-right:1px dotted #ccc;border-bottom:1px dotted #ccc;\">" + arrAll[i].DocCountryCode + "</td>");
                //sb.Append("<td style=\"border-right:1px dotted #ccc;border-bottom:1px dotted #ccc;\">" + arrAll[i].DocNamXuatBan + "</td>");
                sb.Append("</tr>");
            }

            string test = sb.ToString();
            sb.Append("<tr><td colspan=\"6\" style=\"text-transform:uppercase;padding-top:20px;padding-left:20px;text-align:left;\">Tổng số sách</td></tr>");
            sb.Append("<tr><td colspan=\"6\" style=\"text-transform:uppercase;padding-top:-20px;position: relative;text-align:right;padding-right:20px;\">" + total_record + "</td></tr>");
            sb.Append("<tr><td colspan=\"6\" style=\"text-transform:uppercase;padding-top:20px;padding-left:20px;text-align:left;\">Nhân viên thống kê</td></tr>");
            sb.Append("<tr><td colspan=\"6\" style=\"text-transform:uppercase;padding-top:-20px;position: relative;text-align:right;padding-right:20px;\">" + this.Session["mem"] + "</td></tr>");
            sb.Append("</table>");

            if (type_export == 3)
            {
                StringReader str = new StringReader(sb.ToString());
                HTMLWorker htmlworker = new HTMLWorker(document);
                htmlworker.Parse(str);
                PdfWriter.GetInstance(document, Response.OutputStream);

                Response.Flush();
                Response.Close();
                document.Close();

                Response.Write(document);
            }
            else
            {
                Response.Write(sb.ToString());
            }

            Response.End();
            return this.Json("ok");
        }

        /// <summary>
        /// Lists the order.
        /// </summary>
        /// <param name="code">The code.</param>
        /// <param name="from_date">From date.</param>
        /// <param name="to_date">To date.</param>
        /// <param name="payment">The payment.</param>
        /// <param name="process">The process.</param>
        /// <param name="act">The act.</param>
        /// <param name="ctrl">The control.</param>
        /// <param name="type_act">The type act.</param>
        /// <param name="type">The type.</param>
        /// <param name="search">The search.</param>
        /// <param name="page">The page.</param>
        /// <param name="page_size">The page_size.</param>
        /// <param name="order_by">The order by.</param>
        /// <param name="order_type">Type of the order.</param>
        /// <returns>
        /// List order
        /// </returns>
        [ChildActionOnly]
        public ActionResult List_order(string code, DateTime? from_date, DateTime? to_date, string payment, int? process, string act, string ctrl, string type_act, string type, string search, int? page, int? page_size, string order_by, string order_type)
        {
            OrderModels orderModels = new OrderModels();
            order corder = new order();
            StringBuilder sb = new StringBuilder();
            var list_order_view = new Web.Areas.Admin.ViewModels.List_order_view();
            int total_record = 0;

            if (from_date == null)
            {
                from_date = DateTime.Now.AddMonths(-1);
            }

            if (to_date == null)
            {
                to_date = DateTime.Now;
            }

            if (string.IsNullOrEmpty(payment))
            {
                payment = Request.QueryString["Payment"] != null ? Request.QueryString["Payment"].ToString() : CommonGlobal.PaymentAll.ToString();
            }

            if (process == null)
            {
                process = Request.QueryString["Process"] != null ? int.Parse(Request.QueryString["Process"].ToString()) : CommonGlobal.OrderProcessAll;
            }

            if (string.IsNullOrEmpty(act))
            {
                act = Request.QueryString["act"] != null ? Request.QueryString["act"].ToString() : "list_order";
            }

            if (string.IsNullOrEmpty(ctrl))
            {
                ctrl = Request.QueryString["ctrl"] != null ? Request.QueryString["ctrl"].ToString() : "adminOrder";
            }

            if (page == null || page == 0)
            {
                page = Request.QueryString["page"] != null ? Convert.ToInt32(Request.QueryString["page"].ToString()) : 1;
            }

            if (page_size == null)
            {
                page_size = int.Parse(Util.GetConfigValue("NumberPageSizeAdmin", "30"));
            }

            if (string.IsNullOrEmpty(order_by) || string.IsNullOrEmpty(order_type))
            {
                order_by = "CreateDate";
                order_type = "desc";
            }

            if (code != null && type_act != null && type_act == CommonGlobal.Delete)
            {
                if (UserModels.CheckPermission(this.Session["mem"] != null ? this.Session["mem"].ToString() : string.Empty, act, ctrl, type_act, type ?? string.Empty)) 
                {
                    corder = orderModels.GetOrdersbyCode(code);
                    if (corder != null)
                    {
                        ////delete order
                        bool rt = orderModels.Delete_Orders(code);
                        if (rt)
                        {
                            list_order_view.Message = "Bạn đã xóa mã mượn sách  :" + code;
                        }
                        else
                        {
                            list_order_view.Message = "Xóa không thành công";
                        }
                    }
                    else
                    {
                        list_order_view.Message = "Không tìm thấy mã mượn sách : " + code;
                    }
                }
                else
                {
                    list_order_view.Message = " Bạn không có quyền xóa.";
                }
            }

            list_order_view.Cate_type = "kho";
            list_order_view.Type_act = type_act;
            ////tab
            sb.Append("<li class=\"active\"><a href=\"#\"><span><span>Danh sách mượn</span></span></a></li>");
            list_order_view.Html_link_tab = sb.ToString();
            ////list page size and paging
            list_order_view.List_page_size = this.GetSizePagingPublic((int)page_size);
            list_order_view.Page = (int)page;
            list_order_view.Page_size = (int)page_size;
            ////list catalog
            list_order_view.Page_list_order = orderModels.GetAllOrderByAdmin((DateTime)from_date, (DateTime)to_date, payment, (int)process, search, (int)page, (int)page_size, order_by, order_type, out total_record);
            list_order_view.Search = search;
            list_order_view.Order_by = order_by;
            list_order_view.Order_type = order_type;
            list_order_view.Total_record = total_record;
            ////Filter
            list_order_view.Payment = payment;
            list_order_view.Process = (int)process;
            list_order_view.From_date = (DateTime)from_date;
            list_order_view.To_date = (DateTime)to_date;
            list_order_view.List_payment_status = this.GetPaymentStatusSelect(int.Parse(payment));
            list_order_view.List_order_process = this.GetOrderProcessSelect((int)process);
            ////acton and parent action
            list_order_view.Act = act;
            list_order_view.Ctrl = ctrl;
            list_order_view.Parent_action = HttpContext.Request.RequestContext.RouteData.Values["action"].ToString();
            list_order_view.Parent_controller = HttpContext.Request.RequestContext.RouteData.Values["controller"].ToString();

            return this.PartialView("../control/list_order", list_order_view);
        }

        /// <summary>
        /// Creates the PDF.
        /// </summary>
        /// <param name="html">The HTML.</param>
        /// <param name="document">The document.</param>
        /// <returns>Create PDF</returns>
        [Obsolete]
        private MemoryStream CreatePDF(string html, Document document)
        {
            MemoryStream memoryOutput = new MemoryStream();
            TextReader reader = new StringReader(html);

            //// step 1: creation of a document-object
            ////Document document = new Document(PageSize.A4, 30, 30, 30, 30);

            //// step 2:
            //// we create a writer that listens to the document
            //// and directs a XML-stream to a file
            PdfWriter writer = PdfWriter.GetInstance(document, memoryOutput);

            //// step 3: we create a worker parse the document
            HTMLWorker worker = new HTMLWorker(document);

            //// step 4: we open document and start the worker on the document
            document.Open();
            worker.StartDocument();

            //// step 5: parse the html into the document
            worker.Parse(reader);

            //// step 6: close the document and the worker
            worker.EndDocument();
            worker.Close();
            document.Close();

            return memoryOutput;
        }


        /// <summary>
        /// Find product for add ajax the detail.
        /// </summary>
        /// <returns>Wish list detail</returns>
        [AcceptVerbs(HttpVerbs.Post)]
        public ActionResult FindBook(string name)
        {
            if (string.IsNullOrEmpty(this.Lang))
            {
                this.Lang = LanguageModels.ActiveLanguage().LangCultureName;
            }

            ProductModels proModels = new ProductModels();
            //var list_product = proModels.GetAllProducts(name, this.Lang, true).Where(p => (p.Store - (p.Borrow??0)) > 0);
            var list_product = proModels.GetAllProducts(name, this.Lang, true);
            List<C_Product> list_result = null;
            if (list_product != null)
            {
                list_result = list_product.Take(12).ToList();
            }
            List<Suggestions> listSuggestions = new List<Suggestions>();

            if (list_result != null) {
                foreach (var item in list_result) {
                    var obj = new Suggestions()
                    {
                        Name = item.ProductName,
                        Id = item.ProductID
                    };
                    listSuggestions.Add(obj);
                }
            }

            var jsonSerialiser = new JavaScriptSerializer();
            var json = jsonSerialiser.Serialize(listSuggestions);
            
            return this.Json(json);
        }

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