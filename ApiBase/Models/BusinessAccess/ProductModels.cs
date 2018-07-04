namespace ApiBase.Models.BusinessAccess
{
    using ApiBase.Models.DB;
    using Microsoft.EntityFrameworkCore;
    using System;
    using System.Collections;
    using System.Collections.Generic;
    using System.Data.SqlClient;
    using System.Linq;

    /// <summary>
    /// Product Models
    /// </summary>
    public class ProductModels
    {
        /// <summary>
        /// Initializes a new instance of the <see cref="ProductModels"/> class.
        /// </summary>
        public ProductModels()
        {
        }

        /// <summary>
        /// Gets all product by type cate.
        /// </summary>
        /// <param name="type_cate">The type cate.</param>
        /// <param name="lang">The language.</param>
        /// <param name="search">The search.</param>
        /// <param name="tag">The tag.</param>
        /// <param name="param">The parameter.</param>
        /// <param name="active">if set to <c>true</c> [active].</param>
        /// <returns>List Product</returns>
        public static List<Product> GetAllProductByTypeCate(string type_cate, string lang, string search, string typekey, string tag, string param, bool active)
        {
            using (var data = new themanorContext())
            {
                List<Product> list_product = new List<Product>();
                try
                {
                    ////if (active == null) { active = true; }

                    var Type = new SqlParameter("@Type", type_cate);

                    var list = data.Product.FromSql("EXECUTE _Product_GetByCatalogType  @Type", Type).Where(sp => sp.Lang.Trim().ToLower() == lang.ToLower() && sp.IsShow == active).ToList();

                    // var list = data.f_Product_GetByCatalogType(type_cate).Where(sp => sp.Lang.Trim().ToLower() == lang.ToLower() && sp.IsShow == active).ToList();

                    if (list != null)
                    {
                        //list = list.Where(p => p.ProductName.Contains(search) || p.Summary.Contains(search)).ToList();
                        //int NoSearch = 0;
                        switch (typekey)
                        {
                            case "ProductName":
                                list = list.Where(p => p.ProductName.ToLower().Contains(search.ToLower())).ToList();
                                break;
                            //case "DocAuthor":
                            //    list = list.Where(p => p.DocAuthor.ToLower().Contains(search.ToLower())).ToList();
                            //    break;
                            //case "DocAuthorGroup":
                            //    list = list.Where(p => p.DocAuthorGroup.ToLower().Contains(search.ToLower())).ToList();
                            //    break;
                            //case "DocChuBien":
                            //    list = list.Where(p => p.DocChuBien.ToLower().Contains(search.ToLower())).ToList();
                            //    break;
                            //case "DocBienSoan":
                            //    list = list.Where(p => p.DocBienSoan.ToLower().Contains(search.ToLower())).ToList();
                            //    break;
                            //case "DocNguoiDich":
                            //    list = list.Where(p => p.DocNguoiDich.ToLower().Contains(search.ToLower())).ToList();
                            //    break;
                            //case "DocHieuDinh":
                            //    list = list.Where(p => p.DocHieuDinh.ToLower().Contains(search.ToLower())).ToList();
                            //    break;
                            //case "DocDiaChiXuatBan":
                            //    list = list.Where(p => p.DocDiaChiXuatBan.ToLower().Contains(search.ToLower())).ToList();
                            //    break;
                            //case "DocNhaXuatBan":
                            //    list = list.Where(p => p.DocNhaXuatBan.ToLower().Contains(search.ToLower())).ToList();
                            //    break;
                            //case "DocNamXuatBan":
                            //    NoSearch = 0;
                            //    if (!string.IsNullOrEmpty(search) && int.TryParse(search, out NoSearch))
                            //    {
                            //        list = list.Where(p => p.DocNamXuatBan == NoSearch).ToList();
                            //    }

                            //    break;
                            //case "DocLanXuatBan":
                            //    NoSearch = 0;
                            //    if (!string.IsNullOrEmpty(search) && int.TryParse(search, out NoSearch))
                            //    {
                            //        list = list.Where(p => p.DocLanXuatBan == NoSearch).ToList();
                            //    }

                            //    break;
                            //case "DocTenTap":
                            //    list = list.Where(p => p.DocTenTap.ToLower().Contains(search.ToLower())).ToList();
                            //    break;
                            //case "DocSoLanPhanLoai":
                            //    if (!string.IsNullOrEmpty(search) && int.TryParse(search, out NoSearch))
                            //    {
                            //        list = list.Where(p => p.DocSoLanPhanLoai == NoSearch).ToList();
                            //    }
                            //    break;
                            //case "DocDiaChiTaiLieu":
                            //    list = list.Where(p => p.DocDiaChiTaiLieu.ToLower().Contains(search.ToLower())).ToList();
                            //    break;
                            //case "DocTomTat":
                            //    list = list.Where(p => p.DocTomTat.ToLower().Contains(search.ToLower())).ToList();
                            //    break;
                            default:
                                list = list.Where(p => p.ProductName.ToLower().Contains(search.ToLower())).ToList();
                                break;
                        }
                    }

                    if (!string.IsNullOrEmpty(tag))
                    {
                        list = (from p in list
                                join t in data.ProductTag on p.ProductId equals t.ProductId
                                where t.Link == tag
                                select p).ToList();
                    }

                    var list_product_param = data.Product.FromSql("EXECUTE _Product_GetByCatalogType  @Type", Type).ToList();

                    //List<f_Product_GetByCatalogType_Result> list_product_param = new List<f_Product_GetByCatalogType_Result>();
                    string[] arr_param = null;
                    string[] arr_param2 = new string[] { CommonGlobal.Size, CommonGlobal.Color };
                    ////get param list product property
                    if (!string.IsNullOrEmpty(param) && param.Length > 1)
                    {
                        if (param.Contains(';'))
                        {
                            arr_param = param.Split(';');
                            if (arr_param.Length > 0)
                            {
                                for (int i = 0; i < arr_param2.Length; i++)
                                {
                                    try
                                    {
                                        if (arr_param[i].Length > 0)
                                        {
                                            ////var lst_property_id = arr_param[i].Split(',').Select(Int32.Parse).ToList();
                                            var lst_property = arr_param[i].Split(',').ToList();
                                            var c_gen = (from p in list
                                                         join t in data.ProductProperty on p.ProductId equals t.ProductId
                                                         where lst_property.Contains(t.Value) && t.Type == arr_param2[i]
                                                         select p).ToList();
                                            foreach (var it in c_gen)
                                            {
                                                list_product_param.Add(it);
                                            }
                                        }
                                    }
                                    catch
                                    {
                                    }
                                }

                                foreach (var it in list_product_param)
                                {
                                    Product c_gen = new Product();
                                    c_gen.ProductId = it.ProductId;
                                    c_gen.ProductName = it.ProductName;
                                    c_gen.ProductCode = it.ProductCode;
                                    c_gen.CatalogId = it.CatalogId;
                                    c_gen.Summary = it.Summary;
                                    c_gen.Content = it.Content;
                                    c_gen.ImageBigPath = it.ImageBigPath;
                                    c_gen.ImagePath = it.ImagePath;
                                    c_gen.DateModify = it.DateModify;
                                    c_gen.Store = it.Store;
                                    c_gen.Promotion = it.Promotion;
                                    c_gen.Warranty = it.Warranty;
                                    c_gen.Manufacture = it.Manufacture;
                                    c_gen.PriceOld = it.PriceOld;
                                    c_gen.PriceNew = it.PriceNew;
                                    c_gen.Views = it.Views;
                                    c_gen.OrderDisplay = it.OrderDisplay;
                                    c_gen.Lang = it.Lang;
                                    c_gen.IsShow = it.IsShow;
                                    c_gen.IsHot = it.IsHot;
                                    c_gen.IsPromotion = it.IsPromotion;
                                    c_gen.Link = it.Link;
                                    c_gen.Rating = it.Rating;

                                    //c_gen.DocType = it.DocType;
                                    //c_gen.DocLangISO = it.DocLangISO;
                                    //c_gen.DocLang = it.DocLang;
                                    //c_gen.DocCountryCode = it.DocCountryCode;
                                    //c_gen.DocTitleTranslate = it.DocTitleTranslate;
                                    //c_gen.DocAuthor = it.DocAuthor;
                                    //c_gen.DocAuthorGroup = it.DocAuthorGroup;
                                    //c_gen.DocChuBien = it.DocChuBien;
                                    //c_gen.DocBienSoan = it.DocBienSoan;
                                    //c_gen.DocNguoiDich = it.DocNguoiDich;
                                    //c_gen.DocHieuDinh = it.DocHieuDinh;
                                    //c_gen.DocDiaChiXuatBan = it.DocDiaChiXuatBan;
                                    //c_gen.DocNhaXuatBan = it.DocNhaXuatBan;
                                    //c_gen.DocNamXuatBan = it.DocNamXuatBan;
                                    //c_gen.DocLanXuatBan = it.DocLanXuatBan;
                                    //c_gen.DocSoTrang = it.DocSoTrang;
                                    //c_gen.DocTenTap = it.DocTenTap;
                                    //c_gen.DocSoLanPhanLoai = it.DocSoLanPhanLoai;
                                    //c_gen.DocDiaChiTaiLieu = it.DocDiaChiTaiLieu;
                                    //c_gen.DocTomTat = it.DocTomTat;
                                    //c_gen.DocNguoiXuLy = it.DocNguoiXuLy;
                                    //c_gen.DocNguoiHieuDinh = it.DocNguoiHieuDinh;

                                    //c_gen.DocTypeView = it.DocTypeView;

                                    list_product.Add(c_gen);
                                }
                            }
                        }
                    }
                    else
                    {
                        foreach (var it in list)
                        {
                            Product c_gen = new Product();
                            c_gen.ProductId = it.ProductId;
                            c_gen.ProductName = it.ProductName;
                            c_gen.ProductCode = it.ProductCode;
                            c_gen.CatalogId = it.CatalogId;
                            c_gen.Summary = it.Summary;
                            c_gen.Content = it.Content;
                            c_gen.ImageBigPath = it.ImageBigPath;
                            c_gen.ImagePath = it.ImagePath;
                            c_gen.DateModify = it.DateModify;
                            c_gen.Store = it.Store;
                            c_gen.Promotion = it.Promotion;
                            c_gen.Warranty = it.Warranty;
                            c_gen.Manufacture = it.Manufacture;
                            c_gen.PriceOld = it.PriceOld;
                            c_gen.PriceNew = it.PriceNew;
                            c_gen.Views = it.Views;
                            c_gen.OrderDisplay = it.OrderDisplay;
                            c_gen.Lang = it.Lang;
                            c_gen.IsShow = it.IsShow;
                            c_gen.IsHot = it.IsHot;
                            c_gen.IsPromotion = it.IsPromotion;
                            c_gen.Link = it.Link;
                            c_gen.Rating = it.Rating;

                            //c_gen.DocType = it.DocType;
                            //c_gen.DocLangISO = it.DocLangISO;
                            //c_gen.DocLang = it.DocLang;
                            //c_gen.DocCountryCode = it.DocCountryCode;
                            //c_gen.DocTitleTranslate = it.DocTitleTranslate;
                            //c_gen.DocAuthor = it.DocAuthor;
                            //c_gen.DocAuthorGroup = it.DocAuthorGroup;
                            //c_gen.DocChuBien = it.DocChuBien;
                            //c_gen.DocBienSoan = it.DocBienSoan;
                            //c_gen.DocNguoiDich = it.DocNguoiDich;
                            //c_gen.DocHieuDinh = it.DocHieuDinh;
                            //c_gen.DocDiaChiXuatBan = it.DocDiaChiXuatBan;
                            //c_gen.DocNhaXuatBan = it.DocNhaXuatBan;
                            //c_gen.DocNamXuatBan = it.DocNamXuatBan;
                            //c_gen.DocLanXuatBan = it.DocLanXuatBan;
                            //c_gen.DocSoTrang = it.DocSoTrang;
                            //c_gen.DocTenTap = it.DocTenTap;
                            //c_gen.DocSoLanPhanLoai = it.DocSoLanPhanLoai;
                            //c_gen.DocDiaChiTaiLieu = it.DocDiaChiTaiLieu;
                            //c_gen.DocTomTat = it.DocTomTat;
                            //c_gen.DocNguoiXuLy = it.DocNguoiXuLy;
                            //c_gen.DocNguoiHieuDinh = it.DocNguoiHieuDinh;

                            //c_gen.DocTypeView = it.DocTypeView;

                            list_product.Add(c_gen);
                        }
                    }

                    return list_product;
                }
                catch
                {
                    return null;
                }
            }
        }

        /// <summary>
        /// Gets all products.
        /// </summary>
        /// <returns>List Product</returns>
        public static List<Product> GetAllProducts()
        {
            using (var data = new themanorContext())
            {
                try
                {
                    var c_gen = data.Product.OrderByDescending(p => p.DateModify).ToList();
                    return c_gen;
                }
                catch (Exception)
                {
                    return null;
                }
            }
        }

        /// <summary>
        /// Gets all products.
        /// </summary>
        /// <param name="lang">The language.</param>
        /// <param name="active">if set to <c>true</c> [active].</param>
        /// <returns>List products</returns>
        public static List<Product> GetAllProducts(string lang, bool active)
        {
            using (var data = new themanorContext())
            {
                try
                {
                    ////if (active == null) { active = true; }

                    return data.Product.Where(sp => sp.Lang.Trim().ToLower() == lang.ToLower()
                                                && sp.IsShow == active).OrderByDescending(sp => sp.OrderDisplay).ToList<Product>();
                }
                catch (Exception)
                {
                    return null;
                }
            }
        }

        /// <summary>
        /// Gets all products.
        /// </summary>
        /// <param name="nameProduct">The product name.</param>
        /// <param name="lang">The language.</param>
        /// <param name="active">if set to <c>true</c> [active].</param>
        /// <returns>List products</returns>
        public List<Product> GetAllProducts(string nameProduct, string lang, bool active)
        {
            using (var data = new themanorContext())
            {
                List<Product> lstSanPham = new List<Product>();
                lstSanPham = data.Product.OrderByDescending(p => p.DateModify).ToList();

                try
                {
                    if (nameProduct != string.Empty)
                    {
                        lstSanPham = lstSanPham.Where(sp => ((sp.ProductName.ToLower().Contains(nameProduct.ToLower()) || sp.ProductCode == nameProduct.Trim()) &&
                                                             sp.Lang.Trim().ToLower() == lang.ToLower() &&
                                                             sp.IsShow == active)).ToList<Product>();
                    }

                    return lstSanPham.OrderByDescending(sp => sp.DateModify).ToList<Product>();
                }
                catch
                {
                    return null;
                }
            }
        }

        /// <summary>
        /// Gets all products.
        /// </summary>
        /// <param name="namePro">The name pro.</param>
        /// <param name="minPrc">The minimum PRC.</param>
        /// <param name="maxPrc">The maximum PRC.</param>
        /// <param name="lang">The language.</param>
        /// <param name="active">if set to <c>true</c> [active].</param>
        /// <returns>List products</returns>
        public static List<Product> GetAllProducts(string namePro, string minPrc, string maxPrc, string lang, bool active)
        {
            using (var data = new themanorContext())
            {
                List<Product> lstProduct = new List<Product>();
                lstProduct = data.Product.OrderByDescending(p => p.DateModify).ToList();
                try
                {
                    if (namePro != string.Empty)
                    {
                        lstProduct = lstProduct.Where(sp => (sp.ProductName.ToLower().Contains(namePro.ToLower()) ||
                                                      sp.ProductCode.ToLower().Contains(namePro.ToLower())) &&
                                                      sp.Lang.Trim().ToLower() == lang.ToLower() &&
                                                      sp.IsShow == active).ToList<Product>();
                    }

                    if (minPrc != "0" && maxPrc != "0" && Convert.ToDouble(minPrc) < Convert.ToDouble(maxPrc))
                    {
                        lstProduct = lstProduct.Where(sp => sp.PriceNew > Convert.ToDecimal(minPrc) &&
                                                      sp.PriceNew <= Convert.ToDecimal(maxPrc) &&
                                                      sp.Lang.Trim().ToLower() == lang.ToLower() &&
                                                      sp.IsShow == active).ToList<Product>();
                    }

                    return lstProduct.OrderByDescending(sp => sp.DateModify).ToList<Product>();
                }
                catch
                {
                    return null;
                }
            }
        }

        /// <summary>
        /// Get the tags.
        /// </summary>
        /// <param name="lang">The language.</param>
        /// <param name="tags">The tags.</param>
        /// <returns>List Product</returns>
        public static List<Product> GetbyTags(string lang, string tags)
        {
            using (var data = new themanorContext())
            {
                try
                {
                    var c_gen = (from p in data.Product
                                 join t in data.ProductTag on p.ProductId equals t.ProductId
                                 where t.Link == tags && p.Lang.Trim().ToLower() == lang.ToLower()
                                 select p).ToList<Product>();

                    return c_gen;
                }
                catch (Exception)
                {
                    return new List<Product>();
                }
            }
        }

        /// <summary>
        /// Gets the product new.
        /// </summary>
        /// <param name="number">The number.</param>
        /// <param name="lang">The language.</param>
        /// <returns>List Product</returns>
        public static List<Product> GetProductNew(int number, string lang)
        {
            using (var data = new themanorContext())
            {
                try
                {
                    return GetAllProducts(lang, true).Take(number).OrderBy(p => p.OrderDisplay).ToList<Product>();
                }
                catch
                {
                    return null;
                }
            }
        }


        /// <summary>
        /// Admins the get all product by parent identifier.
        /// </summary>
        /// <param name="parent">The parent.</param>
        /// <param name="type">The type.</param>
        /// <param name="lang">The language.</param>
        /// <param name="search">The search.</param>
        /// <param name="page_index">The page index.</param>
        /// <param name="page_size">The page size.</param>
        /// <param name="order_by">The order by.</param>
        /// <param name="order_type">Type of the order.</param>
        /// <param name="is_show">The is show.</param>
        /// <param name="is_hot">The is hot.</param>
        /// <param name="is_promotion">The is promotion.</param>
        /// <param name="total">The total.</param>
        /// <returns>PagedList Product</returns>
        public List<Product> AdminGetAllProductByParentID(int parent, string type, string lang, string search, int page_index, int page_size, string order_by, string order_type, bool? is_show, bool? is_hot, bool? is_promotion, out int total, out int Total_store, out int Total_borrow, out int Total_in_stock)
        {
            using (var data = new themanorContext())
            {
                try
                {
                    var Type = new SqlParameter("@Type", type);

                    var list = data.Product.FromSql("EXECUTE _Product_GetByCatalogType  @Type", Type).ToList();

                    //List<f_Product_GetByCatalogType_Result> list = new List<f_Product_GetByCatalogType_Result>();
                    List<Product> list_pro = new List<Product>();
                    if (parent > 0)
                    {
                        List<Catalog> lstCate = new List<Catalog>();

                        //// Lấy ds các danh mục con
                        lstCate = (new CatalogModels()).GetbyParentID(parent, CommonGlobal.CateProduct, lang);

                        foreach (Catalog catalogItem in lstCate)
                        {
                            //// Lấy sản phẩm của danh mục con
                            list_pro.AddRange(GetAllProducts().Where(sp => sp.CatalogId.Split(',').Contains(catalogItem.CatalogId.ToString())).ToList<Product>());
                        }

                        //// lay product theo category
                        list = list.Where(sp => sp.Lang.Trim().ToLower() == lang.ToLower().Trim() && sp.CatalogId.Contains(parent.ToString())).OrderBy(sp => sp.DateModify).ToList();
                    }
                    else
                    {
                        list = list.Where(sp => sp.Lang.Trim().ToLower() == lang.ToLower().Trim()).OrderBy(sp => sp.OrderDisplay).ToList();
                    }

                    //// lay product mo coi
                    list_pro.AddRange(GetAllProducts().Where(sp => string.IsNullOrEmpty(sp.CatalogId)).ToList<Product>());

                    if (!string.IsNullOrEmpty(search))
                    {
                        list = list.Where(p => p.ProductName.ToLower().Contains(search.ToLower())).ToList();
                    }

                    if (is_show ?? false)
                    {
                        list = list.Where(p => p.IsShow == is_show).ToList();
                    }

                    if (is_hot ?? false)
                    {
                        list = list.Where(p => p.IsHot == is_hot).ToList();
                    }

                    if (is_promotion ?? false)
                    {
                        list = list.Where(p => p.IsPromotion == is_promotion).ToList();
                    }

                    ProductImagesModels imageModels = new ProductImagesModels();
                    foreach (var it in list)
                    {
                        Product c_gen = new Product();
                        c_gen.ProductId = it.ProductId;
                        c_gen.ProductName = it.ProductName;
                        c_gen.ProductCode = it.ProductCode;
                        c_gen.CatalogId = it.CatalogId;
                        c_gen.Summary = it.Summary;
                        c_gen.Content = it.Content;
                        c_gen.ImageBigPath = it.ImageBigPath;
                        c_gen.ImagePath = it.ImagePath;
                        c_gen.DateModify = it.DateModify;
                        c_gen.Store = it.Store;
                        c_gen.Promotion = it.Promotion;
                        c_gen.Warranty = it.Warranty;
                        c_gen.Manufacture = it.Manufacture;
                        c_gen.PriceOld = it.PriceOld;
                        c_gen.PriceNew = it.PriceNew;
                        c_gen.Views = it.Views;
                        c_gen.OrderDisplay = it.OrderDisplay;
                        c_gen.Lang = it.Lang;
                        c_gen.IsShow = it.IsShow;
                        c_gen.IsHot = it.IsHot;
                        c_gen.IsPromotion = it.IsPromotion;
                        c_gen.Link = it.Link;
                        c_gen.Rating = it.Rating;
                        //c_gen.DocType = it.DocType;
                        //c_gen.DocLangISO = it.DocLangISO;
                        //c_gen.DocLang = it.DocLang;
                        //c_gen.DocCountryCode = it.DocCountryCode;
                        //c_gen.DocTitleTranslate = it.DocTitleTranslate;
                        //c_gen.DocAuthor = it.DocAuthor;
                        //c_gen.DocAuthorGroup = it.DocAuthorGroup;
                        //c_gen.DocChuBien = it.DocChuBien;
                        //c_gen.DocBienSoan = it.DocBienSoan;
                        //c_gen.DocNguoiDich = it.DocNguoiDich;
                        //c_gen.DocHieuDinh = it.DocHieuDinh;
                        //c_gen.DocDiaChiXuatBan = it.DocDiaChiXuatBan;
                        //c_gen.DocNhaXuatBan = it.DocNhaXuatBan;
                        //c_gen.DocNamXuatBan = it.DocNamXuatBan;
                        //c_gen.DocLanXuatBan = it.DocLanXuatBan;
                        //c_gen.DocSoTrang = it.DocSoTrang;
                        //c_gen.DocTenTap = it.DocTenTap;
                        //c_gen.DocSoLanPhanLoai = it.DocSoLanPhanLoai;
                        //c_gen.DocDiaChiTaiLieu = it.DocDiaChiTaiLieu;
                        //c_gen.DocTomTat = it.DocTomTat;
                        //c_gen.DocNguoiXuLy = it.DocNguoiXuLy;
                        //c_gen.DocNguoiHieuDinh = it.DocNguoiHieuDinh;
                        //c_gen.Borrow = it.Borrow;
                        //c_gen.DocTypeView = it.DocTypeView;

                        var arrayImage = imageModels.GetLstImagebyProductId(it.ProductId);
                        //if (arrayImage != null && arrayImage.Any())
                        //{
                        //    c_gen.CanViewOnline = true;
                        //}

                        list_pro.Add(c_gen);
                    }

                    var c_pro = list_pro.AsQueryable<Product>();

                    total = c_pro.Count();

                    Total_in_stock = c_pro.AsEnumerable().Sum(o => o.Store);
                    Total_borrow = 0;// c_pro.AsEnumerable().Sum(o => (o.Borrow ?? 0));
                    Total_store = Total_in_stock + Total_borrow;

                    if (!string.IsNullOrEmpty(order_by) && !string.IsNullOrEmpty(order_type))
                    {
                        Type sortByPropType = typeof(Product).GetProperty(order_by).PropertyType;
                        ////calling the extension method using reflection
                        c_pro = typeof(MyExtensions).GetMethod("CustomSort").MakeGenericMethod(new Type[] { typeof(Product), sortByPropType })
                                .Invoke(c_pro, new object[] { c_pro, order_by, order_type }) as IQueryable<Product>;
                    }
                    else
                    {
                        ////if  orderBy null set default is OrderDisplay
                        c_pro = c_pro.OrderByDescending(p => p.DateModify);
                    }

                    return c_pro.Skip(page_index * page_size).Take(page_size).ToList();
                }
                catch (Exception)
                {
                    total = 0;
                    Total_store = 0;
                    Total_borrow = 0;
                    Total_in_stock = 0;
                    return null;
                }
            }
        }


        /// <summary>
        /// Admins the get all product by parent identifier.
        /// </summary>
        /// <param name="parent">The parent.</param>
        /// <param name="type">The type.</param>
        /// <param name="lang">The language.</param>
        /// <param name="search">The search.</param>
        /// <param name="page_index">The page index.</param>
        /// <param name="page_size">The page size.</param>
        /// <param name="order_by">The order by.</param>
        /// <param name="order_type">Type of the order.</param>
        /// <param name="is_show">The is show.</param>
        /// <param name="is_hot">The is hot.</param>
        /// <param name="is_promotion">The is promotion.</param>
        /// <param name="total">The total.</param>
        /// <returns>PagedList Product</returns>
        public List<Product> AdminGetAllProductByParentIDALL(int parent, string type, string lang, string search, int page_index, int page_size, string order_by, string order_type, bool? is_show, bool? is_hot, bool? is_promotion, out int total, out int Total_store, out int Total_borrow, out int Total_in_stock)
        {
            using (var data = new themanorContext())
            {
                try
                {
                    var Type = new SqlParameter("@Type", type);

                    var list = data.Product.FromSql("EXECUTE _Product_GetByCatalogType  @Type", Type).ToList();

                    // List<f_Product_GetByCatalogType_Result> list = new List<f_Product_GetByCatalogType_Result>();
                    List<Product> list_pro = new List<Product>();
                    if (parent > 0)
                    {
                        List<Catalog> lstCate = new List<Catalog>();

                        //// Lấy ds các danh mục con
                        lstCate = (new CatalogModels()).GetbyParentID(parent, CommonGlobal.CateProduct, lang);

                        foreach (Catalog catalogItem in lstCate)
                        {
                            //// Lấy sản phẩm của danh mục con
                            list_pro.AddRange(GetAllProducts().Where(sp => sp.CatalogId.Split(',').Contains(catalogItem.CatalogId.ToString())).ToList<Product>());
                        }

                        //// lay product theo category
                        list = list.Where(sp => sp.Lang.Trim().ToLower() == lang.ToLower().Trim() && sp.CatalogId.Contains(parent.ToString())).OrderBy(sp => sp.DateModify).ToList();
                    }
                    else
                    {
                        list = list.Where(sp => sp.Lang.Trim().ToLower() == lang.ToLower().Trim()).OrderBy(sp => sp.OrderDisplay).ToList();
                    }

                    //// lay product mo coi
                    list_pro.AddRange(GetAllProducts().Where(sp => string.IsNullOrEmpty(sp.CatalogId)).ToList<Product>());

                    if (!string.IsNullOrEmpty(search))
                    {
                        list = list.Where(p => p.ProductName.ToLower().Contains(search.ToLower())).ToList();
                    }

                    if (is_show ?? false)
                    {
                        list = list.Where(p => p.IsShow == is_show).ToList();
                    }

                    if (is_hot ?? false)
                    {
                        list = list.Where(p => p.IsHot == is_hot).ToList();
                    }

                    if (is_promotion ?? false)
                    {
                        list = list.Where(p => p.IsPromotion == is_promotion).ToList();
                    }

                    ProductImagesModels imageModels = new ProductImagesModels();
                    foreach (var it in list)
                    {
                        Product c_gen = new Product();
                        c_gen.ProductId = it.ProductId;
                        c_gen.ProductName = it.ProductName;
                        c_gen.ProductCode = it.ProductCode;
                        c_gen.CatalogId = it.CatalogId;
                        c_gen.Summary = it.Summary;
                        c_gen.Content = it.Content;
                        c_gen.ImageBigPath = it.ImageBigPath;
                        c_gen.ImagePath = it.ImagePath;
                        c_gen.DateModify = it.DateModify;
                        c_gen.Store = it.Store;
                        c_gen.Promotion = it.Promotion;
                        c_gen.Warranty = it.Warranty;
                        c_gen.Manufacture = it.Manufacture;
                        c_gen.PriceOld = it.PriceOld;
                        c_gen.PriceNew = it.PriceNew;
                        c_gen.Views = it.Views;
                        c_gen.OrderDisplay = it.OrderDisplay;
                        c_gen.Lang = it.Lang;
                        c_gen.IsShow = it.IsShow;
                        c_gen.IsHot = it.IsHot;
                        c_gen.IsPromotion = it.IsPromotion;
                        c_gen.Link = it.Link;
                        c_gen.Rating = it.Rating;
                        //c_gen.DocType = it.DocType;
                        //c_gen.DocLangISO = it.DocLangISO;
                        //c_gen.DocLang = it.DocLang;
                        //c_gen.DocCountryCode = it.DocCountryCode;
                        //c_gen.DocTitleTranslate = it.DocTitleTranslate;
                        //c_gen.DocAuthor = it.DocAuthor;
                        //c_gen.DocAuthorGroup = it.DocAuthorGroup;
                        //c_gen.DocChuBien = it.DocChuBien;
                        //c_gen.DocBienSoan = it.DocBienSoan;
                        //c_gen.DocNguoiDich = it.DocNguoiDich;
                        //c_gen.DocHieuDinh = it.DocHieuDinh;
                        //c_gen.DocDiaChiXuatBan = it.DocDiaChiXuatBan;
                        //c_gen.DocNhaXuatBan = it.DocNhaXuatBan;
                        //c_gen.DocNamXuatBan = it.DocNamXuatBan;
                        //c_gen.DocLanXuatBan = it.DocLanXuatBan;
                        //c_gen.DocSoTrang = it.DocSoTrang;
                        //c_gen.DocTenTap = it.DocTenTap;
                        //c_gen.DocSoLanPhanLoai = it.DocSoLanPhanLoai;
                        //c_gen.DocDiaChiTaiLieu = it.DocDiaChiTaiLieu;
                        //c_gen.DocTomTat = it.DocTomTat;
                        //c_gen.DocNguoiXuLy = it.DocNguoiXuLy;
                        //c_gen.DocNguoiHieuDinh = it.DocNguoiHieuDinh;
                        //c_gen.Borrow = it.Borrow;
                        //c_gen.DocTypeView = it.DocTypeView;

                        var arrayImage = imageModels.GetLstImagebyProductId(it.ProductId);
                        //if (arrayImage != null && arrayImage.Any())
                        //{
                        //    c_gen.CanViewOnline = true;
                        //}

                        list_pro.Add(c_gen);
                    }

                    var c_pro = list_pro.AsQueryable<Product>();

                    total = c_pro.Count();

                    Total_in_stock = c_pro.AsEnumerable().Sum(o => o.Store);
                    Total_borrow = 0;//c_pro.AsEnumerable().Sum(o => (o.Borrow ?? 0));
                    Total_store = Total_in_stock + Total_borrow;

                    if (!string.IsNullOrEmpty(order_by) && !string.IsNullOrEmpty(order_type))
                    {
                        Type sortByPropType = typeof(Product).GetProperty(order_by).PropertyType;
                        ////calling the extension method using reflection
                        c_pro = typeof(MyExtensions).GetMethod("CustomSort").MakeGenericMethod(new Type[] { typeof(Product), sortByPropType })
                                .Invoke(c_pro, new object[] { c_pro, order_by, order_type }) as IQueryable<Product>;
                    }
                    else
                    {
                        ////if  orderBy null set default is OrderDisplay
                        c_pro = c_pro.OrderByDescending(p => p.DateModify);
                    }

                    return c_pro.Skip(page_index * page_size).Take(page_size).ToList();
                }
                catch (Exception)
                {
                    total = 0;
                    Total_store = 0;
                    Total_borrow = 0;
                    Total_in_stock = 0;
                    return null;
                }
            }
        }

        /// <summary>
        /// Deletes the specified product identifier.
        /// </summary>
        /// <param name="productId">The product identifier.</param>
        /// <returns>identity procut</returns>
        public bool Delete(int productId)
        {
            using (var data = new themanorContext())
            {
                bool rt;
                try
                {
                    var c_gen = data.Product.Where(p => p.ProductId == productId).FirstOrDefault();
                    if (c_gen != null)
                    {
                        data.Product.Remove(c_gen);
                        data.SaveChanges();

                        rt = true;
                    }
                    else
                    {
                        rt = false;
                    }
                }
                catch (Exception)
                {
                    rt = false;
                }

                return rt;
            }
        }

        /// <summary>
        /// Gets all products.
        /// </summary>
        /// <param name="cate_id">The cate identifier.</param>
        /// <param name="namePro">The name pro.</param>
        /// <param name="minPrc">The minimum PRC.</param>
        /// <param name="maxPrc">The maximum PRC.</param>
        /// <param name="lang">The language.</param>
        /// <param name="active">if set to <c>true</c> [active].</param>
        /// <returns>List Product</returns>
        public List<Product> GetAllProducts(string cate_id, string namePro, string minPrc, string maxPrc, string lang, bool active)
        {
            using (var data = new themanorContext())
            {
                List<Product> lstProduct = new List<Product>();

                try
                {
                    if (cate_id != "0")
                    {
                        lstProduct = this.GetProductByCategory(Convert.ToInt32(cate_id), lang, string.Empty, string.Empty, string.Empty, string.Empty, true).ToList<Product>();
                    }
                    else
                    {
                        lstProduct = GetAllProducts();
                    }

                    if (namePro != string.Empty)
                    {
                        lstProduct = lstProduct.Where(sp => sp.ProductName.ToLower().Contains(namePro.ToLower()) ||
                                                      sp.ProductCode.ToLower().Contains(namePro.ToLower())).ToList<Product>();
                    }

                    if (minPrc != "0" && maxPrc != "0" && Convert.ToDouble(minPrc) < Convert.ToDouble(maxPrc))
                    {
                        lstProduct = lstProduct.Where(sp => sp.PriceNew > Convert.ToDecimal(minPrc) &&
                                                      sp.PriceNew <= Convert.ToDecimal(maxPrc)).ToList<Product>();
                    }

                    lstProduct = lstProduct.Where(sp => sp.Lang.Trim().ToLower() == lang.ToLower() &&
                                                  sp.IsShow == active).ToList<Product>();

                    return lstProduct.OrderByDescending(sp => sp.DateModify).ToList<Product>();
                }
                catch
                {
                    return null;
                }
            }
        }

        /// <summary>
        /// Gets the compare list.
        /// </summary>
        /// <param name="compareList">The compare list.</param>
        /// <returns>List Product</returns>
        public List<Product> GetCompareList(ArrayList compareList)
        {
            using (var data = new themanorContext())
            {
                try
                {
                    List<Product> returnList = new List<Product>();

                    foreach (var productId in compareList)
                    {
                        if (productId != null && productId.ToString() != string.Empty)
                        {
                            returnList.Add(this.GetProductById(Convert.ToInt32(productId)));
                        }
                    }

                    return returnList;
                }
                catch
                {
                    return null;
                }
            }
        }

        /// <summary>
        /// Gets the list product by category identifier.
        /// </summary>
        /// <param name="lang">The language.</param>
        /// <param name="cate_type">Type of the cate.</param>
        /// <param name="cate_id">The cate identifier.</param>
        /// <param name="search">The search.</param>
        /// <param name="manufacture">The manufacture.</param>
        /// <param name="tag">The tag.</param>
        /// <param name="param">The parameter.</param>
        /// <param name="price_min">The price minimum.</param>
        /// <param name="price_max">The price maximum.</param>
        /// <param name="page_index">The page index.</param>
        /// <param name="page_size">The page site.</param>
        /// <param name="order_by">The order by.</param>
        /// <param name="order_type">Type of the order.</param>
        /// <param name="total">The total.</param>
        /// <returns>PagedList Product</returns>
        public List<Product> GetListProductByCategoryID(string lang, string cate_type, int? cate_id, string search, string typekey, string manufacture, string tag, string param, int price_min, int price_max, int page_index, int page_size, string order_by, string order_type, out int total)
        {
            using (var data = new themanorContext())
            {
                //// First, check the cache
                ////IQueryable<Product> list = this.Cache.Get(lang + cate_type + cate_id ?? 0 + search + tag + param + price_min + price_max + page_index + page_site + order_by + order_type) as IQueryable<Product>;
                IQueryable<Product> list = null;

                if (list == null)
                {
                    if (cate_id != null && cate_id != 0)
                    {
                        list = this.GetProductByCategory((int)cate_id, lang, search, typekey, tag, param, true).Where(p => p.PriceNew >= price_min && p.PriceNew <= price_max).AsQueryable<Product>();
                    }
                    else
                    {
                        list = GetAllProductByTypeCate(cate_type, lang, search, typekey, tag, param, true).Where(p => p.PriceNew >= price_min && p.PriceNew <= price_max).AsQueryable();
                    }                    

                    if (!string.IsNullOrEmpty(manufacture))
                    {
                        list = list.Where(p => p.Manufacture == manufacture).AsQueryable<Product>();
                    }

                    total = list.Count();

                    if (cate_id == null || cate_id == 0)
                    {
                        list = list.OrderByDescending(p => p.DateModify);
                    }
                    else
                    {
                        if (!string.IsNullOrEmpty(order_by) && !string.IsNullOrEmpty(order_type))
                        {
                            Type sortByPropType = typeof(Product).GetProperty(order_by).PropertyType;
                            ////calling the extension method using reflection
                            list = typeof(MyExtensions).GetMethod("CustomSort").MakeGenericMethod(new Type[] { typeof(Product), sortByPropType })
                                   .Invoke(list, new object[] { list, order_by, order_type }) as IQueryable<Product>;
                        }
                        else
                        {
                            ////if  orderBy null set default is OrderDisplay
                            list = list.OrderByDescending(p => p.DateModify);
                        }
                    }

                    //if (list.Any())
                    //{
                    //    //// Put this data into the cache for 10 minutes
                    //    this.Cache.Set(lang + cate_type + (cate_id ?? 0) + search + tag + param + page_index + page_site + order_by + order_type, list, int.Parse(Util.GetConfigValue(CommonGlobal.TimeCache, "10")));
                    //}
                }
                else
                {
                    total = 0;
                }

                return list.Skip(page_index * page_size).Take(page_size).ToList();
            }
        }

        /// <summary>
        /// Gets the maximum order display.
        /// </summary>
        /// <param name="type">The type.</param>
        /// <returns>maximum order</returns>
        public int GetMaxOrderDisplay(string type)
        {
            using (var data = new themanorContext())
            {
                try
                {
                    var Type = new SqlParameter("@Type", type);

                    var c_gen = data.Product.FromSql("EXECUTE _Product_GetByCatalogType  @Type", Type).OrderByDescending(p => p.OrderDisplay).Take(1).FirstOrDefault();

                    //var c_gen = data.f_Product_GetByCatalogType(type).OrderByDescending(p => p.OrderDisplay).Take(1).FirstOrDefault();
                    if (c_gen != null)
                    {
                        return c_gen.OrderDisplay + 1;
                    }
                    else
                    {
                        return 1;
                    }
                }
                catch (Exception)
                {
                    return 1;
                }
            }
        }

        /// <summary>
        /// Gets the product by category.
        /// </summary>
        /// <param name="cate_id">The cate identifier.</param>
        /// <param name="lang">The language.</param>
        /// <param name="search">The search.</param>
        /// <param name="tag">The tag.</param>
        /// <param name="param">The parameter.</param>
        /// <param name="active">if set to <c>true</c> [active].</param>
        /// <returns>List Product</returns>
        public List<Product> GetProductByCategory(int cate_id, string lang, string search, string typekey, string tag, string param, bool active)
        {
            using (var data = new themanorContext())
            {
                try
                {
                    List<Catalog> lstCate = new List<Catalog>();
                    List<Product> lstProduct = new List<Product>();

                    if (cate_id == 0)
                    {
                        lstProduct = GetAllProducts().Where(p => p.IsShow == active).ToList();
                    }
                    else
                    {
                        //// Lấy ds các danh mục con
                        lstCate = (new CatalogModels()).GetbyParentID(cate_id, CommonGlobal.CateProduct, lang);
                        //int NoSearch = 0;
                        foreach (Catalog catalogItem in lstCate)
                        {
                            //NoSearch = 0;
                            //// Lấy sản phẩm của danh mục con
                            switch (typekey)
                            {
                                case "ProductName":
                                    lstProduct.AddRange(GetAllProducts().Where(sp => sp.CatalogId.Split(',').Contains(catalogItem.CatalogId.ToString()) && (sp.ProductName.ToLower().Contains(search.ToLower()))).ToList<Product>());
                                    break;
                                //case "DocAuthor":
                                //    lstProduct.AddRange(GetAllProducts().Where(sp => sp.CatalogID.Split(',').Contains(catalogItem.CatalogID.ToString()) && (sp.DocAuthor.ToLower().Contains(search.ToLower()))).ToList<Product>());
                                //    break;
                                //case "DocAuthorGroup":
                                //    lstProduct.AddRange(GetAllProducts().Where(sp => sp.CatalogID.Split(',').Contains(catalogItem.CatalogID.ToString()) && (sp.DocAuthorGroup.ToLower().Contains(search.ToLower()))).ToList<Product>());
                                //    break;
                                //case "DocChuBien":
                                //    lstProduct.AddRange(GetAllProducts().Where(sp => sp.CatalogID.Split(',').Contains(catalogItem.CatalogID.ToString()) && (sp.DocChuBien.ToLower().Contains(search.ToLower()))).ToList<Product>());
                                //    break;
                                //case "DocBienSoan":
                                //    lstProduct.AddRange(GetAllProducts().Where(sp => sp.CatalogID.Split(',').Contains(catalogItem.CatalogID.ToString()) && (sp.DocBienSoan.ToLower().Contains(search.ToLower()))).ToList<Product>());
                                //    break;
                                //case "DocNguoiDich":
                                //    lstProduct.AddRange(GetAllProducts().Where(sp => sp.CatalogID.Split(',').Contains(catalogItem.CatalogID.ToString()) && (sp.DocNguoiDich.ToLower().Contains(search.ToLower()))).ToList<Product>());
                                //    break;
                                //case "DocHieuDinh":
                                //    lstProduct.AddRange(GetAllProducts().Where(sp => sp.CatalogID.Split(',').Contains(catalogItem.CatalogID.ToString()) && (sp.DocHieuDinh.ToLower().Contains(search.ToLower()))).ToList<Product>());
                                //    break;
                                //case "DocDiaChiXuatBan":
                                //    lstProduct.AddRange(GetAllProducts().Where(sp => sp.CatalogID.Split(',').Contains(catalogItem.CatalogID.ToString()) && (sp.DocDiaChiXuatBan.ToLower().Contains(search.ToLower()))).ToList<Product>());
                                //    break;
                                //case "DocNhaXuatBan":
                                //    lstProduct.AddRange(GetAllProducts().Where(sp => sp.CatalogID.Split(',').Contains(catalogItem.CatalogID.ToString()) && (sp.DocNhaXuatBan.ToLower().Contains(search.ToLower()))).ToList<Product>());
                                //    break;
                                //case "DocNamXuatBan":
                                //    NoSearch = 0;
                                //    if (!string.IsNullOrEmpty(search) && int.TryParse(search, out NoSearch))
                                //    {
                                //        lstProduct.AddRange(GetAllProducts().Where(sp => sp.CatalogID.Split(',').Contains(catalogItem.CatalogID.ToString()) && (sp.DocLanXuatBan == NoSearch)).ToList<Product>());
                                //    }
                                //    break;
                                //case "DocLanXuatBan":
                                //    NoSearch = 0;
                                //    if (!string.IsNullOrEmpty(search) && int.TryParse(search, out NoSearch)) {
                                //        lstProduct.AddRange(GetAllProducts().Where(sp => sp.CatalogID.Split(',').Contains(catalogItem.CatalogID.ToString()) && (sp.DocLanXuatBan == NoSearch)).ToList<Product>());
                                //    }                                    
                                //    break;
                                //case "DocTenTap":
                                //    lstProduct.AddRange(GetAllProducts().Where(sp => sp.CatalogID.Split(',').Contains(catalogItem.CatalogID.ToString()) && (sp.DocTenTap.ToLower().Contains(search.ToLower()))).ToList<Product>());
                                //    break;
                                //case "DocSoLanPhanLoai":
                                //    NoSearch = 0;
                                //    if (!string.IsNullOrEmpty(search) && int.TryParse(search, out NoSearch))
                                //    {
                                //        lstProduct.AddRange(GetAllProducts().Where(sp => sp.CatalogID.Split(',').Contains(catalogItem.CatalogID.ToString()) && (sp.DocSoLanPhanLoai == NoSearch)).ToList<Product>());
                                //    }
                                //    break;
                                //case "DocDiaChiTaiLieu":
                                //    lstProduct.AddRange(GetAllProducts().Where(sp => sp.CatalogID.Split(',').Contains(catalogItem.CatalogID.ToString()) && (sp.DocDiaChiTaiLieu.ToLower().Contains(search.ToLower()))).ToList<Product>());
                                //    break;
                                //case "DocTomTat":
                                //    lstProduct.AddRange(GetAllProducts().Where(sp => sp.CatalogID.Split(',').Contains(catalogItem.CatalogID.ToString()) && (sp.ProductName.ToLower().Contains(search.ToLower()))).ToList<Product>());
                                //    break;
                                default:
                                    lstProduct.AddRange(GetAllProducts().Where(sp => sp.CatalogId.Split(',').Contains(catalogItem.CatalogId.ToString()) && (sp.ProductName.ToLower().Contains(search.ToLower()))).ToList<Product>());
                                    break;
                            }
                            
                        }

                        //lstProduct.AddRange(GetAllProducts().Where(sp => sp.CatalogID.Split(',').Contains(cate_id.ToString()) && (sp.ProductName.Contains(search) || sp.ProductCode.Contains(search) || sp.Summary.ToLower().Contains(search.ToLower()))).ToList<Product>());

                        switch (typekey)
                        {
                            case "ProductName":
                                lstProduct.AddRange(GetAllProducts().Where(sp => sp.CatalogId.Split(',').Contains(cate_id.ToString()) && (sp.ProductName.ToLower().Contains(search.ToLower()))).ToList<Product>());
                                break;
                            //case "DocAuthor":
                            //    lstProduct.AddRange(GetAllProducts().Where(sp => sp.CatalogID.Split(',').Contains(cate_id.ToString()) && (sp.DocAuthor.ToLower().Contains(search.ToLower()))).ToList<Product>());
                            //    break;
                            //case "DocAuthorGroup":
                            //    lstProduct.AddRange(GetAllProducts().Where(sp => sp.CatalogID.Split(',').Contains(cate_id.ToString()) && (sp.DocAuthorGroup.ToLower().Contains(search.ToLower()))).ToList<Product>());
                            //    break;
                            //case "DocChuBien":
                            //    lstProduct.AddRange(GetAllProducts().Where(sp => sp.CatalogID.Split(',').Contains(cate_id.ToString()) && (sp.DocChuBien.ToLower().Contains(search.ToLower()))).ToList<Product>());
                            //    break;
                            //case "DocBienSoan":
                            //    lstProduct.AddRange(GetAllProducts().Where(sp => sp.CatalogID.Split(',').Contains(cate_id.ToString()) && (sp.DocBienSoan.ToLower().Contains(search.ToLower()))).ToList<Product>());
                            //    break;
                            //case "DocNguoiDich":
                            //    lstProduct.AddRange(GetAllProducts().Where(sp => sp.CatalogID.Split(',').Contains(cate_id.ToString()) && (sp.DocNguoiDich.ToLower().Contains(search.ToLower()))).ToList<Product>());
                            //    break;
                            //case "DocHieuDinh":
                            //    lstProduct.AddRange(GetAllProducts().Where(sp => sp.CatalogID.Split(',').Contains(cate_id.ToString()) && (sp.DocHieuDinh.ToLower().Contains(search.ToLower()))).ToList<Product>());
                            //    break;
                            //case "DocDiaChiXuatBan":
                            //    lstProduct.AddRange(GetAllProducts().Where(sp => sp.CatalogID.Split(',').Contains(cate_id.ToString()) && (sp.DocDiaChiXuatBan.ToLower().Contains(search.ToLower()))).ToList<Product>());
                            //    break;
                            //case "DocNhaXuatBan":
                            //    lstProduct.AddRange(GetAllProducts().Where(sp => sp.CatalogID.Split(',').Contains(cate_id.ToString()) && (sp.DocNhaXuatBan.ToLower().Contains(search.ToLower()))).ToList<Product>());
                            //    break;
                            //case "DocNamXuatBan":
                            //    NoSearch = 0;
                            //    if (!string.IsNullOrEmpty(search) && int.TryParse(search, out NoSearch))
                            //    {
                            //        lstProduct.AddRange(GetAllProducts().Where(sp => sp.CatalogID.Split(',').Contains(cate_id.ToString()) && (sp.DocLanXuatBan == NoSearch)).ToList<Product>());
                            //    }
                            //    break;
                            //case "DocLanXuatBan":
                            //    NoSearch = 0;
                            //    if (!string.IsNullOrEmpty(search) && int.TryParse(search, out NoSearch))
                            //    {
                            //        lstProduct.AddRange(GetAllProducts().Where(sp => sp.CatalogID.Split(',').Contains(cate_id.ToString()) && (sp.DocLanXuatBan == NoSearch)).ToList<Product>());
                            //    }
                            //    break;
                            //case "DocTenTap":
                            //    lstProduct.AddRange(GetAllProducts().Where(sp => sp.CatalogID.Split(',').Contains(cate_id.ToString()) && (sp.DocTenTap.ToLower().Contains(search.ToLower()))).ToList<Product>());
                            //    break;
                            //case "DocSoLanPhanLoai":
                            //    NoSearch = 0;
                            //    if (!string.IsNullOrEmpty(search) && int.TryParse(search, out NoSearch))
                            //    {
                            //        lstProduct.AddRange(GetAllProducts().Where(sp => sp.CatalogID.Split(',').Contains(cate_id.ToString()) && (sp.DocSoLanPhanLoai == NoSearch)).ToList<Product>());
                            //    }
                            //    break;
                            //case "DocDiaChiTaiLieu":
                            //    lstProduct.AddRange(GetAllProducts().Where(sp => sp.CatalogID.Split(',').Contains(cate_id.ToString()) && (sp.DocDiaChiTaiLieu.ToLower().Contains(search.ToLower()))).ToList<Product>());
                            //    break;
                            //case "DocTomTat":
                            //    lstProduct.AddRange(GetAllProducts().Where(sp => sp.CatalogID.Split(',').Contains(cate_id.ToString()) && (sp.ProductName.ToLower().Contains(search.ToLower()))).ToList<Product>());
                            //    break;
                            default:
                                lstProduct.AddRange(GetAllProducts().Where(sp => sp.CatalogId.Split(',').Contains(cate_id.ToString()) && (sp.ProductName.ToLower().Contains(search.ToLower()))).ToList<Product>());
                                break;
                        }
                        
                    }

                    if (!string.IsNullOrEmpty(tag))
                    {
                        lstProduct = (from p in lstProduct
                                      join t in data.ProductTag on p.ProductId equals t.ProductId
                                      where t.Link == tag
                                      select p).ToList<Product>();
                    }

                    List<Product> lst_product_param = new List<Product>();
                    string[] arr_param = null;
                    string[] arr_param2 = new string[] { CommonGlobal.Size, CommonGlobal.Color };
                    ////get param list product property
                    if (!string.IsNullOrEmpty(param) && param.Length > 1)
                    {
                        if (param.Contains(";"))
                        {
                            arr_param = param.Split(',');
                            if (arr_param.Length > 0)
                            {
                                for (int i = 0; i < arr_param2.Length; i++)
                                {
                                    try
                                    {
                                        if (arr_param[i].Length > 0)
                                        {
                                            ////var lst_property_id = arr_param[i].Split(',').Select(Int32.Parse).ToList();
                                            var lst_property = arr_param[i].Split(',').ToList();
                                            var c_gen = (from p in lstProduct
                                                         join t in data.ProductProperty on p.ProductId equals t.ProductId
                                                         where lst_property.Contains(t.Value) && t.Type == arr_param2[i]
                                                         select p).ToList<Product>();
                                            foreach (var it in c_gen)
                                            {
                                                lst_product_param.Add(it);
                                            }
                                        }
                                    }
                                    catch
                                    {
                                    }
                                }
                            }

                            return lst_product_param;
                        }
                        else
                        {
                            return lstProduct;
                        }
                    }
                    else
                    {
                        return lstProduct;
                    }
                }
                catch
                {
                    return null;
                }
            }
        }

        /// <summary>
        /// Gets the product by identifier.
        /// </summary>
        /// <param name="id">The identifier.</param>
        /// <returns>get product object</returns>
        public Product GetProductById(int id)
        {
            using (var data = new themanorContext())
            {
                try
                {
                    ////// First, check the cache
                    //Product pro = this.Cache.Get(CommonGlobal.Product + string.Empty + id) as Product;

                    //if (pro == null)
                    //{
                    //    pro = data.Product.Where(p => p.ProductID == id).FirstOrDefault();

                    //    if (pro != null)
                    //    {
                    //        //// Put this data into the cache for 10 minutes
                    //        this.Cache.Set(CommonGlobal.Product + string.Empty + id, pro, int.Parse(Util.GetConfigValue(CommonGlobal.TimeCache, "10")));
                    //    }
                    //}

                    Product pro = data.Product.Where(p => p.ProductId == id).FirstOrDefault();

                    return pro;
                }
                catch
                {
                    return new Product();
                }
            }
        }

        /// <summary>
        /// Gets the product hot.
        /// </summary>
        /// <param name="number">The number.</param>
        /// <param name="lang">The language.</param>
        /// <returns>List product</returns>
        public List<Product> GetProductHot(int number, string lang)
        {
            using (var data = new themanorContext())
            {
                try
                {
                    ////// First, check the cache
                    //List<Product> list_product_hot = this.Cache.Get(CommonGlobal.ProductHot + number + lang) as List<Product>;

                    //if (list_product_hot == null)
                    //{
                    //    list_product_hot = GetAllProducts().Where(sp => sp.IsHot && sp.Lang.Trim().ToLower() == lang.ToLower() && sp.IsShow == true).Take(number).OrderBy(p => p.OrderDisplay).ToList<Product>();

                    //    if (list_product_hot.Any())
                    //    {
                    //        //// Put this data into the cache for 10 minutes
                    //        this.Cache.Set(CommonGlobal.ProductHot + number + lang, list_product_hot, int.Parse(Util.GetConfigValue(CommonGlobal.TimeCache, "10")));
                    //    }
                    //}

                    List<Product> list_product_hot = GetAllProducts().Where(sp => sp.IsHot && sp.Lang.Trim().ToLower() == lang.ToLower() && sp.IsShow == true).Take(number).OrderByDescending(p => p.DateModify).ToList<Product>();

                    //List<Product> list_hot = new List<Product>();

                    //foreach (var item in list_product_hot) {
                    //    var arrCate = !string.IsNullOrEmpty(item.CatalogID) ? item.CatalogID.Split(',') : new string[0];
                    //    if (arrCate.Length > 0) {
                    //        var filtered = data.Catalog.Where(o => arrCate.Contains(o.CatalogID.ToString()));
                    //        if (filtered.Any())
                    //        {
                    //            list_hot.Add(item);
                    //        }
                    //    }
                    //}

                    return list_product_hot;
                }
                catch
                {
                    return null;
                }
            }
        }

        /// <summary>
        /// Gets the product promotion.
        /// </summary>
        /// <param name="number">The number.</param>
        /// <param name="lang">The language.</param>
        /// <returns>List product promotion</returns>
        public List<Product> GetProductPromotion(int number, string lang)
        {
            using (var data = new themanorContext())
            {
                try
                {
                    ////// First, check the cache
                    //List<Product> list_product_promotion = null; ////Cache.Get(CommonGlobal.PRODUCT_PROMOTION+number+lang) as List<Product>;

                    //if (list_product_promotion == null)
                    //{
                    //    list_product_promotion = GetAllProducts().Where(sp => sp.IsPromotion == true && (sp.Lang.Trim().ToLower() == lang.ToLower())).Take(number).OrderBy(p => p.OrderDisplay).ToList<Product>();

                    //    if (list_product_promotion.Any())
                    //    {
                    //        //// Put this data into the cache for 10 minutes
                    //        this.Cache.Set(CommonGlobal.ProductPromotion + number + lang, list_product_promotion, int.Parse(Util.GetConfigValue(CommonGlobal.TimeCache, "10")));
                    //    }
                    //}

                    List<Product> list_product_promotion = GetAllProducts().Where(sp => sp.IsPromotion == true && (sp.Lang.Trim().ToLower() == lang.ToLower())).Take(number).OrderByDescending(p => p.DateModify).ToList<Product>();

                    return list_product_promotion;
                }
                catch
                {
                    return null;
                }
            }
        }

        /// <summary>
        /// Inserts the specified product.
        /// </summary>
        /// <param name="product">The product.</param>
        /// <returns>identity of product</returns>
        public int Insert(Product product)
        {
            using (var data = new themanorContext())
            {
                int rt = 0;
                try
                {
                    data.Product.Add(product);
                    data.SaveChanges();
                    rt = product.ProductId;
                }
                catch (Exception)
                {
                    rt = 0;
                }

                return rt;
            }
        }

        /// <summary>
        /// Updates the specified product.
        /// </summary>
        /// <param name="product">product object</param>
        /// <returns>identity product</returns>
        public int Update(Product product)
        {
            using (var data = new themanorContext())
            {
                int rt = 0;
                try
                {
                    var c_gen = data.Product.Where(p => p.ProductId == product.ProductId).FirstOrDefault();
                    c_gen.ProductName = product.ProductName;
                    c_gen.ProductCode = product.ProductCode;
                    c_gen.CatalogId = product.CatalogId;
                    c_gen.Summary = product.Summary;
                    c_gen.Content = product.Content;
                    c_gen.ImageBigPath = product.ImageBigPath;
                    c_gen.ImagePath = product.ImagePath;
                    c_gen.DateModify = product.DateModify;
                    c_gen.Store = product.Store;
                    c_gen.Promotion = product.Promotion;
                    c_gen.Warranty = product.Warranty;
                    c_gen.Manufacture = product.Manufacture;
                    c_gen.PriceOld = product.PriceOld;
                    c_gen.PriceNew = product.PriceNew;
                    c_gen.Views = product.Views;
                    c_gen.OrderDisplay = product.OrderDisplay;
                    c_gen.Lang = product.Lang;
                    c_gen.IsShow = product.IsShow;
                    c_gen.IsHot = product.IsHot;
                    c_gen.IsPromotion = product.IsPromotion;
                    c_gen.Link = product.Link;
                    c_gen.Rating = product.Rating;
                    //c_gen.DocType = product.DocType;
                    //c_gen.DocLangISO = product.DocLangISO;
                    //c_gen.DocLang = product.DocLang;
                    //c_gen.DocCountryCode = product.DocCountryCode;
                    //c_gen.DocTitleTranslate = product.DocTitleTranslate;
                    //c_gen.DocAuthor = product.DocAuthor;
                    //c_gen.DocAuthorGroup = product.DocAuthorGroup;
                    //c_gen.DocChuBien = product.DocChuBien;
                    //c_gen.DocBienSoan = product.DocBienSoan;
                    //c_gen.DocNguoiDich = product.DocNguoiDich;
                    //c_gen.DocHieuDinh = product.DocHieuDinh;
                    //c_gen.DocDiaChiXuatBan = product.DocDiaChiXuatBan;
                    //c_gen.DocNhaXuatBan = product.DocNhaXuatBan;
                    //c_gen.DocNamXuatBan = product.DocNamXuatBan;
                    //c_gen.DocLanXuatBan = product.DocLanXuatBan;
                    //c_gen.DocSoTrang = product.DocSoTrang;
                    //c_gen.DocTenTap = product.DocTenTap;
                    //c_gen.DocSoLanPhanLoai = product.DocSoLanPhanLoai;
                    //c_gen.DocDiaChiTaiLieu = product.DocDiaChiTaiLieu;
                    //c_gen.DocTomTat = product.DocTomTat;
                    //c_gen.DocNguoiXuLy = product.DocNguoiXuLy;
                    //c_gen.DocNguoiHieuDinh = product.DocNguoiHieuDinh;
                    //c_gen.Borrow = product.Borrow;
                    //c_gen.DocTypeView = product.DocTypeView;

                    data.SaveChanges();
                    rt = product.ProductId;
                }
                catch (Exception)
                {
                    rt = 0;
                }

                return rt;
            }
        }

        /// <summary>
        /// Updates the rating product.
        /// </summary>
        /// <param name="id">The identifier.</param>
        /// <param name="rating">The rating.</param>
        /// <returns>identity product</returns>
        public int UpdateRatingProduct(int id, int rating)
        {
            using (var data = new themanorContext())
            {
                int rt = 0;
                try
                {
                    var c_gen = data.Product.Where(p => p.ProductId == id).FirstOrDefault();
                    c_gen.Rating = rating;

                    data.SaveChanges();
                    rt = 1;
                }
                catch (Exception)
                {
                    rt = 0;
                }

                return rt;
            }
        }

        /// <summary>
        /// Updates the rating product.
        /// </summary>
        /// <param name="id">The identifier.</param>
        /// <param name="rating">The rating.</param>
        /// <returns>identity product</returns>
        public int UpdateDocViewTypeProduct(int id, int type)
        {
            using (var data = new themanorContext())
            {
                int rt = 0;
                try
                {
                    var c_gen = data.Product.Where(p => p.ProductId == id).FirstOrDefault();
                    //c_gen.DocTypeView = type;

                    data.SaveChanges();
                    rt = 1;
                }
                catch (Exception)
                {
                    rt = 0;
                }

                return rt;
            }
        }

        /// <summary>
        /// Counts the images.
        /// </summary>
        /// <param name="productId">The product identifier.</param>
        /// <returns></returns>
        public int CountImages(int productId)
        {
            using (var db = new themanorContext())
            {
                return db.ImageProducts.Where(x => x.MaSp == productId).Select(x => x.Id).Count();
            }
        }

        /// <summary>
        /// Gets the image.
        /// </summary>
        /// <param name="productId">The product identifier.</param>
        /// <param name="page">The page.</param>
        /// <returns></returns>
        public ImageProducts GetImage(int productId, int page)
        {
            using (var db = new themanorContext())
            {
                return db.ImageProducts.Where(x => x.MaSp == productId).OrderBy(x => x.Id).Skip(page-1).Take(1).FirstOrDefault();
            }
        }        
    }
}