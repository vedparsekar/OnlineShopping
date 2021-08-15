using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using OnlineShoppingBE;
using OnlineShopingBAL;
using System.Data;
using System.Web.Services;

namespace OnlineShopping
{
    public partial class Index : System.Web.UI.Page
    {
        ProductDetailsRequestBE request = new ProductDetailsRequestBE();
        ProductDetailsPopulateBAL PopulateProduct = new ProductDetailsPopulateBAL();

        AddCartRequestBE cartrequest = new AddCartRequestBE();
        AddCartBAL CartObject = new AddCartBAL();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                DataFill("", "", "");
            }

            if ((string)Session["IsLoginSuccess"] == "YES")
            {
                btnLogin.Visible = false;
                btnSignup.Visible = false;
                loginDiv.Visible = true;
                lbtnUsername.Text = (string)Session["Username"];
            }
            else
            {
                loginDiv.Visible = false;
                btnLogin.Visible = true;
                btnSignup.Visible = true;

            }
        }

        protected void btnLogin_Click(object sender, EventArgs e)
        {
            Response.Redirect("Login.aspx");
        }

        protected void btnLogout_Click(object sender, EventArgs e)
        {
            Session.Remove("IsLoginSuccess");
            loginDiv.Visible = false;
            btnLogin.Visible = true;
            btnSignup.Visible = true;
        }

        protected void btnSignup_Click(object sender, EventArgs e)
        {
            Response.Redirect("Signup.aspx");
        }

        protected void dtlGetProductView_ItemCommand(object source, DataListCommandEventArgs e)
        {
            if (e.CommandName == "ViewProduct")
            {
                Response.Redirect("~/ProductDetail.aspx?pID=" + e.CommandArgument.ToString());
            }

            if (e.CommandName == "AddToCart")
            {
                //Response.Redirect("~/ProductDetail.aspx?pID=" + e.CommandArgument.ToString());
                //cartrequest.ProductID = (Request.QueryString[ e.CommandArgument.ToString()]);
                cartrequest.ProductID = e.CommandArgument.ToString();
                cartrequest.Quantity = "1";
                cartrequest.StatementType = "INSERT";
                var response = CartObject.AddToCart(cartrequest);

                Response.Redirect("CartDetails.aspx");
            }

            if (e.CommandName == "ViewProductImage")
            {
                Response.Redirect("~/ProductDetail.aspx?pID=" + e.CommandArgument.ToString());
            }


        }

        protected void dtlGetProductView_SelectedIndexChanged(object sender, EventArgs e)
        {

        }

        public void DataFill(string productid, string productname, string categoryid)
        {
            request.ProductId = "";
            request.ProductName = productname;
            request.CategoryId = categoryid;

            var response = PopulateProduct.DisplayProductDetails(request);

            //dtlGetProductView.DataBind();
            DataTable dt = new DataTable();

            dt.Columns.Add("PRODUCT_ID");
            dt.Columns.Add("PRODUCT_NAME");
            dt.Columns.Add("PRODUCT_DECRIPTION");
            dt.Columns.Add("IMAGE_PATH");
            dt.Columns.Add("UNIT_PRICE");
            dt.Columns.Add("CATEGORY_ID");
            dt.Columns.Add("SUPPLIER_ID");
            dt.Columns.Add("QUANTITY");
            foreach (var item in response.ProductInfo)
            {
                var row = dt.NewRow();

                row["PRODUCT_ID"] = item.ProductId;
                row["PRODUCT_NAME"] = item.ProductName;
                row["PRODUCT_DECRIPTION"] = item.ProductDescription;
                row["IMAGE_PATH"] = item.ImagePath;
                row["UNIT_PRICE"] = item.UnitPrice;
                row["CATEGORY_ID"] = item.CategoryId;
                row["SUPPLIER_ID"] = item.SupplierId;
                row["QUANTITY"] = item.Quantity;
                dt.Rows.Add(row);
            }
            dtlProducts.DataSource = response.ProductInfo;
            dtlProducts.DataBind();

        }

        protected void btnSearch_Click1(object sender, ImageClickEventArgs e)
        {
            DataFill("", txtProductSearch.Text, "");
        }

        protected void btnHome_Click(object sender, EventArgs e)
        {
            Response.Redirect("Index.aspx");
            
        }

        protected void btnAbout_Click(object sender, EventArgs e)
        {
            Response.Redirect("AboutUs.aspx");
        }

        protected void btnContact_Click(object sender, EventArgs e)
        {
            Response.Redirect("ContactUs.aspx");
        }

        protected void btnProduct_Click(object sender, EventArgs e)
        {
            Response.Redirect("Index.aspx");
        }

        protected void btnCasualShoes_Click(object sender, EventArgs e)
        {
            DataFill("", "", "CA01");
        }

        protected void btnSportsShoes_Click(object sender, EventArgs e)
        {
            DataFill("", "", "CA02");
        }

        protected void btnFormalShoes_Click(object sender, EventArgs e)
        {
            DataFill("", "", "CA03");
        }

        protected void btnSandalsFloaters_Click(object sender, EventArgs e)
        {
            DataFill("", "", "CA04");
        }

        protected void btnSlippersflipflops_Click(object sender, EventArgs e)
        {
            DataFill("", "", "CA05");
        }

        protected void btnAllCategories_Click(object sender, EventArgs e)
        {
            DataFill("", "", "");
        }

        protected void btnCart_Click(object sender, EventArgs e)
        {
            Response.Redirect("CartDetails.aspx");
        }

        [WebMethod]
        public static ProductDetailsResponseBE FetchProductNames(string stext)
        {
            ProductDetailsRequestBE request = new ProductDetailsRequestBE();
            ProductDetailsPopulateBAL PopulateProductObject = new ProductDetailsPopulateBAL();

            request.ProductName = stext + '%';

            var response = PopulateProductObject.FetchProductName(request);
            return response;
        }
    }
}