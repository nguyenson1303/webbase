using System;
using System.Collections.Generic;

namespace ApiBase.Models.DB
{
    public partial class ImageAlbums
    {
        public int Id { get; set; }
        public int? CatalogId { get; set; }
        public string Images { get; set; }
        public string ImagesFull { get; set; }
        public string ImagesName { get; set; }
        public string ImagesDes { get; set; }
    }
}
