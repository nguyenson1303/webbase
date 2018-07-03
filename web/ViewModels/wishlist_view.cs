namespace Web.ViewModels
{
    using System.Collections;

    /// <summary>
    /// Wish list view
    /// </summary>
    public class Wishlist_view
    {
        /// <summary>
        /// Gets or sets the item count.
        /// </summary>
        /// <value>
        /// The item count.
        /// </value>
        public string Item_count
        {
            get;
            set;
        }

        /// <summary>
        /// Gets or sets the list wish list.
        /// </summary>
        /// <value>
        /// The list wish list.
        /// </value>
        public ArrayList ListWishlist
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