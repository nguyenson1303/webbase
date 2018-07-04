using System;
using System.Collections.Generic;

namespace ApiBase.Models.DB
{
    public partial class UserPermission
    {
        public int Id { get; set; }
        public int? PageId { get; set; }
        public bool? Del { get; set; }
        public bool? Edit { get; set; }
        public bool? Add { get; set; }
        public bool? View { get; set; }
        public string User { get; set; }
    }
}
