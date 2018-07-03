namespace DBBase.Models
{
    using DBBase.Data;
    using System;
    using System.Collections.Generic;
    using System.Linq;

    /// <summary>
    /// District Models
    /// </summary>
    public class DistrictModels
    {
        /// <summary>
        /// Initializes a new instance of the <see cref="DistrictModels"/> class.
        /// </summary>
        public DistrictModels()
        {
        }

        /// <summary>
        /// Add the specified it.
        /// </summary>
        /// <param name="district">district object.</param>
        /// <returns>Add District</returns>
        public int Add(District district)
        {
            using (var data = new Entities())
            {
                int rt = 0;
                try
                {
                    data.Districts.Add(district);
                    data.SaveChanges();
                    rt = district.DistrictID;
                }
                catch (Exception)
                {
                    rt = 0;
                }

                return rt;
            }
        }

        /// <summary>
        /// All the district.
        /// </summary>
        /// <returns>All District</returns>
        public List<District> AllDistrict()
        {
            using (var data = new Entities())
            {
                try
                {
                    var lstDistrict = data.Districts.ToList();
                    return lstDistrict;
                }
                catch (Exception)
                {
                    return null;
                }
            }
        }

        /// <summary>
        /// Deletes the specified district identifier.
        /// </summary>
        /// <param name="district_id">The district identifier.</param>
        /// <returns>Delete district</returns>
        public bool Delete(int district_id)
        {
            using (var data = new Entities())
            {
                bool rt;
                try
                {
                    var c_gen = data.Districts.Where(p => p.DistrictID == district_id).FirstOrDefault();
                    if (c_gen != null)
                    {
                        data.Districts.Remove(c_gen);
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
        /// Edits the specified it.
        /// </summary>
        /// <param name="district">district object</param>
        /// <returns>Edit district</returns>
        public int Edit(District district)
        {
            using (var data = new Entities())
            {
                int rt = 0;
                try
                {
                    var c_gen = data.Districts.Where(p => p.DistrictID == district.DistrictID).FirstOrDefault();
                    c_gen.CityID = district.CityID;
                    c_gen.DistrictName = district.DistrictName;
                    data.SaveChanges();
                    rt = district.DistrictID;
                }
                catch (Exception)
                {
                    rt = 0;
                }

                return rt;
            }
        }

        /// <summary>
        /// Gets the district by identifier.
        /// </summary>
        /// <param name="district_id">The district identifier.</param>
        /// <returns> Gets the district</returns>
        public District GetDistrictByID(int district_id)
        {
            using (var data = new Entities())
            {
                try
                {
                    var objDistrict = data.Districts.SingleOrDefault(e => e.DistrictID == district_id);
                    return objDistrict;
                }
                catch (Exception)
                {
                    return null;
                }
            }
        }

        /// <summary>
        /// Gets the list district by city identifier.
        /// </summary>
        /// <param name="cityID">The city identifier.</param>
        /// <returns>Gets the list district</returns>
        public List<District> GetListDistrictByCityID(int cityID)
        {
            using (var data = new Entities())
            {
                try
                {
                    var lstDistrict = data.Districts.Where(d => d.CityID == cityID).ToList();
                    return lstDistrict;
                }
                catch (Exception)
                {
                    return null;
                }
            }
        }

        /// <summary>
        /// Lists the district.
        /// </summary>
        /// <param name="city">The city.</param>
        /// <param name="district">The district.</param>
        /// <returns>Lists the district</returns>
        //public List<SelectListItem> List_district(int city, int district)
        //{
        //    List<SelectListItem> lstSelect = new List<SelectListItem>();
        //    ////CatalogModels cateModels = new CatalogModels();
        //    List<District> lstDistrict = this.GetListDistrictByCityID(city);
        //    lstSelect.Add(new SelectListItem { Selected = true, Text = "Tất cả", Value = "0" });
        //    foreach (District cata in lstDistrict)
        //    {
        //        lstSelect.Add(new SelectListItem { Selected = district == cata.DistrictID ? true : false, Text = cata.DistrictName.ToString(), Value = cata.DistrictID.ToString() });
        //    }

        //    return lstSelect;
        //}

        /// <summary>
        /// Lists the district not all.
        /// </summary>
        /// <param name="city">The city.</param>
        /// <param name="district">The district.</param>
        /// <returns>Lists the district</returns>
        //public List<SelectListItem> List_district_not_all(int city, int district)
        //{
        //    List<SelectListItem> lstSelect = new List<SelectListItem>();
        //    ////CatalogModels cateModels = new CatalogModels();
        //    List<District> lstDistrict = this.GetListDistrictByCityID(city);
        //    foreach (District cata in lstDistrict)
        //    {
        //        lstSelect.Add(new SelectListItem { Selected = district == cata.DistrictID ? true : false, Text = cata.DistrictName.ToString(), Value = cata.DistrictID.ToString() });
        //    }

        //    return lstSelect;
        //}
    }
}