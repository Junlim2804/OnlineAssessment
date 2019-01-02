using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Assignment
{
    public partial class TestingCreate : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
         
                string registerUser = Request.Cookies["registerUser"].Value.ToString();
                Control ctrlControl;
                if (registerUser == "stuRegister")
                {
                h.Text = "Register As Student";
                    ctrlControl = LoadControl("CreateStudentInfo.ascx");
                  
                }
                else if(registerUser == "stuLecturer")
                {
                h.Text = "Register As Lecturer";
                ctrlControl = LoadControl("CreateLecturer.ascx");
            }
            else
            {
                ctrlControl = LoadControl("CreateStudentInfo.ascx");
            }
       

                div1.Controls.Add(ctrlControl);
            
        }
    }
}