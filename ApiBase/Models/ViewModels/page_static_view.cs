using ApiBase.Models.DB;

namespace DBBase.EntitysObject
{
    /// <summary>
    /// Page static view
    /// </summary>
    public class Page_static_view
    {
        /// <summary>
        /// Gets or sets the c pages.
        /// </summary>
        /// <value>
        /// The c pages.
        /// </value>
        public Pages C_pages
        {
            get;
            set;
        }

        /// <summary>
        /// Gets or sets the string breadcrumbs.
        /// </summary>
        /// <value>
        /// The string breadcrumbs.
        /// </value>
        public string Str_breadcrumbs
        {
            get;
            set;
        }
    }
}