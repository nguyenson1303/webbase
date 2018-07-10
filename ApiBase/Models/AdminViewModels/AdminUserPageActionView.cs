using System;

namespace ApiBase.Models.AdminViewModels
{
    /// <summary>
    /// Admin User Page Action View
    /// </summary>
    public class AdminUserPageActionView
    {
        //public int Id { get; set; }
        public string ActionName { get; set; }
        public string ActionDescription { get; set; }
        public int ActionStatus { get; set; }
        public DateTime CreateDate { get; set; }
        public DateTime ModifyDate { get; set; }
        public string ActionPage { get; set; }
    }
}