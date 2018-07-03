namespace Web.Models
{
    using System;
    using System.Collections.Generic;
    using System.Linq;
    using System.Web.Mvc;

    using Web.Data;

    /// <summary>
    /// City Models
    /// </summary>
    public class CityModels
    {
        /// <summary>
        /// Initializes a new instance of the <see cref="CityModels"/> class.
        /// </summary>
        public CityModels()
        {
        }

        /// <summary>
        /// Add the specified it.
        /// </summary>
        /// <param name="cityObject">city Object.</param>
        /// <returns>the Add</returns>
        public int Add(City cityObject)
        {
            using (var data = new Entities())
            {
                int rt = 0;
                try
                {
                    data.Cities.Add(cityObject);
                    data.SaveChanges();
                    rt = cityObject.CityID;
                }
                catch (Exception)
                {
                    rt = 0;
                }

                return rt;
            }
        }

        /// <summary>
        /// All the city.
        /// </summary>
        /// <returns>the All City</returns>
        public List<City> AllCity()
        {
            using (var data = new Entities())
            {
                try
                {
                    var lstCity = data.Cities.ToList();
                    return lstCity;
                }
                catch (Exception)
                {
                    return null;
                }
            }
        }

        /// <summary>
        /// Deletes the specified city identifier.
        /// </summary>
        /// <param name="city_id">The city identifier.</param>
        /// <returns>the Delete</returns>
        public bool Delete(int city_id)
        {
            using (var data = new Entities())
            {
                bool rt;
                try
                {
                    var c_gen = data.Cities.Where(p => p.CityID == city_id).FirstOrDefault();
                    if (c_gen != null)
                    {
                        data.Cities.Remove(c_gen);
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
        /// Edit the specified it.
        /// </summary>
        /// <param name="cityObject">city Object.</param>
        /// <returns>the Edit</returns>
        public int Edit(City cityObject)
        {
            using (var data = new Entities())
            {
                int rt = 0;
                try
                {
                    var c_gen = data.Cities.Where(p => p.CityID == cityObject.CityID).FirstOrDefault();
                    c_gen.CityName = cityObject.CityName;
                    data.SaveChanges();
                    rt = cityObject.CityID;
                }
                catch (Exception)
                {
                    rt = 0;
                }

                return rt;
            }
        }

        /// <summary>
        /// Gets the city by identifier.
        /// </summary>
        /// <param name="city_id">The city identifier.</param>
        /// <returns>Get City ByID</returns>
        public City GetCityByID(int city_id)
        {
            using (var data = new Entities())
            {
                try
                {
                    var objCity = data.Cities.SingleOrDefault(e => e.CityID == city_id);
                    return objCity;
                }
                catch (Exception)
                {
                    return null;
                }
            }
        }

        /// <summary>
        /// Lists the city.
        /// </summary>
        /// <param name="selected">The selected.</param>
        /// <returns>list city</returns>
        public List<SelectListItem> List_city(int selected)
        {
            List<SelectListItem> lstSelect = new List<SelectListItem>();
            ////CatalogModels cateModels = new CatalogModels();
            List<City> lstCity = this.AllCity();

            lstSelect.Add(new SelectListItem { Selected = true, Text = "Tất cả", Value = "0" });
            foreach (City cata in lstCity)
            {
                lstSelect.Add(new SelectListItem { Selected = selected == cata.CityID ? true : false, Text = cata.CityName.ToString(), Value = cata.CityID.ToString() });
            }

            return lstSelect;
        }

        /// <summary>
        /// Lists the city not all.
        /// </summary>
        /// <param name="selected">The selected.</param>
        /// <returns>list city not all</returns>
        public List<SelectListItem> List_city_not_all(int selected)
        {
            List<SelectListItem> lstSelect = new List<SelectListItem>();
            ////CatalogModels cateModels = new CatalogModels();
            lstSelect.Add(new SelectListItem { Selected = true, Text = "Chọn thành phố", Value = "0" });
            List<City> lstCity = this.AllCity();
            foreach (City cata in lstCity)
            {
                lstSelect.Add(new SelectListItem { Selected = selected == cata.CityID ? true : false, Text = cata.CityName.ToString(), Value = cata.CityID.ToString() });
            }

            return lstSelect;
        }
    }
}