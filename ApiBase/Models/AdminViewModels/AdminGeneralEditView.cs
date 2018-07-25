namespace ApiBase.Models.AdminViewModels
{
    /// <summary>
    /// Catalog view
    /// </summary>
    public class AdminGeneralEditView
    {
        public string GeneralName { get; set; }
        public string GeneralContent { get; set; }
        public bool? Show { get; set; }
        public string Lang { get; set; }
    }
}