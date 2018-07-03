namespace Web.ViewModels
{
    using System;
    using System.Collections.Generic;
    using Web.Data;
    using Web.Enums;

    /// <summary>
    /// Products detail view
    /// </summary>
    public class Products_detail_view
    {
        /// <summary>
        /// Gets or sets the array image.
        /// </summary>
        /// <value>
        /// The array image.
        /// </value>
        public List<ImageProduct> ArrayImage
        {
            get;
            set;
        }

        /// <summary>
        /// Gets or sets the catalog identifier.
        /// </summary>
        /// <value>
        /// The catalog identifier.
        /// </value>
        public string CatalogID
        {
            get;
            set;
        }

        /// <summary>
        /// Gets or sets the cate identifier.
        /// </summary>
        /// <value>
        /// The cate identifier.
        /// </value>
        public int Cate_id
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
        /// Gets or sets the date modify.
        /// </summary>
        /// <value>
        /// The date modify.
        /// </value>
        public DateTime? DateModify
        {
            get;
            set;
        }

        /// <summary>
        /// Gets or sets the image big path.
        /// </summary>
        /// <value>
        /// The image big path.
        /// </value>
        public string ImageBigPath
        {
            get;
            set;
        }

        /// <summary>
        /// Gets or sets the image path.
        /// </summary>
        /// <value>
        /// The image path.
        /// </value>
        public string ImagePath
        {
            get;
            set;
        }

        /// <summary>
        /// Gets or sets a value indicating whether this instance is hot.
        /// </summary>
        /// <value>
        ///   <c>true</c> if this instance is hot; otherwise, <c>false</c>.
        /// </value>
        public bool IsHot
        {
            get;
            set;
        }

        /// <summary>
        /// Gets or sets a value indicating whether this instance is promotion.
        /// </summary>
        /// <value>
        /// <c>true</c> if this instance is promotion; otherwise, <c>false</c>.
        /// </value>
        public bool IsPromotion
        {
            get;
            set;
        }

        /// <summary>
        /// Gets or sets a value indicating whether this instance is show.
        /// </summary>
        /// <value>
        ///   <c>true</c> if this instance is show; otherwise, <c>false</c>.
        /// </value>
        public bool IsShow
        {
            get;
            set;
        }

        /// <summary>
        /// Gets or sets the language.
        /// </summary>
        /// <value>
        /// The language.
        /// </value>
        public string Lang
        {
            get;
            set;
        }

        /// <summary>
        /// Gets or sets the link.
        /// </summary>
        /// <value>
        /// The link.
        /// </value>
        public string Link
        {
            get;
            set;
        }

        /// <summary>
        /// Gets or sets the color of the list.
        /// </summary>
        /// <value>
        /// The color of the list.
        /// </value>
        public List<C_ProductProperty> ListColor
        {
            get;
            set;
        }

        /// <summary>
        /// Gets or sets the list other product.
        /// </summary>
        /// <value>
        /// The list other product.
        /// </value>
        public List<C_Product> ListOtherProduct
        {
            get;
            set;
        }

        /// <summary>
        /// Gets or sets the list rating.
        /// </summary>
        /// <value>
        /// The list rating.
        /// </value>
        public List<C_Rating> ListRating
        {
            get;
            set;
        }

        /// <summary>
        /// Gets or sets the size of the list.
        /// </summary>
        /// <value>
        /// The size of the list.
        /// </value>
        public List<C_ProductProperty> ListSize
        {
            get;
            set;
        }

        /// <summary>
        /// Gets or sets the name of the list category.
        /// </summary>
        /// <value>
        /// The name of the list category.
        /// </value>
        public string ListCategoryName
        {
            get;
            set;
        }

        /// <summary>
        /// Gets or sets the name of the list collection.
        /// </summary>
        /// <value>
        /// The name of the list collection.
        /// </value>
        public string ListCollectionName
        {
            get;
            set;
        }

        /// <summary>
        /// Gets or sets the list color view.
        /// </summary>
        /// <value>
        /// The list color view.
        /// </value>
        public string ListColorView
        {
            get;
            set;
        }

        /// <summary>
        /// Gets or sets the list rating view.
        /// </summary>
        /// <value>
        /// The list rating view.
        /// </value>
        public string ListRatingView
        {
            get;
            set;
        }

        /// <summary>
        /// Gets or sets the list thumb image view.
        /// </summary>
        /// <value>
        /// The list thumb image view.
        /// </value>
        public string ListThumbImageView
        {
            get;
            set;
        }

        /// <summary>
        /// Gets or sets the list size view.
        /// </summary>
        /// <value>
        /// The list size view.
        /// </value>
        public string ListSizeView
        {
            get;
            set;
        }

        /// <summary>
        /// Gets or sets the manufacture.
        /// </summary>
        /// <value>
        /// The manufacture.
        /// </value>
        public string Manufacture
        {
            get;
            set;
        }

        /// <summary>
        /// Gets or sets the order display.
        /// </summary>
        /// <value>
        /// The order display.
        /// </value>
        public int OrderDisplay
        {
            get;
            set;
        }

        /// <summary>
        /// Gets or sets the payment guide.
        /// </summary>
        /// <value>
        /// The payment guide.
        /// </value>
        public string PaymentGuide
        {
            get;
            set;
        }

        /// <summary>
        /// Gets or sets the price new.
        /// </summary>
        /// <value>
        /// The price new.
        /// </value>
        public string PriceNew
        {
            get;
            set;
        }

        /// <summary>
        /// Gets or sets the price old.
        /// </summary>
        /// <value>
        /// The price old.
        /// </value>
        public decimal PriceOld
        {
            get;
            set;
        }

        /// <summary>
        /// Gets or sets the product code.
        /// </summary>
        /// <value>
        /// The product code.
        /// </value>
        public string ProductCode
        {
            get;
            set;
        }

        /// <summary>
        /// Gets or sets the product identifier.
        /// </summary>
        /// <value>
        /// The product identifier.
        /// </value>
        public int ProductID
        {
            get;
            set;
        }

        /// <summary>
        /// Gets or sets the name of the product.
        /// </summary>
        /// <value>
        /// The name of the product.
        /// </value>
        public string ProductName
        {
            get;
            set;
        }

        /// <summary>
        /// Gets or sets the promotion.
        /// </summary>
        /// <value>
        /// The promotion.
        /// </value>
        public string Promotion
        {
            get;
            set;
        }

        /// <summary>
        /// Gets or sets the rating start.
        /// </summary>
        /// <value>
        /// The rating start.
        /// </value>
        public string RatingStart
        {
            get;
            set;
        }

        /// <summary>
        /// Gets or sets the rating sum.
        /// </summary>
        /// <value>
        /// The rating sum.
        /// </value>
        public int RatingSum
        {
            get;
            set;
        }

        /// <summary>
        /// Gets or sets the rating total.
        /// </summary>
        /// <value>
        /// The rating total.
        /// </value>
        public int RatingTotal
        {
            get;
            set;
        }

        /// <summary>
        /// Gets or sets the store.
        /// </summary>
        /// <value>
        /// The store.
        /// </value>
        public string Store
        {
            get;
            set;
        }

        /// <summary>
        /// Gets or sets the summary.
        /// </summary>
        /// <value>
        /// The summary.
        /// </value>
        public string Summary
        {
            get;
            set;
        }

        /// <summary>
        /// Gets or sets the URL.
        /// </summary>
        /// <value>
        /// The URL.
        /// </value>
        public string Url
        {
            get;
            set;
        }

        /// <summary>
        /// Gets or sets the views.
        /// </summary>
        /// <value>
        /// The views.
        /// </value>
        public int Views
        {
            get;
            set;
        }

        /// <summary>
        /// Gets or sets the warranty.
        /// </summary>
        /// <value>
        /// The warranty.
        /// </value>
        public string Warranty
        {
            get;
            set;
        }

        public DocTypeViewEnum DocTypeView
        {
            get;
            set;
        }

        public bool CanViewOnline
        {
            get;
            set;
        }

        public string DocType { get; set; }
        public string DocLangISO { get; set; }
        public string DocLang { get; set; }
        public string DocCountryCode { get; set; }
        public string DocTitleTranslate { get; set; }
        public string DocAuthor { get; set; }
        public string DocAuthorGroup { get; set; }
        public string DocChuBien { get; set; }
        public string DocBienSoan { get; set; }
        public string DocNguoiDich { get; set; }
        public string DocHieuDinh { get; set; }
        public string DocDiaChiXuatBan { get; set; }
        public string DocNhaXuatBan { get; set; }
        public Nullable<int> DocNamXuatBan { get; set; }
        public Nullable<int> DocLanXuatBan { get; set; }
        public Nullable<int> DocSoTrang { get; set; }
        public string DocTenTap { get; set; }
        public Nullable<int> DocSoLanPhanLoai { get; set; }
        public string DocDiaChiTaiLieu { get; set; }
        public string DocTomTat { get; set; }
        public string DocNguoiXuLy { get; set; }
        public string DocNguoiHieuDinh { get; set; }
    }
}