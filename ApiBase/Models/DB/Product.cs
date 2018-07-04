using System;
using System.Collections.Generic;

namespace ApiBase.Models.DB
{
    public partial class Product
    {
        public int ProductId { get; set; }
        public string ProductName { get; set; }
        public string ProductCode { get; set; }
        public string CatalogId { get; set; }
        public string Summary { get; set; }
        public string Content { get; set; }
        public string ImagePath { get; set; }
        public string ImageBigPath { get; set; }
        public DateTime? DateModify { get; set; }
        public int Store { get; set; }
        public string Promotion { get; set; }
        public string Warranty { get; set; }
        public string Manufacture { get; set; }
        public decimal PriceOld { get; set; }
        public decimal? PriceNew { get; set; }
        public int Views { get; set; }
        public int OrderDisplay { get; set; }
        public string Lang { get; set; }
        public bool? IsShow { get; set; }
        public bool IsHot { get; set; }
        public bool IsPromotion { get; set; }
        public string Link { get; set; }
        public bool? Approve { get; set; }
        public DateTime? StartDate { get; set; }
        public DateTime? EndDate { get; set; }
        public int? Rating { get; set; }
    }
}
