//------------------------------------------------------------------------------
// <auto-generated>
//     This code was generated from a template.
//
//     Manual changes to this file may cause unexpected behavior in your application.
//     Manual changes to this file will be overwritten if the code is regenerated.
// </auto-generated>
//------------------------------------------------------------------------------

namespace DBBase.Data
{
    using System;
    using System.Collections.Generic;
    
    public partial class C_User
    {
        public string Username { get; set; }
        public string Password { get; set; }
        public int Role { get; set; }
        public Nullable<bool> Online { get; set; }
        public Nullable<System.DateTime> LastLogin { get; set; }
        public string IP { get; set; }
    }
}
