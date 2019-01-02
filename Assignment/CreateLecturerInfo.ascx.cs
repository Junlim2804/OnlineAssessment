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

namespace Assignment
{
    public partial class CreateLecturerInfo : System.Web.UI.UserControl
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
            DropDownList course = (DropDownList)RegisterLecturer1.ContentTemplateContainer.FindControl("Course");
            Session["username"] = lecId.Text;
            using (SqlConnection myConnection = new SqlConnection(connectionString))
            {

                try
                {

                    SqlCommand mycommand = new SqlCommand("proc_register_lecturer", myConnection);
                    mycommand.CommandType = CommandType.StoredProcedure;
                    mycommand.Parameters.Add("@lecId", SqlDbType.VarChar).Value = lecId.Text;
                    mycommand.Parameters.Add("@userID", SqlDbType.UniqueIdentifier).Value = newStudentID;
                    mycommand.Parameters.Add("@lecEmail", SqlDbType.VarChar).Value = lecEmail.Text;
                    mycommand.Parameters.Add("@lecname", SqlDbType.VarChar).Value = lecname.Text;
                    mycommand.Parameters.Add("@lechpNo", SqlDbType.VarChar).Value = lechpNo.Text;
                    mycommand.Parameters.Add("@teachCourse", SqlDbType.VarChar).Value = course.SelectedItem.ToString();

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
                catch (SqlException ex)
                {
                    ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage", "confirm('Database Error!')", true);

                }

            }
        }
    }
}