using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using OnlineShopingBAL;
using OnlineShoppingBE;

namespace OnlineShopping
{
    public partial class AddSupplierDetail : System.Web.UI.Page
    {
        AddSupplierBAL AddSupplierObject = new AddSupplierBAL();
        protected void Page_Load(object sender, EventArgs e)
        {
            if ((string)Session["IsLoginSuccess"] != "YES")
            {
                Response.Redirect("Login.aspx");
            }
        }

        protected void btnSubmit_Click(object sender, EventArgs e)
        {
            AddSupplierRequestBE request = new AddSupplierRequestBE();
            request.SupplierId = txtSupplierId.Text;
            request.SupplierName = txtSupplierName.Text;
            request.SupplierGroup = txtSupplierGroup.Text;
            request.SupplierPassword = txtSupplierPassword.Text;


            var response = AddSupplierObject.AddSupplierSave(request);
            if (response.IsSuccess)
            {
                Response.Redirect("AddProductDetail.aspx");
            }
            else
            {
                Response.Redirect("Index.aspx");
            }

        }

        protected void btnLogout_Click(object sender, EventArgs e)
        {
            Session.Remove("IsLoginSuccess");
            btnLogout.Visible = false;
            Response.Redirect("Index.aspx");
        }

        protected void btnHome_Click(object sender, EventArgs e)
        {
            Response.Redirect("AdminProductDetails.aspx");
        }

        protected void btnAddProduct_Click(object sender, EventArgs e)
        {
            Response.Redirect("AddProductDetail.aspx");
        }

        protected void btnAddCategory_Click(object sender, EventArgs e)
        {
            Response.Redirect("AddCategory.aspx");
        }

        protected void btnAddSupplier_Click(object sender, EventArgs e)
        {
            Response.Redirect("AddSupplierDetail.aspx");
        }
    }
}