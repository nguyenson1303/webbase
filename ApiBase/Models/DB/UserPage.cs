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

    public class UserPageTree
    {
        public string Id { get; set; }
        public string Parent { get; set; }
        public string Text { get; set; }
        public UserPageTreeOption State { get; set; }
    }

    public class UserPageTreeOption
    {
        public Boolean Opened { get; set; }
        public Boolean Selected { get; set; }
        public Boolean Disabled { get; set; }
    }
}
