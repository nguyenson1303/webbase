using System;
using System.Collections.Generic;

namespace ApiBase.Models.DB
{
    public partial class Payment
    {
        public int Id { get; set; }
        public int? InvoiceId { get; set; }
        public double? Amount { get; set; }
        public DateTime? CreateDate { get; set; }
        public string PaymentContent { get; set; }
        public string PaymentMenthod { get; set; }
        public string TransactionInfor { get; set; }
        public string TranscactionStatus { get; set; }
        public int? PaymentType { get; set; }
        public double? NetAmount { get; set; }
        public double? FeeAmount { get; set; }
        public int? MerchantId { get; set; }
        public string CustomerName { get; set; }
        public string CustomerEmail { get; set; }
        public string CustomerPhone { get; set; }
    }
}
