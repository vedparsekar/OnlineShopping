using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using OnlineShoppingBE;
using OnlineShopingDAL;

namespace OnlineShopingBAL
{
    public class CategoryDetailsBAL
    {
        public CategoryDetailsResponseBE AddCategorySave(CategoryDetailsRequestBE request)
        {
            CategoryDetailsDAL AddCategory = new CategoryDetailsDAL();
            CategoryDetailsResponseBE response = null;
            try
            {
                response = AddCategory.AddCategorySave(request);
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

        public CategoryDetailsResponseBE GetCategories(CategoryDetailsRequestBE request)
        {
            CategoryDetailsDAL AddCategory = new CategoryDetailsDAL();
            CategoryDetailsResponseBE response = null;
            try
            {
                response = AddCategory.GetAllCategories(request);
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
