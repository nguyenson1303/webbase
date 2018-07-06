namespace ApiBase.Models.BusinessAccess
{
    using ApiBase.Models.DB;
    using Microsoft.EntityFrameworkCore;
    using System;
    using System.Collections.Generic;
    using System.Linq;

    /// <summary>
    /// Order Models
    /// </summary>
    public class OrderModels
    {
        /// <summary>
        /// Initializes a new instance of the <see cref="OrderModels"/> class.
        /// </summary>
        public OrderModels()
        {
        }

        /// <summary>
        /// Adds the invoices.
        /// </summary>
        /// <param name="it">invoice item</param>
        /// <returns>Add Invoices</returns>
        public int Add_Invoices(Invoices it)
        {
            using (var data = new themanorContext())
            {
                int rt;
                try
                {
                    ////one Invoice - one order
                    if (data.Invoices.Where(p => p.OrderCode == it.OrderCode).Count() == 0)       
                    {
                        data.Invoices.Add(it);
                        data.SaveChanges();
                        rt = it.Id;
                    }
                    else
                    {
                        rt = 0;
                    }
                }
                catch (Exception)
                {
                    rt = 0;
                }

                return rt;
            }
        }

        /// <summary>
        /// Adds the orders.
        /// </summary>
        /// <param name="it">order item</param>
        /// <returns>Add Orders</returns>
        public string Add_Orders(Orders it)
        {
            using (var data = new themanorContext())
            {
                string rt;
                try
                {
                    it.CreateDate = DateTime.Now;
                    //it.ModifyDate = DateTime.Now;

                    data.Orders.Add(it);
                    data.SaveChanges();
                    rt = it.Code;
                }
                catch (Exception)
                {
                    rt = string.Empty;
                }

                return rt;
            }
        }

        /// <summary>
        /// Adds the payment.
        /// </summary>
        /// <param name="it">payment item</param>
        /// <returns>Add Payment</returns>
        public int Add_Payment(Payment it)
        {
            using (var data = new themanorContext())
            {
                int rt;
                try
                {
                    data.Payment.Add(it);
                    data.SaveChanges();
                    rt = it.Id;
                }
                catch (Exception)
                {
                    rt = 0;
                }

                return rt;
            }
        }

        /// <summary>
        /// Deletes the invoices.
        /// </summary>
        /// <param name="id">The identifier.</param>
        /// <returns>Delete Invoices</returns>
        public bool Delete_Invoices(int id)
        {
            using (var data = new themanorContext())
            {
                bool rt;
                try
                {
                    var c_gen = data.Invoices.Where(p => p.Id == id).FirstOrDefault();
                    if (c_gen != null)
                    {
                        data.Invoices.Remove(c_gen);
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
        /// Deletes the orders.
        /// </summary>
        /// <param name="code">The code.</param>
        /// <returns>Delete Orders</returns>
        public bool Delete_Orders(string code)
        {
            using (var data = new themanorContext())
            {
                bool rt;
                try
                {
                    var c_gen = data.Orders.Where(p => p.Code == code).FirstOrDefault();
                    if (c_gen != null)
                    {
                        data.Orders.Remove(c_gen);
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
        /// Deletes the payment.
        /// </summary>
        /// <param name="id">The identifier.</param>
        /// <returns>Delete Payment</returns>
        public bool Delete_Payment(int id)
        {
            using (var data = new themanorContext())
            {
                bool rt;
                try
                {
                    var c_gen = data.Payment.Where(p => p.Id == id).FirstOrDefault();
                    if (c_gen != null)
                    {
                        data.Payment.Remove(c_gen);
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
        /// Edits the invoices.
        /// </summary>
        /// <param name="it">order item</param>
        /// <returns>Edit Invoices</returns>
        public bool Edit_Invoices(Invoices it)
        {
            using (var data = new themanorContext())
            {
                bool rt;
                try
                {
                    var c_gen = data.Invoices.Where(p => p.Id == it.Id).FirstOrDefault();
                    c_gen.InvoiceContent = it.InvoiceContent;
                    c_gen.OrderCode = it.OrderCode;
                    c_gen.Status = it.Status;
                    c_gen.CreateDate = it.CreateDate;

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
        /// Edits the orders.
        /// </summary>
        /// <param name="it">order item</param>
        /// <returns>Edit Orders</returns>
        public string Edit_Orders(Orders it)
        {
            using (var data = new themanorContext())
            {
                string rt = string.Empty;
                try
                {
                    var c_gen = data.Orders.Where(p => p.Code == it.Code).FirstOrDefault();
                    c_gen.Name = it.Name;
                    c_gen.Total = it.Total;
                    c_gen.Lname = it.Lname;
                    c_gen.Gender = it.Gender;
                    c_gen.Phone = it.Phone;
                    c_gen.Fax = it.Fax;
                    c_gen.Email = it.Email;
                    c_gen.City = it.City;
                    c_gen.Recive = it.Recive;
                    c_gen.Payment = it.Payment;
                    c_gen.Shipping = it.Shipping;
                    c_gen.Note = it.Note;
                    c_gen.CreateDate = it.CreateDate;
                    c_gen.Process = it.Process;
                    c_gen.Status = it.Status;
                    c_gen.Address = it.Address;
                    c_gen.ShipDate = it.ShipDate;
                    c_gen.UserCreate = it.UserCreate;
                    //c_gen.BorrowedDay = it.BorrowedDay;
                    //c_gen.PayDay = it.PayDay;
                    //c_gen.ModifyDate = DateTime.Now;

                    data.SaveChanges();
                    rt = it.Code;
                }
                catch (Exception)
                {
                    rt = string.Empty;
                }

                return rt;
            }
        }

        /// <summary>
        /// Edits the orders.
        /// </summary>
        /// <param name="it">order item</param>
        /// <returns>Edit Orders</returns>
        public bool QuantityUpdate(Orders it)
        {
            using (var data = new themanorContext())
            {
                bool rt = false;
                try
                {
                    var c_gen = data.Orders.Where(p => p.Code == it.Code).FirstOrDefault();
                    if (c_gen != null)
                    {
                        var c_gen_detail = data.DetailOrder.Where(p => p.Code == c_gen.Code).ToList();
                        if(c_gen_detail != null && c_gen_detail.Count > 0)
                        {
                            foreach(var item in c_gen_detail)
                            {
                                var pro = data.Product.Where(p => p.ProductId == item.ProductId).FirstOrDefault();
                                if(pro != null)
                                {
                                    int store_number = 0;
                                    int borrow_number = 0;
                                    store_number = pro.Store;
                                    //borrow_number = (pro.Borrow??0);
                                    if (c_gen.Process == 0 ) {
                                        // dang muon 
                                        store_number = store_number - (item.Quantity ?? 0);
                                        borrow_number = borrow_number + (item.Quantity ?? 0);
                                    }
                                    else if(c_gen.Process == 2 || c_gen.Process == 3)
                                    {
                                        // da tra || huy muon
                                        store_number = store_number + (item.Quantity ?? 0);
                                        borrow_number = borrow_number - (item.Quantity ?? 0);
                                    }

                                    if (store_number != pro.Store)
                                    {
                                        //pro.Borrow = borrow_number;
                                        pro.Store = store_number;
                                        data.SaveChanges();
                                        rt = true;
                                    }
                                }
                            }
                        }
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
        /// Edits the payment.
        /// </summary>
        /// <param name="it">payment item</param>
        /// <returns>Edit Payment</returns>
        public bool Edit_Payment(Payment it)
        {
            using (var data = new themanorContext())
            {
                bool rt;
                try
                {
                    var c_gen = data.Payment.Where(p => p.Id == it.Id).FirstOrDefault();
                    c_gen.InvoiceId = it.InvoiceId;
                    c_gen.PaymentContent = it.PaymentContent;
                    c_gen.PaymentMenthod = it.PaymentMenthod;
                    c_gen.TransactionInfor = it.TransactionInfor;
                    c_gen.TranscactionStatus = it.TranscactionStatus;
                    c_gen.Amount = it.Amount;
                    c_gen.CreateDate = it.CreateDate;

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
        /// Gets all order.
        /// </summary>
        /// <returns>get All Order</returns>
        public List<Orders> GetAllOrder()
        {
            using (var data = new themanorContext())
            {
                try
                {
                    var c_gen = data.Orders.OrderByDescending(p => p.Id).ToList();
                    return c_gen;
                }
                catch (Exception)
                {
                    return null;
                }
            }
        }

        /// <summary>
        /// Gets all order by admin.
        /// </summary>
        /// <param name="from_date">From date.</param>
        /// <param name="to_date">To date.</param>
        /// <param name="payment">The payment.</param>
        /// <param name="process">The process.</param>
        /// <param name="search">The search.</param>
        /// <param name="page_index">The page index.</param>
        /// <param name="page_size">The page size.</param>
        /// <param name="order_by">The order by.</param>
        /// <param name="order_type">Type of the order.</param>
        /// <param name="total">The total.</param>
        /// <returns>get All Order By Admin</returns>
        public List<Orders> GetAllOrderByAdmin(DateTime from_date, DateTime to_date, string payment, int process, string search, int page_index, int page_size, string order_by, string order_type, out int total)
        {
            using (var data = new themanorContext())
            {
                try
                {
                    IQueryable<Orders> c_gen = null;
                    //if (!string.IsNullOrEmpty(payment) && payment != "-1")
                    //{
                    //    c_gen = data.orders.Where(p => p.BorrowedDay >= from_date && p.BorrowedDay <= to_date && p.Payment == payment).OrderByDescending(p => p.CreateDate).AsQueryable<order>();
                    //}
                    //else
                    //{
                    //    c_gen = data.orders.Where(p => p.BorrowedDay >= from_date && p.BorrowedDay <= to_date).OrderByDescending(p => p.BorrowedDay).AsQueryable<order>();
                    //}

                    //if (process != -1)
                    //{
                    //    c_gen = data.orders.Where(p => p.BorrowedDay >= from_date && p.BorrowedDay <= to_date && p.Process == process).OrderByDescending(p => p.BorrowedDay).AsQueryable<order>();
                    //}
                    //else
                    //{
                    //    c_gen = data.orders.Where(p => p.BorrowedDay >= from_date && p.BorrowedDay <= to_date).OrderByDescending(p => p.BorrowedDay).AsQueryable<order>();
                    //}

                    if (!string.IsNullOrEmpty(search))
                    {
                        c_gen = c_gen.Where(p => p.Code == search).AsQueryable<Orders>();
                    }

                    total = c_gen.Count();

                    return c_gen.Skip((page_index-1) * page_size).Take(page_size).ToList();
                }
                catch (Exception)
                {
                    total = 0;
                    return null;
                }
            }
        }

        /// <summary>
        /// Gets all order by member.
        /// </summary>
        /// <param name="email">The email.</param>
        /// <param name="page_index">The page index.</param>
        /// <param name="page_size">The page site.</param>
        /// <param name="total">The total.</param>
        /// <returns>get All Order By Member</returns>
        public List<Orders> GetAllOrderByMember(string email, int page_index, int page_size, out int total)
        {
            using (var data = new themanorContext())
            {
                try
                {
                    var c_gen = data.Orders.Where(p => p.UserCreate == email).OrderByDescending(p => p.CreateDate).AsQueryable<Orders>();
                    total = c_gen.Count();

                    return c_gen.Skip((page_index-1) * page_size).Take(page_size).ToList();
                }
                catch (Exception)
                {
                    total = 0;
                    return null;
                }
            }
        }

        /// <summary>
        /// Gets all payment by invoice.
        /// </summary>
        /// <param name="invoice_Id">The invoice identifier.</param>
        /// <returns>get All Payment By Invoice</returns>
        public List<Payment> GetAllPaymentByInvoice(int invoice_Id)
        {
            using (var data = new themanorContext())
            {
                try
                {
                    var c_gen = data.Payment.Where(p => p.InvoiceId == invoice_Id).OrderByDescending(p => p.CreateDate).ToList();
                    return c_gen;
                }
                catch (Exception)
                {
                    return null;
                }
            }
        }

        /// <summary>
        /// Gets the invoices by identifier.
        /// </summary>
        /// <param name="id">The identifier.</param>
        /// <returns>get Invoices by ID</returns>
        public Invoices GetInvoicesbyID(int id)
        {
            using (var data = new themanorContext())
            {
                try
                {
                    var c_gen = data.Invoices.Where(p => p.Id == id).FirstOrDefault();
                    return c_gen;
                }
                catch (Exception)
                {
                    return null;
                }
            }
        }

        /// <summary>
        /// Gets the invoices by order code.
        /// </summary>
        /// <param name="code">The code.</param>
        /// <returns>get Invoices by Order Code</returns>
        public Invoices GetInvoicesbyOrderCode(string code)
        {
            using (var data = new themanorContext())
            {
                try
                {
                    var c_gen = data.Invoices.Where(p => p.OrderCode == code).FirstOrDefault();
                    return c_gen;
                }
                catch (Exception)
                {
                    return null;
                }
            }
        }

        /// <summary>
        /// Gets the order code unique.
        /// </summary>
        /// <returns>get Order Code Unique</returns>
        public string GetOrderCodeUnique()
        {
            using (var data = new themanorContext())
            {
                try
                {
                    var c_gen = data.Database.ExecuteSqlCommand("create_order_code").ToString();

                    //var c_gen = data.create_order_code().FirstOrDefault();
                    return c_gen;
                }
                catch (Exception)
                {
                    return string.Empty;
                }
            }
        }

        /// <summary>
        /// Gets the orders by code.
        /// </summary>
        /// <param name="code">The code.</param>
        /// <param name="user">The user.</param>
        /// <returns>get Orders by Code</returns>
        public Orders GetOrdersbyCode(string code, string user)
        {
            using (var data = new themanorContext())
            {
                try
                {
                    var c_gen = data.Orders.Where(p => p.Code == code && p.UserCreate == user).FirstOrDefault();
                    return c_gen;
                }
                catch (Exception)
                {
                    return null;
                }
            }
        }

        /// <summary>
        /// Gets the orders by code.
        /// </summary>
        /// <param name="code">The code.</param>
        /// <returns>get Orders by Code</returns>
        public Orders GetOrdersbyCode(string code)
        {
            using (var data = new themanorContext())
            {
                try
                {
                    var c_gen = data.Orders.Where(p => p.Code == code).FirstOrDefault();
                    return c_gen;
                }
                catch (Exception)
                {
                    return null;
                }
            }
        }

        /// <summary>
        /// Gets the orders by identifier.
        /// </summary>
        /// <param name="id">The identifier.</param>
        /// <returns>get Orders by ID</returns>
        public Orders GetOrdersbyID(int id)
        {
            using (var data = new themanorContext())
            {
                try
                {
                    var c_gen = data.Orders.Where(p => p.Id == id).FirstOrDefault();
                    return c_gen;
                }
                catch (Exception)
                {
                    return null;
                }
            }
        }

        /// <summary>
        /// Gets the payment by identifier.
        /// </summary>
        /// <param name="id">The identifier.</param>
        /// <returns>Get Payment by ID</returns>
        public Payment GetPaymentbyID(int id)
        {
            using (var data = new themanorContext())
            {
                try
                {
                    var c_gen = data.Payment.Where(p => p.Id == id).FirstOrDefault();
                    return c_gen;
                }
                catch (Exception)
                {
                    return null;
                }
            }
        }
    }
}