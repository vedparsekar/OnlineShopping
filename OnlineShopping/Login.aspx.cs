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
    public partial class Login : System.Web.UI.Page
    {
        UserLoginBAL UserLoginRegisteredObject = new UserLoginBAL();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                ddlUserRole.Items.Add("Client");
                ddlUserRole.Items.Add("Admin");
                ddlUserRole.Items.Add("Supplier");
            }

            if ((string)Session["IsLoginSuccess"] == "YES")
            {
                Response.Redirect("Index.aspx");

            }

        }

        protected void btnSignup_Click(object sender, EventArgs e)
        {
            Response.Redirect("Signup.aspx");
        }

        protected void btnLoginbtn_Click(object sender, EventArgs e)
        {
            UserLoginRequestBE request = new UserLoginRequestBE();
            request.UserName = txtUserName.Text;
            request.Password = txtPassword.Text;
            request.UserRole = ddlUserRole.SelectedValue.ToString();
            var response = UserLoginRegisteredObject.UserLoginSave(request);
            if (response.IsSuccess && response.Status == 1)
            {
                if (response.UserRole == "Client")
                {
                    Session["IsLoginSuccess"] = "YES";
                    Session["Username"] = request.UserName;
                    Response.Redirect("Index.aspx");
                   //Response.Redirect(Request.UrlReferrer.ToString());
                }
                else
                if (response.UserRole == "Admin")
                {
                    Session["IsLoginSuccess"] = "YES";
                    Session["Username"] = request.UserName;
                    Response.Redirect("AdminProductDetails.aspx");
                }
            }
            else
            if (response.Status == 0)
            {
                lblErrorMessage.Text = "Invalid Username or Password!!";
            }
            else
            {
                lblErrorMessage.Text = "Error!!";
            }

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