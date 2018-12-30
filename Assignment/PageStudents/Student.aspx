<%@ Page Language="C#" MasterPageFile="~/LayoutPage.Master" AutoEventWireup="true" CodeBehind="Student.aspx.cs" Inherits="OnlineAssessementSite.Student" %>
<%@ Register TagPrefix="studentSide" TagName="studentSide" Src="studentSideNav.ascx" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <link rel="stylesheet" type="text/css" href="../CSS/Student.css"/>
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

<section>
  
<nav>
<div class="sidenav">
<studentSide:studentSide ID="log" Runat="Server"/>
</div>
</nav>
  
  
<div class="infobox">         
<asp:DataList ID="DataList1" runat="server" DataKeyField="stuId" OnItemCommand="DataList1_ItemCommand" OnSelectedIndexChanged="DataList1_SelectedIndexChanged"  >
<EditItemTemplate>
                   
                         <asp:Label ID="lblStudId" runat="server" Text="Student ID"></asp:Label>
                         <asp:TextBox ID="txtStudId" runat="server"  Text='<%# Eval("stuId") %> ' Enabled="False"  />
                         <br />
                         <asp:Label ID="lblStudName" runat="server" Text="Name"></asp:Label>
                         <asp:TextBox ID="txtStudName" runat="server" Text='<%# Eval("stuname") %>' />
                         <br />
                         <asp:Label ID="lblStudCourse" runat="server" Text="Course"></asp:Label>
                         <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT * FROM [Course]"></asp:SqlDataSource>
                     <asp:DropDownList ID="DropDownList1" runat="server" DataSourceID="SqlDataSource1" DataTextField="CourseCode" DataValueField="CourseCode"></asp:DropDownList>
                         <br />
                         <asp:Label ID="lblStudEmail" runat="server" Text="E-mail"></asp:Label>
                         <asp:TextBox ID="txtStudEmail" runat="server" Text='<%# Eval("stuemail") %>' />
                         <asp:RegularExpressionValidator ID="regexEmailValid" runat="server" ValidationExpression="\w+([-+.]\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*" ControlToValidate="txtStudEmail" ErrorMessage="Invalid Email Format"></asp:RegularExpressionValidator>
                         <br />
                         <asp:Label ID="lblStudHpNo" runat="server" Text="Telephone Number"></asp:Label>
                         <asp:TextBox ID="txtStudHpNo" runat="server" Text='<%# Eval("stuhpNo") %>' />
                         <br />

                         <asp:Button ID="btnEdit" runat="server" CommandName="update" Text="Update"/>
                         &nbsp;<asp:Button ID="Button2" runat="server" CommandName="cancel" Text="cancel" />
                         <br />
                  
                 </EditItemTemplate>
                 <ItemTemplate>
                     <asp:Label ID="lblStudId" runat="server" Text="Student ID"></asp:Label>
                     <asp:TextBox ID="txtStudId" runat="server" Text='<%# Eval("stuId") %>' Enabled="False" />
                     <br />
                     <asp:Label ID="lblStudName" runat="server" Text="Name"></asp:Label>
                     <asp:TextBox ID="txtStuName" runat="server" Text='<%# Eval("stuname") %>' Enabled="False"/>
                     <br />
                     <asp:Label ID="lblStudCourse" runat="server" Text="Course"></asp:Label>
                     <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT * FROM [Course]"></asp:SqlDataSource>
                      <asp:Textbox ID="tbCode" runat="server" Text='<%# Eval("CourseCode") %>' Enabled="False" select="" ></asp:Textbox>
                     <br />
                     <asp:Label ID="lblStudEmail" runat="server" Text="E-mail"></asp:Label>
                     <asp:TextBox ID="txtStudEmail" runat="server" Text='<%# Eval("stuemail") %>' Enabled="False" />
                    
                     <br />
                     <asp:Label ID="lblStudHpNo" runat="server" Text="Telephone Number"></asp:Label>
                     <asp:TextBox ID="txtStudHpNo" runat="server" Text='<%# Eval("stuhpNo") %>' Enabled="False"/>
                     <br />
                   <%--  <asp:Label ID="lblStudCourse" runat="server" Text="Course"></asp:Label>
                     <asp:TextBox ID="txtStudCourse" runat="server" Text='<%# Eval("courseName") %>' Enabled="False"/>
                     <br />--%>

                     
                    
                     <br />
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
       
       "Keep doing some kind of work, that the devil may always find you employed."</p>
    <p>-St Jerome</p>
  </div>



  
</section>

</asp:Content>
