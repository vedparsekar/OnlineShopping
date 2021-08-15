using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace OnlineShoppingBE
{
    public class ProductDetailsRequestBE : BaseRequest
    {
        public string ProductId { get; set; }
        public string ProductName { get; set; }
        public string CategoryId { get; set; }
        public string Quantity { get; set; }
        public string UnitPrice { get; set; }
    }
}
