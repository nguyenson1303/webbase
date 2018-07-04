using System;
using System.Collections.Generic;

namespace ApiBase.Models.DB
{
    public partial class Contact
    {
        public int ContactId { get; set; }
        public string Name { get; set; }
        public string Email { get; set; }
        public string Contents { get; set; }
        public string Phone { get; set; }
        public string Address { get; set; }
        public DateTime? Createdate { get; set; }
    }
}
