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
    public partial class Signup : System.Web.UI.Page
    {  
        UserSignupBAL CustomerRegisteredObject = new UserSignupBAL();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                ddlUserRole.Items.Add("Admin");
                ddlUserRole.Items.Add("Client");
                ddlUserRole.Items.Add("Guest");
            }
        }

        protected void btnLogin_Click(object sender, EventArgs e)
        {
            Response.Redirect("Login.aspx");
        }

        protected void btnSignup_Click(object sender, EventArgs e)
        {
            Response.Redirect("Signup.aspx");
        }

        protected void btnSubmit_Click(object sender, EventArgs e)
        {
            string Genderval;
            if (rdbMale.Checked == true)
            {
                Genderval = rdbMale.Text.ToString();
            }
            else
            if (rdbFemale.Checked == true)
            {
                Genderval = rdbFemale.Text.ToString();
            }
            else
            if (rdbOther.Checked == true)
            {
                Genderval = rdbOther.Text.ToString();
            }
            else
            {
                Genderval = rdbOther.Text.ToString();
            }

            UserSignupRequestBE request = new UserSignupRequestBE();
            request.UserName = txtUserName.Text;
            request.FirstName = txtFirstName.Text;
            request.LastName = txtLastName.Text;
            request.Gender = Genderval;
            request.ContactNumber = txtPhonenumber.Text;
            request.Address = txtAddress.Text;
            request.City = txtCity.Text;
            request.State = txtState.Text;
            request.Zip = txtZip.Text;
            request.Country = txtCountry.Text;
            request.EmailId = txtEmail.Text;
            request.DateOfBirth = Convert.ToString(txtDateOfBirth.SelectedDate);
            request.Password = txtPassword.Text;
            request.UserRole = ddlUserRole.SelectedValue;

            var response = CustomerRegisteredObject.UserSignupSave(request);
            if (response.IsSuccess)
            {
                Response.Redirect("Login.aspx");
            }
            else
            {
                Response.Redirect("Index.aspx");
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