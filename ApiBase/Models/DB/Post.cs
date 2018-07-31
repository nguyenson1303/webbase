using System;
using System.Collections.Generic;

namespace ApiBase.Models.DB
{
    public partial class Post
    {
        public int PostId { get; set; }
        public int? CatalogId { get; set; }
        public string ImagePath { get; set; }
        public DateTime? DateModified { get; set; }
        public bool? IsHot { get; set; }
        public int? OrderDisplay { get; set; }
        public bool? Approve { get; set; }
        public DateTime? CreateDate { get; set; }
    }
}
