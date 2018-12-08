<%@ Page Language="C#"  MasterPageFile="~/LayoutPage.Master" AutoEventWireup="true" CodeBehind="markPaper.aspx.cs" Inherits="Assignment.markPaper" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <style type="text/css">
        .auto-style1 {
            width: 100%;
        }
        .auto-style4 {
            width: 137px;
        }
        .auto-style6 {
            width: 137px;
            height: 64px;
        }
        .auto-style7 {
            width: 163px;
        }
        .auto-style8 {
            width: 163px;
            height: 64px;
        }
        .button{
            background-color:#B3E5FC;
            border:none;
            padding: 10px 15px;
            text-align:center;
            text-decoration:none;
            display:inline-block;
            font-size:16px;
            margin: 4px 2px;
            cursor:pointer;
        }
        th {
            background-color:#B0BEC5;
        }
        #middle{
            text-align:center;
            width:60%;
            margin-left:auto;
            margin-right:auto;
        }

        #below{
            text-align:center;
            width:60%;
            margin-left:auto;
            margin-right:auto;
            margin-bottom:5%;
        }
        .auto-style9 {
            margin-right: 334px;
        }
    </style>
    <br /><br /><br /><br />
        <div id="middle">
            <asp:DataList ID="DataList1" runat="server" OnSelectedIndexChanged="DataList1_SelectedIndexChanged"  CssClass="auto-style9" Width="718px">
                <ItemTemplate>
                    <table class="auto-style1">
                        <tr>
                            <th class="auto-style7"><b>Question  <%# Container.ItemIndex + 1 %> : <%#Eval("questionDesc") %></b></th>
                            <th class="auto-style4"><asp:HiddenField ID="hdnquestionId" Value='<%#Eval("questionId") %>' runat="server" /></th>
                        </tr>
                        <tr>
                            <td class="auto-style7">SampleAnswer</td>
                            <td class="auto-style4">Student Answer</td>
                        </tr>
                        <tr>
                            <td class="auto-style7">
                                <asp:Label ID="lbSampleAns" runat="server" Text='<%#Eval("sampleAns")%>'></asp:Label>
                            </td>
                            <td class="auto-style4">
                                <asp:Label ID="lbStuAns" runat="server" Text='<%#Eval("studAns") %>'></asp:Label>
                            </td>
                        </tr>
                        <tr>
                            <td class="auto-style8">Mark<asp:TextBox ID="tbmark" runat="server"></asp:TextBox>
                                /5</td>
                            <td class="auto-style6">Remark:<asp:TextBox ID="tbRemark" runat="server"></asp:TextBox>
                            </td>
                        </tr>
                        <tr>
                            <td class="auto-style8">
                                &nbsp;</td>
                            <td class="auto-style6">&nbsp;</td>
                        </tr>
                    </table>
                </ItemTemplate>
            </asp:DataList>
            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="Select ql.questionID,questionDesc,sampleAns,studAns
from question q,questionList ql
where stuId=@stuID and q.setID=@setID and ql.questionID=q.questionID" OnUpdating="SqlDataSource1_Updating" UpdateCommand="UPDATE questionList
SET mark=@mark,remarks=@remarks,lecId=@lecID
where questionid=@questionid and stuId=@stuID  
" OnUpdated="SqlDataSource1_Updated1" OnSelecting="SqlDataSource1_Selecting" >
                <SelectParameters>
                    <asp:QueryStringParameter DefaultValue="" Name="setID" QueryStringField="SETID" />
                    <asp:QueryStringParameter DefaultValue="" Name="stuID" QueryStringField="STUID" />
                    
                </SelectParameters>
                <UpdateParameters>
                    <asp:Parameter Name="mark" />
                    <asp:Parameter Name="remarks" />
                    <asp:Parameter Name="lecID" />

                    <asp:Parameter Name="questionid" />
                    <asp:Parameter Name="stuID" />
                    <asp:Parameter Name="setID" />

                </UpdateParameters>
            </asp:SqlDataSource>
            </div>
            <div id="below">
&nbsp;<asp:Button CssClass="button" ID="btnSubmit" runat="server" Text="Submit" OnClick="btnSubmit_Click" />
                            </div>

</asp:Content>