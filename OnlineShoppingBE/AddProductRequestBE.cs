using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace OnlineShoppingBE
{
    public class AddProductRequestBE : BaseRequest
    {
        public string ProductName { get; set; }
        public string ProductDescription { get; set; }
        public string ImagePath { get; set; }
        public string UnitPrice { get; set; }
        public string CategoryId { get; set; }
        public string SupplierId { get; set; }
        public string Quantity { get; set; }
    }
}
