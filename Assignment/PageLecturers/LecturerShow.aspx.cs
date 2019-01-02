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
    public partial class LecturerShow : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            //string personID = Session["username"].ToString();
        }

        /*protected void ddlSubject_SelectedIndexChanged(object sender, EventArgs e)
        {
            ddlSet.DataBind();
        }

        protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
        {
            GridViewRow row = GridView1.Rows[GridView1.SelectedIndex];
            string setid = row.Cells[2].Text;
            string stuid = row.Cells[1].Text;
            Session["id"] = stuid;
            Response.Redirect("markPaper.aspx?SETID=" + setid + "&?STUID=" + stuid);


        }*/

        protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
        {

        }

        protected void DataList1_ItemCommand(object source, DataListCommandEventArgs e)
        {
            if(e.CommandName == "Mark")
            {

            }
            else if (e.CommandName == "Result")
            {
                string setID = DataList1.DataKeys[e.Item.ItemIndex].ToString();
                SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["CaringWow"].ToString());
                string sql = "SELECT * FROM [StudentSetList] WHERE ([setID] = @setID)";
                conn.Open();
                SqlCommand command = new SqlCommand(sql, conn);
                
                command.Parameters.AddWithValue("@setID", setID);
                SqlDataReader results = command.ExecuteReader();
                GridView1.DataSource = results;
                conn.Close();
                GridView1.Visible = true;
            }
        }
    }
}