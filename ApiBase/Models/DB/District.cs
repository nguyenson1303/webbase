using System;
using System.Collections.Generic;

namespace ApiBase.Models.DB
{
    public partial class District
    {
        public int DistrictId { get; set; }
        public int CityId { get; set; }
        public string DistrictName { get; set; }
        public DateTime CreateDate { get; set; }
    }
}
