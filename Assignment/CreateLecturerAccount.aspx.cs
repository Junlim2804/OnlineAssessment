using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace OnlineAssessementSite
{
    public partial class CreateLecturerAccount : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }
        protected void LinkButton1_Click(object sender, EventArgs e)
        {
            Response.Redirect("LoginPage.aspx");
        }


        protected void CreateUserWizard1_CreatedUser(object sender, EventArgs e)
        {

            string connectionString = ConfigurationManager.ConnectionStrings["CaringWow"].ConnectionString;
            MembershipUser NewStudent = Membership.GetUser(CreateUserWizard1.UserName);
            Guid newStudentID = (Guid)NewStudent.ProviderUserKey;
            //to get textbox value  
            TextBox lecId = (TextBox)RegisterLecturer1.ContentTemplateContainer.FindControl("UserName");
            TextBox lecname = (TextBox)RegisterLecturer1.ContentTemplateContainer.FindControl("LecturerName");
            TextBox stupassword = (TextBox)RegisterLecturer1.ContentTemplateContainer.FindControl("Password");
            TextBox lecEmail = (TextBox)RegisterLecturer1.ContentTemplateContainer.FindControl("Email");
            TextBox lechpNo = (TextBox)RegisterLecturer1.ContentTemplateContainer.FindControl("HpNo");


            using (SqlConnection myConnection = new SqlConnection(connectionString))
            {
                SqlCommand mycommand = new SqlCommand("proc_register_lecturer", myConnection);
                mycommand.CommandType = CommandType.StoredProcedure;
                mycommand.Parameters.Add("@lecId", SqlDbType.VarChar).Value = lecId.Text;
                mycommand.Parameters.Add("@userid", SqlDbType.UniqueIdentifier).Value = newStudentID;
                mycommand.Parameters.Add("@lecEmail", SqlDbType.VarChar).Value = lecEmail.Text;
                mycommand.Parameters.Add("@lecname", SqlDbType.VarChar).Value = lecname.Text;
                mycommand.Parameters.Add("@lechpno", SqlDbType.VarChar).Value = lechpNo.Text;


                myConnection.Open();

                if (mycommand.ExecuteNonQuery() == 1)
                {
                    string createRole = "lecturer";
                    if (!Roles.RoleExists(createRole))
                    {
                        Roles.CreateRole(createRole);
                    }
                    Roles.AddUserToRole(lecId.Text, "lecturer");
                }
                myConnection.Close();
            }
        }
    }
}