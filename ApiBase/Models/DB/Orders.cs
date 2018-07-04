using System;
using System.Collections.Generic;

namespace ApiBase.Models.DB
{
    public partial class Orders
    {
        public int Id { get; set; }
        public string Total { get; set; }
        public string Name { get; set; }
        public string Lname { get; set; }
        public string Gender { get; set; }
        public string Phone { get; set; }
        public string Fax { get; set; }
        public string Email { get; set; }
        public string City { get; set; }
        public string Address { get; set; }
        public string Recive { get; set; }
        public string Payment { get; set; }
        public string Shipping { get; set; }
        public string Note { get; set; }
        public DateTime? CreateDate { get; set; }
        public bool? Status { get; set; }
        public int? Process { get; set; }
        public DateTime? ShipDate { get; set; }
        public string UserCreate { get; set; }
        public string Code { get; set; }
    }
}
