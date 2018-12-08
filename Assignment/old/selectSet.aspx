<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="selectSet.aspx.cs" Inherits="Assignment.newWebapge" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Online Test </title>
    <script src="http://ajax.googleapis.com/ajax/libs/jquery/1.7/jquery.min.js" type="text/javascript"></script>  
         
        <script>
            function StartTest(popUpPage) {
                window.open(popUpPage, 'null', 'toolbar=0,scrollbars=1,location=0,statusbar=0,menubar=0,resizable=0,fullscreen=yes');
            }  
        </script>
   
</head>
<body>
    <form id="form1" runat="server">
   <div style=" text-align :center; width:100%">  
                
            </div>  
        <p>
                                    <asp:Button ID="btnStartTest" Text="Start Test" runat="server" 
                                        OnClientClick="return StartTest('questionSet.aspx');"
                                         BorderColor="#FF6600" BorderWidth="4px" Height="43px" Width="142px" />  
                                <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataKeyNames="SubjectID" DataSourceID="SqlDataSource1" OnSelectedIndexChanged="GridView1_SelectedIndexChanged">
                                    <Columns>
                                        <asp:CommandField ShowSelectButton="True" />
                                        <asp:BoundField DataField="setID" HeaderText="setID" ReadOnly="True" SortExpression="setID" InsertVisible="False" />
                                        <asp:BoundField DataField="mode" HeaderText="mode" SortExpression="mode" />
                                        <asp:BoundField DataField="duration" HeaderText="duration" SortExpression="duration" />
                                        <asp:BoundField DataField="subjectID" HeaderText="subjectID" SortExpression="subjectID" />
                                        <asp:BoundField DataField="type" HeaderText="type" SortExpression="type" />
                                    </Columns>
            </asp:GridView>
            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT * FROM [paperset]"></asp:SqlDataSource>
        </p>
    </form>
</body>
</html>


