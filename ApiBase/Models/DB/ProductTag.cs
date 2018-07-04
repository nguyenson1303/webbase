using System;
using System.Collections.Generic;

namespace ApiBase.Models.DB
{
    public partial class ProductTag
    {
        public int ProductTagId { get; set; }
        public int ProductId { get; set; }
        public string Tag { get; set; }
        public string Link { get; set; }
    }
}
