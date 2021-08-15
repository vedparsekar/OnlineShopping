using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace OnlineShoppingBE
{
    public class OrderDetailsResponseBE : BaseResponse
    {
        public List<OrderDetailsResponseBE> AllOrderList = new List<OrderDetailsResponseBE>();
        public string OrderDetailId { get; set; }
        public string OrderId { get; set; }
        public string OrderDate { get; set; }
        public string UserName { get; set; }
        public string FirstName { get; set; }
        public string LastName { get; set; }
        public string ProductId { get; set; }
        public string City { get; set; }
        public string State { get; set; }
        public string EmailId { get; set; }
        public string Total { get; set; }
        public string Payment { get; set; }
        public string HasShifted { get; set; }
        public string Quantity { get; set; }
        public string UnitPrice { get; set; }
        public string OrderRating { get; set; }
        public string ProductName { get; set; }
        public string CategoryId { get; set; }
    }
}
