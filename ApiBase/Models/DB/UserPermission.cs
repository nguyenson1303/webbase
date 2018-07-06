using System;
using System.Collections.Generic;

namespace ApiBase.Models.DB
{
    public partial class UserPermission
    {
        public int Id { get; set; }
        public int? PageId { get; set; }
        public string User { get; set; }
        public string TypeActionId { get; set; }
    }
}
