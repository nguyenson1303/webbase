using System;
using System.Collections.Generic;

namespace ApiBase.Models.DB
{
    public partial class ProductProperty
    {
        public int? ProductId { get; set; }
        public string Name { get; set; }
        public string Value { get; set; }
        public string Type { get; set; }
        public int ProId { get; set; }
    }
}
