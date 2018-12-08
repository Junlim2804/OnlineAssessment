<%@ Page Language="C#" MasterPageFile="~/LayoutPage.Master" AutoEventWireup="true" CodeBehind="complete.aspx.cs" Inherits="Assignment.complete" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <style type="text/css">

        .label{
            
            margin-left:auto;
            margin-right:auto;
            text-align:center;
            width:50%;
        }
    </style>
    <br /><br /><br /><br />
        <div>
            <asp:Label CssClass="label" ID="Label1" runat="server" Text="Label"></asp:Label>
         </div>
    <br /><br /><br />
</asp:Content>
