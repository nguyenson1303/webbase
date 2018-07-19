using Microsoft.AspNetCore.Http;

namespace ApiBase.Models.AdminViewModels
{
    /// <summary>
    /// user view
    /// </summary>
    public class AdminEditUserInforView
    {
        public string Fname { get; set; }
        public string Lname { get; set; }
        public string Phone { get; set; }
        public string Address { get; set; }
        public string Birthday { get; set; }
        public string Avatar { get; set; }
        public IFormFile AvatarFile { get; set; }
        public string FullName { get; set; }
    }
}