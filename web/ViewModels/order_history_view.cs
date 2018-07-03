namespace Web.ViewModels
{
    using Web.Data;
    using Webdiyer.WebControls.Mvc;

    /// <summary>
    /// Order history view
    /// </summary>
    public class Order_history_view
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
        /// Gets or sets the page list order.
        /// </summary>
        /// <value>
        /// The page list order.
        /// </value>
        public PagedList<order> Page_list_order
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
    }
}