using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace OnlineShoppingBE
{
    public class CategoryDetailsResponseBE : BaseResponse
    {
        public List<CategoryDetailsResponseBE> AllCategoryList = new List<CategoryDetailsResponseBE>();
        public string Username { get; set; }
        public string CategoryId { get; set; }
        public string CategoryName { get; set; }
        public string CategoryDescription { get; set; }
        public Boolean IsSuccess { get; set; }
    }
}
