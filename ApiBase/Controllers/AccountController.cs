using System.Collections.Generic;
using System.Linq;
using System.Security.Claims;
using ApiBase.Models.BusinessAccess;
using ApiBase.Models.DB;
using ApiBase.Models.ViewModels;
using DBBase.EntitysObject;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;

// For more information on enabling Web API for empty projects, visit https://go.microsoft.com/fwlink/?LinkID=397860

namespace ApiBase.Controllers
{
    [Route("api/[controller]")]
    public class AccountController : Controller
    {
        // GET: api/<controller>
        [HttpGet]
        public UserInfo Get()
        {
            UserModels sv = new UserModels();

            var identity = (ClaimsIdentity)User.Identity;
            IEnumerable<Claim> claims = identity.Claims;
            var userLogin = claims.FirstOrDefault(c => c.Type == ClaimTypes.Email).Value;
            var userInfor = sv.GetUserInforByEmail(userLogin);
            return userInfor;
        }

        [HttpPost("changePassword")]
        [Authorize]
        public IActionResult ChangePassword([FromBody]ChangePasswordView login)
        {
            UserModels sv = new UserModels();
            IActionResult response = null;
            var mess = string.Empty;

            var identity = (ClaimsIdentity)User.Identity;
            IEnumerable<Claim> claims = identity.Claims;
            var userLogin = claims.FirstOrDefault(c => c.Type == ClaimTypes.Email).Value;

            if (!string.IsNullOrEmpty(login.Password) && !string.IsNullOrEmpty(login.ConfirmPassword))
            {
                // user change password
                User user = sv.GetUserbyUserName(userLogin);
                if (user != null && MD5Extend.EncodePassword(login.OldPassword) == user.Password)
                {
                    if (login.Password == login.ConfirmPassword)
                    {
                        user.Password = MD5Extend.EncodePassword(login.Password);
                        sv.UpdateUser(user);
                        mess = "Thay đổi mật khẩu thành công !";
                        response = StatusCode(200, mess); 
                    }
                    else
                    {
                        mess = "Vui lòng xác nhận lại mật khẩu !";
                        response = StatusCode(201, mess); 
                    }
                }
            }

            return response;
        }

        //// GET api/<controller>/abc@gmail.com
        //[HttpGet("{email}")]
        //public C_UserInfo Get(string email)
        //{
        //    UserModels sv = new UserModels();
        //    C_UserInfo iit = new C_UserInfo();

        //    iit = sv.GetUserInforByEmail(email);
        //    return iit;
        //}

        //// POST api/<controller>
        //// register new user
        //[HttpPost]
        //public void Post([FromBody]Register_view register_view)
        //{

        //}

        //// PUT api/<controller>/5
        //// update account infor by id
        //[HttpPut("{email}")]
        //public bool Put(string email, [FromBody]Register_view register_view)
        //{
        //    UserModels sv = new UserModels();
        //    C_User it = new C_User();
        //    C_UserInfo iit = new C_UserInfo();

        //    bool infors = false;

        //    iit.FName = register_view.FirstName;
        //    iit.Email = register_view.Email;
        //    iit.Address = register_view.Address;
        //    if (!string.IsNullOrEmpty(register_view.Birthday))
        //    {
        //        iit.Birthday = DateTime.Parse(register_view.Birthday);
        //    }

        //    iit.Phone = register_view.Phone;

        //    infors = sv.Add_User_Infor(iit);
        //    if (infors)
        //    {
        //        return true;
        //    }
        //    else
        //    {
        //        return false;
        //    }
        //}

        // DELETE api/<controller>/5
        [HttpDelete("{id}")]
        public void Delete(int id)
        {
        }
    }
}
