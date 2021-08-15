using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Configuration;
using System.Data;
using OnlineShopingBAL;
using OnlineShoppingBE;

namespace OnlineShopping
{
    public partial class AddCategory : System.Web.UI.Page
    {
        CategoryDetailsBAL AddCategoryObject = new CategoryDetailsBAL();
        protected void Page_Load(object sender, EventArgs e)
        {
            if ((string)Session["IsLoginSuccess"] != "YES")
            {
                Response.Redirect("Login.aspx");
            }
        }

        protected void btnSubmit_Click(object sender, EventArgs e)
        {
            CategoryDetailsRequestBE request = new CategoryDetailsRequestBE();
            request.CategoryId = txtCategoryId.Text;
            request.CategoryName = txtCategoryName.Text;
            request.CategoryDescription = txtDescription.Text;


            var response = AddCategoryObject.AddCategorySave(request);
            if (response.IsSuccess)
            {
                Response.Redirect("AddCategory.aspx");
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