namespace ApiBase.Models.AdminViewModels
{
    /// <summary>
    /// user view
    /// </summary>
    public class AdminCheckPermissionView
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
        /// Gets or sets the TypeAct.
        /// </summary>
        /// <value>
        /// The TypeAct.
        /// </value>
        public string TypeAct
        {
            get;
            set;
        }

        /// <summary>
        /// Gets or sets the Type.
        /// </summary>
        /// <value>
        /// The confirm Type.
        /// </value>
        public string Type
        {
            get;
            set;
        }
    }
}