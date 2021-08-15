using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using OnlineShopingDAL;
using OnlineShoppingBE;

namespace OnlineShopingBAL
{
    public class AddCartBAL
    {
        AddCartDAL AddCart = new AddCartDAL();
        public AddCartResponseBE AddToCart(AddCartRequestBE request)
        {

            AddCartResponseBE response = null;
            try
            {
                response = AddCart.AddToCart(request);
                response.IsSuccess = true;
            }
            catch (Exception ex)
            {
                response.IsSuccess = false;
                response.ErrorMessage = ex.Message;
                if (response == null)
                {
                    response.ErrorCode = 100;
                }
            }
            return response;
        }

        public List<AddCartResponseBE> GetCartItems(AddCartRequestBE request)
        {
            List<AddCartResponseBE> response = new List<AddCartResponseBE>();
            try
            {
                response = AddCart.GetCartItems(request);

            }
            catch (Exception ex)
            {
                if (response == null)
                {
                    response = new List<AddCartResponseBE>();
                }

            }
            return response;
        }
    }
}
