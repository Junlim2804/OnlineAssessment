<%@ Page Title="" Language="C#" MasterPageFile="~/LayoutPage.Master" AutoEventWireup="true" CodeBehind="TestingCreate.aspx.cs" Inherits="Assignment.TestingCreate" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <title><asp:Label runat="server" Text="" ID="h"></asp:Label></title>
        <!-- Font Icon -->
    <link rel="stylesheet" href="CSS/material-design-iconic-font.min.css">

    <!-- Main css -->
    <link rel="stylesheet" href="CSS/style.css">
    <style type="text/css">
        .auto-style1 {
            height: 119px;
        }
        .auto-style2 {
            position: relative;
            margin-bottom: 25px;
            overflow: hidden;
            left: 19px;
            top: 0px;
            width: 431px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <div id="div1" runat="server"></div>
 

</asp:Content>
