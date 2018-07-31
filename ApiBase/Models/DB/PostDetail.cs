using System;
using System.Collections.Generic;

namespace ApiBase.Models.DB
{
    public partial class PostDetail
    {
        public int PostDetailId { get; set; }
        public int PostId { get; set; }
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
