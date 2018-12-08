<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="studentLogin.aspx.cs" Inherits="Assignment.studentLogin" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style type="text/css">
        .auto-style1 {
            margin-left: 0px;
        }
        .auto-style2 {
            height: 54px;
        }
        .auto-style3 {
            width: 26%;
        }
        .auto-style4 {
            width: 326px;
        }
        .auto-style6 {
            height: 43px;
        }
        .auto-style7 {
            width: 228px;
            height: 43px;
        }
    </style>
</head>
<body >
        <footer id="dvheader" style="background-color:#e0e0e0">
        <h1 style="font-family:Calibri;text-align:center;">
            Online Assessment Site
        </h1>

    </footer>
    <form id="form1" runat="server">

        <div style="margin:0 auto;background-color:rgb(251, 229, 214)" class="auto-style3" >
            Welcome to Back<br />
            <hr/>
            Student Login Page<br />
            <asp:Login ID="Login1" runat="server" DestinationPageUrl="~/test.aspx" >
                <LayoutTemplate>
                    <table cellpadding="1" cellspacing="0" style="border-collapse:collapse;">
                        <tr>
                            <td class="auto-style4">
                                <table cellpadding="0">
                                    <tr>
                                        <td align="center" colspan="2">Log In</td>
                                    </tr>
                                    <tr>
                                        <td align="right" class="auto-style6">
                                            <asp:Label ID="UserNameLabel" runat="server" AssociatedControlID="UserName">Student Email</asp:Label>
                                        </td>
                                        <td class="auto-style7">
                                            <asp:TextBox ID="UserName" runat="server" Width="237px"></asp:TextBox>
                                            <asp:RequiredFieldValidator ID="UserNameRequired" runat="server" ControlToValidate="UserName" ErrorMessage="User Name is required." ToolTip="User Name is required." ValidationGroup="Login1">*</asp:RequiredFieldValidator>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td align="right" class="auto-style6">
                                            <asp:Label ID="PasswordLabel" runat="server" AssociatedControlID="Password">Password:</asp:Label>
                                        </td>
                                        <td class="auto-style7">
                                            <asp:TextBox ID="Password" runat="server" TextMode="Password" Width="229px"></asp:TextBox>
                                            <asp:RequiredFieldValidator ID="PasswordRequired" runat="server" ControlToValidate="Password" ErrorMessage="Password is required." ToolTip="Password is required." ValidationGroup="Login1">*</asp:RequiredFieldValidator>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td colspan="2" style="text-align:center">
                                            <asp:CheckBox ID="RememberMe" runat="server" Text="Remember " />
                                        </td>
                                    </tr>
                                    <tr>
                                        <td align="center" colspan="2" style="color:Red;">
                                            <asp:Literal ID="FailureText" runat="server" EnableViewState="False"></asp:Literal>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td align="center" colspan="2" class="auto-style2">
                                            <asp:Button ID="LoginButton" runat="server" CommandName="Login" CssClass="auto-style1" Height="29px" Text="Log In" ValidationGroup="Login1" Width="53px" BackColor="#FF9900"/>
                                        </td>
                                    </tr>
                                </table>
                            </td>
                        </tr>
                    </table>
                </LayoutTemplate>
            </asp:Login>
            <br />
        </div>
    </form>

        <footer id="dvfooter" style="background-color:#e0e0e0">
        <h5 style="font-family:Calibri;text-align:center">
         OAS © 2018All Rights ReservedDisclaimerandPrivacy Policy

        </h5>
    </footer>
</body>
</html>

