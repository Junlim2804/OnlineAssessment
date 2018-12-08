<%@ Page Language="C#" MasterPageFile="~/LayoutPage.Master" AutoEventWireup="true" CodeBehind="test.aspx.cs"  Inherits="OnlineAssessementSite.test" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <link rel="stylesheet" type="text/css" href="../CSS/Student.css"/>
     <style type="text/css">
        .auto-style1 {
            width: 100%;
        }
        .auto-style2 {
            margin-left: 40px;
            width: 447px;
        }
        .auto-style3 {
            width: 447px;
        }

        .button {
            background-color:#B3E5FC;
            border: none;
            padding: 10px 15px;
            text-align: center;
            text-decoration: none;
            display: inline-block;
            font-size: 16px;
            margin: 4px 2px;
            cursor: pointer;
        }
         .auto-style4 {
             float: left;
             padding: 40px;
             width: 50%;
             background-color: white;
             margin-top: 0px;
         }
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
      
    <span class="w3-jumbo w3-animate-top">Student Page</span><br> </div>

</div> 
 </header> 

<section>
  <nav>
    <div class="sidenav">
        <ul>
     

          <asp:HyperLink ID="HyperLink2" runat="server" NavigateUrl="~/PageStudents/test.aspx">Assessment</asp:HyperLink>
          <asp:HyperLink ID="HyperLink3" runat="server" NavigateUrl="~/PageStudents/ShowResult.aspx">Achievement</asp:HyperLink>
          <asp:HyperLink ID="HyperLink4" runat="server" NavigateUrl="~/PageStudents/Student.aspx">Personal Information</asp:HyperLink>
         
          
        
    </ul>

    </div>
  </nav>
  
  <div class="container">
    <div class="auto-style4">
     
      


        <table class="auto-style1">
            <tr>
                <td class="auto-style2">
        <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataKeyNames="setid" DataSourceID="SqlDataSource1" OnSelectedIndexChanged="GridView1_SelectedIndexChanged" CellPadding="4" ForeColor="#333333" GridLines="None" Width="682px" >
            <AlternatingRowStyle BackColor="White" />
            <Columns>
                <asp:CommandField ShowSelectButton="True" />
                <asp:BoundField DataField="setid" HeaderText="Set ID" ReadOnly="True" SortExpression="setid" />
                <asp:BoundField DataField="mode" HeaderText="Mode" SortExpression="mode" />
                <asp:BoundField DataField="duration" HeaderText="Duration" SortExpression="duration" />
                <asp:BoundField DataField="subjectID" HeaderText="Subject ID" SortExpression="subjectID" />
                <asp:BoundField DataField="subjectName" HeaderText="Subject Name" SortExpression="subjectName" />
                <asp:BoundField DataField="type" HeaderText="Type" SortExpression="type" />
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
                </td>
                
            </tr>
            <tr>
                <td class="auto-style3">
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="select p.setid,mode,duration,p.subjectID,subjectName,[type]
from studentsetlist ss,paperset p,subject s
where stuid=@stuID and p.setId=ss.setID and p.subjectID=s.subjectID and ss.mark is null and available=1 and expiredDate>CURRENT_TIMESTAMP;">
            <SelectParameters>
                <asp:SessionParameter Name="stuID" SessionField="USERNAME" DefaultValue="" />
            </SelectParameters>
                    </asp:SqlDataSource>
                </td>
               
            </tr>
        </table>



        
    <div class="w3-col 40 m6 w3-margin-bottom">
      <div class="w3-card">
        <div class="w3-container">
          <h3>Subject Selected</h3>
          <p class="w3-opacity"><asp:Label ID="lblSubID" runat="server"></asp:Label></p>
          <p>Question Set ID:<asp:Label ID="lblSet" runat="server"></asp:Label></p>
          <p>Duration: <asp:Label ID="lblTime" runat="server"></asp:Label></p>
          <p><asp:Button ID="Button1" Cssclass="button" runat="server" Text="Start Exam" OnClientClick="return confirm('ARE YOU READY');" OnClick="btnControl_Click" /></p>
        </div>
      </div>
    </div>
        </div>
      </div>
      

    <div class = infobox2>
    <h1">Welcome back, <asp:LoginName ID="LoginName1" runat="server" />
        </h1>
    <p>
       
       "Good, better, best. Never let it rest. 'Til your good is better and your better is best.."</p>
    <p>-St Jerome</p>
  </div>




  
</section>
      <script>
            function StartTest(popUpPage) {
                window.open(popUpPage, '_parent', 'toolbar=0,directories=0,scrollbars=1,location=0,statusbar=0,menubar=0,resizable=0,fullscreen=yes');
             

            }  
        </script>


</asp:Content>
