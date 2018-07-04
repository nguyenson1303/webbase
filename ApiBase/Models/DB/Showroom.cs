using System;
using System.Collections.Generic;

namespace ApiBase.Models.DB
{
    public partial class Showroom
    {
        public int ShowroomId { get; set; }
        public int DistrictId { get; set; }
        public string Latitude { get; set; }
        public string Longitude { get; set; }
        public string Name { get; set; }
        public string Phone { get; set; }
        public string Address { get; set; }
        public string Image { get; set; }
        public DateTime CreateDate { get; set; }
    }
}
