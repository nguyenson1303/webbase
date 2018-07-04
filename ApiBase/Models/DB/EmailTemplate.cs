using System;
using System.Collections.Generic;

namespace ApiBase.Models.DB
{
    public partial class EmailTemplate
    {
        public int Id { get; set; }
        public string Name { get; set; }
        public string Template { get; set; }
        public DateTime? Createdate { get; set; }
    }
}
