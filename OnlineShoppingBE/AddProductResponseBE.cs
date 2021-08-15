using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace OnlineShoppingBE
{
    public class AddProductResponseBE : BaseResponse
    {
        public string ProductName { get; set; }
        public Boolean IsSuccess { get; set; }
    }
}
