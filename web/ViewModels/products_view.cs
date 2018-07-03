namespace Web.ViewModels
{
    /// <summary>
    /// Products view
    /// </summary>
    public class Products_view
    {
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
        /// Gets or sets the heading.
        /// </summary>
        /// <value>
        /// The heading.
        /// </value>
        public string Heading
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
        /// Gets or sets the manufacture.
        /// </summary>
        /// <value>
        /// The manufacture.
        /// </value>
        public string Manufacture
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

        public string Typekey { get; set; }
    }
}