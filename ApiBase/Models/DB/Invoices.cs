using System;
using System.Collections.Generic;

namespace ApiBase.Models.DB
{
    public partial class Invoices
    {
        public int Id { get; set; }
        public string OrderCode { get; set; }
        public DateTime? CreateDate { get; set; }
        public string InvoiceContent { get; set; }
        public int? Status { get; set; }
    }
}
