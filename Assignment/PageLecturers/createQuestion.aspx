<%@ Page Language="C#" MasterPageFile="~/LayoutPage.Master" AutoEventWireup="true" CodeBehind="createQuestion.aspx.cs" Inherits="Assignment.createQuestion" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <style type="text/css">

        table {
            border-collapse: collapse;
            width: 85%;
            margin-left:auto;
            margin-right:auto;
        }

        #below{
            text-align: center;
            margin:0 auto;
            margin-bottom:5%;
        }

        th, td {
            padding: 8px;
            text-align: left;
        }

        .tblOptions tr{
            padding: 8px;
            text-align: left;
            border-bottom: 1px solid #ddd;
        }

        .question {background-color:#B0BEC5;}

        .button {
            background-color:#B0BEC5;
            border: none;
            padding: 10px 15px;
            text-align: center;
            text-decoration: none;
            display: inline-block;
            font-size: 16px;
            margin: 4px 2px;
            cursor: pointer;
        }


        .tblOptions tr:hover {background-color:#f5f5f5;}

    </style>

<br /> <br /><br /><br />
    <h2><b>Create Objective Question</b></h2>
        <div>
        <asp:DataList ID="dl_question" runat="server" OnSelectedIndexChanged="dl_question_SelectedIndexChanged" OnItemCommand="DataList1_ItemCommand">
             
            <EditItemTemplate>
            <table id='<%#Eval("questionId") %>' class="tableclass">
                <tr>
                  <td class="question"><b>Question  <%#Eval("indexNo")  %>: <asp:TextBox ID="tbDesc" runat="server" Text='<%#Eval("questionDesc") %>' width="90%"></asp:TextBox></b>
                  <asp:HiddenField ID="hdnquestionId" Value='<%#Eval("questionId") %>' runat="server" />
                  </td>
                </tr>
                <tr>
                  <td>
                      <table>
                          <tr>
                              <td class="auto-style1">
                                  <table class="tblOptions">
                                      <tr>
                                          <td>
                                              
                                              <br />
                                              <asp:FileUpload ID="FileUpload1" runat="server" />
                                              <asp:Button CssClass="button" ID="changePic" runat="server" Text="Change Image" onClick="uploadPic_Click"/>
                                          </td>
                                      </tr>
                                      <tr>
                                          <td>Option1:<asp:TextBox ID="tbOption1" runat="server" GroupName='<%#Eval("QuestionId") %>' Text='<%#Eval("Option1") %>' />
                                          </td>
                                      </tr>
                                      <tr>
                                          <td>Option2:<asp:TextBox ID="tbOption2" runat="server" GroupName='<%#Eval("QuestionId") %>' Text='<%#Eval("Option2") %>' />
                                          </td>
                                      </tr>
                                      <tr>
                                          <td>Option3:<asp:TextBox ID="tbOption3" runat="server" GroupName='<%#Eval("QuestionId") %>' Text='<%#Eval("Option3") %>' />
                                          </td>
                                      </tr>
                                      <tr>
                                          <td>Option4:<asp:TextBox ID="tbOption4" runat="server" GroupName='<%#Eval("QuestionId") %>' Text='<%#Eval("Option4") %>' />
                                          </td>
                                      </tr>
                                      <tr>
                                          <td>Answer:<asp:TextBox ID="tbAnswer" runat="server" Text='<%#Eval("SampleAns") %>'></asp:TextBox>
                                          </td>
                                      </tr>
                                      <tr>
                                          <td><asp:Button CssClass="button" ID="btnUpdate" runat="server" Text="Update" CommandName="Update"/>
                                              <asp:Button CssClass="button" ID="btnDelete" runat="server" Text="Delete" CommandName="Delete"/>
                                              <asp:Button CssClass="button" ID="btnCancel" runat="server" Text="Cancel" CommandName="Cancel"/></td>
                                      </tr>
                                  </table>
                              </td>
                        </tr>
                      </table>
                  </td>
                </tr>
            </table>
             </EditItemTemplate>

             <ItemTemplate>
                      <table id='<%#Eval("questionId") %>' class="tableclass">
                         
                                                        <tr>
                                                            <td class="question"><b>Question  <%# Container.ItemIndex + 1 %> :<%#Eval("questionDesc") %></b><asp:HiddenField ID="hdnquestionId" Value='<%#Eval("questionId") %>' runat="server" />
                                                            </td>
                                                        </tr>
                                                        <tr>
                                                            <td>
                                                                <table>
                                                                    <tr>
                                                                        <td>
                                                                            <table class="tblOptions">
                                                                                <tr>
                                                                                    <td>
                                                                                        <asp:Image ID="Image1" runat="server" height="25%" width="25%" ImageUrl='<%#"data:Image/jpg;base64,"+Convert.ToBase64String((byte[])Eval("Image")) %>'/>
                                                                                    </td>
                                                                                </tr>
                                                                                <tr>
                                                                                    <td>
                                                                                        <asp:RadioButton ID="rdOption1" runat="server" GroupName='<%#Eval("QuestionId") %>' Text='<%#Eval("Option1") %>' Enabled="false" />
                                                                                    </td>
                                                                                </tr>
                                                                                <tr>
                                                                                    <td>
                                                                                        <asp:RadioButton ID="rdOption2" runat="server" GroupName='<%#Eval("QuestionId") %>' Text='<%#Eval("Option2") %>' Enabled="false" />
                                                                                    </td>
                                                                                </tr>
                                                                                <tr>
                                                                                    <td>
                                                                                        <asp:RadioButton ID="rdOption3" runat="server" GroupName='<%#Eval("QuestionId") %>' Text='<%#Eval("Option3") %>' Enabled="false" />
                                                                                    </td>
                                                                                </tr>
                                                                                <tr>
                                                                                    <td>
                                                                                        <asp:RadioButton ID="rdOption4" runat="server" GroupName='<%#Eval("QuestionId") %>' Text='<%#Eval("Option4") %>' Enabled="false" />
                                                                                    </td>
                                                                                </tr>
                                                                                <tr>
                                                                                    <td>
                                                                                        Answer:<asp:Label ID="lblAnswer" runat="server" Text='<%#Eval("SampleAns") %>'></asp:Label>
                                                                                    </td>
                                                                                </tr>
                                                                                <tr>
                                                                                    <td>
                                                                                        <asp:Button CssClass="button" ID="btnEdit" runat="server" Text="Edit Question" CommandName="Edit"/>
                                                                                        
                                                                                    </td>
                                                                                    
                                                                                </tr>
                                                             
                                                                            </table>
                                                                        </td>
                                                                    </tr>
                                                                </table>
                                                            </td>
                                                        </tr>
                                                    </table>
             </ItemTemplate>



        </asp:DataList>
           
            <asp:FormView ID="fv_add" runat="server" OnItemInserting="fv_add_ItemInserting1">
          
                <InsertItemTemplate>
                           <table>
                      <tr>
                      <td class="question"><b>Question  <%#Eval("indexNo")  %>: <asp:TextBox ID="tbNewDesc" runat="server" width="90%"></asp:TextBox></b>
                       
                            </td>
                                 </tr>
                                     <tr>
                                    <td>
                                      <table>
                                                 <tr>
                                                       <td class="auto-style1">
                                                  <table>
                                                      <tr>
                                          <td>
                                              <asp:FileUpload ID="FileUpload2" runat="server" />
                                              <asp:Button CssClass="button" ID="uploadPic" runat="server" Text="Insert Image" onclick="uploadPic_Click"/>
                                          </td>
                                      </tr>
                                                                                <tr>
                                                                                    <td>
                                                                                        Option1:<asp:TextBox ID="tbNewOption1" runat="server" GroupName='<%#Eval("QuestionId") %>' Text='<%#Eval("Option1") %>' />
                                                                                    </td>
                                                                                </tr>
                                                                                <tr>
                                                                                    <td>
                                                                                        Option2:<asp:TextBox ID="tbNewOption2" runat="server" GroupName='<%#Eval("QuestionId") %>' Text='<%#Eval("Option2") %>' />
                                                                                    </td>
                                                                                </tr>
                                                                                <tr>
                                                                                    <td>
                                                                                        Option3:<asp:TextBox ID="tbNewOption3" runat="server" GroupName='<%#Eval("QuestionId") %>' Text='<%#Eval("Option3") %>' />
                                                                                    </td>
                                                                                </tr>
                                                                                <tr>
                                                                                    <td>
                                                                                        Option4:<asp:TextBox ID="tbNewOption4" runat="server" GroupName='<%#Eval("QuestionId") %>' Text='<%#Eval("Option4") %>' />
                                                                                    </td>
                                                                                </tr>
                                                                                <tr>
                                                                                    <td>
                                                                                        Answer:<asp:TextBox ID="tbNewAnswer" runat="server" Text='<%#Eval("SampleAns") %>'></asp:TextBox>
                                                                                    </td>
                                                                                </tr>
                                                             
                                                                                <tr>
                                                                                    <td>  <asp:Button CssClass="button" ID="btnInsert" runat="server" Text="Add Question" OnClick="btnInsert_Click" /> 
                                                                                        </td>
                                                                                </tr>
                                                             
                                                                            </table>
                                                                        </td>
                                                                    </tr>
                                                                </table>
                                                            </td>
                                                        </tr>
                                                    </table>
                  
                </InsertItemTemplate>

            </asp:FormView>
            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT * FROM [question]"></asp:SqlDataSource>
                     <br />
            
            <br />
           <div id="below">
               <asp:Button CssClass="button" ID="Button1" runat="server" Text="Add More Question" CommandName="Add" OnClick="btnAdd_Click" />
               <asp:Button CssClass="button" ID="Button2" runat="server" Text="Done" OnClick="Button2_Click" />
           </div>
        </div>
    

</asp:Content>
