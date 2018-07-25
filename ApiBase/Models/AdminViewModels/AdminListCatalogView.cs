using ApiBase.Models.DB;
using Microsoft.AspNetCore.Mvc.Rendering;
using System.Collections.Generic;

namespace ApiBase.Models.AdminViewModels
{
    /// <summary>
    /// list catalog view
    /// </summary>
    public class AdminListCatalogView
    {
        /// <summary>
        /// Gets or sets the name of the category.
        /// </summary>
        /// <value>
        /// The name of the category.
        /// </value>
        public string CategoryName
        {
            get;
            set;
        }

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
        /// Gets or sets the page list catalog.
        /// </summary>
        /// <value>
        /// The page list catalog.
        /// </value>
        public List<Catalog> PageListCatalog
        {
            get;
            set;
        }

        /// <summary>
        /// Gets or sets the parent.
        /// </summary>
        /// <value>
        /// The parent.
        /// </value>
        public int Parent
        {
            get;
            set;
        }

        /// <summary>
        /// Gets or sets the total record.
        /// </summary>
        /// <value>
        /// The total record.
        /// </value>
        public int TotalRecord
        {
            get;
            set;
        }

        /// <summary>
        /// Gets or sets the total record.
        /// </summary>
        /// <value>
        /// The total page.
        /// </value>
        public int TotalPage
        {
            get;
            set;
        }

        /// <summary>
        /// Gets or sets the type.
        /// </summary>
        /// <value>
        /// The type.
        /// </value>
        public string Type
        {
            get;
            set;
        }
    }
}