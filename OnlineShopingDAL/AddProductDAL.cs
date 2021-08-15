using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Text;
using OnlineShoppingBE;
using System.Threading.Tasks;

namespace OnlineShopingDAL
{
    public class AddProductDAL
    {
        SqlConnection _connection = new SqlConnection(
       ConfigurationManager.ConnectionStrings["dbconnection"].ToString());
        public AddProductResponseBE AddProductSave(AddProductRequestBE request)
        {
            AddProductResponseBE response = new AddProductResponseBE();
            try
            {
                SqlCommand cmd = new SqlCommand("USP_ADDPRODUCT", _connection);
                cmd.CommandType = System.Data.CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@PRODUCT_NAME", request.ProductName);
                cmd.Parameters.AddWithValue("@PRODUCT_DECRIPTION", request.ProductDescription);
                cmd.Parameters.AddWithValue("@IMAGE_PATH", request.ImagePath);
                cmd.Parameters.AddWithValue("@UNIT_PRICE", request.UnitPrice);
                cmd.Parameters.AddWithValue("@CATEGORY_ID", request.CategoryId);
                cmd.Parameters.AddWithValue("@SUPPLIER_ID", request.SupplierId);
                cmd.Parameters.AddWithValue("@QUANTITY", request.Quantity);

                _connection.Open();
                //response.ProductName = Convert.ToString(cmd.ExecuteScalar());

                int k = cmd.ExecuteNonQuery();
                _connection.Close();
                if (k != 0)
                {
                    response.Status = 1;
                }
            }
            catch (Exception ex)
            {
                response.ErrorMessage = ex.Message;
                response.ErrorCode = -999;
            }
            return response;
        }
    }
}
