using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Assignment
{
    public partial class ShowSetList : System.Web.UI.Page
    {
        public static string subjID="";
        public static string modeid = "";

        SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["CaringWow"].ToString());
        protected void Page_Load(object sender, EventArgs e)
        {
            string personID = Session["username"].ToString();
            
            Page.MaintainScrollPositionOnPostBack = true;
            if (IsPostBack)
            {
                SetFocus(fv_set);
            }
        }

        protected void FormView1_PageIndexChanging(object sender, FormViewPageEventArgs e)
        {

        }

        protected void BtnEdit_Click(object sender, EventArgs e)
        {
            fv_set.ChangeMode(FormViewMode.Edit);

        }

        protected void btnConfirm_Click(object sender, EventArgs e)
        {
            fv_set.ChangeMode(FormViewMode.ReadOnly);
            SqlDataSource2.Update();
        }

        protected void btnCancel_Click(object sender, EventArgs e)
        {
            fv_set.ChangeMode(FormViewMode.ReadOnly);
        }

        protected void SqlDataSource2_Updating(object sender, SqlDataSourceCommandEventArgs e)
        {
            
            String subjectID = "";
          DropDownList ddlSubList = (DropDownList)fv_set.FindControl("ddlSubject");
     
            String type = "";
            RadioButtonList rblType = (RadioButtonList)fv_set.FindControl("rblType");
            Calendar CalExp = (Calendar)fv_set.FindControl("CalExp");
            for (int i = 0; i < rblType.Items.Count; i++)
            {
                if (rblType.Items[i].Selected)
                {
                   type = rblType.Items[i].Value;
                    break;
                }
            }
            
            for (int i = 0; i < ddlSubList.Items.Count; i++)
            {

                if (ddlSubList.Items[i].Selected)
                {

                    subjectID = ddlSubList.Items[i].Value;
                    break;

                }

            }
            
            String duration = ((TextBox)fv_set.FindControl("tbDuration")).Text;
            
            subjID = subjectID;
           
            e.Command.Parameters[0].Value = duration; 
            e.Command.Parameters[1].Value = subjectID;
            e.Command.Parameters[2].Value = type;
            e.Command.Parameters[3].Value = CalExp.SelectedDate;
            e.Command.Parameters[4].Value = GridView1.SelectedValue;
            

        }

        protected void SqlDataSource2_Updated(object sender, SqlDataSourceStatusEventArgs e)
        {
            GridView1.DataBind();
        }

        protected void btnAdd_Click(object sender, EventArgs e)
        {
            fv_set.ChangeMode(FormViewMode.Insert);
        }

        protected void btnInsertClick(object sender, EventArgs e)
        {
            SqlDataSource2.Insert();
        }

        protected void SqlDataSource2_Inserted(object sender, SqlDataSourceStatusEventArgs e)
        {
            string sql = "";
            conn.Open();
            string setid = "";
           
            sql = "select max(setid) from paperset";
            SqlCommand cmd = new SqlCommand(sql, conn);
            setid = cmd.ExecuteScalar().ToString();


            if (modeid == "Public")
            {
                sql = "INSERT studentSetList(stuId,setId) select stuid,'" + setid + "' as setID from student where courseCode = (SELECT courseCode from[subject] where subjectID = '" + subjID + "')";
                cmd = new SqlCommand(sql, conn);
                cmd.ExecuteNonQuery();
            }
            else
            {
                ListBox blStud = fv_set.FindControl("blStudent") as ListBox;
                for (int i = 0; i < blStud.Items.Count; i++)
                {
                    sql = "INSERT studentSetList(stuId,setId) values('" + blStud.Items[i] + "','" + setid + "')";
                    cmd = new SqlCommand(sql, conn);
                    cmd.ExecuteNonQuery();
                }
            }
            conn.Close();

            DataList1.DataBind();
            fv_set.ChangeMode(FormViewMode.ReadOnly);
            
        }
        protected void SqlDataSource2_Inserting(object sender, SqlDataSourceCommandEventArgs e)
        {
            String mode = "";
            String subjectID = "";
            DropDownList ddlSubList = (DropDownList)fv_set.FindControl("ddlSubject");
            RadioButtonList rbtMode = (RadioButtonList)fv_set.FindControl("rblMode");
            for (int i = 0; i < rbtMode.Items.Count; i++)
            {

                if (rbtMode.Items[i].Selected)
                {

                    mode = rbtMode.Items[i].Value;
                    break;

                }

            }
            modeid = mode;
            String type = "";
            RadioButtonList rblType = (RadioButtonList)fv_set.FindControl("rblType");
            Calendar CalExp = (Calendar)fv_set.FindControl("CalExp");

            for (int i = 0; i < rblType.Items.Count; i++)
            {

                if (rblType.Items[i].Selected)
                {

                    type = rblType.Items[i].Value;
                    break;

                }

            }


            for (int i = 0; i < ddlSubList.Items.Count; i++)
            {

                if (ddlSubList.Items[i].Selected)
                {

                    subjectID = ddlSubList.Items[i].Value;
                    break;

                }

            }
            subjID = subjectID;

            String duration = ((TextBox)fv_set.FindControl("tbDuration")).Text;



           
            e.Command.Parameters[0].Value = mode;
            e.Command.Parameters[1].Value = duration;
            e.Command.Parameters[2].Value = subjectID;
            e.Command.Parameters[3].Value = type;
            e.Command.Parameters[4].Value = CalExp.SelectedDate;
           
           
        }

        protected void BtnEditQuestion_Click(object sender, EventArgs e)
        {
            Label lbType = (Label)fv_set.FindControl("lbType");
            if (lbType.Text=="obj")
            Response.Redirect("createQuestion.aspx?SETID=" + GridView1.SelectedValue);
            else
                Response.Redirect("createSubQuestion.aspx?SETID=" + GridView1.SelectedValue);
        }

        protected void GridView2_SelectedIndexChanged(object sender, EventArgs e)
        {
            SqlDataSource3.Update();
        }

        protected void btnPublish_Click(object sender, EventArgs e)
        {
            SqlDataSource4.Update();
        }

        protected void SqlDataSource4_Updating(object sender, SqlDataSourceCommandEventArgs e)
        {
            e.Command.Parameters[0].Value = GridView1.SelectedValue;
        }

        protected void SqlDataSource3_Updating(object sender, SqlDataSourceCommandEventArgs e)
        {
            if(GridView2.SelectedValue!=null)
            e.Command.Parameters[0].Value = GridView2.SelectedValue;
            else
            e.Command.Parameters[0].Value = GridView1.SelectedValue;
        }

        protected void btnTerminate_Click(object sender, EventArgs e)
        {
            SqlDataSource3.Update();
        }

        protected void SqlDataSource3_Updated(object sender, SqlDataSourceStatusEventArgs e)
        {
            GridView2.DataBind();
        }

        protected void btnAddStud_Click(object sender, EventArgs e)
        {
            conn.Open();
            ListItem li = new ListItem();
            li.Text = ((TextBox)fv_set.FindControl("tbStudID")).Text;
            Literal msg = fv_set.FindControl("FailureText") as Literal;
            string sql = "select stuid from student where stuid='"+li.Text+"'";
            SqlCommand command = new SqlCommand(sql, conn);
            if (command.ExecuteScalar() ==null)
            {
                msg.Text = "Student ID NOT EXISTS";
                msg.EnableViewState = true;
            }
            else
            {
                msg.Text = "";
                msg.EnableViewState = false;
                ListBox blStud = fv_set.FindControl("blStudent") as ListBox;
               
                blStud.Items.Add(li);
            }

            conn.Close();
                
        }


        protected void rblMode_SelectedIndexChanged(object sender, EventArgs e)
        {
            RadioButtonList rblMode = fv_set.FindControl("rblMode") as RadioButtonList;
            if (rblMode.Items[0].Selected)
            {
                ((Label)fv_set.FindControl("lblStudentID")).Visible = false;
                fv_set.FindControl("blStudent").Visible = false;
                fv_set.FindControl("tbStudID").Visible = false;
                fv_set.FindControl("btnAddStud").Visible = false;
            }
            else
            {
                ((Label)fv_set.FindControl("lblStudentID")).Visible = true;
                fv_set.FindControl("blStudent").Visible = true;
                fv_set.FindControl("tbStudID").Visible = true;
                fv_set.FindControl("btnAddStud").Visible = true;
            }

        }

        protected void blStudent_SelectedIndexChanged(object sender, EventArgs e)
        {
            ListBox blStud = fv_set.FindControl("blStudent") as ListBox;
            blStud.Items.RemoveAt(blStud.SelectedIndex);
        }

        protected void fv_set_PageIndexChanging(object sender, FormViewPageEventArgs e)
        {

        }

        protected void DataList1_ItemCommand(object source, DataListCommandEventArgs e)
        {
            if (e.CommandName == "View")
            {
                string setID = DataList1.DataKeys[e.Item.ItemIndex].ToString();
                string lbType =((Label)e.Item.FindControl("typeLabel")).Text;

                if (lbType == "obj")
                  Response.Redirect("createQuestion.aspx?SETID=" + setID);
                else if (lbType == "sub")
                  Response.Redirect("createSubQuestion.aspx?SETID=" + setID);
            }
            else if (e.CommandName == "Check")
            {
                string setID = DataList1.DataKeys[e.Item.ItemIndex].ToString();
                fv_set.Visible = true;
            }
        }


        protected void DataList1_SelectedIndexChanged1(object sender, EventArgs e)
        {

        }


    }
}