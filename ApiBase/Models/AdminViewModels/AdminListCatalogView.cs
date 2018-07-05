﻿using ApiBase.Models.DB;
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
        /// Gets or sets the Path.
        /// </summary>
        /// <value>
        /// The Path.
        /// </value>
        public string Path
        {
            get;
            set;
        }

        /// <summary>
        /// Gets or sets the name of the alias.
        /// </summary>
        /// <value>
        /// The name of the alias.
        /// </value>
        public string Alias_name
        {
            get;
            set;
        }

        /// <summary>
        /// Gets or sets the name of the category.
        /// </summary>
        /// <value>
        /// The name of the category.
        /// </value>
        public string Category_name
        {
            get;
            set;
        }

        /// <summary>
        /// Gets or sets the cate identifier.
        /// </summary>
        /// <value>
        /// The cate identifier.
        /// </value>
        public int Cate_id
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
        public string Cate_type
        {
            get;
            set;
        }


        /// <summary>
        /// Gets or sets the language.
        /// </summary>
        /// <value>
        /// The language.
        /// </value>
        public string Lang
        {
            get;
            set;
        }

        /// <summary>
        /// Gets or sets the link.
        /// </summary>
        /// <value>
        /// The link.
        /// </value>
        public string Link
        {
            get;
            set;
        }

        /// <summary>
        /// Gets or sets the list language.
        /// </summary>
        /// <value>
        /// The list language.
        /// </value>
        public List<SelectListItem> List_language
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
        /// Gets or sets the list page size.
        /// </summary>
        /// <value>
        /// The list page size.
        /// </value>
        public List<SelectListItem> List_page_size
        {
            get;
            set;
        }

        /// <summary>
        /// Gets or sets the list parent object.
        /// </summary>
        /// <value>
        /// The list parent object.
        /// </value>
        public List<SelectListItem> List_parent
        {
            get;
            set;
        }

        /// <summary>
        /// Gets or sets the message.
        /// </summary>
        /// <value>
        /// The message.
        /// </value>
        public string Message
        {
            get;
            set;
        }

        /// <summary>
        /// Gets or sets the order by.
        /// </summary>
        /// <value>
        /// The order by.
        /// </value>
        public string Order_by
        {
            get;
            set;
        }

        /// <summary>
        /// Gets or sets the type of the order.
        /// </summary>
        /// <value>
        /// The type of the order.
        /// </value>
        public string Order_type
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
        public int Page
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
        public int Page_size
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
        public List<Catalog> Page_list_catalog
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
        /// Gets or sets the search.
        /// </summary>
        /// <value>
        /// The search.
        /// </value>
        public string Search
        {
            get;
            set;
        }

        /// <summary>
        /// Gets or sets the style list.
        /// </summary>
        /// <value>
        /// The style list.
        /// </value>
        public string Style_list
        {
            get;
            set;
        }

        /// <summary>
        /// Gets or sets the tag.
        /// </summary>
        /// <value>
        /// The tag.
        /// </value>
        public string Tag
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
        public string Text_search_result
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
        public int Total_record
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

        /// <summary>
        /// Gets or sets the type act.
        /// </summary>
        /// <value>
        /// The type act.
        /// </value>
        public string Type_act
        {
            get;
            set;
        }
    }
}