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
    public partial class AdminProductDetails : System.Web.UI.Page
    {
        ProductDetailsRequestBE request = new ProductDetailsRequestBE();
        ProductDetailsPopulateBAL PopulateProduct = new ProductDetailsPopulateBAL();
        protected void Page_Load(object sender, EventArgs e)
        {
            DataFill(""," ","", false, false, false);

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

        public void DataFill(string productId, string productName, string categoryId,bool orderByName, bool orderByPrice, bool orderByQuantity)
        {
            request.ProductId = "";
            request.ProductName = productName;
            request.CategoryId = "";
            List<ProductDetailsResponseBE> SortedList = new List<ProductDetailsResponseBE>(); 
            var response = PopulateProduct.DisplayProductDetails(request);

            List<ProductDetailsResponseBE> ProductList = new List<ProductDetailsResponseBE>();
            foreach (var item in response.ProductInfo)
            {
                ProductList.Add(item);
            }
            if (orderByName)
            {
                SortedList = ProductList.OrderBy(o => o.ProductName).ToList();
            }
            else
            if(orderByPrice)
            {
                SortedList = ProductList.OrderBy(o => o.UnitPrice).ToList();
            }
            else
            if (orderByQuantity)
            {
                SortedList = ProductList.OrderBy(o => o.Quantity).ToList();
            }
            else
            {
                SortedList = ProductList;
            }

            grdAdminProductDetails.DataSource = SortedList;
            grdAdminProductDetails.DataBind();
        }

        protected void btnSearch_Click(object sender, EventArgs e)
        {
            DataFill("", txtSearch.Text, "",false,false,false);
        }
        protected void btnSortName(object sender, EventArgs e)
        {
            DataFill("", txtSearch.Text, "", true, false, false);
        }
        protected void btnSortPrice(object sender, EventArgs e)
        {
            DataFill("", txtSearch.Text, "", false, true, false);
        }
        protected void btnSortQuality(object sender, EventArgs e)
        {
            DataFill("", txtSearch.Text, "", false, false, true);
        }
        protected void btnAddProduct(object sender, EventArgs e)
        {
            Response.Redirect("AddProductDetail.aspx");
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

        protected void grdCartDetails_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            grdAdminProductDetails.PageIndex = e.NewPageIndex;
            DataFill("","","", false, false, false);
        }

        protected void grdCartDetails_PageIndexChanging(object sender, EventArgs e)
        {

        }
    }
}