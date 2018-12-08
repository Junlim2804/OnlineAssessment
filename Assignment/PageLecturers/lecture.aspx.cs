using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace OnlineAssessementSite
{
    public partial class lecture : System.Web.UI.Page
    {

        static string username;
        SqlConnection conn = new SqlConnection("Data Source=(LocalDB)\\ MSSQLLocalDB;AttachDbFilename=|DataDirectory|\\CaringWow.mdf;Integrated Security=True");
        protected void Page_Load(object sender, EventArgs e)
        {
            MembershipUser u = Membership.GetUser(User.Identity.Name);
            username = u.UserName;
            if (!IsPostBack)
                filldata();
        }

        protected void filldata()
        {
            string sql = "SELECT * FROM [lecturer] WHERE ([lecId] ='" + username + "')";
            SqlDataAdapter da = new SqlDataAdapter(sql, conn);
            DataSet ds = new DataSet();
            da.Fill(ds);
            DataList1.DataSource = ds;
            DataList1.DataBind();
        }

        protected void DataList1_ItemCommand(object source, DataListCommandEventArgs e)
        {
            if (e.CommandName == "edit")
            {

                DataList1.EditItemIndex = e.Item.ItemIndex;
                int test = DataList1.EditItemIndex;
                filldata();

            }
            else if (e.CommandName == "cancel")
            {
                DataList1.EditItemIndex = -1;
                filldata();

            }
            else if (e.CommandName == "update")
            {

                string txtLecId = ((TextBox)e.Item.FindControl("txtLecId")).Text;
                string txtLecName = ((TextBox)e.Item.FindControl("txtLecName")).Text;
                string txtLecEmail = ((TextBox)e.Item.FindControl("txtLecEmail")).Text;
                string txtLecHpNo = ((TextBox)e.Item.FindControl("txtLecHpNo")).Text;
          
                SqlCommand cmd = new SqlCommand("update lecturer set lecname ='" + txtLecName + "', lecemail ='" + txtLecEmail + "',lechpno ='" + txtLecHpNo +
                   "'where lecid='" + txtLecId + "'", conn);
                conn.Open();
                cmd.ExecuteNonQuery();
                DataList1.EditItemIndex = -1;
                conn.Close();
                filldata();



            }

        }

        protected void DataList1_SelectedIndexChanged(object sender, EventArgs e)
        {

        }

        protected void btnEdit_Command(object sender, CommandEventArgs e)
        {

        }

        protected void btnEdit_Click(object sender, EventArgs e)
        {
            DataList1.EditItemIndex = 0;

        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            filldata();
        }
    }
}