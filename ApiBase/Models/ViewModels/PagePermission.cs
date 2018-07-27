using ApiBase.Models.AdminViewModels;
using ApiBase.Models.DB;
using System.Collections.Generic;

namespace DBBase.EntitysObject
{
    /// <summary>
    /// Page Permission
    /// </summary>
    public partial class PagePermission
    {
        /// <summary>
        /// Gets or sets the OrderDisplay.
        /// </summary>
        /// <value>
        /// The OrderDisplay.
        /// </value>
        public int OrderDisplay
        {
            get;
            set;
        }

        /// <summary>
        /// Gets or sets the page identifier.
        /// </summary>
        /// <value>
        /// The page identifier.
        /// </value>
        public int PageId
        {
            get;
            set;
        }

        /// <summary>
        /// Gets or sets the parent identifier.
        /// </summary>
        /// <value>
        /// The parent identifier.
        /// </value>
        public int ParentId
        {
            get;
            set;
        }

        /// <summary>
        /// Gets or sets the title.
        /// </summary>
        /// <value>
        /// The title.
        /// </value>
        public string Title
        {
            get;
            set;
        }

        /// <summary>
        /// Gets or sets the name of the user.
        /// </summary>
        /// <value>
        /// The name of the user.
        /// </value>
        public string UserName
        {
            get;
            set;
        }

        public int Level
        {
            get;
            set;
        }

        public string classLevel
        {
            get; set;
        }


        public List<AdminUserPageActionFullView> ListUserPageAction { get; set; }
    }
}