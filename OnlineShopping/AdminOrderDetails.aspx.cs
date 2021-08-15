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
    public partial class AdminOrderDetails : System.Web.UI.Page
    {
        OrderDetailsRequestBE request = new OrderDetailsRequestBE();
        OrderDetailsBAL PopulateOrder = new OrderDetailsBAL();
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
            var response = PopulateOrder.GetAllOrderDetails(request);
            List<OrderDetailsResponseBE> OrderList = new List<OrderDetailsResponseBE>();
            foreach (var item in response.AllOrderList)
            {
                OrderList.Add(item);
            }
            grdAdminProductDetails.DataSource = OrderList;
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
    }
}