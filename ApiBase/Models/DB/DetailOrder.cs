using System;
using System.Collections.Generic;

namespace ApiBase.Models.DB
{
    public partial class DetailOrder
    {
        public int Id { get; set; }
        public int OrderId { get; set; }
        public int? ProductId { get; set; }
        public string ProductName { get; set; }
        public int? Quantity { get; set; }
        public double? Price { get; set; }
        public double? TotalPrice { get; set; }
        public string Propertices { get; set; }
        public string Code { get; set; }
    }
}
