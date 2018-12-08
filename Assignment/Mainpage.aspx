<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Mainpage.aspx.cs" Inherits="Assignment.Mainpage" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">

        <style type="text/css">
        .auto-style1 {
            height: 300px;
            text-align:center;
        }
        .auto-style3 {
            height: 99px;
        }
        .auto-style4 {
            width: 731px;
            background-color:#5c6bc0;
        }
        .auto-style9 {
            width: 100%;
            height: 100%;
        }
        .auto-style10 {
            height: 229px;
        }
        .auto-style11 {
            height: 74px;
        }
        .button {
            background-color: #1a237e;
            border: none;
            color: white;
            padding: 15px 32px;
            text-align: center;
            text-decoration: none;
            display: inline-block;
            font-size: 16px;
            margin: 4px 2px;
            cursor: pointer;
            width:250px;
        }
        .button2{
            background-color: #e8eaf6;
            border: none;
            border: none;
            color: black;
            padding: 15px 32px;
            text-align: center;
            text-decoration: none;
            display: inline-block;
            font-size: 16px;
            margin: 4px 2px;
            cursor: pointer;
            width:250px;
        }
    </style>

<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
             <table class="auto-style9">
                <tr>
                    <td class="auto-style4" rowspan="3">
                        <p style="margin-left:300px;font-family:Calibri;font-size:50px;color:white">  
                               Good to see you<br />
                               again!

                        </p>
                       <p style="margin-left:300px;font-family:Calibri;font-size:20px;color:white">
                               Get started with the Online Assessement where <br />
                               we can help you to discover your endless potential!

                       </p>
                    </td>
                    <td class="auto-style3">
                        <div style="text-align:center;margin-top:50px;margin-bottom:50px">
                            <asp:Image ID="BrainImage1" runat="server" Height="200px" Width="225px" ImageUrl="~/image/brain2.png" />

                        </div>
                        
                    </td>
                </tr>
                <tr>
                    <td class="auto-style10">


                        <table style="width:100%;">
                            <tr>
                                <td>
                                    <div style="text-align:center">
                                        <asp:Button ID="StuLoginBtn" class="button" runat="server" Text="Student Login" PostBackUrl="~/studentLogin.aspx" />

                                    </div>
                                    
                                </td>
                            </tr>
                            <tr>
                                <td>&nbsp;</td>
                            </tr>
                            <tr>
                                <td class="auto-style11">
                                    <div style="text-align:center">
                                        <asp:Button ID="LecLoginBtn" class="button" runat="server" Text="Lecturer Login" PostBackUrl="~/LecuterLogin.aspx" />

                                    </div>
                                </td>
                            </tr>
                        </table>


                    </td>
                </tr>
                <tr>
                    <td class="auto-style1">
                        <p style="margin-left:500px">
                          <h2 style="font-family:Calibri;;font-size: 20px">
                              New User? &nbsp
                          </h2><asp:Button ID="RegisterBtn" class="button2" runat="server" Text="Sign Up" />
                        </p>
                    </td>
                </tr>
            </table>
        </div>
    </form>
</body>
</html>
