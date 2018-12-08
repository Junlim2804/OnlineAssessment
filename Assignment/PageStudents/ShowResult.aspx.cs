using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Assignment
{
  
    public partial class ShowResult : System.Web.UI.Page
    {
        SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["CaringWow"].ToString());
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
                Filldata();
        }
        protected void Filldata()
        {
            MembershipUser u = Membership.GetUser(User.Identity.Name);

            string userId = u.UserName;

            string sql = "SELECT * from studentSetList s,paperset p where stuID='"+u.UserName+ "' and (mark is not null or expiredDate<CURRENT_TIMESTAMP) and p.setid=s.setid  ";
            SqlDataAdapter da = new SqlDataAdapter(sql, ConfigurationManager.ConnectionStrings["CaringWow"].ToString());

            DataSet ds = new DataSet();
            da.Fill(ds);
            GridView1.DataSource = ds;
            GridView1.DataBind();
           

        }

        protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
        {
            int i = GridView1.SelectedIndex;
            Session["SetID"] = GridView1.Rows[i].Cells[1].Text;
            Session["Type"] = GridView1.Rows[i].Cells[3].Text;
            
            Response.Redirect("PreviewQuestion.aspx");
        }
    }
}