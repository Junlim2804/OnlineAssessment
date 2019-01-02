<%@ Page Language="C#" MasterPageFile="~/LayoutPage.Master" AutoEventWireup="true" CodeBehind="LoginPage.aspx.cs" Inherits="OnlineAssessementSite.StudentLoginPage" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <title>Lecturer Register Page</title>

    <!-- Font Icon -->
    <link rel="stylesheet" href="CSS/material-design-iconic-font.min.css">

    <!-- Main css -->
    <link rel="stylesheet" href="CSS/style.css">

       <%-- JAVASCRIPT--%>
<script type="text/javascript" language="javascript">
     function DisableBackButton() {
       window.history.forward()
      }
     DisableBackButton();
     window.onload = DisableBackButton;
     window.onpageshow = function(evt) { if (evt.persisted) DisableBackButton() }
     window.onunload = function() { void (0) }
 </script>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <asp:Login ID="Login1" runat="server" OnLoggedIn="Login1_LoggedIn">
        <LayoutTemplate>
   <div class="main" style="margin-top:100px;margin-bottom:200px">
        <section class="sign-in">
            <div class="container">
                <div class="signin-content">
                    <div class="signin-image">
                        <figure>
                            <img src="Image/icon.gif" alt="sing up image">
                        </figure>
                        
                       <asp:HyperLink ID="HyperLink1" CssClass="signup-image-link" runat="server" NavigateUrl="~/MainCreateAccountPage.aspx">Create an account?</asp:HyperLink> 
                         <asp:HyperLink ID="HyperLink2" CssClass="signup-image-link" runat="server" NavigateUrl="~/resetPassword.aspx">Forget password?</asp:HyperLink> 
                    </div>

                    <div class="signin-form">
                        <h2 class="form-title">Sign in</h2>
                        <div class="register-form" id="login-form">
                            <div class="form-group">
                               

                                <asp:TextBox ID="UserName" runat="server" Placeholder="User Name"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="UserNameRequired" runat="server" ControlToValidate="UserName"
                                    ErrorMessage="User Name is required." forecolor="Red" ToolTip="User Name is required." ValidationGroup="Login1">
                                        *User name is required</asp:RequiredFieldValidator>

                             
                            </div>
                            <div class="form-group">
                               

                                <asp:TextBox ID="Password" runat="server" TextMode="Password" Placeholder="Password"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="PasswordRequired" runat="server" ControlToValidate="Password"
                                    ErrorMessage="Password is required." forecolor="Red"  ToolTip="Password is required." ValidationGroup="Login1" >
                                        *Password is required</asp:RequiredFieldValidator>

                            </div>
                         
                            <div class="form-group form-button">
                                <%--<input type="submit" name="signin" id="signin" class="form-submit" value="Log in" />--%>
                                <asp:Literal ID="FailureText" runat="server" EnableViewState="False"></asp:Literal>
                                <asp:Button ID="LoginButton" cssclass="form-submit" runat="server" CommandName="Login"
                                    Text="Log In" ValidationGroup="Login1" OnClick="LoginButton_Click" />
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </section>
    </div>

    <!-- JS -->
    <script src="vendor/jquery/jquery.min.js"></script>
    <script src="js/main.js"></script>
        
  
        </LayoutTemplate>
    </asp:Login>
 
</asp:Content>
