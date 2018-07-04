using System;
using System.Collections.Generic;

namespace ApiBase.Models.DB
{
    public partial class ImageProducts
    {
        public int Id { get; set; }
        public int? MaSp { get; set; }
        public string Images { get; set; }
        public string ImagesFull { get; set; }
    }
}
