using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace OnlineShoppingBE
{
    public class AddSupplierResponseBE : BaseResponse
    {
        public List<AddSupplierResponseBE> AllSupplierDetails = new List<AddSupplierResponseBE>();
        public string Username { get; set; }
        public string SupplierId { get; set; }
        public string SupplierName { get; set; }
        public string SupplierGroup { get; set; }
        public Boolean IsSuccess { get; set; }
    }
}
