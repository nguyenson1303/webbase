﻿namespace Web.ViewModels
{
    using System.Collections.Generic;
    using Web.Data;

    /// <summary>
    /// Slide view
    /// </summary>
    public class Slide_view
    {
        /// <summary>
        /// Gets or sets the list1.
        /// </summary>
        /// <value>
        /// The list1.
        /// </value>
        public List<C_Link> List1
        {
            get;
            set;
        }

        /// <summary>
        /// Gets or sets the list2.
        /// </summary>
        /// <value>
        /// The list2.
        /// </value>
        public List<C_Link> List2
        {
            get;
            set;
        }

        /// <summary>
        /// Gets or sets the slide content1.
        /// </summary>
        /// <value>
        /// The slide content1.
        /// </value>
        public string Slide_content1
        {
            get;
            set;
        }

        /// <summary>
        /// Gets or sets the slide content2.
        /// </summary>
        /// <value>
        /// The slide content2.
        /// </value>
        public string Slide_content2
        {
            get;
            set;
        }
    }
}