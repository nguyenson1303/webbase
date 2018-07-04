using System;
using System.Collections.Generic;

namespace ApiBase.Models.DB
{
    public partial class City
    {
        public int CityId { get; set; }
        public string CityName { get; set; }
        public DateTime CreateDate { get; set; }
    }
}
