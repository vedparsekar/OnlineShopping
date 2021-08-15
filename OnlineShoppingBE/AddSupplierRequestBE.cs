using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace OnlineShoppingBE
{
    public class AddSupplierRequestBE : BaseRequest
    {
        public string SupplierId { get; set; }
        public string SupplierName { get; set; }
        public string SupplierGroup { get; set; }
        public string SupplierPassword { get; set; }
    }
}
