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
        public int? ParentId { get; set; }
        public int? OrderDisplay { get; set; }
        public string Icon { get; set; }
        public string Path { get; set; }
        public string Breadcrumb { get; set; }
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