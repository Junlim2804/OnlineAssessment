using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Net.Mail;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace OnlineAssessementSite
{
    public partial class resetPassword : System.Web.UI.Page
    {
        
        MembershipUser u;

        public void Page_Load(object sender, EventArgs args)
        {
            if (!Membership.EnablePasswordReset)
            {
                FormsAuthentication.RedirectToLoginPage();
            }

            Msg.Text = "";

            if (!IsPostBack)
            {
                Msg.Text = "Please supply a username.";
            }
            else
            {
                VerifyUsername();
            }
        }


        public void VerifyUsername()
        {
            u = Membership.GetUser(UsernameTextBox.Text, false);

            if (u == null)
            {
                Msg.Text = "Username " + Server.HtmlEncode(UsernameTextBox.Text) + " not found. Please check the value and re-enter.";

                ResetPasswordButton.Enabled = false;
            }
            else
            {
                ResetPasswordButton.Enabled = true;
            }
        }

        public void ResetPassword_OnClick(object sender, EventArgs args)
        {
            string newPassword;

            u = Membership.GetUser(UsernameTextBox.Text, false);

            if (u == null)
            {
                Msg.Text = "Username " + Server.HtmlEncode(UsernameTextBox.Text) + " not found. Please check the value and re-enter.";
                return;
            }

            try
            {
                newPassword = u.ResetPassword();
            }
            catch (MembershipPasswordException e)
            {
                Msg.Text = "Invalid password answer. Please re-enter and try again.";
                return;
            }
            catch (Exception e)
            {
                Msg.Text = e.Message;
                return;
            }

            if (newPassword != null)
            {
                Msg.Text = "Password reset. Your new password is sent to your registered email." + Server.HtmlEncode(newPassword);
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
                    obj.To.Add(u.Email);
                    obj.Priority = System.Net.Mail.MailPriority.High;
                    obj.Subject = "Reset Password Email";
                    string date = DateTime.Now.ToString();
                    obj.Body = "Your new password is " + Server.HtmlEncode(newPassword) + ". Please proceed to change your password to prevent others from using your account.";
                    serverobj.Send(obj);
                }
                catch (Exception ex)
                {
                    ex.ToString();
                }
            }
            else
            {
                Msg.Text = "Password reset failed. Please re-enter your values and try again.";
            }
        }


    }
}