using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using DBBase.Data;
using DBBase.EntitysObject;
using DBBase.Models;
using Microsoft.AspNetCore.Mvc;

// For more information on enabling Web API for empty projects, visit https://go.microsoft.com/fwlink/?LinkID=397860

namespace ApiBase.Controllers
{
    [Route("api/[controller]")]
    public class AccountController : Controller
    {
        // GET: api/<controller>
        [HttpGet]
        public IEnumerable<string> Get()
        {
            return new string[] { "value1", "value2" };
        }

        // GET api/<controller>/abc@gmail.com
        [HttpGet("{email}")]
        public C_UserInfo Get(string email)
        {
            UserModels sv = new UserModels();
            C_UserInfo iit = new C_UserInfo();

            iit = sv.GetUserInforByEmail(email);
            return iit;
        }

        // POST api/<controller>
        // register new user
        [HttpPost]
        public void Post([FromBody]Register_view register_view)
        {

        }

        // PUT api/<controller>/5
        // update account infor by id
        [HttpPut("{email}")]
        public bool Put(string email, [FromBody]Register_view register_view)
        {
            UserModels sv = new UserModels();
            C_User it = new C_User();
            C_UserInfo iit = new C_UserInfo();

            bool infors = false;

            iit.FName = register_view.FirstName;
            iit.Email = register_view.Email;
            iit.Address = register_view.Address;
            if (!string.IsNullOrEmpty(register_view.Birthday))
            {
                iit.Birthday = DateTime.Parse(register_view.Birthday);
            }

            iit.Phone = register_view.Phone;

            infors = sv.Add_User_Infor(iit);
            if (infors)
            {
                return true;
            }
            else
            {
                return false;
            }          
        }

        // DELETE api/<controller>/5
        [HttpDelete("{id}")]
        public void Delete(int id)
        {
        }
    }
}
