namespace ApiBase.Models.AdminViewModels
{
    /// <summary>
    /// user view
    /// </summary>
    public class AdminEditUserView
    {
        /// <summary>
        /// Gets or sets the Internet Protocol address.
        /// </summary>
        /// <value>
        /// The Internet Protocol address.
        /// </value>
        public string Ip
        {
            get;
            set;
        }

        /// <summary>
        /// Gets or sets a value indicating whether this <see cref="User_view"/> is online.
        /// </summary>
        /// <value>
        ///   <c>true</c> if online; otherwise, <c>false</c>.
        /// </value>
        public bool Online
        {
            get;
            set;
        }
       
        /// <summary>
        /// Gets or sets the role.
        /// </summary>
        /// <value>
        /// The role.
        /// </value>
        public int Role
        {
            get;
            set;
        }  
    }
}