﻿namespace Web.Areas.Admin.ViewModels
{
    using System.Collections.Generic;
    using System.Web;
    using System.Web.Mvc;
    using Data;
    using Webdiyer.WebControls.Mvc;

    /// <summary>
    /// list album images view
    /// </summary>
    public class List_album_images_view
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
        /// Gets or sets the album.
        /// </summary>
        /// <value>
        /// The album.
        /// </value>
        public int Album
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
        /// Gets or sets the file image.
        /// </summary>
        /// <value>
        /// The file image.
        /// </value>
        public HttpPostedFileBase[] File_image
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
        /// Gets or sets the identifier.
        /// </summary>
        /// <value>
        /// The identifier.
        /// </value>
        public int Id
        {
            get;
            set;
        }

        /// <summary>
        /// Gets or sets the image path.
        /// </summary>
        /// <value>
        /// The image path.
        /// </value>
        public string ImagePath
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
        /// Gets or sets the page list image.
        /// </summary>
        /// <value>
        /// The page list image.
        /// </value>
        public PagedList<ImageAlbum> Page_list_image
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
        /// Gets or sets the pro identifier.
        /// </summary>
        /// <value>
        /// The pro identifier.
        /// </value>
        public int Pro_id
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