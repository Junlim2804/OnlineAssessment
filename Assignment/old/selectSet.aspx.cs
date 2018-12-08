using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace OnlineAssessementSite
{
    public partial class newWebapge : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
        {
            int i = GridView1.SelectedIndex;
            Session["SetID"] = GridView1.SelectedValue.ToString();
            Session["Type"] = GridView1.Rows[i].Cells[2].ToString();
            Session["Duration"] = GridView1.Rows[i].Cells[1].ToString() ;
        }
    }
}