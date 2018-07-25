using System;
using System.Collections.Generic;

namespace ApiBase.Models.DB
{
    public partial class Catalog
    {
        public int CatalogId { get; set; }
        public int? ParentId { get; set; }
        public string CategoryName { get; set; }
        public string Link { get; set; }
        public string ImagePath { get; set; }
        public string Intro { get; set; }
        public string MoreInfo { get; set; }
        public string Lang { get; set; }
        public bool? Show { get; set; }
        public string Keyword { get; set; }
        public string Description { get; set; }
        public string Title { get; set; }
        public string Type { get; set; }
        public int? OrderDisplay { get; set; }
        public DateTime? CreateDate { get; set; }
        public DateTime? ModifyDate { get; set; }
    }
}
