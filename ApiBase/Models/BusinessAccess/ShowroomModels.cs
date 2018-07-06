namespace ApiBase.Models.BusinessAccess
{
    using ApiBase.Models.DB;
    using System;
    using System.Collections.Generic;
    using System.Linq;

    /// <summary>
    /// Showroom Models
    /// </summary>
    public class ShowroomModels
    {
        /// <summary>
        /// Initializes a new instance of the <see cref="ShowroomModels"/> class.
        /// </summary>
        public ShowroomModels()
        {
        }

        /// <summary>
        /// Add the specified it.
        /// </summary>
        /// <param name="showroom">showroom object.</param>
        /// <returns>Add the Showroom</returns>
        public int Add(Showroom showroom)
        {
            using (var data = new themanorContext())
            {
                int rt = 0;
                try
                {
                    data.Showroom.Add(showroom);
                    data.SaveChanges();
                    rt = showroom.ShowroomId;
                }
                catch (Exception)
                {
                    rt = 0;
                }

                return rt;
            }
        }

        /// <summary>
        /// All the showroom.
        /// </summary>
        /// <returns>All the showroom</returns>
        public List<Showroom> AllShowroom()
        {
            using (var data = new themanorContext())
            {
                try
                {
                    var lstShowroom = data.Showroom.OrderBy(s => s.Name).ToList();
                    return lstShowroom;
                }
                catch (Exception)
                {
                    return null;
                }
            }
        }

        /// <summary>
        /// Deletes the specified showroom identifier.
        /// </summary>
        /// <param name="showroom_id">The showroom identifier.</param>
        /// <returns>Delete showroom</returns>
        public bool Delete(int showroom_id)
        {
            using (var data = new themanorContext())
            {
                bool rt;
                try
                {
                    var c_gen = data.Showroom.Where(p => p.ShowroomId == showroom_id).FirstOrDefault();
                    if (c_gen != null)
                    {
                        data.Showroom.Remove(c_gen);
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
        /// Edits the specified showroom.
        /// </summary>
        /// <param name="showroom">showroom object.</param>
        /// <returns>Edit Showroom</returns>
        public int Edit(Showroom showroom)
        {
            using (var data = new themanorContext())
            {
                int rt = 0;
                try
                {
                    var c_gen = data.Showroom.Where(p => p.ShowroomId == showroom.ShowroomId).FirstOrDefault();
                    c_gen.DistrictId = showroom.DistrictId;
                    c_gen.Latitude = showroom.Latitude;
                    c_gen.Longitude = showroom.Longitude;
                    c_gen.Name = showroom.Name;
                    c_gen.Address = showroom.Address;
                    c_gen.Phone = showroom.Phone;
                    c_gen.Image = showroom.Image;
                    data.SaveChanges();
                    rt = showroom.ShowroomId;
                }
                catch (Exception)
                {
                    rt = 0;
                }

                return rt;
            }
        }

        /// <summary>
        /// Gets the list showroom.
        /// </summary>
        /// <param name="districtID">The district identifier.</param>
        /// <param name="page_index">The page index.</param>
        /// <param name="page_size">The page site.</param>
        /// <param name="total">The total.</param>
        /// <returns>Gets the list showroom</returns>
        public List<Showroom> GetListShowroom(int? districtID, int page_index, int page_size, out int total)
        {
            using (var data = new themanorContext())
            {
                try
                {
                    List<Showroom> lstShowroom = new List<Showroom>();
                    if (districtID == null || districtID == 0)
                    {
                        lstShowroom = this.AllShowroom();
                    }
                    else
                    {
                        lstShowroom = data.Showroom.Where(s => s.DistrictId == districtID).OrderBy(s => s.Name).ToList();
                    }

                    total = lstShowroom.Count();

                    return lstShowroom.Skip((page_index-1) * page_size).Take(page_size).ToList();
                }
                catch (Exception)
                {
                    total = 0;
                    return null;
                }
            }
        }

        /// <summary>
        /// Gets the showroom by district identifier.
        /// </summary>
        /// <param name="districtID">The district identifier.</param>
        /// <returns>Gets the showroom by district id</returns>
        public List<Showroom> GetShowroomByDistrictID(int districtID)
        {
            using (var data = new themanorContext())
            {
                try
                {
                    List<Showroom> lstShowroom = data.Showroom.Where(s => s.DistrictId == districtID).OrderBy(s => s.Name).ToList();
                    return lstShowroom;
                }
                catch (Exception)
                {
                    return null;
                }
            }
        }

        /// <summary>
        /// Gets the showroom by identifier.
        /// </summary>
        /// <param name="showroom_id">The showroom identifier.</param>
        /// <returns>Gets the showroom by id</returns>
        public Showroom GetShowroomById(int showroom_id)
        {
            using (var data = new themanorContext())
            {
                try
                {
                    var objShowroom = data.Showroom.SingleOrDefault(e => e.ShowroomId == showroom_id);

                    return objShowroom;
                }
                catch (Exception)
                {
                    return null;
                }
            }
        }
    }
}