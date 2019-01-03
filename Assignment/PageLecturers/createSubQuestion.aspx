<%@ Page Language="C#" MasterPageFile="~/LayoutPage.Master" AutoEventWireup="true" CodeBehind="createSubQuestion.aspx.cs" Inherits="Assignment.createSubQuestion" %>

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

        .tblOptions tr {
            padding: 8px;
            text-align: left;
            C: \OnlineAssessment\Assignment\PageLecturers\createSubQuestion.aspx border-bottom: 1px solid #ddd;
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

    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
    <script>
        function showpreview(input,id) {

            if (input.files[0]) {
                var reader = new FileReader();
                //var image = document.getElementById("%=dl_question.FindControl("Image1").ClientID%>");
                var str = id.substring(0, 32) + "Image" + id.substring(42, id.length);
                console.log(id);
                console.log(id.length);
                console.log(id.substring(43,id.length - 1));
                console.log(str);
                reader.onload = function (e) {
                    $("#"+str).css('visibility', 'visible');
                    $("#"+str).attr('src', e.target.result);
                }
                reader.readAsDataURL(input.files[0]);
            }
        }

        function showpreview2(input,id) {

            if (input.files[0]) {
                var reader = new FileReader();
                //var image = document.getElementById("%=dl_question.FindControl("Image1").ClientID%>");
                var str = id.substring(0, 27) + "Image" + id.substring(37, id.length);
                console.log(id);
                console.log(id.length);
                console.log(id.substring(38,id.length - 1));
                console.log(str);
                reader.onload = function (e) {
                    $("#"+str).css('visibility', 'visible');
                    $("#"+str).attr('src', e.target.result);
                }
                reader.readAsDataURL(input.files[0]);
            }
        }
    </script>


<br /> <br /><br /><br />
    <h2><b>Create Subjective Question</b></h2>
    <h4><b>
        <asp:Label ID="Label2" runat="server" ></asp:Label>
    </b></h4>
        <div>
             <asp:DataList ID="dl_question" runat="server" OnItemCommand="DataList1_ItemCommand" >
             <EditItemTemplate>
             <table id='<%#Eval("questionId") %>' class="tableclass">
                      <tr>
                      <td class="question"><b>Question  <%#Container.ItemIndex+1%>: <asp:TextBox ID="tbDesc" runat="server" Text='<%#Eval("questionDesc") %>'></asp:TextBox>
                           <asp:RequiredFieldValidator runat="server" id="RequiredFieldValidator4" controltovalidate="tbDesc" forecolor="Red" errormessage="Question cannot be blank!" /></b>
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
                                                                                        <asp:Image ID="Image1" runat="server" height="25%" width="25%" Visible='<%#Eval("Image")!=DBNull.Value %>' ImageUrl='<%#(Eval("Image")!=DBNull.Value)?"data:Image/jpg;base64,"+Convert.ToBase64String((byte[])Eval("Image")):"~/Image/brain1.png" %>'/>
                                                                                        <asp:FileUpload ID="FileUpload1" runat="server" onchange="showpreview(this,this.id)"/> <br />
                                                                                        <asp:Label ID="Label1" runat="server"></asp:Label>
                                                                                    </td>
                                                                                </tr>
                                                                                <tr>
                                                                                    <td>
                                                                                        Sample Answer:<asp:TextBox ID="tbAnswer" runat="server" Text='<%#Eval("SampleAns") %>' Width="90%"></asp:TextBox>
                                                                                        <asp:RequiredFieldValidator runat="server" id="RequiredFieldValidator1" controltovalidate="tbAnswer" forecolor="Red" errormessage="Sample Answer cannot be blank!" />
                                                                                    </td>
                                                                                </tr>
                                                             
                                                                                <tr>
                                                                                    <td>  <asp:Button CssClass="button" ID="btnUpdate" runat="server" Text="Update" CommandName="Update"/> 
                                                                                        <asp:Button CssClass="button" ID="btnDelete" runat="server" CommandName="Delete" Text="Delete" />
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
                                                            <td class="question"><b>Question <%#Container.ItemIndex+1 %>: <%#Eval("questionDesc") %></b>
                                                                <asp:HiddenField ID="hdnquestionId" Value='<%#Eval("questionId") %>' runat="server" />
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
                                                                                        <asp:Image ID="Image1" runat="server" height="25%" width="25%" Visible='<%#Eval("Image")!=DBNull.Value %>' ImageUrl='<%#(Eval("Image")!=DBNull.Value)?"data:Image/jpg;base64,"+Convert.ToBase64String((byte[])Eval("Image")):"~/Image/brain1.png" %>'  />
                                                                                            
                                                                                    </td>
                                                                                </tr>
                                                                                <tr>
                                                                                    <td>
                                                                                        Sample Answer:<asp:Label ID="lblAnswer" runat="server" Text='<%#Eval("SampleAns") %>'></asp:Label>
                                                                                    </td>
                                                                                </tr>
                                                             
                                                                                <tr>
                                                                                    <td>
                                                                                        <asp:Button CssClass="button" ID="btnEdit" runat="server" Text="Edit" CommandName="Edit"/>
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
           
            <asp:FormView ID="fv_add" runat="server" OnItemInserting="fv_add_ItemInserting">
          
                <InsertItemTemplate>
                           <table>
                      <tr>
                      <td class="question"><b>Question: <asp:TextBox ID="tbNewDesc" runat="server" width="90%"></asp:TextBox>
                            <asp:RequiredFieldValidator runat="server" id="RequiredFieldValidator2" controltovalidate="tbNewDesc" forecolor="Red" errormessage="Question cannot be blank!" />
                                           </b>
                       
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
                                                              
                                                              <asp:Image ID="Image2" runat="server" height="25%" width="25%" Visible='<%#Eval("Image")!=DBNull.Value %>' />
                                                              <asp:FileUpload ID="FileUpload2" runat="server" onchange="showpreview2(this,this.id)"/><br />
                                                              
                                                          </td>
                                                      </tr>
                                                                                <tr>
                                                                                    <td>
                                                                                        Sample Answer:<asp:TextBox ID="tbNewAnswer" runat="server"></asp:TextBox>
                                                                                         <asp:RequiredFieldValidator runat="server" id="RequiredFieldValidator1" controltovalidate="tbNewAnswer" forecolor="Red" errormessage="Sample Answer cannot be blank!" />
                                                                                    </td>
                                                                                </tr>
                                                             
                                                                                <tr>
                                                                                    <td>  <asp:Button CssClass="button" ID="btnInsert" runat="server" Text="Add Question" OnClick="btnInsert_Click" CommandName="Insert" />
                                                                                        
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
             <br />
            <div id="below">
             <asp:Button CssClass="button" ID="btnAdd" runat="server" Text="Add More Question" CommandName="Add" OnClick="btnAdd_Click" />
            <asp:Button CssClass="button" ID="Button2" runat="server" Text="Done" OnClick="Button2_Click" />
            </div>
        </div>
</asp:Content>
