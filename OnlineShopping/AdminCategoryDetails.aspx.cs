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
    public partial class AdminCategoryDetails : System.Web.UI.Page
    {
        CategoryDetailsRequestBE request = new CategoryDetailsRequestBE();
        CategoryDetailsBAL PopulateCategory = new CategoryDetailsBAL();
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
            var response = PopulateCategory.GetCategories(request);
            List<CategoryDetailsResponseBE> UserList = new List<CategoryDetailsResponseBE>();
            foreach (var item in response.AllCategoryList)
            {
                UserList.Add(item);
            }
            grdAdminProductDetails.DataSource = UserList;
            grdAdminProductDetails.DataBind();
        }
        protected void btnAddCategory(object sender, EventArgs e)
        {
            Response.Redirect("AddCategory.aspx");
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
    }
}