<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="lecSideNav.ascx.cs" Inherits="Assignment.PageLecturers.lecSideNav" %>
<ul>
     

          <asp:HyperLink ID="hpSet" runat="server" NavigateUrl="~/PageLecturers/ShowSetList.aspx">Create Examination Set</asp:HyperLink>
          <asp:HyperLink ID="hpPersonalInfo" runat="server" NavigateUrl="~/PageLecturers/lecture.aspx">Personal Information</asp:HyperLink>
          <asp:HyperLink ID="HyperLink2" runat="server" NavigateUrl="~/PageLecturers/LecturerShow.aspx">Mark Paper</asp:HyperLink>
        
    </ul>