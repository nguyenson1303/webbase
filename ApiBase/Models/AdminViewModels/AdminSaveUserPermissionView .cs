namespace ApiBase.Models.AdminViewModels
{
    using DBBase.EntitysObject;
    using System.Collections.Generic;

    /// <summary>
    /// List user permission view
    /// </summary>
    public class AdminSaveUserPermissionView
    {
        /// <summary>
        /// Gets or sets the list permission.
        /// </summary>
        /// <value>
        /// The list permission.
        /// </value>
        public List<PagePermission> ListPermission
        {
            get;
            set;
        }
    }  
}