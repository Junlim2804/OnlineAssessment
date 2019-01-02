<%@ Page Language="C#" MasterPageFile="~/LayoutPage.Master" AutoEventWireup="true" CodeBehind="LecturerShow.aspx.cs" Inherits="Assignment.LecturerShow" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <link rel="stylesheet" type="text/css" href="../CSS/Student.css">
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
 <span class="w3-jumbo w3-animate-top">Mark Paper</span><br> </div>

</div> 
 </header>


  <nav>
    <div class="sidenav">
        <ul>
     
<asp:HyperLink ID="hpPersonalInfo" runat="server" NavigateUrl="../PersonalInformation.aspx">Personal Information</asp:HyperLink>
<asp:HyperLink ID="hpSet" runat="server" NavigateUrl="~/PageLecturers/ShowSetList.aspx">Create Examination Set</asp:HyperLink>
<asp:HyperLink ID="HyperLink2" runat="server" NavigateUrl="~/PageLecturers/LecturerShow.aspx">Mark Paper</asp:HyperLink>     

    </ul>

    </div>
  </nav>

     <div class="infobox">
         <h2><b>Assessment Set</b></h2>
             <asp:DataList ID="DataList1" runat="server"  CellSpacing="4" CellPadding="4" RepeatColumns="3" RepeatDirection="Horizontal" DataKeyField="setID" DataSourceID="SqlDataSource1" 
                 BackColor="White" BorderColor="#3366CC" BorderStyle="None" BorderWidth="1px" GridLines="Both" width="80%" OnItemCommand="DataList1_ItemCommand">
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
                 <!----<asp:Button ID="markBtn" runat="server" Text="Mark Paper" CommandName="Mark"/>
                 <br />--->
                 <asp:Button ID="viewDetailsBtn" runat="server" Text="View Details" CommandName="View"/>
                 <br />
             </ItemTemplate>
         </asp:DataList>
    </div>


    
    <div id="grid" >
        <h2><b>Students Results</b></h2>
        
    <table class="auto-style3"  style="margin-left:30%">
        <tr>
            <td>
                <asp:Label ID="Label1" runat="server" ></asp:Label>
        <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataKeyNames="stuID,setID" OnSelectedIndexChanged="GridView1_SelectedIndexChanged" Width="478px" AllowPaging="True" AllowSorting="True" DataSourceID="SqlDataSource3">
            <Columns>
                <asp:CommandField ShowSelectButton="True" />
                <asp:BoundField DataField="setID" HeaderText="SetID" ReadOnly="True" SortExpression="setID" />
                <asp:BoundField DataField="stuID" HeaderText="StuID" ReadOnly="True" SortExpression="stuID" />
                <asp:BoundField DataField="mark" HeaderText="Mark" SortExpression="mark" />
            </Columns>
        </asp:GridView>
                </td>
            </tr>
        </table>
        </div>
    
        <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT [subjectID], [subjectName] FROM [subject]"></asp:SqlDataSource>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT p.setID, p.subjectID, p.type, p.duration, p.mode, p.available FROM paperset AS p INNER JOIN subject AS s ON p.subjectID = s.subjectID INNER JOIN lecturer AS l ON s.CourseCode = l.teachCourse WHERE l.lecId = @personID">
            <SelectParameters>
                <asp:SessionParameter Name="personID" SessionField="username" />
            </SelectParameters>
        </asp:SqlDataSource>
        <asp:SqlDataSource ID="SqlDataSource3" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT * FROM [StudentSetList] WHERE ([setID] = @setID)">
            <SelectParameters>
                <asp:SessionParameter Name="setID" SessionField="setID" />
            </SelectParameters>
            
        </asp:SqlDataSource>
        <br />
        
</asp:Content>