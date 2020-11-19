using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace ShareCode.Models
{
    public class ViewRegister
    {
        public string DisplayName { get; set; }
        public string Email { get; set; }
        public string Password { get; set; }
    }

    public class ViewLogin
    {
        public string Email { get; set; }
        public string Password { get; set; }
        public string ReturnUrl { get; set; }
        public Boolean RememberMe { get; set; }
    }
    public class ViewResetPassword
    {
        public string NewPassword { get; set; }
    }
}