using System;
using System.Collections.Generic;

namespace ApiBase.Models.DB
{
    public partial class Email
    {
        public int Id { get; set; }
        public string Name { get; set; }
        public string Email1 { get; set; }
        public string Phone { get; set; }
        public string Address { get; set; }
        public string Note { get; set; }
        public bool? Status { get; set; }
        public DateTime? Createdate { get; set; }
    }
}
