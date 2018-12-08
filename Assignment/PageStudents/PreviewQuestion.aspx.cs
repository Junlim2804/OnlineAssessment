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
    public partial class PreviewQuestion : System.Web.UI.Page
    {
        Random randomizer = new Random();

      
        static string setID;
       
        DataTable dt = new DataTable();
        static List<string> qs = new List<string>();
        static string type;
        protected void Page_Load(object sender, EventArgs e)
        {

            //var textbox = PreviousPage.FindControl("txtData") as TextBox;

            setID = (string)(Session["SetID"]);
           
            type=(string)(Session["Type"]);
           
            




            if (!IsPostBack)
            {
                BindGrid(setID);
                
                foreach (GridViewRow row in grdquestions.Rows)
                {

                    RadioButton chkbox1 = row.FindControl("rdOption1") as RadioButton;
                    RadioButton chkbox2 = row.FindControl("rdOption2") as RadioButton;
                    RadioButton chkbox3 = row.FindControl("rdOption3") as RadioButton;
                    RadioButton chkbox4 = row.FindControl("rdOption4") as RadioButton;
                    string sampleAns = ((Label)row.FindControl("lbAnswer")).Text;
                    string answer = ((HiddenField)row.FindControl("hdnStudans")).Value;
                    if (chkbox1.Text == answer)
                    {
                        chkbox1.Checked = true;
                    }
                    else if (chkbox2.Text == answer)
                    {
                        chkbox2.Checked = true;
                    }
                    else if (chkbox3.Text == answer)
                    {
                        chkbox3.Checked = true;
                    }
                    else 
                    {
                        chkbox4.Checked = true;
                    }


                }

                if (type == "Obj" || type == "obj")
                    ClientScript.RegisterStartupScript(GetType(), "hwa", "CheckAll()", true);

            }




        }


        public void BindGrid(string id)
        {
            MembershipUser u = Membership.GetUser(User.Identity.Name);


            string userId = u.UserName;
            SqlDataAdapter adp = new SqlDataAdapter("select q.questionId,questionDesc,Option1,Option2,Option3,Option4,sampleAns,studAns,mark from question q, questionList ql where setID='" + setID + "' and stuId='"+userId+"' ", ConfigurationManager.ConnectionStrings["CaringWow"].ToString());
            adp.Fill(dt);
            
            int i = 0;
            foreach (DataRow row in dt.Rows)
            {
             
            }

            grdquestions.DataSource = dt;



            grdquestions.DataBind();
            if (type == "Sub"||type=="sub")
                foreach (GridViewRow row in grdquestions.Rows)
                {

                    RadioButton chkbox1 = row.FindControl("rdOption1") as RadioButton;
                    RadioButton chkbox2 = row.FindControl("rdOption2") as RadioButton;
                    RadioButton chkbox3 = row.FindControl("rdOption3") as RadioButton;
                    RadioButton chkbox4 = row.FindControl("rdOption4") as RadioButton;
                    TextBox tbAnswer= row.FindControl("tbAnswer") as TextBox;
                    Label mark = row.FindControl("lblMark") as Label;
                    chkbox1.Visible = false;
                    chkbox2.Visible = false;
                    chkbox3.Visible = false;
                    chkbox4.Visible = false;
                    tbAnswer.Visible = true;
                    tbAnswer.Enabled = false;
                    mark.Visible = true;
                    
                

                }





        }
   
        
    


    }
}