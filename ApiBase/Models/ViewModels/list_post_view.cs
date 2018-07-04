namespace DBBase.EntitysObject
{
    using System.Collections;

    /// <summary>
    /// List post view
    /// </summary>
    public class List_post_view
    {
        /// <summary>
        /// Gets or sets the item count.
        /// </summary>
        /// <value>
        /// The item count.
        /// </value>
        public string ItemCount
        {
            get;
            set;
        }

        /// <summary>
        /// Gets or sets the ListView.
        /// </summary>
        /// <value>
        /// The ListView.
        /// </value>
        public ArrayList ListView
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
    }
}