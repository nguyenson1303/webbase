using System;
using System.Collections.Generic;

namespace ApiBase.Models.DB
{
    public partial class Rating
    {
        public int RatingId { get; set; }
        public int? Rating1 { get; set; }
        public string Ip { get; set; }
        public string Name { get; set; }
        public string Email { get; set; }
        public string Contents { get; set; }
        public int? ItemId { get; set; }
    }
}
