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
    public partial class AdminUserDetails : System.Web.UI.Page
    {
        UserDetailsRequestBE request = new UserDetailsRequestBE();
        UserDetailsBAL PopulateUser = new UserDetailsBAL();
        protected void Page_Load(object sender, EventArgs e)
        {
            DataFill();
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

        public void DataFill()
        {
            var response = PopulateUser.DisplayUserDetails(request);
            List<UserDetailsResponseBE> UserList = new List<UserDetailsResponseBE>();
            foreach (var item in response.AllUserDetails)
            {
                UserList.Add(item);
            }
            grdAdminProductDetails.DataSource = UserList;
            grdAdminProductDetails.DataBind();
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
            DataFill();
        }

        protected void grdCartDetails_PageIndexChanging(object sender, EventArgs e)
        {

        }
    }
}