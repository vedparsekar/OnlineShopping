using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using OnlineShoppingBE;
using OnlineShopingDAL;

namespace OnlineShopingBAL
{
    public class AddProductBAL
    {
        public AddProductResponseBE AddProductSave(AddProductRequestBE request)
        {
            AddProductDAL AddProduct = new AddProductDAL();
            AddProductResponseBE response = null;
            try
            {
                response = AddProduct.AddProductSave(request);
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
    }
}
