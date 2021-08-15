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
    public class AddSupplierDAL
    {
        SqlConnection _connection = new SqlConnection(
       ConfigurationManager.ConnectionStrings["dbconnection"].ToString());
        public AddSupplierResponseBE AddSupplierSave(AddSupplierRequestBE request)
        {
            AddSupplierResponseBE response = new AddSupplierResponseBE();
            try
            {
                SqlCommand cmd = new SqlCommand("USP_ADDSUPPLIER", _connection);
                cmd.CommandType = System.Data.CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@SUPPLIER_ID", request.SupplierId);
                cmd.Parameters.AddWithValue("@SUPPLIER_NAME", request.SupplierName);
                cmd.Parameters.AddWithValue("@SUPPLIER_GROUP_NAME", request.SupplierGroup);
                cmd.Parameters.AddWithValue("@SUPPLIER_PASSWORD", request.SupplierPassword);

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

        public AddSupplierResponseBE GetAllSupplier(AddSupplierRequestBE request)
        {
            AddSupplierResponseBE response = new AddSupplierResponseBE();
            try
            {
                List<AddSupplierResponseBE> SupplierList = new List<AddSupplierResponseBE>();
                SqlCommand cmd = new SqlCommand("USP_SUPPLIERDETAILS", _connection);
                cmd.CommandType = System.Data.CommandType.StoredProcedure;
                SqlDataReader responsedr;
                _connection.Open();


                responsedr = cmd.ExecuteReader();
                while (responsedr.Read())
                {
                    AddSupplierResponseBE supplierlist = new AddSupplierResponseBE();
                    supplierlist.SupplierId = (responsedr["SUPPLIER_ID"].ToString());
                    supplierlist.SupplierName = (responsedr["SUPPLIER_NAME"].ToString());
                    supplierlist.SupplierGroup = (responsedr["SUPPLIER_GROUP_NAME"].ToString());
                    SupplierList.Add(supplierlist);
                }
                response.AllSupplierDetails = SupplierList;
                _connection.Close();

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
