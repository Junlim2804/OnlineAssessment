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
    public partial class CreateStudentInfo : System.Web.UI.UserControl
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void LinkButton1_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/LoginPage.aspx");
        }

        protected void CreateUserWizard1_CreatedUser(object sender, EventArgs e)
        {

            string connectionString = ConfigurationManager.ConnectionStrings["CaringWow"].ConnectionString;
            MembershipUser NewStudent = Membership.GetUser(CreateUserWizard1.UserName);
            Guid newStudentID = (Guid)NewStudent.ProviderUserKey;
            //to get textbox value  
            TextBox stuid = (TextBox)RegisterStudent1.ContentTemplateContainer.FindControl("UserName");
            TextBox stuname = (TextBox)RegisterStudent1.ContentTemplateContainer.FindControl("StudentName");
            TextBox stupassword = (TextBox)RegisterStudent1.ContentTemplateContainer.FindControl("Password");
            TextBox stuemail = (TextBox)RegisterStudent1.ContentTemplateContainer.FindControl("Email");
            TextBox stuhpNo = (TextBox)RegisterStudent1.ContentTemplateContainer.FindControl("HpNo");
            DropDownList course = (DropDownList)RegisterStudent1.ContentTemplateContainer.FindControl("Course");
            Session["username"] = stuid.Text;

            using (SqlConnection myConnection = new SqlConnection(connectionString))
            {


                try
                {

                    SqlCommand mycommand = new SqlCommand("proc_register", myConnection);
                    mycommand.CommandType = CommandType.StoredProcedure;
                    mycommand.Parameters.Add("@stuid", SqlDbType.VarChar).Value = stuid.Text;
                    mycommand.Parameters.Add("@userid", SqlDbType.UniqueIdentifier).Value = newStudentID;
                    mycommand.Parameters.Add("@stuemail", SqlDbType.VarChar).Value = stuemail.Text;
                    mycommand.Parameters.Add("@stuname", SqlDbType.VarChar).Value = stuname.Text;
                    mycommand.Parameters.Add("@stuhpno", SqlDbType.VarChar).Value = stuhpNo.Text;
                    mycommand.Parameters.Add("@courseCode", SqlDbType.VarChar).Value = course.SelectedItem.ToString();
                    myConnection.Open();

                    if (mycommand.ExecuteNonQuery() == 1)
                    {
                        string createRole = "student";
                        if (!Roles.RoleExists(createRole))
                        {
                            Roles.CreateRole(createRole);
                        }
                        Roles.AddUserToRole(stuid.Text, "student");
                    }
                    myConnection.Close();

                }
                catch (SqlException ex)
                {
                    ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "myconfirm", "confirm('Database Error!')", true);

                }

            }
        }
    }
}