namespace DBBase.EntitysObject
{
    /// <summary>
    /// Page Permission
    /// </summary>
    public partial class PagePermission
    {
        /// <summary>
        /// Gets or sets a value indicating whether this <see cref="PagePermission"/> is add.
        /// </summary>
        /// <value>
        ///   <c>true</c> if add; otherwise, <c>false</c>.
        /// </value>
        public bool Add
        {
            get;
            set;
        }

        /// <summary>
        /// Gets or sets a value indicating whether this <see cref="PagePermission"/> is delete.
        /// </summary>
        /// <value>
        ///   <c>true</c> if delete; otherwise, <c>false</c>.
        /// </value>
        public bool Delete
        {
            get;
            set;
        }

        /// <summary>
        /// Gets or sets a value indicating whether this <see cref="PagePermission"/> is edit.
        /// </summary>
        /// <value>
        ///   <c>true</c> if edit; otherwise, <c>false</c>.
        /// </value>
        public bool Edit
        {
            get;
            set;
        }

        /// <summary>
        /// Gets or sets the order display.
        /// </summary>
        /// <value>
        /// The order display.
        /// </value>
        public int OrderDisplay
        {
            get;
            set;
        }

        /// <summary>
        /// Gets or sets the page identifier.
        /// </summary>
        /// <value>
        /// The page identifier.
        /// </value>
        public int Page_ID
        {
            get;
            set;
        }

        /// <summary>
        /// Gets or sets the parent identifier.
        /// </summary>
        /// <value>
        /// The parent identifier.
        /// </value>
        public int Parent_ID
        {
            get;
            set;
        }

        /// <summary>
        /// Gets or sets the title.
        /// </summary>
        /// <value>
        /// The title.
        /// </value>
        public string Title
        {
            get;
            set;
        }

        /// <summary>
        /// Gets or sets the name of the user.
        /// </summary>
        /// <value>
        /// The name of the user.
        /// </value>
        public string User_Name
        {
            get;
            set;
        }

        /// <summary>
        /// Gets or sets a value indicating whether this <see cref="PagePermission"/> is view.
        /// </summary>
        /// <value>
        ///   <c>true</c> if view; otherwise, <c>false</c>.
        /// </value>
        public bool View
        {
            get;
            set;
        }
    }
}