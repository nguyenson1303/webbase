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
        public int? ActionPage { get; set; }
        public Boolean IsCreate { get; set; }
    }

    public class AdminUserPageActionFullView
    {
        public int Id { get; set; }
        public string ActionName { get; set; }
        public string ActionDescription { get; set; }
        public int ActionPage { get; set; }
        public bool Active { get; set; }
    }

    public class AdminUserPagePermisionAction
    {
        public string UserName { get; set; }
        public int PageId { get; set; }
        public string Title { get; set; }
        public int ParentId { get; set; }
        public int OrderDisplay { get; set; }
        public string TypeActionId { get; set; }
        public int ActionId { get; set; }
        public int Level { get; set; }
        public string ClassLevel { get; set; }
    }
}