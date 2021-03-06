﻿<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="studentProfile.ascx.cs" Inherits="Assignment.studentProfile" %>
<div class="infobox">         
<asp:DataList ID="DataList1" runat="server" DataKeyField="stuId" OnItemCommand="DataList1_ItemCommand" OnSelectedIndexChanged="DataList1_SelectedIndexChanged"  >
<EditItemTemplate>
                   
                         <asp:Label ID="lblStudId" runat="server" Text="Student ID"></asp:Label>
                         <asp:TextBox ID="txtStudId" runat="server"  Text='<%# Eval("stuId") %> ' Enabled="False"  />
                         <br />
                         <asp:Label ID="lblStudName" runat="server" Text="Name"></asp:Label>
                         <asp:TextBox ID="txtStudName" runat="server" Text='<%# Eval("stuname") %>' />
                         <asp:RequiredFieldValidator ID="NameRequired" runat="server" ControlToValidate="txtStudName" ForeColor="Red" ErrorMessage="Student Name is required." ToolTip="Student Name is required.">
                           *Student Name is required</asp:RequiredFieldValidator>
                         <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" forecolor="Red" ErrorMessage="Enter only characters!" ControlToValidate="txtStudName" 
                           ValidationExpression="^[a-zA-Z\s]+$" ></asp:RegularExpressionValidator> 
                         <br />
                         <asp:Label ID="lblStudCourse" runat="server" Text="Course"></asp:Label>
                         <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT * FROM [Course]"></asp:SqlDataSource>
                     <asp:DropDownList ID="DropDownList1" runat="server" DataSourceID="SqlDataSource1" DataTextField="CourseCode" DataValueField="CourseCode"></asp:DropDownList>
                         <br />
                         <asp:Label ID="lblStudEmail" runat="server" Text="E-mail"></asp:Label>
                         <asp:TextBox ID="txtStudEmail" runat="server" Text='<%# Eval("stuemail") %>' />
               <asp:RequiredFieldValidator ID="EmailRequired" runat="server" ControlToValidate="txtStudEmail" ForeColor="Red" ErrorMessage="Email is required." ToolTip="Student Email is required.">
                           *Student Email is required</asp:RequiredFieldValidator>
                         <asp:RegularExpressionValidator ID="regexEmailValid" runat="server" ValidationExpression="\w+([-+.]\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*" ControlToValidate="txtStudEmail" ErrorMessage="Invalid Email Format"></asp:RegularExpressionValidator>
                         <br />
                         <asp:Label ID="lblStudHpNo" runat="server" Text="Telephone Number"></asp:Label>
                         <asp:TextBox ID="txtStudHpNo" runat="server" Text='<%# Eval("stuhpNo") %>' />
                   <asp:RequiredFieldValidator ID="HpNoRequired" runat="server" ControlToValidate="txtStudHpNo" ForeColor="Red" ErrorMessage="Handphone NO is required." ToolTip="Student Email is required.">
                           *Handphone No is required</asp:RequiredFieldValidator>
                               <asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server" ErrorMessage="Enter valid Phone number" ControlToValidate="txtStudHpNo" 
                           ValidationExpression="\d{10,11}" ></asp:RegularExpressionValidator> 
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


                                    
                     <br />
                     <br />

                     
                    
                     <asp:Button ID="btnEdit" runat="server" CommandName="edit" Text="Edit" EnableTheming="True" OnClick="btnEdit_Click" OnCommand="btnEdit_Command" />
                     <br />
                     <asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl="~/realchangepassword.aspx">Reset Password?</asp:HyperLink>
                     
                     
                 </ItemTemplate>
             </asp:DataList>
        
    </div>