<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="questionSet.aspx.cs" Inherits="Assignment.questionSet" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title></title>
    <script src="http://ajax.googleapis.com/ajax/libs/jquery/1.7/jquery.min.js" type="text/javascript"></script>

</head>
<body oncontextmenu="return false" style=" background: #cccca0;">
    <form id="form1" runat="server">
        <asp:ScriptManager ID="ScriptManger" runat="server"></asp:ScriptManager>

        <div style="background: #ddffca;margin:0 auto; width:1000px;">
         
                    <table style="width: 100%;">
                        <tr>
                            <td>

                                <table style="width: 100%;">
                                    <tr>
                                        <td style="float: left;">
                                            <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                                                <ContentTemplate>
                                                    <asp:Timer ID="Timer1" runat="server" Interval="1000" OnTick="Timer1_Tick">
                                                    </asp:Timer>
                                                    <asp:Label ID="TimeLabel" runat="server"></asp:Label>
                                                </ContentTemplate>
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
                                                                
                                                                <br />
                                                            </td>
                                                        </tr>
                                                        <tr><td><asp:Image ID="Image1" runat="server" height="25%" width="25%" Visible='<%#Eval("Image")!=DBNull.Value %>' ImageUrl='<%#(Eval("Image")!=DBNull.Value)?"data:Image/jpg;base64,"+Convert.ToBase64String((byte[])Eval("Image")):"~/Image/brain1.png" %>'/></td></tr>
                                                        <tr>
                                                            <td>
                                                                <table>
                                                                    <tr>
                                                                        <td>
                                                                            <table class="tblOptions">
                                                                                <tr>
                                                                                    <td class="auto-style1">
                                                                                        <asp:RadioButton ID="rdOption1" runat="server" GroupName='<%#Eval("QuestionId") %>' Text='<%#Eval("Option1") %>' />
                                                                                    </td>
                                                                                </tr>
                                                                                <tr>
                                                                                    <td class="auto-style1">
                                                                                        <asp:RadioButton ID="rdOption2" runat="server" GroupName='<%#Eval("QuestionId") %>' Text='<%#Eval("Option2") %>' />
                                                                                    </td>
                                                                                </tr>
                                                                                <tr>
                                                                                    <td class="auto-style1">
                                                                                        <asp:RadioButton ID="rdOption3" runat="server" GroupName='<%#Eval("QuestionId") %>' Text='<%#Eval("Option3") %>' />
                                                                                    </td>
                                                                                </tr>
                                                                                <tr>
                                                                                    <td class="auto-style1">
                                                                                        <asp:RadioButton ID="rdOption4" runat="server" GroupName='<%#Eval("QuestionId") %>' Text='<%#Eval("Option4") %>' />
                                                                                    </td>
                                                                                </tr>
                                                                                <tr>
                                                                                    <td class="auto-style1">Answer:<asp:TextBox ID="tbAns" runat="server" Visible="False"></asp:TextBox>
                                                                                    </td>
                                                                                </tr>
                                                                                <tr>
                                                                                    <td class="auto-style1">
                                                                                        <asp:Label ID="lbquestionstatus" runat="server"></asp:Label>
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
                                    <asp:Button ID="btnSubmit" runat="server" CssClass="btn" OnClick="CheckQuestion" OnClientClick="return CheckIfAllQuestionAnswerHasBeenSubmitted()" Text="Submit" />
                                   
                                </td>
                            </tr>
                        </tr>
                    </table>
     

            <script>
               
                function CheckIfAllQuestionAnswerHasBeenSubmitted() {

                     var confirmation = confirm("ARE YOU CONFIRM TO SUBMIT??");
                        if (confirmation == true) {  

                            window.opener.location.href = "../PersonalInformation.aspx";
                            return true;
                        }                 
                   
                    var numItems = $('.tblOptions').length;
                    var flagtocheckcount = 0;
                    $(".tblOptions").each(function () {
                        var groupname = $('input[type=radio]:first', this).attr('name');
                        if (!$("input[name='" + groupname + "']:checked").val()) {
                            $(this).parents(".tableclass").addClass("border");
                            var tableid = $(this).closest('table [class^="tableclass"]').attr("id");
                        }
                        else {
                            flagtocheckcount = flagtocheckcount + 1;
                        }
                    })
                  var chatinput = document.getElementById("tbAns").value;
                    if (parseInt(flagtocheckcount) == parseInt(numItems)) {
                        var confirmation = confirm("ARE YOU CONFIRM TO SUBMIT??");
                        if (confirmation == true) {  

                            window.opener.location.href = "../PersonalInformation.aspx";
                            return true;
                        }                          
                        else
                        return false;
                    }
                    else
                    {
                        return false;
                    }
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


