﻿using System;
using System.Collections.Generic;

namespace ApiBase.Model.AdminViewModels
{
    /// <summary>
    /// admin menu view
    /// </summary>
    public class PostFull
    {
        public int PostId { get; set; }
        public int? CatalogId { get; set; }
        public string ImagePath { get; set; }
        public bool? IsHot { get; set; }
        public int? OrderDisplay { get; set; }
        public bool? Approve { get; set; }
        public int PostDetailId { get; set; }
        public string PostName { get; set; }
        public string Link { get; set; }
        public string Summary { get; set; }
        public string PostContent { get; set; }
        public string Lang { get; set; }
        public string Keyword { get; set; }
        public string Description { get; set; }
        public string Title { get; set; }
        public DateTime? DateModified { get; set; }
        public DateTime? CreateDate { get; set; }
    }
}