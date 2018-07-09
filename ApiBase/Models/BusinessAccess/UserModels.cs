namespace ApiBase.Models.BusinessAccess
{
    using ApiBase.Models.DB;
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
        /// <param name="path">The act.</param>
        /// <param name="ctrl">The control.</param>
        /// <param name="type_action">The type action.</param>
        /// <param name="type">The type.</param>
        /// <returns>Checks the permission</returns>
        public static bool CheckPermission(string user_name, string path, string type_action, string type)
        {
            try
            {
                using (var data = new themanorContext())
                {
                    UserPage objUserPage = new UserPage();
                    if (string.IsNullOrEmpty(type))
                    {
                        objUserPage = data.UserPage.Where(c => c.Path == path).FirstOrDefault();
                    }
                    else
                    {
                        objUserPage = data.UserPage.Where(c => c.Path == path && c.Tye == type).FirstOrDefault();
                    }

                    if (objUserPage != null)
                    {
                        UserPermission objUserPermission = data.UserPermission.Where(p => p.PageId == objUserPage.Id && p.User == user_name).FirstOrDefault();
                        if (objUserPermission != null)
                        {
                            bool isOK = false;
                            var listActionID = objUserPermission.TypeActionId;
                            List<string> listAction = new List<string>();

                            if (!string.IsNullOrEmpty(listActionID)) {
                                listAction = listActionID.Split(',').ToList();

                                if (listAction.Contains(type_action))
                                {
                                    isOK = true;
                                }                                
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
        public List<UserPage> GetListUserPageByParrentID(int parentID)
        {
            using (var data = new themanorContext())
            {
                return data.UserPage.Where(p => p.ParentId == parentID && p.IsShow == true).OrderBy(p => p.OrderDisplay).ToList();
            }
        }        
       
        /// <summary>
        /// Adds the user.
        /// </summary>
        /// <param name="user">user object.</param>
        /// <returns>Adds the user</returns>
        public string AddUser(User user)
        {
            using (var data = new themanorContext())
            {
                string rt = string.Empty;
                using (var dbContextTransaction = data.Database.BeginTransaction())
                {
                    try
                    {
                        data.User.Add(user);
                        data.SaveChanges();
                        rt = user.Username;

                        if (rt != null)
                        {
                            UserInfo uf = new UserInfo();
                            uf.Email = user.Username;
                            uf.DateRegister = DateTime.Now;

                            data.UserInfo.Add(uf);
                            data.SaveChanges();
                            var ufId = uf.InforId;
                            if (ufId > 0)
                            {
                                dbContextTransaction.Commit();
                            }
                            else
                            {
                                dbContextTransaction.Rollback();
                            }
                        }
                        else
                        {
                            dbContextTransaction.Rollback();
                        }

                    }
                    catch (Exception)
                    {
                        dbContextTransaction.Rollback();
                    }
                }

                return rt;
            }
        }

        /// <summary>
        /// Add the user information.
        /// </summary>
        /// <param name="userInfor">user Infor object.</param>
        /// <returns>Add User Information</returns>
        public bool Add_User_Infor(UserInfo userInfor)
        {
            using (var data = new themanorContext())
            {
                bool rt;
                try
                {
                    data.UserInfo.Add(userInfor);
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
        /// <param name="pageIndex">The page index.</param>
        /// <param name="pageSize">The page size.</param>
        /// <param name="orderBy">The order by.</param>
        /// <param name="orderType">Type of the order.</param>
        /// <param name="total">The total.</param>
        /// <returns>Admin Get All User</returns>
        public List<User> AdminGetAllUser(string type, string lang, string search, int pageIndex, int pageSize, string orderBy, string orderType, out int total)
        {
            using (var data = new themanorContext())
            {
                try
                {
                    IQueryable<User> c_gen = null;
                    if (!string.IsNullOrEmpty(search))
                    {
                        c_gen = (from p in data.User
                                 join i in data.UserInfo on p.Username equals i.Email
                                 join r in data.Role on p.Role equals r.Id
                                 where r.Role1 == type && p.Username != "Admin" && p.Username.Contains(search)
                                 select p).OrderByDescending(p => p.Username).AsQueryable<User>();
                    }
                    else
                    {
                        c_gen = (from p in data.User
                                 join i in data.UserInfo on p.Username equals i.Email
                                 join r in data.Role on p.Role equals r.Id
                                 where r.Role1 == type && p.Username != "Admin"
                                 select p).OrderByDescending(p => p.Username).AsQueryable<User>();
                    }

                    total = c_gen.Count();

                    if (!string.IsNullOrEmpty(orderBy) && !string.IsNullOrEmpty(orderType))
                    {
                        Type sortByPropType = typeof(User).GetProperty(orderBy).PropertyType;
                        ////calling the extension method using reflection
                        c_gen = typeof(MyExtensions).GetMethod("CustomSort").MakeGenericMethod(new Type[] { typeof(User), sortByPropType })
                                .Invoke(c_gen, new object[] { c_gen, orderBy, orderType }) as IQueryable<User>;
                    }
                    else
                    {
                        ////if  orderBy null set default is ID
                        c_gen = c_gen.OrderBy(p => p.Username);
                    }

                    return c_gen.Skip((pageIndex-1) * pageSize).Take(pageSize).ToList();
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
        public List<User> AllUser()
        {
            using (var data = new themanorContext())
            {
                try
                {
                    var c_gen = data.User.ToList();
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
        public List<UserInfo> AllUserEvent()
        {
            using (var data = new themanorContext())
            {
                try
                {
                    var c_gen = data.UserInfo.ToList();
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
        /// <param name="userName">Name of the user.</param>
        /// <returns>Delete User</returns>
        public bool DeleteUser(string userName)
        {
            using (var data = new themanorContext())
            {
                bool rt;
                using (var dbContextTransaction = data.Database.BeginTransaction())
                {
                    try
                    {
                        var c_infor = data.UserInfo.Where(p => p.Email == userName).FirstOrDefault();
                        if(c_infor != null)
                        {
                            data.UserInfo.Remove(c_infor);
                            data.SaveChanges();
                            var c_gen = data.User.Where(p => p.Username == userName).FirstOrDefault();
                            if (c_gen != null) {
                                data.User.Remove(c_gen);
                                data.SaveChanges();
                                rt = true;
                                dbContextTransaction.Commit();
                            }
                            else
                            {
                                rt = false;
                                dbContextTransaction.Rollback();
                            }
                        }
                        else
                        {
                            rt = false;
                            dbContextTransaction.Rollback();
                        }
                        
                    }
                    catch (Exception)
                    {
                        rt = false;
                        dbContextTransaction.Rollback();
                    }
                }

                return rt;
            }
        }

        /// <summary>
        /// Gets the list parent page.
        /// </summary>
        /// <returns>Get List Parent Page</returns>
        public List<UserPage> GetListParentPage()
        {
            using (var data = new themanorContext())
            {
                return data.UserPage.Where(p => p.IsShow == true && p.ParentId == 0).OrderBy(p => p.OrderDisplay).ToList();
            }
        }

        /// <summary>
        /// Gets the list permission by user.
        /// </summary>
        /// <param name="userName">The username.</param>
        /// <returns>Get List permission By User</returns>
        public List<PagePermission> GetListPermissionByUser(string userName, int pageIndex, int pageSize, out int total)
        {
            List<PagePermission> lstPagePermission = new List<PagePermission>();
            List<PagePermission> lstData = new List<PagePermission>();
            using (var data = new themanorContext())
            {
                var query = from u in data.UserPermission
                            join p in data.UserPage on u.PageId equals p.Id
                            where u.User == userName
                            select new
                {
                    u.User, u.PageId, p.Title, p.ParentId, p.OrderDisplay, u.TypeActionId
                };
                if (query.Any())
                {
                    foreach (var obj in query)
                    {
                        
                        PagePermission page = new PagePermission();
                        page.PageId = (int)obj.PageId;
                        page.UserName = obj.User;
                        page.Title = obj.Title;
                        page.ParentId = (int)obj.ParentId;
                        page.OrderDisplay = (int)obj.OrderDisplay;
                        page.ListActionId = obj.TypeActionId;
                        lstPagePermission.Add(page);
                    }

                    List<UserPermission> lstUserPermission = data.UserPermission.Where(u => u.User == userName).ToList();
                    List<int> lstPageID = (from c in data.UserPermission
                                where c.User == userName
                                select (int)c.PageId).ToList<int>();

                    List<UserPage> lstUserPage = data.UserPage.Where(c => !lstPageID.Contains(c.Id) && c.ParentId > 0).ToList();
                    if (lstUserPage.Any())
                    {
                        foreach (var obj in lstUserPage)
                        {
                            PagePermission page = new PagePermission();
                            page.PageId = obj.Id;
                            page.UserName = userName;
                            page.Title = obj.Title;
                            page.ParentId = (int)obj.ParentId;
                            page.OrderDisplay = (int)obj.OrderDisplay;
                            page.ListActionId = string.Empty;
                            lstPagePermission.Add(page);
                        }
                    }
                }
                else
                {
                    List<UserPage> lstUserPage = data.UserPage.Where(p => p.ParentId > 0).ToList();
                    if (lstUserPage.Any())
                    {
                        foreach (var obj in lstUserPage)
                        {
                            PagePermission page = new PagePermission();
                            page.PageId = obj.Id;
                            page.UserName = userName;
                            page.Title = obj.Title;
                            page.ParentId = (int)obj.ParentId;
                            page.OrderDisplay = (int)obj.OrderDisplay;
                            page.ListActionId = string.Empty;
                            lstPagePermission.Add(page);
                        }
                    }
                }

                List<UserPage> lstUserPageParent = data.UserPage.Where(p => p.ParentId == 0).OrderBy(p => p.OrderDisplay).ToList();
                foreach (var parent in lstUserPageParent)
                {
                    PagePermission page = new PagePermission();
                    page.PageId = parent.Id;
                    page.UserName = userName;
                    page.Title = parent.Title;
                    page.ParentId = (int)parent.ParentId;
                    page.OrderDisplay = (int)parent.OrderDisplay;
                    page.ListActionId = string.Empty;
                    lstData.Add(page);
                    lstData.AddRange(lstPagePermission.Where(p => p.ParentId == parent.Id).OrderBy(p => p.OrderDisplay));
                }

                total = lstData.Count();
            }

            return lstData.Skip((pageIndex - 1) * pageSize).Take(pageSize).ToList();
        }

        /// <summary>
        /// Gets the user by role.
        /// </summary>
        /// <param name="role">The role.</param>
        /// <returns>Gets the user by role</returns>
        public List<User> GetUserbyRole(int role)
        {
            using (var data = new themanorContext())
            {
                try
                {
                    var c_gen = data.User.Where(p => p.Role == role).ToList<User>();
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
        public User GetUserbyUserName(string user_name)
        {
            using (var data = new themanorContext())
            {
                try
                {
                    var c_gen = data.User.Where(p => p.Username == user_name).FirstOrDefault();
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
        public List<UserInfo> GetUserEventbyEvent(int event_user)
        {
            using (var data = new themanorContext())
            {
                try
                {
                    var c_gen = data.UserInfo.Where(p => p.EventId == event_user).ToList();
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
        public UserInfo GetUserInforByEmail(string email)
        {
            using (var data = new themanorContext())
            {
                try
                {
                    var c_gen = data.UserInfo.Where(p => p.Email == email).FirstOrDefault();
                    return c_gen;
                }
                catch (Exception)
                {
                    return null;
                }
            }
        }

        ///// <summary>
        ///// Lists all user statistic.
        ///// </summary>
        ///// <returns>Lists all user statistic</returns>
        //public List<f_UserInfor_Statistic_Result> ListAllUserStatistic()
        //{
        //    using (var data = new themanorContext())
        //    {
        //        try
        //        {
        //            var c_gen = data.f_UserInfor_Statistic().ToList<f_UserInfor_Statistic_Result>();
        //            return c_gen;
        //        }
        //        catch (Exception)
        //        {
        //            return null;
        //        }
        //    }
        //}

        /// <summary>
        /// Updates the permission.
        /// </summary>
        /// <param name="userPermission">The user permission.</param>
        /// <returns>Updates the permission</returns>
        public bool UpdatePermission(UserPermission userPermission)
        {
            try
            {
                using (var data = new themanorContext())
                {
                    UserPermission objUserPer = data.UserPermission.Where(p => p.PageId == userPermission.PageId && p.User == userPermission.User).FirstOrDefault();
                    if (objUserPer != null)
                    {
                        objUserPer.TypeActionId = userPermission.TypeActionId;
                        data.SaveChanges();
                    }
                    else
                    {
                        data.UserPermission.Add(userPermission);
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
        public string UpdateUser(string userName, User user)
        {
            using (var data = new themanorContext())
            {
                string rt = string.Empty;
                try
                {
                    var c_gen = data.User.Where(p => p.Username == userName).FirstOrDefault();
                    c_gen.Role = user.Role;
                    c_gen.Online = user.Online;
                    c_gen.Ip = user.Ip;

                    data.SaveChanges();
                    rt = user.Username;
                }
                catch (Exception ex) 
                {
                    rt = string.Empty;
                }

                return rt;
            }
        }

        /// <summary>
        /// Updates the user.
        /// </summary>
        /// <param name="user">user object.</param>
        /// <returns>Updates the user</returns>
        public string UpdateUserPassword(User user)
        {
            using (var data = new themanorContext())
            {
                string rt = string.Empty;
                try
                {
                    var c_gen = data.User.Where(p => p.Username == user.Username).FirstOrDefault();
                    c_gen.Password = user.Password;

                    data.SaveChanges();
                    rt = user.Username;
                }
                catch (Exception ex)
                {
                    rt = string.Empty;
                }

                return rt;
            }
        }

        /// <summary>
        /// Updates the user.
        /// </summary>
        /// <param name="user">user object.</param>
        /// <returns>Updates the user</returns>
        public string RefreshTokenUser(User user)
        {
            using (var data = new themanorContext())
            {
                string rt = string.Empty;
                try
                {
                    var c_gen = data.User.Where(p => p.Username == user.Username).FirstOrDefault();
                    c_gen.Token = user.Token.ToString();
                    c_gen.Expire = user.Expire;

                    data.SaveChanges();
                    rt = user.Username;
                }
                catch (Exception ex)
                {
                    rt = string.Empty;
                }

                return rt;
            }
        }

        /// <summary>
        /// Gets the name of the role.
        /// </summary>
        /// <param name="user_name">Name of the user.</param>
        /// <returns>Gets the name of the user by user</returns>
        public Role GetRolebyId(int id)
        {
            using (var data = new themanorContext())
            {
                try
                {
                    var c_gen = data.Role.Where(p => p.Id == id).FirstOrDefault();
                    return c_gen;
                }
                catch (Exception ex)
                {
                    return null;
                }
            }
        }


        public UserPageAction GetActionByActionName(string actionName)
        {
            using (var data = new themanorContext())
            {
                try
                {
                    var c_gen = data.UserPageAction.Where(p => p.ActionName == actionName).FirstOrDefault();
                    return c_gen;
                }
                catch (Exception ex)
                {
                    return null;
                }
            }
        }
    }
}