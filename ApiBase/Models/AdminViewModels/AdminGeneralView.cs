using System;

namespace ApiBase.Models.AdminViewModels
{
    /// <summary>
    /// Catalog view
    /// </summary>
    public class AdminGeneralView
    {
        public int GeneralId { get; set; }
        public string GeneralName { get; set; }
        public string GeneralContent { get; set; }
        public DateTime? Datemodified { get; set; }
        public bool? Show { get; set; }
        public string Lang { get; set; }
    }
}