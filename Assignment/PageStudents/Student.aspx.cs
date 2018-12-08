using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Web.Security;

namespace OnlineAssessementSite
{
    public partial class Student : System.Web.UI.Page
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
            string sql = "SELECT * FROM [student] WHERE ([stuId] ='" + username + "')";
            SqlDataAdapter da = new SqlDataAdapter(sql, conn);
              DataSet ds = new DataSet();
              da.Fill(ds);
              DataList1.DataSource = ds;
              DataList1.DataBind();
          }

        protected void DataList1_ItemCommand(object source, DataListCommandEventArgs e)
           {
               if(e.CommandName == "edit")
               {

                DataList1.EditItemIndex = e.Item.ItemIndex;
                int test = DataList1.EditItemIndex;
               
                     filldata();
               }
               else if(e.CommandName == "cancel")
               {
                   DataList1.EditItemIndex = -1;
                 filldata();
               }
               else if(e.CommandName == "update")
               {
                
                   string txtStudId = ((TextBox)e.Item.FindControl("txtStudId")).Text;
                   string txtStudName = ((TextBox)e.Item.FindControl("txtStudName")).Text;
                   string txtStudEmail = ((TextBox)e.Item.FindControl("txtStudEmail")).Text;
                   string txtStudHpNo = ((TextBox)e.Item.FindControl("txtStudHpNo")).Text;
                string txtStudCourse = ((DropDownList)e.Item.FindControl("DropDownList1")).SelectedValue;
                  
                   SqlCommand cmd = new SqlCommand("update student set stuname ='" + txtStudName + "', stuemail ='" + txtStudEmail + "', stuhpno ='" + txtStudHpNo +
                       "',courseCode ='" + txtStudCourse +"'where stuid='" + txtStudId+"'",conn);
                   conn.Open();
                   cmd.ExecuteNonQuery();
                   DataList1.EditItemIndex = -1;
                   conn.Close();

                   filldata();
                 
               }
               
    }

        protected void SqlDataSource2_Selecting(object sender, SqlDataSourceSelectingEventArgs e)
        {

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

        protected void txtStudHpNo_TextChanged(object sender, EventArgs e)
        {

        }

        protected void SqlDataSource1_Selecting(object sender, SqlDataSourceSelectingEventArgs e)
        {

        }

        protected void ddlCourse_SelectedIndexChanged(object sender, EventArgs e)
        {

        }
    }
}