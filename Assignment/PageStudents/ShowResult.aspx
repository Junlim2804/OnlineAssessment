<%@ Page Language="C#" MasterPageFile="~/LayoutPage.Master" AutoEventWireup="true" CodeBehind="ShowResult.aspx.cs" Inherits="Assignment.ShowResult" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <!DOCTYPE html>
     <link rel="stylesheet" type="text/css" href="../CSS/Student.css"/>
      <style>
        .bgimg {
    background-position: center;
    background-size: cover;
    background-image: url("/Image/studBack.jpg");
    min-height: 100%;
}
    </style>
     <header class="bgimg w3-display-container w3-grayscale-min" id="home">
   

<div class="w3-container" style="padding:128px 16px" id="about">

    
  <div class="auto-style1" style="padding:48px">
      
    <span class="w3-jumbo w3-animate-top">Acheivement</span><br> </div>

</div> 
 </header> 
    
    <section>
  <nav>
    <div class="sidenav">
        <ul>
     
<%--   ----------------URL-------------------  --%>
<asp:HyperLink ID="HyperLink4" runat="server" NavigateUrl="../PersonalInformation.aspx">Personal Information</asp:HyperLink>
<asp:HyperLink ID="HyperLink2" runat="server" NavigateUrl="~/PageStudents/test.aspx">Assessment</asp:HyperLink>
<asp:HyperLink ID="HyperLink3" runat="server" NavigateUrl="~/PageStudents/ShowResult.aspx">Achievement</asp:HyperLink>
         
        
    </ul>

    </div>
  </nav>

        <div class="infobox">
            <h2><b>Assessment Results</b></h2>
            <table>
                <tr>
                    <td class="auto-style2">
                        <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataKeyNames="stuID,subjectID" Height="264px" Width="318px" OnSelectedIndexChanged="GridView1_SelectedIndexChanged" CellPadding="4" ForeColor="#333333" GridLines="None" AllowPaging="True" >
                            <AlternatingRowStyle BackColor="White" />
                            <Columns>
                                <asp:BoundField DataField="setID" HeaderText="Set ID" SortExpression="subjectID" ReadOnly="True" />
                                <asp:BoundField DataField="subjectID" HeaderText="Subject Code" />
                                <asp:BoundField DataField="mark" HeaderText="Score" SortExpression="score" />
                            </Columns>
                            <EditRowStyle BackColor="#2461BF" />
                            <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                            <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                            <PagerStyle BackColor="#2461BF" ForeColor="White" HorizontalAlign="Center" />
                            <RowStyle BackColor="#EFF3FB" />
                            <SelectedRowStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
                            <SortedAscendingCellStyle BackColor="#F5F7FB" />
                            <SortedAscendingHeaderStyle BackColor="#6D95E1" />
                            <SortedDescendingCellStyle BackColor="#E9EBEF" />
                            <SortedDescendingHeaderStyle BackColor="#4870BE" />
                        </asp:GridView>
                        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString2 %>" SelectCommand="SELECT s.setID, p.subjectID, p.mode, p.type, s.mark FROM StudentSetList AS s INNER JOIN paperset AS p ON s.setID = p.setID WHERE (s.stuID = @stuID) and s.mark is not null and s.mark&gt;=0">
                            <SelectParameters>
                                <asp:SessionParameter Name="stuID" SessionField="username" Type="String" />
                            </SelectParameters>
                        </asp:SqlDataSource>
                    </td>
                    <td class="auto-style4">
                        <br />
                        <br />
                    </td>
                </tr>
                <tr>
                    <td class="auto-style3">
             
                    </td>
                    <td class="auto-style4">&nbsp;</td>
                </tr>
            </table>
        </div>
</section>

</asp:Content>
<asp:Content ID="Content2" runat="server" contentplaceholderid="head">
    <style type="text/css">
        .auto-style1 {
            width: 975px;
        }
        .auto-style2 {
            width: 248px;
        }
        .auto-style3 {
            width: 275px;
        }
        .auto-style4 {
            width: 516px;
        }
    </style>
</asp:Content>

