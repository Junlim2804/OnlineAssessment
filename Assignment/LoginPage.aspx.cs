using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace OnlineAssessementSite
{
    public partial class StudentLoginPage : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Roles.IsUserInRole(Login1.UserName, "student") || Roles.IsUserInRole(Login1.UserName, "lecturer"))
            {
                if (!IsPostBack) {Response.Redirect("Homepage.aspx"); }
                
            }
            
        }

        protected void LinkButton1_Click(object sender, EventArgs e)
        {
            Response.Redirect("MainCreateAccountPage.aspx");
        }

        protected void LoginButton_Click(object sender, EventArgs e)
        {

        }

        protected void Login1_LoggedIn(object sender, EventArgs e)
        {
            if (Roles.IsUserInRole(Login1.UserName, "student"))
            {

                Response.Redirect("PageStudents/Student.aspx");
            }
            else if (Roles.IsUserInRole(Login1.UserName, "lecturer"))
                Response.Redirect("PageLecturers/lecture.aspx");
     
        }
    }
}