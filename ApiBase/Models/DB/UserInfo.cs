using System;
using System.Collections.Generic;

namespace ApiBase.Models.DB
{
    public partial class UserInfo
    {
        public int InforId { get; set; }
        public string Fname { get; set; }
        public string Lname { get; set; }
        public string Phone { get; set; }
        public string Address { get; set; }
        public string Email { get; set; }
        public int? EventId { get; set; }
        public DateTime? Birthday { get; set; }
        public string Location { get; set; }
        public string Note { get; set; }
        public DateTime? DateJoin { get; set; }
        public DateTime? DateRegister { get; set; }
    }
}
