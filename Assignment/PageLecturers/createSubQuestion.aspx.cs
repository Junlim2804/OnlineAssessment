using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Assignment
{
    public partial class createSubQuestion : System.Web.UI.Page
    {
        static string paperset;   
        SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["CaringWow"].ToString());
        protected void Page_Load(object sender, EventArgs e)
        {
            Page.MaintainScrollPositionOnPostBack = true;
            paperset = Request.QueryString["SETID"];

            if (!IsPostBack)
            {
                paperset = Request.QueryString["SETID"];
                Filldata();
                
            }

            conn.Open();

            SqlCommand cmd = new SqlCommand("SELECT p.subjectID, subjectName, mode FROM paperset p, subject s where setID=@setID", conn);
            cmd.Parameters.AddWithValue("@setID", paperset);
            SqlDataReader read = cmd.ExecuteReader();
            while (read.Read())
            {
                Label2.Text = "For " + read[0].ToString() + read[1].ToString() + " as " + read[2].ToString() + " paper.";
            }
            conn.Close();
            
        }

       

        protected void Filldata()
        {
            string query= paperset;
            string sql = "SELECT ROW_NUMBER() OVER (ORDER BY questionID) AS indexNo,* FROM [question] WHERE  SETID='" + query + "'";
            SqlDataAdapter da = new SqlDataAdapter(sql, ConfigurationManager.ConnectionStrings["CaringWow"].ToString());
            DataSet ds = new DataSet();
            da.Fill(ds);
            dl_question.DataSource = ds;
            dl_question.DataBind();
            sql = "select count(questionID) from question  WHERE  SETID='" + query + "'";
            da = new SqlDataAdapter(sql, ConfigurationManager.ConnectionStrings["CaringWow"].ToString());
            fv_add.DataSource = ds;
            fv_add.DataBind();

        }

        protected void DataList1_ItemCommand(object source, DataListCommandEventArgs e)
        {
            if (e.CommandName == "Edit")
            {

                dl_question.EditItemIndex = e.Item.ItemIndex;
                SetFocus(e.Item);
                Filldata();

            }
            else if (e.CommandName == "Cancel")
            {
                dl_question.EditItemIndex = -1;
                Filldata();

            }
            else if (e.CommandName == "Update")
            {
                if (!((FileUpload)e.Item.FindControl("FileUpload1")).HasFile)
                {
                    ((Label)e.Item.FindControl("Label1")).Text = "No yet upload";
                    return;
                }
                else
                {
                    int length = ((FileUpload)e.Item.FindControl("FileUpload1")).PostedFile.ContentLength;
                    byte[] pic = new byte[length];
                    HttpPostedFile uploaded = ((FileUpload)e.Item.FindControl("FileUpload1")).PostedFile;
                    uploaded.InputStream.Read(pic, 0, length);
                    e.Item.FindControl("Image1").Visible = true;

                    string newDesc = ((TextBox)e.Item.FindControl("tbDesc")).Text;
                    string newAnswer = ((TextBox)e.Item.FindControl("tbAnswer")).Text;
                    string qid = ((HiddenField)e.Item.FindControl("hdnquestionId")).Value;

                    SqlCommand cmd = new SqlCommand("update question set questionDesc='" + newDesc +
                       "',sampleAns='" + newAnswer + "', image=@image where questionID='" + qid + "';", conn);

                    conn.Open();
                    cmd.Parameters.AddWithValue("@image", pic);
                    cmd.ExecuteNonQuery();
                    dl_question.EditItemIndex = -1;
                    conn.Close();

                    Filldata();
                }
            }
            else if (e.CommandName == "Delete")
            {
                string qid = ((HiddenField)e.Item.FindControl("hdnquestionId")).Value;
                SqlCommand cmd = new SqlCommand("delete from question where questionID='" + qid + "';", conn);
                conn.Open();
                cmd.ExecuteNonQuery();
                dl_question.EditItemIndex = -1;
                conn.Close();
                Filldata();
            }

        }

        protected void fv_add_ItemInserting(object sender, FormViewInsertEventArgs e)
        {
            int length = ((FileUpload)fv_add.Row.FindControl("FileUpload2")).PostedFile.ContentLength;
            byte[] pic = new byte[length];
            HttpPostedFile uploaded = ((FileUpload)fv_add.Row.FindControl("FileUpload2")).PostedFile;
            uploaded.InputStream.Read(pic, 0, length);
            //fv_add.Row.FindControl("Image1").Visible = true;

            string newDesc = ((TextBox)fv_add.Row.FindControl("tbNewDesc")).Text;
            string newAnswer = ((TextBox)fv_add.Row.FindControl("tbNewAnswer")).Text;

            SqlCommand cmd = new SqlCommand("Insert into question(questionDesc,sampleAns,setID,image) " +
                "values('" + newDesc + "','" + newAnswer + "','"+paperset+"', @image)", conn);
            
            cmd.Parameters.AddWithValue("@image", pic);
            conn.Open();
            cmd.ExecuteNonQuery();
            conn.Close();
            fv_add.ChangeMode(FormViewMode.ReadOnly);
            Filldata();
        }

        protected void btnInsert_Click(object sender, EventArgs e)
        {
            fv_add.InsertItem(true);
        }

        protected void btnAdd_Click(object sender, EventArgs e)
        {
            fv_add.ChangeMode(FormViewMode.Insert);
        }

        protected void Button2_Click(object sender, EventArgs e)
        {
            Response.Redirect("ShowSetList.aspx");
        }

       
    }
}
