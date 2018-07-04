namespace DBBase.EntitysObject
{
    using ApiBase.Models.DB;
    using System.Collections.Generic;

    /// <summary>
    /// Page products view
    /// </summary>
    public class Page_products_view
    {
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
        /// Gets or sets the name of the cate parent.
        /// </summary>
        /// <value>
        /// The name of the cate parent.
        /// </value>
        public string Cate_parent_name
        {
            get;
            set;
        }

        /// <summary>
        /// Gets or sets the cate parent summary.
        /// </summary>
        /// <value>
        /// The cate parent summary.
        /// </value>
        public string Cate_parent_summary
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
        /// Gets or sets a value indicating whether this instance is search.
        /// </summary>
        /// <value>
        ///   <c>true</c> if this instance is search; otherwise, <c>false</c>.
        /// </value>
        public bool Is_search
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
        /// Gets or sets the list order.
        /// </summary>
        /// <value>
        /// The list order.
        /// </value>
        //public List<SelectListItem> List_order
        //{
        //    get;
        //    set;
        //}

        /// <summary>
        /// Gets or sets the size of the list page.
        /// </summary>
        /// <value>
        /// The size of the list page.
        /// </value>
        //public List<SelectListItem> List_page_size
        //{
        //    get;
        //    set;
        //}

        /// <summary>
        /// Gets or sets the list parent all.
        /// </summary>
        /// <value>
        /// The list parent all.
        /// </value>
        public List<Catalog> List_parent_all
        {
            get;
            set;
        }

        /// <summary>
        /// Gets or sets the list parent category.
        /// </summary>
        /// <value>
        /// The list parent category.
        /// </value>
        public List<Catalog> List_parent_category
        {
            get;
            set;
        }

        /// <summary>
        /// Gets or sets the order.
        /// </summary>
        /// <value>
        /// The order.
        /// </value>
        public string Order
        {
            get;
            set;
        }

        /// <summary>
        /// Gets or sets the page list product.
        /// </summary>
        /// <value>
        /// The page list product.
        /// </value>
        public List<Product> Page_list_product
        {
            get;
            set;
        }

        /// <summary>
        /// Gets or sets the size of the page.
        /// </summary>
        /// <value>
        /// The size of the page.
        /// </value>
        public int Page_size
        {
            get;
            set;
        }

        /// <summary>
        /// Gets or sets the parameter.
        /// </summary>
        /// <value>
        /// The parameter.
        /// </value>
        public string Param
        {
            get;
            set;
        }

        /// <summary>
        /// Gets or sets the parent action.
        /// </summary>
        /// <value>
        /// The parent action.
        /// </value>
        public string Parent_action
        {
            get;
            set;
        }

        /// <summary>
        /// Gets or sets the parent controller.
        /// </summary>
        /// <value>
        /// The parent controller.
        /// </value>
        public string Parent_controller
        {
            get;
            set;
        }

        /// <summary>
        /// Gets or sets the price maximum.
        /// </summary>
        /// <value>
        /// The price maximum.
        /// </value>
        public int Price_max
        {
            get;
            set;
        }

        /// <summary>
        /// Gets or sets the price minimum.
        /// </summary>
        /// <value>
        /// The price minimum.
        /// </value>
        public int Price_min
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
        /// Gets or sets the text search.
        /// </summary>
        /// <value>
        /// The text search.
        /// </value>
        public string Text_search
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
    }
}