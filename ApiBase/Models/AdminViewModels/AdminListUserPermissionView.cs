namespace ApiBase.Models.AdminViewModels
{
    using DBBase.EntitysObject;
    using System.Collections.Generic;

    /// <summary>
    /// List user permission view
    /// </summary>
    public class AdminListUserPermissionView
    {
        /// <summary>
        /// Gets or sets the list permission.
        /// </summary>
        /// <value>
        /// The list permission.
        /// </value>
        public List<PagePermission> List_permission
        {
            get;
            set;
        }

        /// <summary>
        /// Gets or sets the page.
        /// </summary>
        /// <value>
        /// The page.
        /// </value>
        public int PageIndex
        {
            get;
            set;
        }

        /// <summary>
        /// Gets or sets the page size.
        /// </summary>
        /// <value>
        /// The page size.
        /// </value>
        public int PageSize
        {
            get;
            set;
        }

        /// <summary>
        /// Gets or sets the total page.
        /// </summary>
        /// <value>
        /// The total page.
        /// </value>
        public int TotalPage
        {
            get;
            set;
        }
    }  
}