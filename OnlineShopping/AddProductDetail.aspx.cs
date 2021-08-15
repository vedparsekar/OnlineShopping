using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Configuration;
using OnlineShopingBAL;
using OnlineShoppingBE;

namespace OnlineShopping
{
    public partial class AddProductDetail : System.Web.UI.Page
    {
    
        AddProductBAL AddProductObject = new AddProductBAL();
        protected void Page_Load(object sender, EventArgs e)
        {
            if ((string)Session["IsLoginSuccess"] != "YES")
            {
                Response.Redirect("Login.aspx");
            }
        }

        protected void btnSubmit_Click(object sender, EventArgs e)
        {
            fulImage.PostedFile.SaveAs(Server.MapPath("~/Images/") + fulImage.FileName.ToString());
            AddProductRequestBE request = new AddProductRequestBE();
            request.ProductName = txtProductName.Text;
            request.ProductDescription = txtProductDecription.Text;
            request.ImagePath = fulImage.FileName.ToString();
            request.UnitPrice = txtPrice.Text;
            request.CategoryId = txtCategoryId.Text;
            request.SupplierId = txtSupplierId.Text;
            request.Quantity = drpQuantity.SelectedValue.ToString();

            var response = AddProductObject.AddProductSave(request);
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