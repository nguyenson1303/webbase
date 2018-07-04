using System;
using System.IdentityModel.Tokens.Jwt;
using System.Security.Claims;
using System.Text;
using ApiBase.Model;
using ApiBase.Models.BusinessAccess;
using ApiBase.Models.DB;
using DBBase.EntitysObject;
using Microsoft.AspNetCore.Authentication;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;
using Microsoft.Extensions.Configuration;
using Microsoft.IdentityModel.Tokens;

// For more information on enabling Web API for empty projects, visit https://go.microsoft.com/fwlink/?LinkID=397860

namespace ApiBase.Controllers
{
    [Route("api/[controller]")]
    public class TokenController : Controller
    {
        private IConfiguration _config;

        public TokenController(IConfiguration config)
        {
            _config = config;
        }

        [AllowAnonymous]
        [HttpPost]
        public IActionResult CreateToken([FromBody]LoginView login)
        {
            IActionResult response = Unauthorized();
            Role userRole = null;
            var user = Authenticate(login, out userRole);

            if (user != null)
            {             
                var tokenString = BuildToken(user, userRole);
                response = Ok(new { token = tokenString });
            }

            return response;
        }

        private string BuildToken(UserInfo user, Role role)
        {
            var claims = new[] {
                new Claim(JwtRegisteredClaimNames.Sub, user.Fname + " " + user.Lname),
                new Claim(JwtRegisteredClaimNames.NameId, user.InforId.ToString()),
                new Claim("roles", role.Role1.ToString()),
                new Claim(JwtRegisteredClaimNames.Email, user.Email),
                new Claim(JwtRegisteredClaimNames.Birthdate, user.Birthday != null ? user.Birthday.Value.ToString("yyyy-MM-dd") : string.Empty),
                new Claim(JwtRegisteredClaimNames.Jti, Guid.NewGuid().ToString())
            };

            var key = new SymmetricSecurityKey(Encoding.UTF8.GetBytes(_config["Jwt:Key"]));
            var creds = new SigningCredentials(key, SecurityAlgorithms.HmacSha256);

            var token = new JwtSecurityToken(_config["Jwt:Issuer"],
              _config["Jwt:Issuer"],
              claims,
              expires: DateTime.Now.AddHours(12),
              signingCredentials: creds);

            return new JwtSecurityTokenHandler().WriteToken(token);
        }

        private UserInfo Authenticate(LoginView login, out Role role)
        {
            UserModels sv = new UserModels();
            UserInfo iit = new UserInfo();
            User it = sv.GetUserbyUserName(login.UserName);
            if (it != null && MD5Extend.EncodePassword(login.Password) == it.Password)
            {
                role = sv.GetRolebyId(it.Role);
                iit = sv.GetUserInforByEmail(it.Username);
                if (iit != null)
                {
                    return iit;
                }
                else
                {
                    return null;
                }
            }
            else
            {
                role = null;
                return null;
            }
        }
    }
}
