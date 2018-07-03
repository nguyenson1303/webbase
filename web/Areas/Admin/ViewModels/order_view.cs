namespace Web.Areas.Admin.ViewModels
{
    using System;
    using System.Collections;
    using System.Collections.Generic;
    using System.Web.Mvc;

    /// <summary>
    /// order view
    /// </summary>
    public class Order_view
    {
        /// <summary>
        /// Gets or sets the act.
        /// </summary>
        /// <value>
        /// The act.
        /// </value>
        public string Act
        {
            get;
            set;
        }

        /// <summary>
        /// Gets or sets the address.
        /// </summary>
        /// <value>
        /// The address.
        /// </value>
        public string Address
        {
            get;
            set;
        }

        /// <summary>
        /// Gets or sets the type of the cate.
        /// </summary>
        /// <value>
        /// The type of the cate.
        /// </value>
        public string Cate_type
        {
            get;
            set;
        }

        /// <summary>
        /// Gets or sets the code.
        /// </summary>
        /// <value>
        /// The code.
        /// </value>
        public string Code
        {
            get;
            set;
        }

        /// <summary>
        /// Gets or sets the content.
        /// </summary>
        /// <value>
        /// The content.
        /// </value>
        public string Content
        {
            get;
            set;
        }

        /// <summary>
        /// Gets or sets the control.
        /// </summary>
        /// <value>
        /// The control.
        /// </value>
        public string Ctrl
        {
            get;
            set;
        }

        /// <summary>
        /// Gets or sets the email.
        /// </summary>
        /// <value>
        /// The email.
        /// </value>
        public string Email
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
        public string Fee_ship
        {
            get;
            set;
        }

        /// <summary>
        /// Gets or sets the gender.
        /// </summary>
        /// <value>
        /// The gender.
        /// </value>
        public string Gender
        {
            get;
            set;
        }

        /// <summary>
        /// Gets or sets the HTML link tab.
        /// </summary>
        /// <value>
        /// The HTML link tab.
        /// </value>
        public string Html_link_tab
        {
            get;
            set;
        }

        /// <summary>
        /// Gets or sets the identifier.
        /// </summary>
        /// <value>
        /// The identifier.
        /// </value>
        public int Id
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
        public string Item_count
        {
            get;
            set;
        }

        /// <summary>
        /// Gets or sets the list order process.
        /// </summary>
        /// <value>
        /// The list order process.
        /// </value>
        public List<SelectListItem> List_order_process
        {
            get;
            set;
        }

        /// <summary>
        /// Gets or sets the list payment status.
        /// </summary>
        /// <value>
        /// The list payment status.
        /// </value>
        public List<SelectListItem> List_payment_status
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
        /// Gets or sets the name.
        /// </summary>
        /// <value>
        /// The name.
        /// </value>
        public string Name
        {
            get;
            set;
        }

        /// <summary>
        /// Gets or sets the order code.
        /// </summary>
        /// <value>
        /// The order code.
        /// </value>
        public string Order_code
        {
            get;
            set;
        }

        /// <summary>
        /// Gets or sets the parent action.
        /// </summary>
        /// <value>
        /// The parent action.
        /// </value>
        public string Parent_action
        {
            get;
            set;
        }

        /// <summary>
        /// Gets or sets the parent controller.
        /// </summary>
        /// <value>
        /// The parent controller.
        /// </value>
        public string Parent_controller
        {
            get;
            set;
        }

        /// <summary>
        /// Gets or sets the payment.
        /// </summary>
        /// <value>
        /// The payment.
        /// </value>
        public string Payment
        {
            get;
            set;
        }

        /// <summary>
        /// Gets or sets the Payment method.
        /// </summary>
        /// <value>
        /// The Payment method
        /// </value>
        public string Payment_method
        {
            get;
            set;
        }

        /// <summary>
        /// Gets or sets the payment status text.
        /// </summary>
        /// <value>
        /// The payment status text.
        /// </value>
        public string Payment_status_text
        {
            get;
            set;
        }

        /// <summary>
        /// Gets or sets the phone.
        /// </summary>
        /// <value>
        /// The phone.
        /// </value>
        public string Phone
        {
            get;
            set;
        }

        /// <summary>
        /// Gets or sets the process.
        /// </summary>
        /// <value>
        /// The process.
        /// </value>
        public int Process
        {
            get;
            set;
        }

        /// <summary>
        /// Gets or sets the process status text.
        /// </summary>
        /// <value>
        /// The process status text.
        /// </value>
        public string Process_status_text
        {
            get;
            set;
        }

        /// <summary>
        /// Gets or sets the search.
        /// </summary>
        /// <value>
        /// The search.
        /// </value>
        public string Search
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
        /// Gets or sets a value indicating whether this <see cref="Order_view"/> is status.
        /// </summary>
        /// <value>
        ///   <c>true</c> if status; otherwise, <c>false</c>.
        /// </value>
        public bool Status
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
        public string Sub_total
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
        /// Gets or sets the text search result.
        /// </summary>
        /// <value>
        /// The text search result.
        /// </value>
        public string Text_search_result
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
        public string Total_string
        {
            get;
            set;
        }

        /// <summary>
        /// Gets or sets the type act.
        /// </summary>
        /// <value>
        /// The type act.
        /// </value>
        public string Type_act
        {
            get;
            set;
        }

        public DateTime? ModifyDate { get; set; }
        public DateTime? BorrowedDay { get; set; }
        public DateTime? PayDay { get; set; }
    }
}