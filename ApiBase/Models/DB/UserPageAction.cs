using System;
using System.Collections.Generic;

namespace ApiBase.Models.DB
{
    public partial class UserPageAction
    {
        public int Id { get; set; }
        public string ActionName { get; set; }
        public string ActionDescription { get; set; }
        public int? ActionStatus { get; set; }
        public DateTime? CreateDate { get; set; }
        public DateTime? ModifyDate { get; set; }
        public int? ActionPage { get; set; }
    }
}
