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
            HttpCookie ck = Request.Cookies["registerUser"];
            string test = ck["rg"].ToString(); //stuRegister
                string registerUser = Request.Cookies["registerUser"].Value.ToString(); //rg=stuRegister
                Control ctrlControl;
                if (test == "stuRegister")
                {
                h.Text = "Register As Student";
                    ctrlControl = LoadControl("CreateStudentInfo.ascx");
                HttpCookie Cookie = new HttpCookie("registerUser");
                Cookie.Expires = DateTime.Now.AddDays(-1d);
                Response.Cookies.Add(Cookie);

            }
                else /*if(registerUser == "lecLecturer")*/
                {
                h.Text = "Register As Lecturer";
                ctrlControl = LoadControl("CreateLecturerInfo.ascx");
                HttpCookie Cookie = new HttpCookie("registerUser");
                Cookie.Expires = DateTime.Now.AddDays(-1d);
                Response.Cookies.Add(Cookie);
            }
            //else
            //{
            //    ctrlControl = LoadControl("CreateLecturerInfo.ascx");
            //    HttpCookie Cookie = new HttpCookie("registerUser");
            //    Cookie.Expires = DateTime.Now.AddDays(-1d);
            //    Response.Cookies.Add(Cookie);
            //}
       

                div1.Controls.Add(ctrlControl);
            
        }
    }
}