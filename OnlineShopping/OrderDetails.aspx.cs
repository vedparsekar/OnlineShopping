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
    public partial class OrderDetails : System.Web.UI.Page
    {
        OrderDetailsBAL AddOrderDetailsObject = new OrderDetailsBAL();
        OrderDetailsRequestBE request = new OrderDetailsRequestBE();
        protected void Page_Load(object sender, EventArgs e)
        {
            DataFill();

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
                Response.Redirect("Login.aspx");
            }
        }

        protected void btnLogin_Click(object sender, EventArgs e)
        {
            Response.Redirect("Login.aspx");
        }

        protected void btnLogout_Click(object sender, EventArgs e)
        {
            Session.Remove("IsLoginSuccess");
            Session.Remove("Username");
            loginDiv.Visible = false;
            btnLogin.Visible = true;
            btnSignup.Visible = true;
            Response.Redirect("Index.aspx");
        }

        protected void btnSignup_Click(object sender, EventArgs e)
        {
            Response.Redirect("Signup.aspx");
        }

        protected void btnContinueShopping_Click(object sender, EventArgs e)
        {
            Response.Redirect("Index.aspx");
        }

        public void DataFill()
        {
            request.UserName = (string)Session["Username"];
            var response = AddOrderDetailsObject.GetOrderitems(request);
            List<OrderDetailsResponseBE> CurrentList = new List<OrderDetailsResponseBE>();
            foreach (var item in response)
            {
                CurrentList.Add(item);
            }
            grdCartDetails.DataSource = CurrentList;
            grdCartDetails.DataBind();
        }

        protected void btnHome_Click(object sender, EventArgs e)
        {
            Response.Redirect("Index.aspx");
        }

        protected void btnAbout_Click(object sender, EventArgs e)
        {
            Response.Redirect("Index.aspx");
        }

        protected void btnContact_Click(object sender, EventArgs e)
        {
            Response.Redirect("Index.aspx");
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

        protected void grdCartDetails_SelectedIndexChanging(object sender, GridViewSelectEventArgs e)
        {

        }

        protected void grdCartDetails_PageIndexChanging(object sender, EventArgs e)
        {

        }

        protected void grdCartDetails_RowEditing(object sender, GridViewEditEventArgs e)
        {

        }

        protected void grdCartDetails_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {

        }

        protected void grdCartDetails_RowDeleted(object sender, GridViewDeletedEventArgs e)
        {

        }

        protected void grdCartDetails_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
        {

        }

        protected void grdCartDetails_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            grdCartDetails.PageIndex = e.NewPageIndex;
            DataFill();
        }

        protected void grdCartDetails_RowUpdating(object sender, GridViewUpdateEventArgs e)
        {

        }
    }
}