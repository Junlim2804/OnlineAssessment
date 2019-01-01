<%@ Page Language="C#"  AutoEventWireup="true"  CodeBehind="recoveryByemail.aspx.cs" Inherits="OnlineAssessementSite.recoveryByemail" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN"
    "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head>
<title>Sample: Retrieve Password</title>
</head>
<body>

<form id="form1" runat="server">
  <h3>Retrieve Password</h3>

  <asp:Label id="Msg" runat="server" ForeColor="maroon" /><br />

  Username: <asp:Textbox id="UserNameTextBox" Columns="30" runat="server" AutoPostBack="true" />
            <asp:RequiredFieldValidator id="UsernameRequiredValidator" runat="server"
                                        ControlToValidate="UsernameTextBox" ForeColor="red"
                                        Display="Static" ErrorMessage="Required" /><br />

  Password Question: <b><asp:Label id="QuestionLabel" runat="server" /></b><br />

  Answer: <asp:TextBox id="AnswerTextBox" Columns="60" runat="server" Enabled="false" />
          <asp:RequiredFieldValidator id="AnswerRequiredValidator" runat="server"
                                      ControlToValidate="AnswerTextBox" ForeColor="red"
                                      Display="Static" ErrorMessage="Required" Enabled="false" /><br />

  <asp:Button id="EmailPasswordButton" Text="Email My Password" 
              OnClick="EmailPassword_OnClick" runat="server" Enabled="false" />

</form>

</body>
</html>