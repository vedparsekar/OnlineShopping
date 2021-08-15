using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace OnlineShopping.UserControl
{
    public partial class DateTimeCalender : System.Web.UI.UserControl
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        //public DateTime SelectedDate
        public String SelectedDate
        {
            get
            {
                //return Convert.ToDateTime(txtCalender.Text);
                return txtCalender.Text;
            }
            set
            {
                txtCalender.Text = value.ToString();
            }
        }
    }
}