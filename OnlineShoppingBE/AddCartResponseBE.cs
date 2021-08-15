using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace OnlineShoppingBE
{
    public class AddCartResponseBE : BaseResponse
    {
        public string CartID { get; set; }
        public string CartCount { get; set; }
        public string ProductName { get; set; }
        public string Quantity { get; set; }
        public string UnitPrice { get; set; }
        public string ProductTotal { get; set; }
        public string ProductID { get; set; }
        public string AvailableQuantity { get; set; }
        public bool IsSuccess { get; set; }
    }
}
