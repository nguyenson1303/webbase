namespace Web.ViewModels
{
    using System.Collections;

    /// <summary>
    /// Cart mini view
    /// </summary>
    public class Cart_mini_view
    {
        /// <summary>
        /// Gets or sets the content shipping.
        /// </summary>
        /// <value>
        /// The content shipping.
        /// </value>
        public string ContentShipping
        {
            get;
            set;
        }

        /// <summary>
        /// Gets or sets the fee ship.
        /// </summary>
        /// <value>
        /// The fee ship.
        /// </value>
        public string FeeShip
        {
            get;
            set;
        }

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
        /// Gets or sets the shopping cart.
        /// </summary>
        /// <value>
        /// The shopping cart.
        /// </value>
        public ArrayList ShoppingCart
        {
            get;
            set;
        }

        /// <summary>
        /// Gets or sets the sub total.
        /// </summary>
        /// <value>
        /// The sub total.
        /// </value>
        public string SubTotal
        {
            get;
            set;
        }

        /// <summary>
        /// Gets or sets the tax.
        /// </summary>
        /// <value>
        /// The tax.
        /// </value>
        public string Tax
        {
            get;
            set;
        }

        /// <summary>
        /// Gets or sets the total.
        /// </summary>
        /// <value>
        /// The total.
        /// </value>
        public string Total
        {
            get;
            set;
        }

        /// <summary>
        /// Gets or sets the total string.
        /// </summary>
        /// <value>
        /// The total string.
        /// </value>
        public string TotalString
        {
            get;
            set;
        }
    }
}