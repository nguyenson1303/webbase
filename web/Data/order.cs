//------------------------------------------------------------------------------
// <auto-generated>
//     This code was generated from a template.
//
//     Manual changes to this file may cause unexpected behavior in your application.
//     Manual changes to this file will be overwritten if the code is regenerated.
// </auto-generated>
//------------------------------------------------------------------------------

namespace Web.Data
{
    using System;
    using System.Collections.Generic;
    
    public partial class order
    {
        public int id { get; set; }
        public string Total { get; set; }
        public string Name { get; set; }
        public string LName { get; set; }
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
        public Nullable<System.DateTime> CreateDate { get; set; }
        public Nullable<bool> Status { get; set; }
        public Nullable<int> Process { get; set; }
        public Nullable<System.DateTime> ShipDate { get; set; }
        public string UserCreate { get; set; }
        public string Code { get; set; }
    }
}
