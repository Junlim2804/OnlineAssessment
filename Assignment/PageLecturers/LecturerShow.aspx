<%@ Page Language="C#" MasterPageFile="~/LayoutPage.Master" AutoEventWireup="true" CodeBehind="LecturerShow.aspx.cs" Inherits="Assignment.LecturerShow" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <link rel="stylesheet" type="text/css" href="CSS/Student.css">
    <style type="text/css">


        table{
            border-collapse:collapse;
            width:60%;
        }
        th, td{
            text-align:center;
            padding:8px;
        }
        #upper{
            width:60%;
            margin-left:auto;
            margin-right:auto;
            text-align:center;
        }
        #grid{
            width:60%;
            margin-left:auto;
            margin-right:auto;
            text-align:center;
        }

        .auto-style3 th{
            background-color:#1A237E;
            color:white;
        }
    </style>

        <br /><br /><br /><br />
        
        <br />

             <asp:DataList ID="DataList1" runat="server"  CellSpacing="4" CellPadding="4" RepeatColumns="3" DataKeyField="setID" DataSourceID="SqlDataSource1" BackColor="White" BorderColor="#3366CC" BorderStyle="None" BorderWidth="1px" GridLines="Both" width="80%">
             <FooterStyle BackColor="#99CCCC" ForeColor="#003399" />
             <HeaderStyle BackColor="#003399" Font-Bold="True" ForeColor="#CCCCFF" />
             <ItemStyle BackColor="White" ForeColor="#003399" />
             <ItemTemplate>
                 setID:
                 <asp:Label ID="setIDLabel" runat="server" Text='<%# Eval("setID") %>' />
                 <br />
                 mode:
                 <asp:Label ID="modeLabel" runat="server" Text='<%# Eval("mode") %>' />
                 <br />
                 duration:
                 <asp:Label ID="durationLabel" runat="server" Text='<%# Eval("duration") %>' />
                 <br />
                 subjectID:
                 <asp:Label ID="subjectIDLabel" runat="server" Text='<%# Eval("subjectID") %>' />
                 <br />
                 type:
                 <asp:Label ID="typeLabel" runat="server" Text='<%# Eval("type") %>' />
                 <br />
                 <asp:Button ID="markBtn" runat="server" Text="Mark Paper" OnClick="markBtn_Click"/>
                 <br />
                 <asp:Button ID="resultBtn" runat="server" Text="View Result" OnClick="resultBtn_Click"/>
                 <br />
             </ItemTemplate>
             <SelectedItemStyle BackColor="#009999" Font-Bold="True" ForeColor="#CCFF99" />
         </asp:DataList>





    
    <div id="grid" >
        <h2><b>Students Results</b></h2>
        
    <table class="auto-style3" style="align-content:center">
        
        <tr>

            <td>
        <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataKeyNames="stuID,setID" DataSourceID="SqlDataSource3" OnSelectedIndexChanged="GridView1_SelectedIndexChanged" Width="478px">
            <Columns>
                <asp:CommandField ShowSelectButton="True" />
                <asp:BoundField DataField="stuID" HeaderText="StuID" ReadOnly="True" SortExpression="stuID" />
                <asp:BoundField DataField="setID" HeaderText="SetID" ReadOnly="True" SortExpression="setID" />
                <asp:BoundField DataField="mark" HeaderText="Mark" SortExpression="mark" />
            </Columns>
        </asp:GridView>
                </td>
            </tr>
        </table>
        </div>
        <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT [subjectID], [subjectName] FROM [subject]"></asp:SqlDataSource>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT p.setID, p.mode, p.duration, p.subjectID, p.type FROM paperset AS p INNER JOIN subject AS s ON p.subjectID = s.subjectID WHERE (s.CourseCode = 'RSF')">
        </asp:SqlDataSource>
        <asp:SqlDataSource ID="SqlDataSource3" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT * FROM [StudentSetList] WHERE ([setID] = @setID)">
            <SelectParameters>
                <asp:ControlParameter ControlID="ddlSet" Name="setID" PropertyName="SelectedValue" Type="Int32" />
            </SelectParameters>
        </asp:SqlDataSource>
        <br />
        
</asp:Content>