using System;
using System.Collections.Generic;

namespace ApiBase.Models.DB
{
    public partial class Languages
    {
        public string LangKey { get; set; }
        public string LangValue { get; set; }
        public int? OrderDisplay { get; set; }
        public bool? IsUser { get; set; }
    }
}
