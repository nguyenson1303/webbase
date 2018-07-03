namespace DBBase.EntitysObject
{
    using DBBase.Data;
    using System;
    using System.Collections.Generic;

    /// <summary>
    /// Post detail view
    /// </summary>
    public class Post_detail_view
    {
        /// <summary>
        /// Gets or sets the approve.
        /// </summary>
        /// <value>
        /// The approve.
        /// </value>
        public bool? Approve
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
        public int? CatalogID
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
        /// Gets or sets the date modified.
        /// </summary>
        /// <value>
        /// The date modified.
        /// </value>
        public DateTime? DateModified
        {
            get;
            set;
        }

        /// <summary>
        /// Gets or sets the description.
        /// </summary>
        /// <value>
        /// The description.
        /// </value>
        public string Description
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
        /// Gets or sets the is hot.
        /// </summary>
        /// <value>
        /// The is hot.
        /// </value>
        public bool? IsHot
        {
            get;
            set;
        }

        /// <summary>
        /// Gets or sets the keyword.
        /// </summary>
        /// <value>
        /// The keyword.
        /// </value>
        public string Keyword
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
        /// Gets or sets the list other.
        /// </summary>
        /// <value>
        /// The list other.
        /// </value>
        public List<C_Post> ListOther
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
        /// Gets or sets the order display.
        /// </summary>
        /// <value>
        /// The order display.
        /// </value>
        public int? OrderDisplay
        {
            get;
            set;
        }

        /// <summary>
        /// Gets or sets the content of the post.
        /// </summary>
        /// <value>
        /// The content of the post.
        /// </value>
        public string PostContent
        {
            get;
            set;
        }

        /// <summary>
        /// Gets or sets the post identifier.
        /// </summary>
        /// <value>
        /// The post identifier.
        /// </value>
        public int PostID
        {
            get;
            set;
        }

        /// <summary>
        /// Gets or sets the name of the post.
        /// </summary>
        /// <value>
        /// The name of the post.
        /// </value>
        public string PostName
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
        /// Gets or sets the title.
        /// </summary>
        /// <value>
        /// The title.
        /// </value>
        public string Title
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
    }
}