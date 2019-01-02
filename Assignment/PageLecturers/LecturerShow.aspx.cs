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
        }*/

        protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
        {
            GridViewRow row = GridView1.Rows[GridView1.SelectedIndex];
            string setid = row.Cells[1].Text;//2
            string stuid = row.Cells[2].Text;//1
            Session["id"] = stuid;
            Response.Redirect("markPaper.aspx?SETID=" + setid + "&?STUID=" + stuid);
        }



        protected void DataList1_ItemCommand(object source, DataListCommandEventArgs e)
        {
            string setID = DataList1.DataKeys[e.Item.ItemIndex].ToString();
            /*if (e.CommandName == "Mark")
            {
                //Response.Redirect("markPaper.aspx?SETID=" + setID);// "&?STUID=" + stuid);
            }*/
            if (e.CommandName == "View")
            {
                Session["setID"] = setID;
                GridView1.DataBind();
                Page.SetFocus(GridView1);
                /*SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["CaringWow"].ToString());
                string sql = "SELECT * FROM [StudentSetList] WHERE ([setID] = @setID)";
                conn.Open();
                SqlCommand command = new SqlCommand(sql, conn);
                
                command.Parameters.AddWithValue("@setID", setID);
                SqlDataReader results = command.ExecuteReader();
                GridView1.DataSource = results;
                conn.Close();*/
            }
        }
    }
}