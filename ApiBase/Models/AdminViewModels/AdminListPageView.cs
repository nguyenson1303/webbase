namespace ApiBase.Models.AdminViewModels
{
    using ApiBase.Model.AdminViewModels;
    using ApiBase.Models.DB;
    using Microsoft.AspNetCore.Mvc.Rendering;
    using System.Collections.Generic;

    /// <summary>
    /// list user view
    /// </summary>
    public class AdminListPageView
    {        
        /// <summary>
        /// Gets or sets the type of the cate.
        /// </summary>
        /// <value>
        /// The type of the cate.
        /// </value>
        public string CateType
        {
            get;
            set;
        }

        /// <summary>
        /// Gets or sets the list order.
        /// </summary>
        /// <value>
        /// The list order.
        /// </value>
        public List<SelectListItem> List_order
        {
            get;
            set;
        }
      
        /// <summary>
        /// Gets or sets the page list user.
        /// </summary>
        /// <value>
        /// The page list user.
        /// </value>
        public List<AdminListUserPage> ListUserPage
        {
            get;
            set;
        }     

        /// <summary>
        /// Gets or sets the text search result.
        /// </summary>
        /// <value>
        /// The text search result.
        /// </value>
        public string MessageSearchResult
        {
            get;
            set;
        }
    }
}