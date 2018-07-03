namespace DBBase.Models
{
    using DBBase.Data;
    using DBBase.EntitysObject;
    using System;
    using System.Collections.Generic;
    using System.Linq;

    /// <summary>
    /// User Models
    /// </summary>
    public class UserModels
    {
        /// <summary>
        /// Initializes a new instance of the <see cref="UserModels"/> class.
        /// </summary>
        public UserModels()
        {
        }

        /// <summary>
        /// Checks the permission.
        /// </summary>
        /// <param name="user_name">Name of the user.</param>
        /// <param name="act">The act.</param>
        /// <param name="ctrl">The control.</param>
        /// <param name="type_action">The type action.</param>
        /// <param name="type">The type.</param>
        /// <returns>Checks the permission</returns>
        public static bool CheckPermission(string user_name, string act, string ctrl, string type_action, string type)
        {
            try
            {
                using (var data = new Entities())
                {
                    C_UserPage objUserPage = new C_UserPage();
                    if (string.IsNullOrEmpty(type))
                    {
                        objUserPage = data.C_UserPage.Where(c => c.act == act && c.ctrl == ctrl).FirstOrDefault();
                    }
                    else
                    {
                        objUserPage = data.C_UserPage.Where(c => c.act == act && c.ctrl == ctrl && c.Tye == type).FirstOrDefault();
                    }

                    if (objUserPage != null)
                    {
                        C_UserPermission objUserPermission = data.C_UserPermission.Where(p => p.page_id == objUserPage.id && p.user == user_name).FirstOrDefault();
                        if (objUserPermission != null)
                        {
                            bool isOK = false;
                            switch (type_action)
                            {
                                case CommonGlobal.Add:
                                    isOK = (bool)objUserPermission.add;
                                    break;
                                case CommonGlobal.Edit:
                                    isOK = (bool)objUserPermission.edit;
                                    break;
                                case CommonGlobal.Delete:
                                    isOK = (bool)objUserPermission.del;
                                    break;
                                case CommonGlobal.View:
                                    isOK = (bool)objUserPermission.view;
                                    break;
                                default:
                                    isOK = false;
                                    break;
                            }

                            return isOK;
                        }
                        else
                        {
                            return false;
                        }
                    }
                    else
                    {
                        return false;
                    }
                }
            }
            catch (Exception)
            {
                return false;
            }
        }

        /// <summary>
        /// Gets the list user page by parent identifier.
        /// </summary>
        /// <param name="parentID">The parent identifier.</param>
        /// <returns>Gets the list user</returns>
        public List<C_UserPage> GetListUserPageByParrentID(int parentID)
        {
            using (var data = new Entities())
            {
                return data.C_UserPage.Where(p => p.ParentId == parentID && p.IsShow == true).OrderBy(p => p.OrderDisplay).ToList();
            }
        }        
       
        /// <summary>
        /// Adds the user.
        /// </summary>
        /// <param name="user">user object.</param>
        /// <returns>Adds the user</returns>
        public string Add_User(C_User user)
        {
            using (var data = new Entities())
            {
                string rt = string.Empty;
                try
                {
                    data.C_User.Add(user);
                    data.SaveChanges();
                    rt = user.Username;
                }
                catch (Exception)
                {
                    rt = string.Empty;
                }

                return rt;
            }
        }

        /// <summary>
        /// Add the user information.
        /// </summary>
        /// <param name="userInfor">user Infor object.</param>
        /// <returns>Add User Information</returns>
        public bool Add_User_Infor(C_UserInfo userInfor)
        {
            using (var data = new Entities())
            {
                bool rt;
                try
                {
                    data.C_UserInfo.Add(userInfor);
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
        /// Admins the get all user.
        /// </summary>
        /// <param name="type">The type.</param>
        /// <param name="lang">The language.</param>
        /// <param name="search">The search.</param>
        /// <param name="page_index">The page index.</param>
        /// <param name="page_size">The page size.</param>
        /// <param name="order_by">The order by.</param>
        /// <param name="order_type">Type of the order.</param>
        /// <param name="total">The total.</param>
        /// <returns>Admin Get All User</returns>
        public List<C_User> AdminGetAllUser(string type, string lang, string search, int page_index, int page_size, string order_by, string order_type, out int total)
        {
            using (var data = new Entities())
            {
                try
                {
                    IQueryable<C_User> c_gen = null;
                    if (!string.IsNullOrEmpty(search))
                    {
                        c_gen = (from p in data.C_User
                                 join r in data.C_Role on p.Role equals r.ID
                                 where r.Role == type && p.Username != "Admin" && p.Username.Contains(search)
                                 select p).OrderByDescending(p => p.Username).AsQueryable<C_User>();
                    }
                    else
                    {
                        c_gen = (from p in data.C_User
                                 join r in data.C_Role on p.Role equals r.ID
                                 where r.Role == type && p.Username != "Admin"
                                 select p).OrderByDescending(p => p.Username).AsQueryable<C_User>();
                    }

                    total = c_gen.Count();

                    if (!string.IsNullOrEmpty(order_by) && !string.IsNullOrEmpty(order_type))
                    {
                        Type sortByPropType = typeof(C_User).GetProperty(order_by).PropertyType;
                        ////calling the extension method using reflection
                        c_gen = typeof(MyExtensions).GetMethod("CustomSort").MakeGenericMethod(new Type[] { typeof(C_User), sortByPropType })
                                .Invoke(c_gen, new object[] { c_gen, order_by, order_type }) as IQueryable<C_User>;
                    }
                    else
                    {
                        ////if  orderBy null set default is ID
                        c_gen = c_gen.OrderBy(p => p.Username);
                    }

                    return c_gen.Skip(page_index * page_size).Take(page_size).ToList();
                }
                catch (Exception)
                {
                    total = 0;
                    return null;
                }
            }
        }

        /// <summary>
        /// All the user.
        /// </summary>
        /// <returns>All User</returns>
        public List<C_User> AllUser()
        {
            using (var data = new Entities())
            {
                try
                {
                    var c_gen = data.C_User.ToList();
                    return c_gen;
                }
                catch (Exception)
                {
                    return null;
                }
            }
        }

        /// <summary>
        /// All the user event.
        /// </summary>
        /// <returns>All User Event</returns>
        public List<C_UserInfo> AllUserEvent()
        {
            using (var data = new Entities())
            {
                try
                {
                    var c_gen = data.C_UserInfo.ToList();
                    return c_gen;
                }
                catch (Exception)
                {
                    return null;
                }
            }
        }

        /// <summary>
        /// Deletes the user.
        /// </summary>
        /// <param name="user_name">Name of the user.</param>
        /// <returns>Delete User</returns>
        public bool Delete_User(string user_name)
        {
            using (var data = new Entities())
            {
                bool rt;
                try
                {
                    var c_gen = data.C_User.Where(p => p.Username == user_name).FirstOrDefault();
                    if (c_gen != null)
                    {
                        data.C_User.Remove(c_gen);
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
        /// Gets the list parent page.
        /// </summary>
        /// <returns>Get List Parent Page</returns>
        public List<C_UserPage> GetListParentPage()
        {
            using (var data = new Entities())
            {
                return data.C_UserPage.Where(p => p.IsShow == true && p.ParentId == 0).OrderBy(p => p.OrderDisplay).ToList();
            }
        }

        /// <summary>
        /// Gets the list permission by user.
        /// </summary>
        /// <param name="username">The username.</param>
        /// <returns>Get List permission By User</returns>
        public List<PagePermission> GetListPermissionByUser(string username)
        {
            List<PagePermission> lstPagePermission = new List<PagePermission>();
            List<PagePermission> lstData = new List<PagePermission>();
            using (var data = new Entities())
            {
                var query = from u in data.C_UserPermission
                            join p in data.C_UserPage on u.page_id equals p.id
                            where u.user == username
                            select new
                {
                    u.user, u.page_id, u.del, u.add, u.edit, u.view, p.Title, p.ParentId, p.OrderDisplay
                };
                if (query.Any())
                {
                    foreach (var obj in query)
                    {
                        PagePermission page = new PagePermission();
                        page.Page_ID = (int)obj.page_id;
                        page.User_Name = obj.user;
                        page.Title = obj.Title;
                        page.Add = (bool)obj.add;
                        page.Edit = (bool)obj.edit;
                        page.Delete = (bool)obj.del;
                        page.View = (bool)obj.view;
                        page.Parent_ID = (int)obj.ParentId;
                        page.OrderDisplay = (int)obj.OrderDisplay;
                        lstPagePermission.Add(page);
                    }

                    List<C_UserPermission> lstUserPermission = data.C_UserPermission.Where(u => u.user == username).ToList();
                    var dataID = from c in data.C_UserPermission
                                where c.user == username
                                select new
                    {
                        c.page_id
                    };

                    List<int> lstPageID = new List<int>();
                    if (dataID.Any())
                    {
                        foreach (var obj in dataID)
                        {
                            lstPageID.Add((int)obj.page_id);
                        }
                    }

                    List<C_UserPage> lstUserPage = data.C_UserPage.Where(c => !lstPageID.Contains(c.id) && c.ParentId > 0).ToList();
                    if (lstUserPage.Any())
                    {
                        foreach (var obj in lstUserPage)
                        {
                            PagePermission page = new PagePermission();
                            page.Page_ID = obj.id;
                            page.User_Name = username;
                            page.Title = obj.Title;
                            page.Add = false;
                            page.Edit = false;
                            page.Delete = false;
                            page.View = false;
                            page.Parent_ID = (int)obj.ParentId;
                            page.OrderDisplay = (int)obj.OrderDisplay;
                            lstPagePermission.Add(page);
                        }
                    }
                }
                else
                {
                    List<C_UserPage> lstUserPage = data.C_UserPage.Where(p => p.ParentId > 0).ToList();
                    if (lstUserPage.Any())
                    {
                        foreach (var obj in lstUserPage)
                        {
                            PagePermission page = new PagePermission();
                            page.Page_ID = obj.id;
                            page.User_Name = username;
                            page.Title = obj.Title;
                            page.Add = false;
                            page.Edit = false;
                            page.Delete = false;
                            page.View = false;
                            page.Parent_ID = (int)obj.ParentId;
                            page.OrderDisplay = (int)obj.OrderDisplay;
                            lstPagePermission.Add(page);
                        }
                    }
                }

                List<C_UserPage> lstUserPageParent = data.C_UserPage.Where(p => p.ParentId == 0).OrderBy(p => p.OrderDisplay).ToList();
                foreach (var parent in lstUserPageParent)
                {
                    PagePermission page = new PagePermission();
                    page.Page_ID = parent.id;
                    page.User_Name = username;
                    page.Title = parent.Title;
                    page.Add = false;
                    page.Edit = false;
                    page.Delete = false;
                    page.View = false;
                    page.Parent_ID = (int)parent.ParentId;
                    page.OrderDisplay = (int)parent.OrderDisplay;
                    lstData.Add(page);
                    lstData.AddRange(lstPagePermission.Where(p => p.Parent_ID == parent.id).OrderBy(p => p.OrderDisplay));
                }
            }

            return lstData;
        }

        /// <summary>
        /// Gets the user by role.
        /// </summary>
        /// <param name="role">The role.</param>
        /// <returns>Gets the user by role</returns>
        public List<C_User> GetUserbyRole(int role)
        {
            using (var data = new Entities())
            {
                try
                {
                    var c_gen = data.C_User.Where(p => p.Role == role).ToList<C_User>();
                    return c_gen;
                }
                catch (Exception)
                {
                    return null;
                }
            }
        }

        /// <summary>
        /// Gets the name of the user by user.
        /// </summary>
        /// <param name="user_name">Name of the user.</param>
        /// <returns>Gets the name of the user by user</returns>
        public C_User GetUserbyUserName(string user_name)
        {
            using (var data = new Entities())
            {
                try
                {
                    var c_gen = data.C_User.Where(p => p.Username == user_name).FirstOrDefault();
                    return c_gen;
                }
                catch (Exception ex)
                {
                    return null;
                }
            }
        }

        /// <summary>
        /// Gets the user event by event.
        /// </summary>
        /// <param name="event_user">The event.</param>
        /// <returns>Gets the user event by event</returns>
        public List<C_UserInfo> GetUserEventbyEvent(int event_user)
        {
            using (var data = new Entities())
            {
                try
                {
                    var c_gen = data.C_UserInfo.Where(p => p.EventId == event_user).ToList();
                    return c_gen;
                }
                catch (Exception)
                {
                    return null;
                }
            }
        }

        /// <summary>
        /// Gets the user infor by email.
        /// </summary>
        /// <param name="email">The email.</param>
        /// <returns>Gets the user infor by email</returns>
        public C_UserInfo GetUserInforByEmail(string email)
        {
            using (var data = new Entities())
            {
                try
                {
                    var c_gen = data.C_UserInfo.Where(p => p.Email == email).FirstOrDefault();
                    return c_gen;
                }
                catch (Exception)
                {
                    return null;
                }
            }
        }

        /// <summary>
        /// Lists all user statistic.
        /// </summary>
        /// <returns>Lists all user statistic</returns>
        public List<f_UserInfor_Statistic_Result> ListAllUserStatistic()
        {
            using (var data = new Entities())
            {
                try
                {
                    var c_gen = data.f_UserInfor_Statistic().ToList<f_UserInfor_Statistic_Result>();
                    return c_gen;
                }
                catch (Exception)
                {
                    return null;
                }
            }
        }

        /// <summary>
        /// Updates the permission.
        /// </summary>
        /// <param name="userPermission">The user permission.</param>
        /// <returns>Updates the permission</returns>
        public bool UpdatePermission(C_UserPermission userPermission)
        {
            try
            {
                using (var data = new Entities())
                {
                    C_UserPermission objUserPer = data.C_UserPermission.Where(p => p.page_id == userPermission.page_id && p.user == userPermission.user).FirstOrDefault();
                    if (objUserPer != null)
                    {
                        objUserPer.add = userPermission.add;
                        objUserPer.edit = userPermission.edit;
                        objUserPer.del = userPermission.del;
                        objUserPer.view = userPermission.view;
                        data.SaveChanges();
                    }
                    else
                    {
                        data.C_UserPermission.Add(userPermission);
                        data.SaveChanges();
                    }
                }

                return true;
            }
            catch
            {
                return false;
            }
        }

        /// <summary>
        /// Updates the user.
        /// </summary>
        /// <param name="user">user object.</param>
        /// <returns>Updates the user</returns>
        public string Update_User(C_User user)
        {
            using (var data = new Entities())
            {
                string rt = string.Empty;
                try
                {
                    var c_gen = data.C_User.Where(p => p.Username == user.Username).FirstOrDefault();
                    c_gen.Password = user.Password;
                    c_gen.Role = user.Role;
                    c_gen.Online = user.Online;
                    c_gen.IP = user.IP;
                    c_gen.LastLogin = user.LastLogin;

                    data.SaveChanges();
                    rt = user.Username;
                }
                catch (Exception)
                {
                    rt = string.Empty;
                }

                return rt;
            }
        }
    }
}