using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using OnlineShoppingBE;
using OnlineShopingLOG;
using OnlineShopingDAL;
using System.Data.SqlClient;
using System.Configuration;


namespace OnlineShopingDAL
{
    public class AddCartDAL
    {
        SqlConnection _connection = new SqlConnection(
      ConfigurationManager.ConnectionStrings["dbconnection"].ToString());
        public AddCartResponseBE AddToCart(AddCartRequestBE request)
        {
            AddCartResponseBE response = new AddCartResponseBE();
            try
            {
                SqlCommand cmd = new SqlCommand("USP_ADDTOCART_SAVE", _connection);
                _connection.Open();
                cmd.CommandType = System.Data.CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@PRODUCT_ID", request.ProductID);
                cmd.Parameters.AddWithValue("@QUANTITY", request.Quantity);
                cmd.Parameters.AddWithValue("@STATEMENTTYPE", request.StatementType);
                SqlParameter statusParameter = cmd.Parameters.Add("@STATUS", System.Data.SqlDbType.Int);

                statusParameter.Direction = System.Data.ParameterDirection.Output;
                response.CartID = Convert.ToString(cmd.ExecuteScalar());
                response.Status = Convert.ToInt32(cmd.Parameters["@STATUS"].Value);
                //response.Username = Convert.ToString(cmd.ExecuteScalar());
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
                //LogManager.Log(ex);
            }
            return response;
        }

        public List<AddCartResponseBE> GetCartItems(AddCartRequestBE request)
        {
            List<AddCartResponseBE> response = new List<AddCartResponseBE>();
            try
            {
                SqlCommand cmd = new SqlCommand("USP_ADDTOCART_SAVE", _connection);
                cmd.CommandType = System.Data.CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@PRODUCT_ID", request.ProductID);
                cmd.Parameters.AddWithValue("@QUANTITY", request.Quantity);
                cmd.Parameters.AddWithValue("@STATEMENTTYPE", request.StatementType);
                _connection.Open();

                SqlParameter statusParameter = cmd.Parameters.Add("@STATUS", System.Data.SqlDbType.Int);
                SqlDataReader responsedr;


                statusParameter.Direction = System.Data.ParameterDirection.Output;

                responsedr = cmd.ExecuteReader();
                while (responsedr.Read())
                {
                    AddCartResponseBE prolist = new AddCartResponseBE();
                    prolist.ProductID = (responsedr["PRODUCT_ID"].ToString());
                    prolist.ProductName = (responsedr["PRODUCT_NAME"].ToString());
                    prolist.Quantity = (responsedr["QUANTITY"].ToString());
                    prolist.UnitPrice = (responsedr["UNIT_PRICE"].ToString());
                    prolist.ProductTotal = (responsedr["PRODUCT_TOTAL"].ToString());
                    prolist.AvailableQuantity = (responsedr["AVAILABLEQUANTITY"].ToString());
                    response.Add(prolist);
                }
                _connection.Close();

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
