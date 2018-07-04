using System;
using System.Collections.Generic;

namespace ApiBase.Models.DB
{
    public partial class Pages
    {
        public int PageId { get; set; }
        public string PageName { get; set; }
        public string Link { get; set; }
        public string ImagePath { get; set; }
        public string Summary { get; set; }
        public string PageContent { get; set; }
        public DateTime? DateModified { get; set; }
        public bool? Show { get; set; }
        public string Lang { get; set; }
        public string Keyword { get; set; }
        public string Description { get; set; }
        public string Title { get; set; }
        public int? OrderDisplay { get; set; }
    }
}
