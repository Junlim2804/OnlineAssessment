using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Assignment
{
    public partial class PersonalInformation : System.Web.UI.Page
    {
        static string username;

        SqlConnection conn = new SqlConnection("Data Source=(LocalDB)\\ MSSQLLocalDB;AttachDbFilename=|DataDirectory|\\CaringWow.mdf;Integrated Security=True");
        protected void Page_Load(object sender, EventArgs e)
        {
            MembershipUser u = Membership.GetUser(User.Identity.Name);
            username = u.UserName;
            Control ctrlControl,ctrlControl2;
            if (Roles.IsUserInRole(u.UserName, "student"))
            {
                ctrlControl = LoadControl("studentHeader.ascx");
                ctrlControl2 = LoadControl("studentProfile.ascx");
            }
            else
            {
                ctrlControl = LoadControl("lecturerHeader.ascx");
                ctrlControl2 = LoadControl("lecturerProfile.ascx");
            }

            div1.Controls.Add(ctrlControl);
            div2.Controls.Add(ctrlControl2);


        }
    }
}