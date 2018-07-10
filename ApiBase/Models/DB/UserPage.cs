using System;
using System.Collections.Generic;

namespace ApiBase.Models.DB
{
    public partial class UserPage
    {
        public int Id { get; set; }
        public string Act { get; set; }
        public string Ctrl { get; set; }
        public string Title { get; set; }
        public bool? IsShow { get; set; }
        public string Tye { get; set; }
        public int? ParentId { get; set; }
        public int? OrderDisplay { get; set; }
        public string Icon { get; set; }
        public string Path { get; set; }
        public string Breadcrumb { get; set; }
        public int? TypeActionId { get; set; }
        public DateTime? ModifyDate { get; set; }
        public DateTime? CreateDate { get; set; }
    }
}
