<%@ Page Language="C#" MasterPageFile="~/LayoutPage.Master" AutoEventWireup="true" CodeBehind="MainCreateAccountPage.aspx.cs" Inherits="OnlineAssessementSite.WebForm1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server"> 

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

        

            <table class="auto-style9">
                <tr>
                    <td class="auto-style4" rowspan="3">
                        <p style="margin-left:300px;font-family:Calibri;font-size:50px;color:white">  
                               Welcome to CaringWow Online Learning Website</p>
                       <p style="margin-left:300px;font-family:Calibri;font-size:20px;color:white">
                               Get started with the Online Assessement where <br />
                               we can help you to discover your endless potential!

                       </p>
                    </td>
                    <td class="auto-style3">
                        <div style="text-align:center;margin-top:150px;margin-bottom:50px">
                            <asp:Image ID="BrainImage1" runat="server" Height="350px" Width="350px" ImageUrl="Image/brain1.png" />

                        </div>
                        
                    </td>
                </tr>
                <tr>
                    <td class="auto-style10">


                        <table style="width:100%;">
                            <tr>
                                <td>
                                    <div style="text-align:center">
                                        <asp:Button ID="StuLoginBtn" class="button" runat="server" Text="Register as Student" PostBackUrl="~/CreateStudentAccount.aspx" />

                                    </div>
                                    
                                </td>
                            </tr>
                            <tr>
                                <td>&nbsp;</td>
                            </tr>
                            <tr>
                                <td class="auto-style11">
                                    <div style="text-align:center">
                                        <asp:Button ID="LecLoginBtn" class="button" runat="server" Text="Register as Lecturer" PostBackUrl="~/CreateLecturerAccount.aspx" />

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
                              &nbsp;</h2>
                        </p>
                    </td>
                </tr>
            </table>
 

    </asp:Content>
