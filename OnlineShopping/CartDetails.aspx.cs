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
    public partial class CartDetails : System.Web.UI.Page
    {
        AddCartBAL AddCartDetailsOblject = new AddCartBAL();
        AddCartRequestBE request = new AddCartRequestBE();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                DataFill();
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

        protected void btnCheckOut_Click(object sender, EventArgs e)
        {
            if (Session["IsLoginSuccess"] == null || (string)Session["IsLoginSuccess"] == "NO")
            {
                Response.Redirect("Login.aspx");
            }
            else
            {
                PlaceOrderBAL PlaceOrderObject = new PlaceOrderBAL();
                PlaceOrderRequestBE request = new PlaceOrderRequestBE();
                request.UserName = (string)Session["Username"];
                request.OrderTotal = lblTotalPrice.Text;

                var response = PlaceOrderObject.AddOrder(request);
                if (response.IsSuccess)
                {
                    Response.Redirect("OrderDetails.aspx");
                }
                else
                {
                    Response.Redirect("Index.aspx");
                }              
            }
        }

        protected void grdCartDetails_RowEditing(object sender, GridViewEditEventArgs e)
        {
            Label lblProductId = (Label)grdCartDetails.Rows[e.NewEditIndex].FindControl("lblProductId");
            string quantity = ((TextBox)grdCartDetails.Rows[e.NewEditIndex].FindControl("txtQuantity")).Text;
            request.ProductID = lblProductId.Text;
            request.StatementType = "UPDATE";
            request.Quantity = quantity;
            var response = AddCartDetailsOblject.AddToCart(request);
            if (response.IsSuccess)
            {
                Response.Redirect("CartDetails.aspx");
                lblStatus.Text = "Cart Updated";
            }
            else
            {
                lblStatus.Text = "Error";
            }
            DataFill();
        }

        protected void grdCartDetails_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            Label lblProductId = (Label)grdCartDetails.Rows[e.RowIndex].FindControl("lblProductId");
            request.ProductID = lblProductId.Text;
            request.StatementType = "DELETE";
            request.Quantity = "";
            var response = AddCartDetailsOblject.AddToCart(request);
            if (response.IsSuccess)
            {
                Response.Redirect("CartDetails.aspx");
                lblStatus.Text = "Product removed";
            }
            else
            {
                lblStatus.Text = "Error";
            }
        }

        public void DataFill()
        {
            request.ProductID = "";
            request.Quantity = "";
            request.StatementType = "SELECT";
            var response = AddCartDetailsOblject.GetCartItems(request);
            List<AddCartResponseBE> CurrentList = new List<AddCartResponseBE>();
            int count=0;
            foreach (var item in response)
            {
                CurrentList.Add(item);
                count = count + 1;
            }

            lblcount.Text = count.ToString();
            grdCartDetails.DataSource = CurrentList;
            grdCartDetails.DataBind();

            float Total = 0;
            foreach(var item in response)
            {
                Total = float.Parse(item.ProductTotal)+Total;
            }
            lblTotalPrice.Text = Convert.ToString(Total);
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

        protected void btnContinueShopping_Click(object sender, EventArgs e)
        {
            Response.Redirect("Index.aspx");
        }

        protected void grdCartDetails_SelectedIndexChanging(object sender, GridViewSelectEventArgs e)
        {

        }

        protected void grdCartDetails_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            grdCartDetails.PageIndex = e.NewPageIndex;
            DataFill();
        }

        protected void grdCartDetails_PageIndexChanging(object sender, EventArgs e)
        {
         
        }

        protected void grdCartDetails_PageIndexChanged(object sender, EventArgs e)
        {
            
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

        protected void lbtnHistory_Click(object sender, EventArgs e)
        {
            Response.Redirect("OrderDetails.aspx");
        }

        protected void grdCartDetails_RowDeleted(object sender, GridViewDeletedEventArgs e)
        {

        }

        protected void grdCartDetails_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
        {

        }

        protected void grdCartDetails_RowUpdating(object sender, GridViewUpdateEventArgs e)
        {

        }
    }
}