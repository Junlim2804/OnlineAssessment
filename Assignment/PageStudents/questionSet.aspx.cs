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

    public partial class questionSet : System.Web.UI.Page
    {
        Random randomizer = new Random();

        static int timeLeft;
        static string setID;
        static System.Windows.Forms.Timer myTimer = new System.Windows.Forms.Timer();
        DataTable dt = new DataTable();
        static List<string> qs = new List<string>();
        static string type;
        protected void Page_Load(object sender, EventArgs e)
        {

            //var textbox = PreviousPage.FindControl("txtData") as TextBox;
            
            setID = (string)(Session["SetID"]);
         
            if (!IsPostBack)
            {
                timeLeft = Int32.Parse((string)Session["Duration"]);
                timeLeft = timeLeft * 60;
                type = (string)(Session["Type"]);
                TimeLabel.Text = timeLeft+" seconds";
                BindGrid(setID);

                Timer1.Enabled = true;

                myTimer.Start();
            }
          
        }


        public void BindGrid(string id)
        {
            SqlDataAdapter adp = new SqlDataAdapter("select * from question where setID='" +id + "' ", ConfigurationManager.ConnectionStrings["CaringWow"].ToString());
            adp.Fill(dt);
            int i = 0;
            foreach (DataRow row in dt.Rows)
            {
                qs.Add(row["sampleAns"].ToString());
                i++;
            }

            grdquestions.DataSource = dt;
           
            

            grdquestions.DataBind();
            if(type=="Sub"||type=="sub")
            foreach (GridViewRow row in grdquestions.Rows)
            {
               
                RadioButton chkbox1 = row.FindControl("rdOption1") as RadioButton;
                RadioButton chkbox2 = row.FindControl("rdOption2") as RadioButton;
                RadioButton chkbox3 = row.FindControl("rdOption3") as RadioButton;
                RadioButton chkbox4 = row.FindControl("rdOption4") as RadioButton;
                chkbox1.Visible = false;
                chkbox2.Visible = false;
                chkbox3.Visible = false;
                chkbox4.Visible = false;
                    TextBox tbans = row.FindControl("tbAns") as TextBox;

                    tbans.Visible = true;

                }
        




        }
        /*
        protected void grdquestions_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.DataRow)
            {
                RadioButtonList rdlstOptions = (RadioButtonList)e.Row.FindControl("rdlstOptions");
                HiddenField hdnquestionId = (HiddenField)e.Row.FindControl("hdnquestionId");
                if (rdlstOptions != null && hdnquestionId != null)
                {
                    DataRow[] result = dt.Select("questionid=" + (Convert.ToInt32(hdnquestionId.Value)));
                    DataView view = new DataView();
                    view.Table = dt;
                    view.RowFilter = "questionid=" + (Convert.ToInt32(hdnquestionId.Value));
                    if (view.Table.Rows.Count > 0)
                    {
                        DataTable dt1 = new DataTable();
                        dt1 = view.ToTable();
                    }
                }
            }
        }
        */
        protected void grdquestions_SelectedIndexChanged(object sender, EventArgs e)
        {

        }

        protected void CheckQuestion(object sender, EventArgs e)
        {
            MembershipUser u = Membership.GetUser(User.Identity.Name);
            string userId = u.UserName;
            string connectionString = ConfigurationManager.ConnectionStrings["CaringWow"].ToString();
            string sql = "";
            string answer = "";
            SqlConnection cnn;
            cnn = new SqlConnection(connectionString);
            cnn.Open();
           
            SqlCommand command;
            int noOfCorrectAnswer=0;
            int i = 0;
            if (type == "Obj"||type=="obj")
                foreach (GridViewRow row in grdquestions.Rows)
                {
                  
                    HiddenField hdnquestionId = (HiddenField)row.FindControl("hdnquestionId");
                    string qid = hdnquestionId.Value.ToString();
                    RadioButton chkbox1 = row.FindControl("rdOption1") as RadioButton;
                    RadioButton chkbox2 = row.FindControl("rdOption2") as RadioButton;
                    RadioButton chkbox3 = row.FindControl("rdOption3") as RadioButton;
                    RadioButton chkbox4 = row.FindControl("rdOption4") as RadioButton;
                    if (chkbox1.Checked)
                        answer = chkbox1.Text;
                    else if (chkbox2.Checked)
                        answer = chkbox2.Text;
                    else if (chkbox3.Checked)
                        answer = chkbox3.Text;
                    else
                        answer = chkbox4.Text;
                    sql = "insert into questionList(stuID,questionID,studAns,setID) values('1808466','" + qid + "','" + answer + "','" + setID + "');";
                    command = new SqlCommand(sql, cnn);
                    //command.ExecuteNonQuery();

                    if (answer.Equals(qs.ElementAt(i)))
                        noOfCorrectAnswer++;


                    i++;
                    int mark = noOfCorrectAnswer * 5;
                    
                    sql = "update StudentSetList set mark='" + mark + "' where setid='" + setID + "' and stuId='" + userId + "'";
                    command = new SqlCommand(sql, cnn);
                    command.ExecuteNonQuery();
                    Response.Redirect("complete.aspx?mark=" + noOfCorrectAnswer);

                }
            else
            {
                foreach (GridViewRow row in grdquestions.Rows)
                {
                    HiddenField hdnquestionId = (HiddenField)row.FindControl("hdnquestionId");
                    string qid = hdnquestionId.Value.ToString();
                    TextBox tbans = row.FindControl("tbAns") as TextBox;
                    answer = tbans.Text;
                    sql = "insert into questionList(stuID,questionID,studAns) values('"+userId+"','" + qid + "','" + answer +" ');";
                    command = new SqlCommand(sql, cnn);
                    command.ExecuteNonQuery();
                   


                }
                Response.Redirect("subComplete.aspx");
            }




            cnn.Close();
           
        }
        protected void btnSubmit_Click(object sender, EventArgs e)
        {
           
            //Server.Transfer("complete.aspx");
        }

        protected void Timer1_Tick(object sender, EventArgs e)
        {

            if (timeLeft > 0)
            {
                // Display the new time left
                // by updating the Time Left label.
                timeLeft = timeLeft - 1;
                TimeLabel.Text = timeLeft + " seconds";
             
            }
            else
            {
                // If the user ran out of time, stop the timer, show
                // a MessageBox, and fill in the answers.
                Timer1.Enabled = false;
                TimeLabel.Text = "Time's up!";
                CheckQuestion(null, EventArgs.Empty);
            }
        }
    }

}