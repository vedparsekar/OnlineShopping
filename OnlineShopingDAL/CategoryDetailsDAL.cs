using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using OnlineShoppingBE;

namespace OnlineShopingDAL
{
    public class CategoryDetailsDAL
    {
        SqlConnection _connection = new SqlConnection(
       ConfigurationManager.ConnectionStrings["dbconnection"].ToString());
        public CategoryDetailsResponseBE AddCategorySave(CategoryDetailsRequestBE request)
        {
            CategoryDetailsResponseBE response = new CategoryDetailsResponseBE();
            try
            {
                SqlCommand cmd = new SqlCommand("USP_ADDCATEGORY", _connection);
                cmd.CommandType = System.Data.CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@CATEGORY_ID", request.CategoryId);
                cmd.Parameters.AddWithValue("@CATEGORY_NAME", request.CategoryName);
                cmd.Parameters.AddWithValue("@CATEGORY_DESCRIPTION", request.CategoryDescription);


                _connection.Open();
                response.Username = Convert.ToString(cmd.ExecuteScalar());


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


        public CategoryDetailsResponseBE GetAllCategories(CategoryDetailsRequestBE request)
        {
            CategoryDetailsResponseBE response = new CategoryDetailsResponseBE();
            List<CategoryDetailsResponseBE> CategoryList = new List<CategoryDetailsResponseBE>();
            try
            {
                SqlCommand cmd = new SqlCommand("USP_ALL_CATEGORIES", _connection);
                cmd.CommandType = System.Data.CommandType.StoredProcedure;
                SqlDataReader responsedr;
                _connection.Open();


                responsedr = cmd.ExecuteReader();
                while (responsedr.Read())
                {
                    CategoryDetailsResponseBE categorylist = new CategoryDetailsResponseBE();
                    categorylist.CategoryId = (responsedr["CATEGORY_ID"].ToString());
                    categorylist.CategoryName = (responsedr["CATEGORY_NAME"].ToString());
                    categorylist.CategoryDescription = (responsedr["CATEGORY_DESCRIPTION"].ToString());
                    CategoryList.Add(categorylist);
                }

                response.AllCategoryList = CategoryList;
                _connection.Close();
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
