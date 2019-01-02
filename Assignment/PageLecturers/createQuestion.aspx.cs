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
    public partial class createQuestion : System.Web.UI.Page
    {
        SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["CaringWow"].ToString());
        DataTable dt = new DataTable();
        static String paperSet;

        //public TextBox ActiveControl { get; private set; }
        

        protected void Page_Load(object sender, EventArgs e)
        {
            Page.MaintainScrollPositionOnPostBack = true;
            paperSet = Request.QueryString["SETID"];
           
           
            if (!IsPostBack)
            {
                Filldata();
            }
        }


        protected void Filldata()
        {
            String query = paperSet;
            string sql = "SELECT ROW_NUMBER() OVER (ORDER BY questionID) AS indexNo,* FROM [question] WHERE  SETID='" + query+"'";
            SqlDataAdapter da = new SqlDataAdapter(sql, ConfigurationManager.ConnectionStrings["CaringWow"].ToString());
            DataSet ds = new DataSet();
            da.Fill(ds);
            dl_question.DataSource = ds;
            dl_question.DataBind();
            sql= "select count(questionID) from question  WHERE  SETID='" + query + "'";
            da = new SqlDataAdapter(sql, ConfigurationManager.ConnectionStrings["CaringWow"].ToString());
            fv_add.DataSource = ds;
            fv_add.DataBind();

        }


        // The return type can be changed to IEnumerable, however to support
        // paging and sorting, the following parameters must be added:
        //     int maximumRows
        //     int startRowIndex
        //     out int totalRowCount
        //     string sortByExpression


        protected void dl_question_SelectedIndexChanged(object sender, EventArgs e)
        {

        }

        protected void DataList1_ItemCommand(object source, DataListCommandEventArgs e)
        {
            if (e.CommandName == "Edit")
            {
                //e.Item.FindControl("rdOption1").Focus();
                //fv_add.FindControl("tbOption1").Focus();
                dl_question.EditItemIndex = e.Item.ItemIndex;
                SetFocus(e.Item);
                Filldata();
                //TextBox a=e.Item.FindControl("tbDesc") as TextBox;
                //a.Focus();    
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
                }

                int length = ((FileUpload)e.Item.FindControl("FileUpload1")).PostedFile.ContentLength;
                byte[] pic = new byte[length];
                HttpPostedFile uploaded = ((FileUpload)e.Item.FindControl("FileUpload1")).PostedFile;
                uploaded.InputStream.Read(pic, 0, length);

                string newDesc = ((TextBox)e.Item.FindControl("tbDesc")).Text;
                string newOption1 = ((TextBox)e.Item.FindControl("tbOption1")).Text;
                string newOption2 = ((TextBox)e.Item.FindControl("tbOption2")).Text;
                string newOption3 = ((TextBox)e.Item.FindControl("tbOption3")).Text;
                string newOption4 = ((TextBox)e.Item.FindControl("tbOption4")).Text;
                string newAnswer = ((TextBox)e.Item.FindControl("tbAnswer")).Text;
                string qid = ((HiddenField)e.Item.FindControl("hdnquestionId")).Value;

                SqlCommand cmd = new SqlCommand("update question set questionDesc='"+newDesc+
                    "',Option1='"+newOption1+"',Option2='"+newOption2+"',Option3='"+newOption3
                    +"',Option4='"+newOption4+"',sampleAns='"+newAnswer+"', image=@image where questionID='"+qid+"';", conn);
                conn.Open();
                cmd.Parameters.AddWithValue("@image", pic);
                cmd.ExecuteNonQuery();
                dl_question.EditItemIndex = -1;
                conn.Close();

                Filldata();
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

        protected void fv_add_ItemInserting1(object sender, FormViewInsertEventArgs e)
        {
            string newDesc = ((TextBox)fv_add.Row.FindControl("tbNewDesc")).Text;
            string newOption1 = ((TextBox)fv_add.Row.FindControl("tbNewOption1")).Text;
            string newOption2 = ((TextBox)fv_add.Row.FindControl("tbNewOption2")).Text;
            string newOption3 = ((TextBox)fv_add.Row.FindControl("tbNewOption3")).Text;
            string newOption4 = ((TextBox)fv_add.Row.FindControl("tbNewOption4")).Text;
            string newAnswer = ((TextBox)fv_add.Row.FindControl("tbNewAnswer")).Text;

            int length = ((FileUpload)fv_add.Row.FindControl("FileUpload2")).PostedFile.ContentLength;
            byte[] pic = new byte[length];
            HttpPostedFile uploaded = ((FileUpload)fv_add.Row.FindControl("FileUpload2")).PostedFile;
            uploaded.InputStream.Read(pic, 0, length);

            SqlCommand cmd = new SqlCommand("Insert into question(questionDesc,Option1,Option2,Option3,Option4,sampleAns,setID,image) " +
                "values('" + newDesc + "','" + newOption1 + "','" + newOption2 + "','" + newOption3 + "','" + newOption4 + "','" + newAnswer + "','"+paperSet+"',@image)", conn);
            conn.Open();
            cmd.Parameters.AddWithValue("@image", pic);
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

        protected void uploadPic_Click(object sender, EventArgs e)
        {
            /*
            //string qid = ((HiddenField)dl_question.FindControl("hdnquestionId")).Value;
            string connection = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;
            SqlConnection conn = new SqlConnection(connection);
            conn.Open();

            /*if (!((FileUpload)dl_question.FindControl("FileUpload1")).HasFile)
            {
                //no file
            }*/
            /*
            int length = ((FileUpload)dl_question.FindControl("FileUpload12")).PostedFile.ContentLength;
            byte[] pic = new byte[length];
            HttpPostedFile uploaded = ((FileUpload)dl_question.FindControl("FileUpload2")).PostedFile;
            uploaded.InputStream.Read(pic, 0, length);

            //change to insert into question table
            SqlCommand cmd = new SqlCommand("insert into test(id,image) values (@id,@image)", conn);
            cmd.Parameters.AddWithValue("@id", 77); //qid
            cmd.Parameters.AddWithValue("@image", pic);
            cmd.ExecuteNonQuery();
            conn.Close();*/
        }

        
    }
}