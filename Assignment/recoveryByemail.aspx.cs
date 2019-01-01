using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.Mail;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace OnlineAssessementSite
{
    public partial class recoveryByemail : System.Web.UI.Page
    {
        public object UsernameTextBox { get; private set; }

        protected void Page_Load(object sender, EventArgs args)
        {
            if (!Membership.EnablePasswordRetrieval)
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
            MembershipUser u = Membership.GetUser(UserNameTextBox.Text, false);

            if (u == null)
            {
                Msg.Text = "Username " + Server.HtmlEncode(UserNameTextBox.Text) + " not found. Please check the value and re-enter.";

                QuestionLabel.Text = "";
                QuestionLabel.Enabled = false;
                AnswerTextBox.Enabled = false;
                EmailPasswordButton.Enabled = false;
            }
            else
            {
                QuestionLabel.Text = u.PasswordQuestion;
                QuestionLabel.Enabled = true;
                AnswerTextBox.Enabled = true;
                EmailPasswordButton.Enabled = true;
            }
        }


        public void EmailPassword_OnClick(object sender, EventArgs args)
        {
            MembershipUser u = Membership.GetUser(UserNameTextBox.Text, false);
            string password;

            if (u != null)
            {
                try
                {
                    password = u.GetPassword(AnswerTextBox.Text);
                }
                catch (Exception e)
                {
                    Msg.Text = "An exception occurred retrieving your password: " + Server.HtmlEncode(e.Message);
                    return;
                }

                EmailPassword(u.Email, password);
                Msg.Text = "Password sent via email.";
            }
            else
            {
                Msg.Text = "Password Answer is not valid. Please check the value and try again.";
            }
        }


        private void EmailPassword(string email, string password)
        {
            try
            {
                MailMessage Message = new MailMessage();
                Message.To = email;
                Message.From = "administrator";
                Message.Subject = "Your Password";
                Message.Body = "Your password is: " + Server.HtmlEncode(password);

                SmtpMail.SmtpServer = "smarthost";
                SmtpMail.Send(Message);
            }
            catch
            {
                Msg.Text = "An exception occurred sending your password. Please try again.";
            }
        }
    }
}

