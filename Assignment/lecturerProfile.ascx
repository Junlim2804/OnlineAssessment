<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="lecturerProfile.ascx.cs" Inherits="Assignment.lecturerProfile" %>

      <div class="infobox">
   
             <asp:DataList ID="DataList1" runat="server" DataKeyField="lecId" OnItemCommand="DataList1_ItemCommand" OnSelectedIndexChanged="DataList1_SelectedIndexChanged"  >
                <EditItemTemplate>
                   
                         <asp:Label ID="lblLecId" runat="server" Text="Lecturer ID"></asp:Label>
                         <asp:TextBox ID="txtLecId" runat="server"  Text='<%# Eval("lecId") %> ' Enabled="False"  />
                         <br />
                         <asp:Label ID="lblLecName" runat="server" Text="Name"></asp:Label>
                         <asp:TextBox ID="txtLecName" runat="server" Text='<%# Eval("lecname") %>' />
                        <asp:RequiredFieldValidator ID="NameRequired" runat="server" ControlToValidate="txtLecName" ForeColor="Red" ErrorMessage="Lecturer Name is required." ToolTip="Student Name is required.">
                           *Lecturer Name is required</asp:RequiredFieldValidator>
                            <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" forecolor="Red"  ErrorMessage="Enter only characters!" ControlToValidate="txtLecName" 
                           ValidationExpression="^[a-zA-Z\s]+$" ></asp:RegularExpressionValidator> 
                         <br />
                          <asp:Label ID="lblLecCourse" runat="server" Text="Course"></asp:Label>
                         <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT * FROM [Course]"></asp:SqlDataSource>
                         <asp:DropDownList ID="DropDownList1" runat="server" DataSourceID="SqlDataSource1" DataTextField="CourseCode" DataValueField="CourseCode" Enabled="False" SelectedValue='<%# Eval("teachCourse") %>' ></asp:DropDownList>
                    <br />
                         <asp:Label ID="lblLecEmail" runat="server" Text="E-mail"></asp:Label>
                         <asp:TextBox ID="txtLecEmail" runat="server" Text='<%# Eval("lecemail") %>' />
                       <asp:RequiredFieldValidator ID="EmailRequired" runat="server" ControlToValidate="txtLecEmail" ForeColor="Red" ErrorMessage="Email is required." ToolTip="Student Email is required.">
                           *Lecturer Email is required</asp:RequiredFieldValidator>
                         <asp:RegularExpressionValidator ID="regexEmailValid" runat="server" ValidationExpression="\w+([-+.]\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*" ControlToValidate="txtLecEmail" ErrorMessage="Invalid Email Format"></asp:RegularExpressionValidator>
                        <br />
                         <asp:Label ID="lblLecHpNo" runat="server" Text="Telephone Number"></asp:Label>
                         <asp:TextBox ID="txtLecHpNo" runat="server" Text='<%# Eval("lechpNo") %>' />
                                       <asp:RequiredFieldValidator ID="HpNoRequired" runat="server" ControlToValidate="txtLecHpNo" ForeColor="Red" ErrorMessage="Handphone No is required." ToolTip="Student Email is required.">
                           *Handphone No is required</asp:RequiredFieldValidator>
                           <asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server" ErrorMessage="Enter valid Phone number" ControlToValidate="txtLecHpNo" 
                           ValidationExpression="\d{10,11}" ></asp:RegularExpressionValidator> 
                         <br />

                         <asp:Button ID="btnEdit" runat="server" CommandName="update" Text="Update"/>
                         &nbsp;<asp:Button ID="Button2" runat="server" CommandName="cancel" Text="Cancel" />
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
                                        
                     <asp:Label ID="lblLecCourse" runat="server" Text="Course"></asp:Label>
                     <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT * FROM [Course]"></asp:SqlDataSource>
                      <asp:Textbox ID="tbCode" runat="server" Text='<%# Eval("teachCourse") %>' Enabled="False" ></asp:Textbox>
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