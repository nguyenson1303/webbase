using System;
using System.Collections.Generic;

namespace ApiBase.Models.DB
{
    public partial class General
    {
        public int GeneralId { get; set; }
        public string GeneralName { get; set; }
        public string GeneralContent { get; set; }
        public DateTime? Datemodified { get; set; }
        public bool? Show { get; set; }
        public string Lang { get; set; }
    }
}
