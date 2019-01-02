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
                    ctrlControl = LoadControl("CreateStudentInfo.ascx");
                  
                }
                else 
                {
                    ctrlControl = LoadControl("CreateLecturer.ascx");
                }
       

                div1.Controls.Add(ctrlControl);
            
        }
    }
}