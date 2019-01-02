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
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void StuLoginBtn_Click(object sender, EventArgs e)
        {
            String registerUser = "stuRegister";
            HttpCookie cookie = new HttpCookie("registerUser", registerUser);
            cookie.Expires = DateTime.Now.AddMinutes(1);
            Response.Cookies.Add(cookie);
            Response.Redirect("~/TestingCreate.aspx");
        }

        protected void LecLoginBtn_Click(object sender, EventArgs e)
        {
            String registerUser = "lecRegister";
            HttpCookie cookie = new HttpCookie("registerUser", registerUser);
            cookie.Expires = DateTime.Now.AddMinutes(1);
            Response.Cookies.Add(cookie);
            Response.Redirect("~/TestingCreate.aspx");
        }
    }
}