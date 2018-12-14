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
    public partial class testimage : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            string conn = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;
            SqlConnection connection = new SqlConnection(conn);
            connection.Open();
            string sql = "SELECT image FROM test WHERE id='21' ";
            SqlCommand cmd = new SqlCommand(sql, connection);
            object img = cmd.ExecuteScalar();
            byte[] arr = (byte[])img;
            string base64String = Convert.ToBase64String(arr, 0, arr.Length);
            Image1.ImageUrl = "data:image/jpg;base64," + base64String;
            connection.Close();
        }
    }
}