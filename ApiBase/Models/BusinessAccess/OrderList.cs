namespace ApiBase.Models.BusinessAccess
{
    using ApiBase.Models.DB;
    using System.Collections;
    using System.Collections.Generic;

    /// <summary>
    /// Order List
    /// </summary>
    public class OrderList
    {
        /// <summary>
        /// The web information
        /// </summary>
        private static WebInfoModels webInfor = new WebInfoModels();

        /// <summary>
        /// The list order detail
        /// </summary>
        private List<DetailOrder> listOrderDetail;

        /// <summary>
        /// The minimum fee
        /// </summary>
        private double minFee = double.Parse(webInfor.GetContent(CommonGlobal.MinFees).ToString(), System.Globalization.CultureInfo.InvariantCulture); ////mức tối tiểu phải tính phí ship (vnđ)

        /// <summary>
        /// The hash table orders
        /// </summary>
        private Hashtable hashtableOrders = new Hashtable();

        /// <summary>
        /// The shipp fee
        /// </summary>
        private double shippFee = double.Parse(webInfor.GetContent(CommonGlobal.Fees).ToString(), System.Globalization.CultureInfo.InvariantCulture); ////Phí vận chuyển

        /// <summary>
        /// The tax rate
        /// </summary>
        private double taxRate = double.Parse(webInfor.GetContent(CommonGlobal.Tax).ToString(), System.Globalization.CultureInfo.InvariantCulture); ////10% VAT web_infor.getContent(CommonGlobal.TAX)

        /// <summary>
        /// The global
        /// </summary>
        public CommonGlobal globals = new CommonGlobal();

        /// <summary>
        /// Initializes a new instance of the <see cref="OrderList"/> class.
        /// </summary>
        public OrderList()
        {
            this.listOrderDetail = new List<DetailOrder>();
        }

        /// <summary>
        /// Gets the count.
        /// </summary>
        /// <value>
        /// The count.
        /// </value>
        public int Count
        {
            get
            {
                int total = 0;

                if (this.hashtableOrders.Count == 0)
                {
                    total = 0;
                }

                ////craftviet.market.OrderItem x = default(craftviet.market.OrderItem);
                foreach (OrderItem x in this.hashtableOrders.Values)
                {
                    total = total + x.Quatity;
                }

                return total;
            }
        }

        /// <summary>
        /// Gets the fee.
        /// </summary>
        /// <value>
        /// The fee.
        /// </value>
        public double Fee
        {
            get
            {
                return this.SubTotal < this.minFee ? this.shippFee : 0;
            }
        }

        /// <summary>
        /// Gets or sets the list.
        /// </summary>
        /// <value>
        /// The list.
        /// </value>
        public List<DetailOrder> List
        {
            get
            {
                return this.listOrderDetail;
            }

            set
            {
                this.listOrderDetail = value;
            }
        }

        /// <summary>
        /// Gets or sets the shipp fee.
        /// </summary>
        /// <value>
        /// The shipp fee.
        /// </value>
        public double ShippFee
        {
            get
            {
                return this.shippFee;
            }

            set
            {
                this.shippFee = this.ShippFee;
            }
        }

        /// <summary>
        /// Gets the shipp fee format money.
        /// </summary>
        /// <value>
        /// The shipp fee format money.
        /// </value>
        public string ShippFee_Format_money
        {
            get
            {
                return this.ShippFee != 0 ? CommonGlobal.FormatMoney(this.ShippFee.ToString()) : "0 đ";
            }
        }

        /// <summary>
        /// Gets the sub total.
        /// </summary>
        /// <value>
        /// The sub total.
        /// </value>
        public double SubTotal
        {
            get
            {
                double sub_total = 0.0;

                if (this.hashtableOrders.Count == 0)
                {
                    sub_total = 0.0;
                }

                foreach (OrderItem x in this.hashtableOrders.Values)
                {
                    sub_total = sub_total + (x.Price * x.Quatity);
                }

                return sub_total;
            }
        }

        /// <summary>
        /// Gets the sub total format money.
        /// </summary>
        /// <value>
        /// The sub total format money.
        /// </value>
        public string SubTotal_Format_money
        {
            get
            {
                return this.Count > 0 ? CommonGlobal.FormatMoney(this.SubTotal.ToString()) : "0 đ";
            }
        }

        /// <summary>
        /// Gets the tax.
        /// </summary>
        /// <value>
        /// The tax.
        /// </value>
        public double Tax
        {
            get
            {
                return this.SubTotal * this.taxRate;
            }
        }

        /// <summary>
        /// Gets or sets the tax rate.
        /// </summary>
        /// <value>
        /// The tax rate.
        /// </value>
        public double TaxRate
        {
            get
            {
                return this.taxRate;
            }

            set
            {
                this.taxRate = this.TaxRate;
            }
        }

        /// <summary>
        /// Gets the tax format money.
        /// </summary>
        /// <value>
        /// The tax format money.
        /// </value>
        public string Tax_Format_money
        {
            get
            {
                return this.Count > 0 ? CommonGlobal.FormatMoney(this.Tax.ToString()) : "0 đ";
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
                return this.SubTotal * (1 + this.taxRate) + this.Fee;
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
                return this.Count > 0 ? CommonGlobal.FormatMoney(this.Total.ToString()) : "0 đ";
            }
        }

        /// <summary>
        /// Gets the total string.
        /// </summary>
        /// <value>
        /// The total string.
        /// </value>
        public string Total_string
        {
            get
            {
                return this.Count > 0 ? this.globals.ConvertNumberToChar(long.Parse(this.Total.ToString())) : "0 đ";
            }
        }

        /// <summary>
        /// Gets the values.
        /// </summary>
        /// <value>
        /// The values.
        /// </value>
        public ICollection Values
        {
            get
            {
                return this.hashtableOrders.Values;
            }
        }

        /// <summary>
        /// Adds the specified value.
        /// </summary>
        /// <param name="value">The value.</param>
        public void Add(OrderItem value)
        {
            if (this.hashtableOrders["Pro_" + value.ProductID + "_" + value.Property] == null)
            {
                this.hashtableOrders.Add("Pro_" + value.ProductID + "_" + value.Property, value);
            }
            else
            {
                OrderItem oI = new OrderItem();
                oI = (OrderItem)this.hashtableOrders["Pro_" + value.ProductID + "_" + value.Property];
                oI.Quatity = oI.Quatity + 1;
            }
        }

        /// <summary>
        /// Adds the specified detail order.
        /// </summary>
        /// <param name="detailOrder">detail order.</param>
        public void Add(DetailOrder detailOrder)
        {
            this.listOrderDetail.Add(detailOrder);
        }

        /// <summary>
        /// Clears this instance.
        /// </summary>
        public void Clear()
        {
            this.listOrderDetail.Clear();
        }

        /// <summary>
        /// Clears the cart.
        /// </summary>
        public void ClearCart()
        {
            this.hashtableOrders.Clear();
        }

        /// <summary>
        /// Defaults the property.
        /// </summary>
        /// <param name="name">The name.</param>
        /// <returns>the property</returns>
        public OrderItem DefaultProp(string name)
        {
            return (OrderItem)this.hashtableOrders[name];
        }

        /// <summary>
        /// Gets the order item at.
        /// </summary>
        /// <param name="keys">The keys.</param>
        /// <returns>the order</returns>
        public OrderItem GetOrderItemAt(string keys)
        {
            return (OrderItem)this.hashtableOrders[keys];
        }

        /// <summary>
        /// Removes the specified name.
        /// </summary>
        /// <param name="name">The name.</param>
        public void Remove(string name)
        {
            this.hashtableOrders.Remove(name);
        }

        /// <summary>
        /// Removes the specified it.
        /// </summary>
        /// <param name="detailOder">detail order</param>
        public void Remove(DetailOrder detailOder)
        {
            this.listOrderDetail.Remove(detailOder);
        }

        /// <summary>
        /// Sets the quantity.
        /// </summary>
        /// <param name="name">The name.</param>
        /// <param name="quantity">The quantity.</param>
        public void SetQuantity(string name, int quantity)
        {
            OrderItem it = new OrderItem();
            it = this.DefaultProp(name);
            it.Quatity = quantity;
            this.hashtableOrders.Remove(name);
            this.hashtableOrders.Add(it.Name, it);
        }
    }
}