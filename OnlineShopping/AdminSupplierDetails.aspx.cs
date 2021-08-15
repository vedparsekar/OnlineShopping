using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using OnlineShoppingBE;
using OnlineShopingBAL;

namespace OnlineShopping
{
    public partial class AdminSupplierDetails : System.Web.UI.Page
    {
        AddSupplierRequestBE request = new AddSupplierRequestBE();
        AddSupplierBAL PopulateSupplier = new AddSupplierBAL();
        protected void Page_Load(object sender, EventArgs e)
        {
            DataFill();

            if ((string)Session["IsLoginSuccess"] != "YES")
            {
                Response.Redirect("Login.aspx");
            }
        }

        protected void btnLogout_Click(object sender, EventArgs e)
        {
            Session.Remove("IsLoginSuccess");
            btnLogout.Visible = false;
            Response.Redirect("Index.aspx");
        }

        public void DataFill()
        {
            var response = PopulateSupplier.GetAllSupplier(request);
            List<AddSupplierResponseBE> SupplierList = new List<AddSupplierResponseBE>();
            foreach (var item in response.AllSupplierDetails)
            {
                SupplierList.Add(item);
            }
            grdAdminProductDetails.DataSource = SupplierList;
            grdAdminProductDetails.DataBind();
        }

        protected void lbtnOrderDetails_Click(object sender, EventArgs e)
        {
            Response.Redirect("AdminOrderDetails.aspx");
        }

        protected void lbtnProductDetails_Click(object sender, EventArgs e)
        {
            Response.Redirect("AdminProductDetails.aspx");
        }

        protected void lbtnUserDetails_Click(object sender, EventArgs e)
        {
            Response.Redirect("AdminUserDetails.aspx");
        }

        protected void lbtnSupplierDetails_Click(object sender, EventArgs e)
        {
            Response.Redirect("AdminSupplierDetails.aspx");
        }

        protected void lbtnCategoryDetails_Click(object sender, EventArgs e)
        {
            Response.Redirect("AdminCategoryDetails.aspx");
        }
       

             protected void btnAddSupplier(object sender, EventArgs e)
        {
            Response.Redirect("AddSupplierDetail.aspx");
        }
    }
}