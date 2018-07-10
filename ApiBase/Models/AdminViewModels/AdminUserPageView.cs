using System;

namespace ApiBase.Models.AdminViewModels
{
    /// <summary>
    /// Admin User Page Action View
    /// </summary>
    public class AdminUserPageView
    {
        public string Title { get; set; }
        public bool IsShow { get; set; }
        public string Tye { get; set; }
        public int ParentId { get; set; }
        public int OrderDisplay { get; set; }
        public string Icon { get; set; }
        public string Path { get; set; }
        public string Breadcrumb { get; set; }
        public int TypeActionId { get; set; }
        public DateTime ModifyDate { get; set; }
        public DateTime CreateDate { get; set; }
    }
}