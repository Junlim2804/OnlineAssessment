<%@ Page Title="" Language="C#" MasterPageFile="~/LayoutPage.Master" AutoEventWireup="true" CodeBehind="PersonalInformation.aspx.cs" Inherits="Assignment.PersonalInformation" %>
<%@ Register TagPrefix="studentHead" TagName="studentHeader" Src="studentHeader.ascx" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <link rel="stylesheet" type="text/css" href="../CSS/Student.css"/>


<div id="div1" runat="server">

</div>


<section>
  

 
<div id="div2" runat="server"></div>

     <div class = infobox2>
    <h1">Welcome back, <asp:LoginName ID="LoginName1" runat="server" />
        </h1>
    <p>
       
       "Keep doing some kind of work, that the devil may always find you employed."</p>
    <p>-St Jerome</p>
  </div>



  
</section>

</asp:Content>

