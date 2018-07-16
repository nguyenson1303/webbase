using System;
using System.Collections.Generic;
using System.IdentityModel.Tokens.Jwt;
using System.Linq;
using System.Security.Claims;
using System.Text;
using System.Threading.Tasks;
using ApiBase.Models.BusinessAccess;
using ApiBase.Models.DB;
using ApiBase.Models.ViewModels;
using DBBase.EntitysObject;
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
            var userInfor = Authenticate(login, out User user, out Role userRole);

            var expiresDate = DateTime.Now.AddHours(12);
            var now = DateTime.Now;
            if (userInfor != null)
            {   
                if(!string.IsNullOrEmpty(user.Token) && user.Expire != null && user.Expire.Value > DateTime.Now)
                {
                    var tokenResource = new TokenResource
                    {
                        Token = user.Token,
                        Expiry = user.Expire.Value
                    };
                    response = Json(tokenResource);
                }
                else
                {
                    var tokenResource = BuildToken(userInfor, user, userRole, now, expiresDate);
                    response = Json(tokenResource);
                }               
            }
            else
            {
                response = Json(new { code = Constant.NotExist, message = Constant.MessageNotExist });
            }

            return response;
        }

        [HttpPost("refresh")]
        [Authorize]
        public IActionResult Refresh([FromBody]RefreshTokenResource resource)
        {
            UserModels sv = new UserModels();
            IActionResult response = null;

            var identity = (ClaimsIdentity)User.Identity;
            IEnumerable<Claim> claims = identity.Claims;
            var userLogin = claims.FirstOrDefault(c => c.Type == ClaimTypes.Email).Value;
       
            User user = sv.GetUserbyUserName(userLogin);
            if (user != null && user.Token == resource.Token)
            {
                var role = sv.GetRolebyId(user.Role);
                var expiresDate = DateTime.Now.AddHours(12);
                var now = DateTime.Now;
                var userInfo = sv.GetUserInforByEmail(user.Username);

                if (!string.IsNullOrEmpty(user.Token) && user.Expire != null && user.Expire.Value > DateTime.Now)
                {
                    var tokenResource = new TokenResource
                    {
                        Token = user.Token,
                        Expiry = user.Expire.Value
                    };
                    response = Json(tokenResource);
                }
                else
                {
                    var tokenResource = BuildToken(userInfo, user, role, now, expiresDate);
                    response = Json(tokenResource);
                } 
            }

            return response;            
        }

        private TokenResource BuildToken(UserInfo userInfor, User user, Role role, DateTime now, DateTime expiresDate)
        {
            var claims = new[] {
                new Claim(JwtRegisteredClaimNames.Sub, userInfor.Fname + " " + userInfor.Lname),
                new Claim(JwtRegisteredClaimNames.NameId, userInfor.InforId.ToString()),
                new Claim("roles", role.Role1.ToString()),
                new Claim(JwtRegisteredClaimNames.Email, userInfor.Email),
                new Claim(JwtRegisteredClaimNames.Birthdate, userInfor.Birthday != null ? userInfor.Birthday.Value.ToString("yyyy-MM-dd") : string.Empty),
                new Claim(JwtRegisteredClaimNames.Jti, Guid.NewGuid().ToString()),
                new Claim(ClaimTypes.Expired, expiresDate.ToString()),
            };

            var key = new SymmetricSecurityKey(Encoding.UTF8.GetBytes(_config["Jwt:Key"]));
            var creds = new SigningCredentials(key, SecurityAlgorithms.HmacSha256);

            var token = new JwtSecurityToken(_config["Jwt:Issuer"],
              _config["Jwt:Issuer"],
              claims,
              expires: expiresDate,
              signingCredentials: creds);
            var tokenKey = new JwtSecurityTokenHandler().WriteToken(token);

            UserModels sv = new UserModels();
            user.Token = tokenKey;
            user.Expire = expiresDate;
            sv.RefreshTokenUser(user);

            var tokenResource = new TokenResource
            {
                Token = tokenKey,
                Expiry = expiresDate
            };

            return tokenResource;
        }

        private UserInfo Authenticate(LoginView login, out User user, out Role role)
        {
            UserModels sv = new UserModels();
            UserInfo iit = new UserInfo();
            user = sv.GetUserbyUserName(login.UserName);
            if (user != null && MD5Extend.EncodePassword(login.Password) == user.Password && user.Online == true)
            {
                role = sv.GetRolebyId(user.Role);
                iit = sv.GetUserInforByEmail(user.Username);
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
