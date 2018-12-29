using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace OnlineAssessementSite
{
    public partial class LoginPage : System.Web.UI.MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void LinkButton1_Click(object sender, EventArgs e)
        {
            String username = (String)Session["username"];
            if (Session["username"] != null)
            {
                
                if (Roles.IsUserInRole(username, "student"))
                {

                    Response.Redirect("Student.aspx");
                }
                else if (Roles.IsUserInRole(username, "lecturer"))
                    Response.Redirect("lecture.aspx");
            }

        }

        protected void LoginStatus1_LoggingOut(object sender, LoginCancelEventArgs e)
        {
            Session["username"] = null;
            Session.Remove("username");
            Session.RemoveAll();
     
        }
    }
}