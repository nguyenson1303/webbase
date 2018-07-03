namespace Web.Areas.Admin.ViewModels
{
    using System.Collections.Generic;
    using System.Web.Mvc;
    using Web.Data;
    using Webdiyer.WebControls.Mvc;

    /// <summary>
    /// list showroom view
    /// </summary>
    public class List_showroom_view
    {
        /// <summary>
        /// Gets or sets the act.
        /// </summary>
        /// <value>
        /// The act.
        /// </value>
        public string Act
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
        /// Gets or sets the city.
        /// </summary>
        /// <value>
        /// The city.
        /// </value>
        public int City
        {
            get;
            set;
        }

        /// <summary>
        /// Gets or sets the control.
        /// </summary>
        /// <value>
        /// The control.
        /// </value>
        public string Ctrl
        {
            get;
            set;
        }

        /// <summary>
        /// Gets or sets the district.
        /// </summary>
        /// <value>
        /// The district.
        /// </value>
        public int District
        {
            get;
            set;
        }

        /// <summary>
        /// Gets or sets the HTML link tab.
        /// </summary>
        /// <value>
        /// The HTML link tab.
        /// </value>
        public string Html_link_tab
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
        /// Gets or sets the list city.
        /// </summary>
        /// <value>
        /// The list city.
        /// </value>
        public List<SelectListItem> List_city
        {
            get;
            set;
        }

        /// <summary>
        /// Gets or sets the list district.
        /// </summary>
        /// <value>
        /// The list district.
        /// </value>
        public List<SelectListItem> List_district
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
        /// Gets or sets the page list showroom.
        /// </summary>
        /// <value>
        /// The page list showroom.
        /// </value>
        public PagedList<Showroom> Page_list_showroom
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