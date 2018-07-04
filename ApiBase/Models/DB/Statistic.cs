using System;
using System.Collections.Generic;

namespace ApiBase.Models.DB
{
    public partial class Statistic
    {
        public int Id { get; set; }
        public DateTime ThoiGian { get; set; }
        public long SoTruyCap { get; set; }
        public int? Year { get; set; }
        public int? Month { get; set; }
        public int? Total { get; set; }
    }
}
