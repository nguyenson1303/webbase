using System;
using System.Collections.Generic;

namespace ApiBase.Models.DB
{
    public partial class CatalogDetail
    {
        public int CatalogDetailId { get; set; }
        public int CatalogId { get; set; }
        public string CategoryName { get; set; }
        public string Link { get; set; }
        public string Intro { get; set; }
        public string MoreInfo { get; set; }
        public string Lang { get; set; }
        public string Keyword { get; set; }
        public string Description { get; set; }
        public string Title { get; set; }
        public DateTime? CreateDate { get; set; }
        public DateTime? ModifyDate { get; set; }
    }
}
