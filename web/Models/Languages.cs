namespace Web.Models
{
    using System;
    using System.Collections.Generic;
    using System.Globalization;
    using System.Linq;
    using System.Web;

    /// <summary>
    /// the Languages
    /// </summary>
    public class Languages
    {
        /// <summary>
        /// Gets or sets the name of the language culture.
        /// </summary>
        /// <value>
        /// The name of the language culture.
        /// </value>
        public string LangCultureName
        {
            get;
            set;
        }

        /// <summary>
        /// Gets or sets the language flag.
        /// </summary>
        /// <value>
        /// The language flag.
        /// </value>
        public string LangFlag
        {
            get;
            set;
        }

        /// <summary>
        /// Gets or sets the full name of the language.
        /// </summary>
        /// <value>
        /// The full name of the language.
        /// </value>
        public string LangFullName
        {
            get;
            set;
        }
    }
}