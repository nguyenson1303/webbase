using System;
using System.Collections.Generic;

namespace ApiBase.Models.DB
{
    public partial class User
    {
        public string Username { get; set; }
        public string Password { get; set; }
        public int Role { get; set; }
        public bool? Online { get; set; }
        public DateTime? LastLogin { get; set; }
        public string Ip { get; set; }
        public string Token { get; set; }
        public DateTime? Expire { get; set; }
    }
}
