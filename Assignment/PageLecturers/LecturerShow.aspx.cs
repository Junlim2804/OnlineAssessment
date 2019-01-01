using System;
using System.Collections.Generic;
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

        protected void markBtn_Click(object sender, EventArgs e)
        {
            
        }

        protected void resultBtn_Click(object sender, EventArgs e)
        {
            GridView1.Visible = true;
        }
    }
}