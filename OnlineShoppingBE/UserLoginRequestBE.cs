﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace OnlineShoppingBE
{
    public class UserLoginRequestBE : BaseRequest
    {
        public string UserName { get; set; }
        public string UserRole { get; set; }
        public string Password { get; set; }
    }
}
