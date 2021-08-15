using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace OnlineShoppingBE
{
    public class UserLoginResponseBE : BaseResponse
    {
        public string Username { get; set; }
        public string UserRole { get; set; }
        public Boolean IsSuccess { get; set; }
    }
}
