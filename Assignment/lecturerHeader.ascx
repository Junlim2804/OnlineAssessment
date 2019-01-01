<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="lecturerHeader.ascx.cs" Inherits="Assignment.lecturerHeader" %>
    <style>
        
    .bgimg {
    background-position: center;
    background-size: cover;
    background-image: url("/Image/lecBack.jpg");
    min-height: 100%;
}


</style>

<header class="bgimg w3-display-container w3-grayscale-min" id="home">
<div class="w3-container" style="padding:128px 16px" id="about">  
<div class="auto-style1" style="padding:48px">     
<span class="w3-jumbo w3-animate-top">Lecturer Details</span><br> </div>
</div> 
</header> 

<nav>
<div class="sidenav">
<ul>   
<asp:HyperLink ID="hpPersonalInfo" runat="server" NavigateUrl="~/PersonalInformation.aspx">Personal Information</asp:HyperLink>
<asp:HyperLink ID="hpSet" runat="server" NavigateUrl="~/PageLecturers/ShowSetList.aspx">Create Examination Set</asp:HyperLink>
<asp:HyperLink ID="HyperLink2" runat="server" NavigateUrl="~/PageLecturers/LecturerShow.aspx">Mark Paper</asp:HyperLink>        
</ul>
</div>
</nav>