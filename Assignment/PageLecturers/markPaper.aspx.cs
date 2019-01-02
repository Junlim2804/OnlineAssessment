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
using System.Net;
using System.Net.Mail;

namespace Assignment
{
    public partial class markPaper : System.Web.UI.Page
    {
        SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["CaringWow"].ToString());

        static string stuid = "";
        
        static string setid = "";
        static string lecid="";
     

        protected void Page_Load(object sender, EventArgs e)
        {
            MembershipUser u = Membership.GetUser(User.Identity.Name);
            string userId = u.UserName;
            stuid = (string)(Session["id"]);
            setid = Request.QueryString["SETID"];
            lecid = userId;
            if (!IsPostBack)
            {
                Filldata();
            }
          
        }

        protected void Filldata()
        {

            string sql = "Select ql.questionID,questionDesc,sampleAns,studAns from question q,questionList ql where stuId ='"+stuid+"' and q.setID ='"+setid+"' and ql.questionID = q.questionID;";
            SqlDataAdapter da = new SqlDataAdapter(sql, ConfigurationManager.ConnectionStrings["CaringWow"].ToString());
            DataSet ds = new DataSet();
            da.Fill(ds);
            DataList1.DataSource = ds;
            DataList1.DataBind();
          

        }
        protected int updateData()
        {
            SqlCommand cmd = new SqlCommand();
            conn.Open();
            int totalmark = 0;
            foreach (DataListItem item in DataList1.Items)
            {
                HiddenField hdnquestionId = (HiddenField)item.FindControl("hdnquestionId");
                string qid = hdnquestionId.Value.ToString();
                TextBox tbMark = item.FindControl("tbMark") as TextBox;
                int mark = 0;
                if(tbMark.Text!="")
                mark = Int32.Parse(tbMark.Text.ToString());
                totalmark = totalmark + mark;
                TextBox tbRemark = item.FindControl("tbReMark") as TextBox;
                string sql = "UPDATE questionList SET mark =" + mark + ", remarks = '" + tbRemark.Text + "', lecId = '" + lecid + "' where questionid =" + qid + " and stuId = '"+stuid+"'";
                cmd = new SqlCommand(sql, conn);
                
                
                cmd.ExecuteNonQuery();
                
            }
            String sqlmark="Update StudentSetList set mark="+totalmark+ "  where setID ='" + setid + "' and stuId = '" + stuid + "';";
           cmd = new SqlCommand(sqlmark, conn);


            cmd.ExecuteNonQuery();
            conn.Close();
            return totalmark;
        }

        protected void DataList1_SelectedIndexChanged(object sender, EventArgs e)
        {

        }

        protected void btnSubmit_Click(object sender, EventArgs e)
        {
            string email;
            int mark = updateData();

            using (SqlConnection myConnection = new SqlConnection(ConfigurationManager.ConnectionStrings["CaringWow"].ToString()))
            {
                SqlCommand mycommand = new SqlCommand("proc_getEmail", myConnection);
                mycommand.CommandType = CommandType.StoredProcedure;
                mycommand.Parameters.Add("@stuid", SqlDbType.VarChar).Value =stuid;



                myConnection.Open();
                email = mycommand.ExecuteScalar().ToString();

                myConnection.Close();
            }


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
                obj.Subject = "Result for Exam SET CODE"+setid;
                string date = DateTime.Now.ToString();
                obj.Body = "You have been graded !! \n Your mark for XXX is " + mark;
                //serverobj.Send(obj);
            }
            catch (Exception ex)
            {
                ex.ToString();
            }
            Response.Redirect("LecturerShow.aspx");
            
        }

        protected void SqlDataSource1_Updating(object sender, SqlDataSourceCommandEventArgs e)
        {
            foreach (DataListItem item in DataList1.Items)
            {
                HiddenField hdnquestionId = (HiddenField)item.FindControl("hdnquestionId");
                string qid = hdnquestionId.Value.ToString();
                TextBox tbMark = item.FindControl("tbMark") as TextBox;
                TextBox tbRemark = item.FindControl("tbReMark") as TextBox;
                e.Command.Parameters[0].Value = tbMark.Text;
                e.Command.Parameters[1].Value = tbRemark.Text;
                e.Command.Parameters[2].Value = lecid;
                e.Command.Parameters[3].Value = qid;
                e.Command.Parameters[4].Value = stuid;
               
               
            }
          
        }
    
        protected void SqlDataSource1_Updated1(object sender, SqlDataSourceStatusEventArgs e)
        {
            btnSubmit.Enabled = false;
           
        }

        protected void SqlDataSource1_Selecting(object sender, SqlDataSourceSelectingEventArgs e)
        {

        }
    }
}