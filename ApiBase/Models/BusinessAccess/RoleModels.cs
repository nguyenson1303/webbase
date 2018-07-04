namespace ApiBase.Models.BusinessAccess
{
    using ApiBase.Models.DB;
    using System;
    using System.Collections.Generic;
    using System.Linq;

    /// <summary>
    /// Role Models
    /// </summary>
    public class RoleModels
    {
        /// <summary>
        /// Initializes a new instance of the <see cref="RoleModels"/> class.
        /// </summary>
        public RoleModels()
        {
        }

        /// <summary>
        /// Add the role.
        /// </summary>
        /// <param name="role">role object.</param>
        /// <returns>Adds the role</returns>
        public bool Add_Role(Role role)
        {
            using (var data = new themanorContext())
            {
                bool rt;
                try
                {
                    data.Role.Add(role);
                    data.SaveChanges();
                    rt = true;
                }
                catch (Exception)
                {
                    rt = false;
                }

                return rt;
            }
        }

        /// <summary>
        /// Deletes the role.
        /// </summary>
        /// <param name="id">The identifier.</param>
        /// <returns>Deletes the role</returns>
        public bool Delete_Role(int id)
        {
            using (var data = new themanorContext())
            {
                bool rt;
                try
                {
                    var c_gen = data.Role.Where(p => p.Id == id).FirstOrDefault();
                    if (c_gen != null)
                    {
                        data.Role.Remove(c_gen);
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
        /// Edits the role.
        /// </summary>
        /// <param name="role">role object.</param>
        /// <returns>Edits the role</returns>
        public bool Edit_Role(Role role)
        {
            using (var data = new themanorContext())
            {
                bool rt;
                try
                {
                    var c_gen = data.Role.Where(p => p.Id == role.Id).FirstOrDefault();
                    c_gen.Role1 = role.Role1;
                    c_gen.RoleName = role.RoleName;
                    c_gen.Des = role.Des;
                    data.SaveChanges();
                    rt = true;
                }
                catch (Exception)
                {
                    rt = false;
                }

                return rt;
            }
        }

        /// <summary>
        /// Get the list role.
        /// </summary>
        /// <returns>Get the list role</returns>
        public List<Role> GetListRole()
        {
            using (var data = new themanorContext())
            {
                try
                {
                    var c_gen = data.Role.ToList();

                    return c_gen;
                }
                catch (Exception)
                {
                    return null;
                }
            }
        }

        /// <summary>
        /// Gets the role by role.
        /// </summary>
        /// <param name="role">The role.</param>
        /// <returns>Get the role by role</returns>
        public string GetRoleByRole(string role)
        {
            using (var data = new themanorContext())
            {
                try
                {
                    var c_gen = data.Role.Where(p => p.Role1 == role).FirstOrDefault();
                    if (c_gen != null)
                    {
                        return c_gen.RoleName;
                    }
                    else
                    {
                        return string.Empty;
                    }
                }
                catch (Exception)
                {
                    return null;
                }
            }
        }

        /// <summary>
        /// Gets the role item.
        /// </summary>
        /// <param name="id">The identifier.</param>
        /// <returns>Gets the role item</returns>
        public Role GetRoleItem(int id)
        {
            using (var data = new themanorContext())
            {
                try
                {
                    var c_gen = data.Role.Where(p => p.Id == id).FirstOrDefault();
                    return c_gen;
                }
                catch (Exception)
                {
                    return null;
                }
            }
        }
    }
}