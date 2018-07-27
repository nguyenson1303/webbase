using System;
using System.Collections.Generic;

namespace ApiBase.Model.AdminViewModels
{
    /// <summary>
    /// admin menu view
    /// </summary>
    public class AdminListUserPage
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
        public DateTime? ModifyDate { get; set; }
        public DateTime? CreateDate { get; set; }
        public int Level { get; set; }
        public string ClassLevel { get; set; }
    }
}