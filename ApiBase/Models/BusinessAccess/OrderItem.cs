namespace ApiBase.Models.BusinessAccess
{
    /// <summary>
    /// Order Item
    /// </summary>
    public class OrderItem
    {
        /// <summary>
        /// The image path
        /// </summary>
        public string ItemImagePath;

        /// <summary>
        /// The name
        /// </summary>
        public string ItemName;

        /// <summary>
        /// The price
        /// </summary>
        public double ItemPrice;

        /// <summary>
        /// The price format money
        /// </summary>
        public string ItemPriceFormatMoney;

        /// <summary>
        /// The product identifier
        /// </summary>
        public int ItemProductID;

        /// <summary>
        /// The product link
        /// </summary>
        public string ItemProductLink;

        /// <summary>
        /// The product name
        /// </summary>
        public string ItemProductName;

        /// <summary>
        /// The property
        /// </summary>
        public string ItemProperty;

        /// <summary>
        /// The property detail
        /// </summary>
        public string ItemPropertyDetail;

        /// <summary>
        /// The quantity
        /// </summary>
        public int ItemQuatity;

        /// <summary>
        /// The summary
        /// </summary>
        public string ItemSummary;

        /// <summary>
        /// Initializes a new instance of the <see cref="OrderItem"/> class.
        /// </summary>
        /// <param name="productID">The product identifier.</param>
        /// <param name="name">The name.</param>
        /// <param name="price">The price.</param>
        /// <param name="quantity">The quantity.</param>
        /// <param name="properties">The properties.</param>
        public OrderItem(int productID, string name, double price, int quantity, string properties)
        : base()
        {
            this.ItemProductID = productID;
            this.ItemQuatity = quantity;
            this.ItemName = name;
            this.ItemPrice = price;
            this.ItemProperty = properties;
        }

        /// <summary>
        /// Initializes a new instance of the <see cref="OrderItem"/> class.
        /// </summary>
        public OrderItem()
        {
        }

        /// <summary>
        /// Gets or sets the image path.
        /// </summary>
        /// <value>
        /// The image path.
        /// </value>
        public string ImagePath
        {
            get
            {
                return this.ItemImagePath;
            }

            set
            {
                this.ItemImagePath = value;
            }
        }

        /// <summary>
        /// Gets or sets the name.
        /// </summary>
        /// <value>
        /// The name.
        /// </value>
        public string Name
        {
            get
            {
                return this.ItemName;
            }

            set
            {
                this.ItemName = value;
            }
        }

        /// <summary>
        /// Gets or sets the price.
        /// </summary>
        /// <value>
        /// The price.
        /// </value>
        public double Price
        {
            get
            {
                return this.ItemPrice;
            }

            set
            {
                this.ItemPrice = value;
            }
        }

        /// <summary>
        /// Gets the price format money.
        /// </summary>
        /// <value>
        /// The price format money.
        /// </value>
        public string Price_Format_money
        {
            get
            {
                return this.Price != 0 ? CommonGlobal.FormatMoney(this.Price.ToString()) : "0 đ";
            }
        }

        /// <summary>
        /// Gets or sets the product identifier.
        /// </summary>
        /// <value>
        /// The product identifier.
        /// </value>
        public int ProductID
        {
            get
            {
                return this.ItemProductID;
            }

            set
            {
                this.ItemProductID = value;
            }
        }

        /// <summary>
        /// Gets or sets the product link.
        /// </summary>
        /// <value>
        /// The product link.
        /// </value>
        public string ProductLink
        {
            get
            {
                return this.ItemProductLink;
            }

            set
            {
                this.ItemProductLink = value;
            }
        }

        /// <summary>
        /// Gets or sets the name of the product.
        /// </summary>
        /// <value>
        /// The name of the product.
        /// </value>
        public string ProductName
        {
            get
            {
                return this.ItemProductName;
            }

            set
            {
                this.ItemProductName = value;
            }
        }

        /// <summary>
        /// Gets or sets the property.
        /// </summary>
        /// <value>
        /// The property.
        /// </value>
        public string Property
        {
            get
            {
                return this.ItemProperty;
            }

            set
            {
                this.ItemProperty = value;
            }
        }

        /// <summary>
        /// Gets or sets the property detail.
        /// </summary>
        /// <value>
        /// The property detail.
        /// </value>
        public string Property_detail
        {
            get
            {
                return this.ItemPropertyDetail;
            }

            set
            {
                this.ItemPropertyDetail = value;
            }
        }

        /// <summary>
        /// Gets or sets the quatity.
        /// </summary>
        /// <value>
        /// The quantity.
        /// </value>
        public int Quatity
        {
            get
            {
                return this.ItemQuatity;
            }

            set
            {
                this.ItemQuatity = value;
            }
        }

        /// <summary>
        /// Gets or sets the summary.
        /// </summary>
        /// <value>
        /// The summary.
        /// </value>
        public string Summary
        {
            get
            {
                return this.ItemSummary;
            }

            set
            {
                this.ItemSummary = value;
            }
        }

        /// <summary>
        /// Gets the total.
        /// </summary>
        /// <value>
        /// The total.
        /// </value>
        public double Total
        {
            get
            {
                return this.ItemQuatity * this.ItemPrice;
            }
        }

        /// <summary>
        /// Gets the total format money.
        /// </summary>
        /// <value>
        /// The total format money.
        /// </value>
        public string Total_Format_money
        {
            get
            {
                return this.Total != 0 ? CommonGlobal.FormatMoney(this.Total.ToString()) : "0 đ";
            }
        }
    }
}