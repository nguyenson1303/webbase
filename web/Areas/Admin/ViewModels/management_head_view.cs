namespace Web.Areas.Admin.ViewModels
{
    /// <summary>
    /// management head view
    /// </summary>
    public class Management_head_view
    {
        /// <summary>
        /// Gets or sets the internet protocol address.
        /// </summary>
        /// <value>
        /// The internet protocol address.
        /// </value>
        public string Ip_address
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
        /// Gets or sets the server time.
        /// </summary>
        /// <value>
        /// The server time.
        /// </value>
        public string Server_time
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
        public string User_name
        {
            get;
            set;
        }
    }
}