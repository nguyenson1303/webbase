﻿namespace Web.Areas.Admin.ViewModels
{
    using System.Collections.Generic;
    using System.Web.Mvc;

    using Web.Data;

    using Webdiyer.WebControls.Mvc;

    /// <summary>
    /// list email view
    /// </summary>
    public class List_email_view
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
        /// Gets or sets the body email.
        /// </summary>
        /// <value>
        /// The body email.
        /// </value>
        public string BodyEmail
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
        /// Gets or sets a value indicating whether this instance is send all.
        /// </summary>
        /// <value>
        /// <c>true</c> if this instance is send all; otherwise, <c>false</c>.
        /// </value>
        public bool IsSendAll
        {
            get;
            set;
        }

        /// <summary>
        /// Gets or sets the is send all text.
        /// </summary>
        /// <value>
        /// The is send all text.
        /// </value>
        public string IsSendAllText
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
        /// Gets or sets the list email.
        /// </summary>
        /// <value>
        /// The list email.
        /// </value>
        public PagedList<C_Email> ListEmail
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
        public List<SelectListItem> ListPageSize
        {
            get;
            set;
        }

        /// <summary>
        /// Gets or sets the list template.
        /// </summary>
        /// <value>
        /// The list template.
        /// </value>
        public List<SelectListItem> ListTemplate
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
        /// Gets or sets the subject email.
        /// </summary>
        /// <value>
        /// The subject email.
        /// </value>
        public string SubjectEmail
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
        /// Gets or sets the total record on page.
        /// </summary>
        /// <value>
        /// The total record on page.
        /// </value>
        public int Total_record_on_page
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