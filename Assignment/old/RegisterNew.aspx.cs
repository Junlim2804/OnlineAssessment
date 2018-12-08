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
    public partial class RegisterNew : System.Web.UI.Page
    {
        string connectionString = ConfigurationManager.ConnectionStrings["CaringWow"].ConnectionString;
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void CreateUserWizard1_CreatedUser(object sender, EventArgs e)
        {
            MembershipUser NewStudent = Membership.GetUser(CreateUserWizard1.UserName);
            Guid newStudentID = (Guid)NewStudent.ProviderUserKey;
            //to get textbox value  
            TextBox studentid = (TextBox)CreateUserWizardStep1.ContentTemplateContainer.FindControl("UserName");


            using (SqlConnection myConnection = new SqlConnection(connectionString))
            {
                SqlCommand mycommand = new SqlCommand("proc_register", myConnection);
                mycommand.CommandType = CommandType.StoredProcedure;
                mycommand.Parameters.Add("@studentid", SqlDbType.VarChar).Value = studentid.Text;
                mycommand.Parameters.Add("@userid", SqlDbType.UniqueIdentifier).Value = newStudentID;



                myConnection.Open();

                if (mycommand.ExecuteNonQuery()==1)
                { 
                string createRole = "student";
                if (!Roles.RoleExists(createRole))
                {
                    Roles.CreateRole(createRole);
                }
                Roles.AddUserToRole(studentid.Text, "student");
                     }
                myConnection.Close();
            }
        }
    }

    
}