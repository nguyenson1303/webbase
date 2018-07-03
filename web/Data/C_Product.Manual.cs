using System;
using Web.Enums;

namespace Web.Data
{
    public partial class C_Product
    {
        public DocTypeViewEnum DocTypeViewEnum
        {
            get
            {
                //if (DocTypeView == Convert.ToInt32(DocTypeViewEnum.Pdf))
                //{
                //    return DocTypeViewEnum.Pdf;
                //}

                return DocTypeViewEnum.Img;
            }
        }

        public bool CanViewOnline { get; set; }
    }
}