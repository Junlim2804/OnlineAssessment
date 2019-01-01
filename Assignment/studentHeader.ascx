<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="studentHeader.ascx.cs" Inherits="Assignment.siteURL" %>
    <style>
        .bgimg {
    background-position: center;
    background-size: cover;
    background-image: url("/Image/studBack.jpg");
    min-height: 100%;
    }
    </style>

<header class="bgimg w3-display-container w3-grayscale-min" id="home">
<div class="w3-container" style="padding:128px 16px" id="about">
<div class="auto-style1" style="padding:48px">
<span class="w3-jumbo w3-animate-top">Student Details</span><br> 
</div>
</div> 
</header> 

<nav>
<div class="sidenav">
<ul>
<asp:HyperLink ID="HyperLink4" runat="server" NavigateUrl="~/PageStudents/Student.aspx">Personal Information</asp:HyperLink>
<asp:HyperLink ID="HyperLink2" runat="server" NavigateUrl="~/PageStudents/test.aspx">Assessment</asp:HyperLink>
<asp:HyperLink ID="HyperLink3" runat="server" NavigateUrl="~/PageStudents/ShowResult.aspx">Achievement</asp:HyperLink>
</ul>
</div>
</nav>