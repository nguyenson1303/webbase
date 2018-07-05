using System;

namespace ApiBase.Models.ViewModels
{
    public class TokenResource
    {
        public TokenResource()
        {
        }

        public string Token { get; set; }
        public DateTime Expiry { get; set; }
    }
}
