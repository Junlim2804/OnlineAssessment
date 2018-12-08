<%@ Page Language="C#"  MasterPageFile="~/LayoutPage.Master"  AutoEventWireup="true"  CodeBehind="resetPassword.aspx.cs" Inherits="OnlineAssessementSite.resetPassword" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <title>Lecturer Register Page</title>
    <!-- Font Icon -->
    <link rel="stylesheet" href="CSS/material-design-iconic-font.min.css">

    <!-- Main css -->
    <link rel="stylesheet" href="CSS/style.css">
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
   <div class="signin" style="margin:400px;font-size:larger" >
  <h3>Retrieve Password</h3>
  
  <asp:Label id="Msg" runat="server" ForeColor="maroon" /><br />

  Username: <asp:Textbox id="UsernameTextBox" Columns="30" runat="server" AutoPostBack="true" />
            <asp:RequiredFieldValidator id="UsernameRequiredValidator" runat="server"
                                        ControlToValidate="UsernameTextBox" ForeColor="red"
                                        Display="Static" ErrorMessage="Required" /><br />

  <asp:Button id="ResetPasswordButton" Text="Reset Password" 
              OnClick="ResetPassword_OnClick" runat="server" Enabled="false" />

    <br />
    <br />
      
 </div>
</asp:Content>