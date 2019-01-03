using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace OnlineAssessementSite
{
    public partial class test : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            
            Session["USERNAME"] = HttpContext.Current.User.Identity.Name.ToString();
            if (GridView1.Rows.Count == 0)
            {
                Button1.Visible = false;
            }
        }

        protected void btnControl_Click(object sender, EventArgs e)
        {

            if (lblSet.Text == "")
            {

            }
            int i = GridView1.SelectedIndex;
            Session["SetID"] = GridView1.SelectedValue.ToString();
            Session["Type"] = GridView1.Rows[i].Cells[6].Text;
            Session["Duration"] = GridView1.Rows[i].Cells[3].Text;
           
            string newWin = "window.open('questionSet.aspx', 'null', 'toolbar=0,scrollbars=1,location=0,statusbar=0,menubar=0,resizable=0,fullscreen=yes')";
             ClientScript.RegisterStartupScript(this.GetType(),"pop",newWin , true);

            

            Button1.Enabled = false;
            
        }

        protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
        {
            int selectedIndex = GridView1.SelectedIndex;
            GridViewRow row = GridView1.SelectedRow;
            lblSet.Text= (GridView1.DataKeys[selectedIndex]["setid"]).ToString();
            lblSubID.Text = row.Cells[4].Text;

           lblTime.Text= row.Cells[3].Text;
            lblSet.Focus();
            Button1.Enabled = true;
        }
    }
}