using System;
using System.Collections.Generic;

namespace ApiBase.Models.DB
{
    public partial class PostTag
    {
        public int PostTagId { get; set; }
        public int PostId { get; set; }
        public string Tag { get; set; }
        public string Link { get; set; }
    }
}
