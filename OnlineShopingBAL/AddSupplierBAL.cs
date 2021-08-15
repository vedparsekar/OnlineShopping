using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using OnlineShoppingBE;
using OnlineShopingDAL;

namespace OnlineShopingBAL
{
    public class AddSupplierBAL
    {
        public AddSupplierResponseBE AddSupplierSave(AddSupplierRequestBE request)
        {
            AddSupplierDAL AddSupplier = new AddSupplierDAL();
            AddSupplierResponseBE response = null;
            try
            {
                response = AddSupplier.AddSupplierSave(request);
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

        public AddSupplierResponseBE GetAllSupplier(AddSupplierRequestBE request)
        {
            AddSupplierDAL AddSupplier = new AddSupplierDAL();
            AddSupplierResponseBE response = null;
            try
            {
                response = AddSupplier.GetAllSupplier(request);
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
