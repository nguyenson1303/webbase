namespace Web.Areas.Admin.ViewModels
{
    using System.Collections.Generic;

    using Web.Data;

    /// <summary>
    /// statistic view
    /// </summary>
    public class Statistic_view
    {
        /// <summary>
        /// Gets or sets the chart register text.
        /// </summary>
        /// <value>
        /// The chart register text.
        /// </value>
        public string Chart_register_text
        {
            get;
            set;
        }

        /// <summary>
        /// Gets or sets the chart text.
        /// </summary>
        /// <value>
        /// The chart text.
        /// </value>
        public string Chart_text
        {
            get;
            set;
        }

        /// <summary>
        /// Gets or sets the list contact last.
        /// </summary>
        /// <value>
        /// The list contact last.
        /// </value>
        public List<C_Contact> List_contact_last
        {
            get;
            set;
        }

        /// <summary>
        /// Gets or sets the list rating last.
        /// </summary>
        /// <value>
        /// The list rating last.
        /// </value>
        public List<C_Rating> List_rating_last
        {
            get;
            set;
        }
    }
}