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
}