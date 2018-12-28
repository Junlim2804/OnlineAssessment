<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="studentSideNav.ascx.cs" Inherits="Assignment.studentSideNav" %>
<ul>
<asp:HyperLink ID="HyperLink4" runat="server" NavigateUrl="~/PageStudents/Student.aspx">Personal Information</asp:HyperLink>
<asp:HyperLink ID="HyperLink2" runat="server" NavigateUrl="~/PageStudents/test.aspx">Assessment</asp:HyperLink>
<asp:HyperLink ID="HyperLink3" runat="server" NavigateUrl="~/PageStudents/ShowResult.aspx">Achievement</asp:HyperLink>
</ul>