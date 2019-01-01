using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Net;
using System.Net.Mail;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Assignment
{
    public partial class complete : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            String email;
            String username = Session["Username"].ToString();
            String s = Request.QueryString["mark"];
        

            using (SqlConnection myConnection = new SqlConnection(ConfigurationManager.ConnectionStrings["CaringWow"].ToString()))
            {
                SqlCommand mycommand = new SqlCommand("proc_register", myConnection);
                mycommand.CommandType = CommandType.StoredProcedure;
                mycommand.Parameters.Add("@stuid", SqlDbType.VarChar).Value = username;
         


                myConnection.Open();
                email = mycommand.ExecuteScalar().ToString();
                
                myConnection.Close();
            }

            Label1.Text = "<h2>Thank you for completing the test !! <br />You have answered " + s + " question(s) correctly !!" +
            "<br />You can leave this page now.</h2>";

            try
            {
                System.Net.Mail.MailMessage obj = new System.Net.Mail.MailMessage();

                SmtpClient serverobj = new SmtpClient();
                serverobj.Credentials = new NetworkCredential("caringwow@outlook.com", "Caringw0w!");
                serverobj.Port = 587;
                serverobj.Host = "smtp.outlook.com";
                serverobj.EnableSsl = true;
                obj = new System.Net.Mail.MailMessage();
                obj.From = new MailAddress("caringwow@outlook.com", "Reset Password", System.Text.Encoding.UTF8);
                obj.To.Add(email);
                obj.Priority = System.Net.Mail.MailPriority.High;
                obj.Subject = "Result";
                string date = DateTime.Now.ToString();
                int mark = Int32.Parse(s) * 5;
                obj.Body = "Thank you for completing the test !!You marks is "+mark+" !!";
     
                serverobj.Send(obj);
            }
            catch (Exception ex)
            {
                ex.ToString();
            }




        }
    }
}