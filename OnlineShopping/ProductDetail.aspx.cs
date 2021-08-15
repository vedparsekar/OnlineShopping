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
    public partial class ProductDetail : System.Web.UI.Page
    {
        ProductDetailsRequestBE request = new ProductDetailsRequestBE();
        ProductDetailsPopulateBAL PopulateDisplayObject = new ProductDetailsPopulateBAL();

        AddCartRequestBE cartrequest = new AddCartRequestBE();
        AddCartBAL CartObject = new AddCartBAL();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                int id = Convert.ToInt32(Request.QueryString["pID"].ToString());
                ProductDetailsPublic(id);
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


        public void ProductDetailsPublic(int id)
        {
            request.ProductId = id.ToString();
            request.ProductName = "";
            request.CategoryId = "";

            var response = PopulateDisplayObject.DisplayProductDetails(request);
            fvProdDescription.DataSource = response.ProductInfo;
            fvProdDescription.DataBind();
        }


        protected void btnAddtoCart_Click(object sender, EventArgs e)
        {
            cartrequest.ProductID = (Request.QueryString["pID"]);
            cartrequest.Quantity = drpQuantity.SelectedValue;
            cartrequest.StatementType = "INSERT";
            var response = CartObject.AddToCart(cartrequest);

            Response.Redirect("CartDetails.aspx");
        }

        protected void btnBuyNow_Click(object sender, EventArgs e)
        {

        }

        protected void fvProdDescription_PageIndexChanging(object sender, FormViewPageEventArgs e)
        {

        }


        protected void fvProdDescription_ItemCommand(object sender, FormViewCommandEventArgs e)
        {

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

        protected void btnSearch_Click1(object sender, ImageClickEventArgs e)
        {
            Response.Redirect("Index.aspx");
        }

        protected void btnCasualShoes_Click(object sender, EventArgs e)
        {
            Response.Redirect("Index.aspx");
        }

        protected void btnSportsShoes_Click(object sender, EventArgs e)
        {
            Response.Redirect("Index.aspx");
        }

        protected void btnFormalShoes_Click(object sender, EventArgs e)
        {
            Response.Redirect("Index.aspx");
        }

        protected void btnSandalsFloaters_Click(object sender, EventArgs e)
        {
            Response.Redirect("Index.aspx");
        }

        protected void btnSlippersflipflops_Click(object sender, EventArgs e)
        {
            Response.Redirect("Index.aspx");
        }

        protected void btnAllCategories_Click(object sender, EventArgs e)
        {
            Response.Redirect("Index.aspx");
        }

        protected void btnCart_Click(object sender, EventArgs e)
        {
            Response.Redirect("CartDetails.aspx");
        }
    }
}