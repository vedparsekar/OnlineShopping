using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace OnlineShopping
{
    public partial class NavigationMaster : System.Web.UI.MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            

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