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

        <br /><br /><br /><br />
        <table id="upper" class="auto-style1">
            <tr>
                <td class="auto-style2">Subject<asp:DropDownList ID="ddlSubject" runat="server" AutoPostBack="True" DataSourceID="SqlDataSource2" DataTextField="subjectName" DataValueField="subjectID" OnSelectedIndexChanged="ddlSubject_SelectedIndexChanged">
                    </asp:DropDownList>
                </td>
                <td class="auto-style2">Set<asp:DropDownList ID="ddlSet" runat="server" AutoPostBack="True" DataSourceID="SqlDataSource1" DataTextField="setID" DataValueField="setID">
                    </asp:DropDownList>
                </td>
                <td class="auto-style2"></td>
            </tr>
            <tr>
                <td>&nbsp;</td>
                <td>&nbsp;</td>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td>&nbsp;</td>
                <td>&nbsp;</td>
                <td>&nbsp;</td>
            </tr>
        </table>
        <br />
    
    <div id="grid" >
        <h2><b>Students Results</b></h2>
        
    <table class="auto-style3"  style="margin-left:30%">
        
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
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT [setID] FROM [paperset] WHERE ([subjectID] = @subjectID)">
            <SelectParameters>
                <asp:ControlParameter ControlID="ddlSubject" Name="subjectID" PropertyName="SelectedValue" Type="String" />
            </SelectParameters>
        </asp:SqlDataSource>
        <asp:SqlDataSource ID="SqlDataSource3" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT * FROM [StudentSetList] WHERE ([setID] = @setID)">
            <SelectParameters>
                <asp:ControlParameter ControlID="ddlSet" Name="setID" PropertyName="SelectedValue" Type="Int32" />
            </SelectParameters>
        </asp:SqlDataSource>
        <br />
        
</asp:Content>