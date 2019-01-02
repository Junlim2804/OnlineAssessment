using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace OnlineAssessementSite
{
    public partial class WebForm1 : System.Web.UI.Page
    {
        HttpCookie cookie = new HttpCookie("registerUser");
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void StuLoginBtn_Click(object sender, EventArgs e)
        {

            cookie.Values["rg"] = "stuRegister";
              cookie.Expires = DateTime.Now.AddDays(1);
            Response.Cookies.Add(cookie);
            Response.Redirect("~/TestingCreate.aspx");
        }

        protected void LecLoginBtn_Click(object sender, EventArgs e)
        {
            cookie.Values["rg"] = "lecRegister";
            cookie.Expires = DateTime.Now.AddDays(1);
            Response.Cookies.Add(cookie);
            Response.Redirect("~/TestingCreate.aspx");
        }
    }
}