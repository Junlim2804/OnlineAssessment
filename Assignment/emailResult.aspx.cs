using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Net.Mail;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Assignment
{
    public partial class emailResult : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
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
                obj.To.Add("jslim2804@gmail.com");
                obj.Priority = System.Net.Mail.MailPriority.High;
                obj.Subject = "Result";
                string date = DateTime.Now.ToString();
                obj.Body = "this is test email";
                serverobj.Send(obj);
            }
            catch (Exception ex)
            {
                ex.ToString();
            }
        }
    }
}