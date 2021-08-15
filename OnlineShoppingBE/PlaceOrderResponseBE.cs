using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace OnlineShoppingBE
{
    public class PlaceOrderResponseBE : BaseResponse
    {
        public string UserName { get; set; }
        public Boolean IsSuccess { get; set; }

    }
}
