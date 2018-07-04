using System;
using System.Collections.Generic;

namespace ApiBase.Models.DB
{
    public partial class Link
    {
        public int Id { get; set; }
        public string Title { get; set; }
        public string Summary { get; set; }
        public string LinkContent { get; set; }
        public string Link1 { get; set; }
        public string ImagePath { get; set; }
        public string Type { get; set; }
        public int? OrderDisplay { get; set; }
        public string Lang { get; set; }
    }
}
