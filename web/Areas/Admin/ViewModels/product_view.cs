namespace Web.Areas.Admin.ViewModels
{
    using System;
    using System.Collections.Generic;
    using System.Web;
    using System.Web.Mvc;

    /// <summary>
    /// product view
    /// </summary>
    public class Product_view
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
        /// Gets or sets the date modify.
        /// </summary>
        /// <value>
        /// The date modify.
        /// </value>
        public DateTime DateModify
        {
            get;
            set;
        }

        /// <summary>
        /// Gets or sets the file image.
        /// </summary>
        /// <value>
        /// The file image.
        /// </value>
        public HttpPostedFileBase File_image
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
        /// Gets or sets the is hot text.
        /// </summary>
        /// <value>
        /// The is hot text.
        /// </value>
        public string IsHot_text
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
        /// Gets or sets the is promotion text.
        /// </summary>
        /// <value>
        /// The is promotion text.
        /// </value>
        public string IsPromotion_text
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
        /// Gets or sets the is show text.
        /// </summary>
        /// <value>
        /// The is show text.
        /// </value>
        public string IsShow_text
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
        /// Gets or sets the list brand.
        /// </summary>
        /// <value>
        /// The list brand.
        /// </value>
        public List<SelectListItem> List_brand
        {
            get;
            set;
        }

        /// <summary>
        /// Gets or sets the list language.
        /// </summary>
        /// <value>
        /// The list language.
        /// </value>
        public List<SelectListItem> List_language
        {
            get;
            set;
        }

        /// <summary>
        /// Gets or sets the list page_size.
        /// </summary>
        /// <value>
        /// The list page_size.
        /// </value>
        public List<SelectListItem> List_page_size
        {
            get;
            set;
        }

        /// <summary>
        /// Gets or sets the list parent.
        /// </summary>
        /// <value>
        /// The list parent.
        /// </value>
        public List<SelectListItem> List_parent
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
        /// Gets or sets the multi cate.
        /// </summary>
        /// <value>
        /// The multi cate.
        /// </value>
        public string Multi_cate
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
        /// Gets or sets the parent.
        /// </summary>
        /// <value>
        /// The parent.
        /// </value>
        public int Parent
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
        /// Gets or sets the parent select.
        /// </summary>
        /// <value>
        /// The parent select.
        /// </value>
        public int[] Parent_select
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
        public decimal PriceNew
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
        /// Gets or sets the rating.
        /// </summary>
        /// <value>
        /// The rating.
        /// </value>
        public int Rating
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
        /// Gets or sets the store.
        /// </summary>
        /// <value>
        /// The store.
        /// </value>
        public int Store
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
        /// Gets or sets the type.
        /// </summary>
        /// <value>
        /// The type.
        /// </value>
        public string Type
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

        /// <summary>
        /// Gets or sets the type property.
        /// </summary>
        /// <value>
        /// The type property.
        /// </value>
        public string Type_property
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
        public int? DocNamXuatBan { get; set; }
        public int? DocLanXuatBan { get; set; }
        public int? DocSoTrang { get; set; }
        public string DocTenTap { get; set; }
        public int? DocSoLanPhanLoai { get; set; }
        public string DocDiaChiTaiLieu { get; set; }
        public string DocTomTat { get; set; }
        public string DocNguoiXuLy { get; set; }
        public string DocNguoiHieuDinh { get; set; }
        public int? Borrow { get; set; }
        public int? DocTypeView { get; set; }
    }
}