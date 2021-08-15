using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace OnlineShoppingBE
{
    public class AddCartRequestBE : BaseRequest
    {
        public string StatementType { get; set; }
        public string ProductID { get; set; }
        public string Quantity { get; set; }
    }
}
