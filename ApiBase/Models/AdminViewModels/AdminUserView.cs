using System;

namespace ApiBase.Models.AdminViewModels
{
    /// <summary>
    /// user view
    /// </summary>
    public class AdminUserView
    {
        /// <summary>
        /// Gets or sets the username.
        /// </summary>
        /// <value>
        /// The username.
        /// </value>
        public string Username
        {
            get;
            set;
        }

        /// <summary>
        /// Gets or sets the password.
        /// </summary>
        /// <value>
        /// The password.
        /// </value>
        public string Password
        {
            get;
            set;
        }

        /// <summary>
        /// Gets or sets the confirm password.
        /// </summary>
        /// <value>
        /// The confirm password.
        /// </value>
        public string ConfirmPassword
        {
            get;
            set;
        }

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
        public string Role
        {
            get;
            set;
        }

        public string Fname { get; set; }
        public string Lname { get; set; }
        public string Phone { get; set; }
        public string Address { get; set; }
        public string Birthday { get; set; }
        public string Avatar { get; set; }
        public bool IsCreate { get; set; }
    }
}