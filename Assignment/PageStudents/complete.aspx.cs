using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Assignment
{
    public partial class complete : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            String s = Request.QueryString["mark"];
            Label1.Text = "<h2>Thank you for completing the test !! <br />You have answered " + s + " question(s) correctly !!" +
                "<br />You can leave this page now.</h2>";
        }
    }
}