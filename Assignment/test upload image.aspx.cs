using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Assignment
{
    public partial class test_upload_image : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            string connection = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;
            SqlConnection conn = new SqlConnection(connection);
            conn.Open();
            if (!FileUpload1.HasFile)
            {
                Label1.Text = "No yet upload";    
            }

            int length = FileUpload1.PostedFile.ContentLength;
            byte[] pic = new byte[length];
            HttpPostedFile uploaded = FileUpload1.PostedFile;
            uploaded.InputStream.Read(pic, 0, length);

            SqlCommand cmd = new SqlCommand("insert into test(id,image) values (@id,@image)", conn);
            cmd.Parameters.AddWithValue("@id", TextBox1.Text);
            cmd.Parameters.AddWithValue("@image", pic);
            cmd.ExecuteNonQuery();
            conn.Close();
        }

        protected void TextBox1_TextChanged(object sender, EventArgs e)
        {

        }
    }
}