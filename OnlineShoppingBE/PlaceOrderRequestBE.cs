using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace OnlineShoppingBE
{
    public class PlaceOrderRequestBE : BaseRequest
    {
        public string UserName { get; set; }
        public string OrderTotal { get; set; }
        public string Status { get; set; }
    }
}
