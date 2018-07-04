using System.Collections.Generic;

namespace ApiBase.Model
{
    /// <summary>
    /// admin menu view
    /// </summary>
    public class AdminMenu
    {
        public string title { get; set; }
        public string icon { get; set; }
        public string link { get; set; }        
        public bool home { get; set; }
        public bool group { get; set; }

        public List<AdminMenu> children { get; set; }
    }
}