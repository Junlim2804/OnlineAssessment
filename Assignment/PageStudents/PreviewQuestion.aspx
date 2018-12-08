<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="PreviewQuestion.aspx.cs" Inherits="Assignment.PreviewQuestion" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title></title>
    <script src="http://ajax.googleapis.com/ajax/libs/jquery/1.7/jquery.min.js" type="text/javascript"></script>

</head>
<body oncontextmenu="return false"  style=" background: #cccca0;">
    <form id="form1" runat="server">
        <asp:ScriptManager ID="ScriptManger" runat="server"></asp:ScriptManager>

        <div style="background: #ddffca;margin:0 auto; width:1000px;">
         
                    <table style="width: 100%;">
                        <%--<tr>--%>
                        </tr>
                        <tr>
                            <td>

                                <table style="width: 100%;">
                                    <tr>
                                        <td style="float: left;">
                                            <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                                            </asp:UpdatePanel>
                                        </td>
                                        <td style="float: right; background-color: yellow; color: black;"><b><span id="lbresult"></span></b></td>
                                    </tr>
                                </table>

                            </td>
                            <tr>
                                <td>
                                    <asp:GridView ID="grdquestions" runat="server" AutoGenerateColumns="false" DataKeyNames="QuestionId" Width="100%">
                                        <Columns>
                                            <asp:TemplateField HeaderText="Asp .Net Online Test">
                                                <ItemTemplate>
                                                    <table id='<%#Eval("questionId") %>' class="tableclass">
                                                        <tr>
                                                            <td><b>Question  <%# Container.DataItemIndex + 1 %>: <%#Eval("questionDesc") %></b>
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
                                                                                    <td class="auto-style1">
                                                                                        <asp:HiddenField ID="csAns" Value='<%#Eval("sampleAns") %>' runat="server" />
                                                                                        <asp:RadioButton ID="rdOption1" runat="server" GroupName='<%#Eval("QuestionId") %>' Enabled="false" Text='<%#Eval("Option1") %>' />
                                                                                    </td>
                                                                                </tr>
                                                                                <tr>
                                                                                    <td class="auto-style1">
                                                                                        <asp:RadioButton ID="rdOption2" runat="server" GroupName='<%#Eval("QuestionId") %>' Enabled="false" Text='<%#Eval("Option2") %>' />
                                                                                    </td>
                                                                                </tr>
                                                                                <tr>
                                                                                    <td class="auto-style1">
                                                                                        <asp:RadioButton ID="rdOption3" runat="server" GroupName='<%#Eval("QuestionId") %>' Enabled="false" Text='<%#Eval("Option3") %>' />
                                                                                    </td>
                                                                                </tr>
                                                                                <tr>
                                                                                    <td class="auto-style1">
                                                                                        <asp:RadioButton ID="rdOption4" runat="server" GroupName='<%#Eval("QuestionId") %>' Enabled="false" Text='<%#Eval("Option4") %>' />
                                                                                    </td>
                                                                                </tr>
                                                                                
                                                                                <tr>
                                                                                    <td class="auto-style1">
                                                                                        <asp:TextBox ID="tbAnswer" runat="server" Visible="False" Text='<%#Eval("studAns") %>'></asp:TextBox>
                                                                                    </td>
                                                                                </tr>
                                                                                
                                                                                <tr>
                                                                                    <td class="auto-style1">
                                                                                        <asp:Label ID="lbquestionstatus" runat="server"></asp:Label>
                                                                                            <asp:Label ID="lblMark" runat="server" Text='<%# Eval("mark") %>' Visible="False"></asp:Label>
                                                                                    </td>
                                                                                </tr>
                                                                                <tr>
                                                                                    
                                                                                    <td class="correctAnswer"> <asp:HiddenField ID="hdnStudans" Value='<%#Eval("studAns") %>' runat="server" />Correct Answer Is -:  <asp:Label ID="lbAnswer" runat="server" Text='<%#Eval("sampleAns") %>'></asp:Label>

                                                                                       
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
                                            </asp:TemplateField>
                                        </Columns>
                                    </asp:GridView>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    &nbsp;</td>
                            </tr>
                        </tr>
                    </table>
     
            <script>
                    function CheckAll() {
                    var numItems = $('.tblOptions').length;
                    var flagtocheckcount = 0;
          

                    
                        var CountFinalResult = 0;
                        $(".tblOptions").each(function () {
                            var groupname = $('input[type=radio]:first', this).attr('name');
                            var radioId = $("input[name='" + groupname + "']:checked").attr("id")
                            var UserSelectedAnswer = $("label[for='" + radioId + "']").text();
                       
                            var CorrectAnswer = $('span:last-child', this).text();
                            CorrectAnswer = CorrectAnswer[4];
                           
                                                  
                            
                            var CorrectAnswerSpanId = $('span:last-child', this).attr("id");
                            var QuestionStatus = $("span:nth-last-child(1)", this).attr("id");

                            if (CorrectAnswer == UserSelectedAnswer) {
                                
                                $("#" + QuestionStatus).text("Correct Answer").css("color", "green");
                                $('td.correctAnswer').find("td.correctAnswer", this).css("display", "none");
                                CountFinalResult = CountFinalResult + 1;
                            }
                            else {
                                //$('table.tblOptions tbody tr td:last-child').addClass("incorrect");
                                $('span:last-child', this).css({ 'display': 'inline-flex' });
                                $("#" + QuestionStatus).text("InCorrect Answer").css({ 'color': 'Red' });
                                $('td.correctAnswer', this).css({ "display": "block", "background-color": "yellow", "color": "red" });

                            }
                        });
                        $("#lbresult").text("Final Result-:" + CountFinalResult + "/20");
                       
                        $("input[type=radio]").attr('disabled', true); //disable all radio button after test submitted by user
                        
                    
                 
                }

                </script>

            <style>
                .border {
                    border-color: red;
                    border-width: 2px;
                    border-style: solid;
                    width: 100%;
                }

                .correctAnswer {
                    display: none;
                    width: 950px!important;
                }

                .tblOptions {
                    width: 100%;
                }

                .btn {
                    background: #000000;
                    background-image: -webkit-linear-gradient(top, #000000, #2980b9);
                    background-image: -moz-linear-gradient(top, #000000, #2980b9);
                    background-image: -o-linear-gradient(top, #000000, #2980b9);
                    background-image: linear-gradient(to bottom, #000000, #2980b9);
                    -webkit-border-radius: 0;
                    -moz-border-radius: 0;
                    border-radius: 6px;
                    font-family: Arial;
                    color: #ffffff;
                    font-size: 19px;
                    padding: 3px 20px;
                    text-decoration: none;
                }

                .btn:hover {
                    background: #261c61;
                    background-image: -webkit-linear-gradient(top, #261c61, #3498db);
                    background-image: -moz-linear-gradient(top, #261c61, #3498db);
                    background-image: -o-linear-gradient(top, #261c61, #3498db);
                    background-image: linear-gradient(to bottom, #261c61, #3498db);
                    text-decoration: none;
                    cursor: pointer;
                }

                .btndiabled {
                    background: #bdb3bd;
                    background-image: -webkit-linear-gradient(top, #bdb3bd, #757575);
                    background-image: -moz-linear-gradient(top, #bdb3bd, #757575);
                    background-image: -o-linear-gradient(top, #bdb3bd, #757575);
                    background-image: linear-gradient(to bottom, #bdb3bd, #757575);
                    -webkit-border-radius: 0;
                    -moz-border-radius: 0;
                    border-radius: 6px;
                    font-family: Arial;
                    color: #ffffff;
                    font-size: 19px;
                    padding: 3px 20px;
                    text-decoration: none;
                    cursor: none;
                }
                .auto-style1 {
                    width: 197px;
                }
            </style>
        </div>
    </form>
</body>
</html>