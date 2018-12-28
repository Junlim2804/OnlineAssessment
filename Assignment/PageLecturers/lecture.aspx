<%@ Page Language="C#" MasterPageFile="~/LayoutPage.Master" AutoEventWireup="true" CodeBehind="lecture.aspx.cs" Inherits="OnlineAssessementSite.lecture" %>
<%@ Register TagPrefix="lecturerSide" TagName="lecturerSide" Src="lecSideNav.ascx" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <link rel="stylesheet" type="text/css" href="../CSS/Student.css"/>
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

<section>
<nav>
<div class="sidenav">
<lecturerSide:lecturerSide ID="log" Runat="Server"/>
</div>
</nav>
  

      <div class="infobox">
   
             <asp:DataList ID="DataList1" runat="server" DataKeyField="lecId" OnItemCommand="DataList1_ItemCommand" OnSelectedIndexChanged="DataList1_SelectedIndexChanged"  >
                <EditItemTemplate>
                   
                         <asp:Label ID="lblLecId" runat="server" Text="Lecturer ID"></asp:Label>
                         <asp:TextBox ID="txtLecId" runat="server"  Text='<%# Eval("lecId") %> ' Enabled="False"  />
                         <br />
                         <asp:Label ID="lblLecName" runat="server" Text="Name"></asp:Label>
                         <asp:TextBox ID="txtLecName" runat="server" Text='<%# Eval("lecname") %>' />
                         <br />
                         <asp:Label ID="lblLecEmail" runat="server" Text="E-mail"></asp:Label>
                         <asp:TextBox ID="txtLecEmail" runat="server" Text='<%# Eval("lecemail") %>' />
                         <asp:RegularExpressionValidator ID="regexEmailValid" runat="server" ValidationExpression="\w+([-+.]\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*" ControlToValidate="txtLecEmail" ErrorMessage="Invalid Email Format"></asp:RegularExpressionValidator>
                        <br />
                         <asp:Label ID="lblLecHpNo" runat="server" Text="Telephone Number"></asp:Label>
                         <asp:TextBox ID="txtLecHpNo" runat="server" Text='<%# Eval("lechpNo") %>' />
                         <br />

                         <asp:Button ID="btnEdit" runat="server" CommandName="update" Text="Update"/>
                         &nbsp;<asp:Button ID="Button2" runat="server" CommandName="cancel" Text="cancel" />
                         <br />
                    
                  <br />
                 </EditItemTemplate>
                 <ItemTemplate>
                     <asp:Label ID="lblLecId" runat="server" Text="Lecturer ID"></asp:Label>
                     <asp:TextBox ID="txtLecId" runat="server" Text='<%# Eval("lecId") %>' Enabled="False" />
                     <br />
                     <asp:Label ID="lblLecName" runat="server" Text="Name"></asp:Label>
                     <asp:TextBox ID="txtLecName" runat="server" Text='<%# Eval("lecname") %>' Enabled="False"/>
                     <br />
                     <asp:Label ID="lblLecEmail" runat="server" Text="E-mail"></asp:Label>
                     <asp:TextBox ID="txtLecEmail" runat="server" Text='<%# Eval("lecemail") %>' Enabled="False" />
                     <asp:RegularExpressionValidator ID="regexEmailValid" runat="server" ValidationExpression="\w+([-+.]\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*" ControlToValidate="txtLecEmail" ErrorMessage="Invalid Email Format"></asp:RegularExpressionValidator>
                    <br />
                     <asp:Label ID="lblHpNo" runat="server" Text="Telephone Number"></asp:Label>
                     <asp:TextBox ID="txtHpNp" runat="server" Text='<%# Eval("lechpNo") %>' Enabled="False"/>
                     <br />

                     
                    
                     <asp:Button ID="btnEdit" runat="server" CommandName="edit" Text="Edit" EnableTheming="True" OnClick="btnEdit_Click" OnCommand="btnEdit_Command" />
                     <br />
                     <asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl="~/realchangepassword.aspx">Reset Password?</asp:HyperLink>
                     
                 </ItemTemplate>
             </asp:DataList>
        
    </div>
    
      

    <div class = infobox2>
    <h1">Welcome back, <asp:LoginName ID="LoginName1" runat="server" />
        </h1>
    <p>
       
       "Good, better, best. Never let it rest. 'Til your good is better and your better is best.."</p>
    <p>-St Jerome</p>
  </div>




  
</section>

</asp:Content>

