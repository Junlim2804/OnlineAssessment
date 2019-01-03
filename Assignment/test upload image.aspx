<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="test upload image.aspx.cs" Inherits="Assignment.test_upload_image" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <asp:SiteMapPath ID="SiteMapPath1" runat="server" Font-Names="Verdana" Font-Size="0.8em" PathSeparator=" : ">
            <CurrentNodeStyle ForeColor="#333333" />
            <NodeStyle Font-Bold="True" ForeColor="#284E98" />
            <PathSeparatorStyle Font-Bold="True" ForeColor="#507CD1" />
            <RootNodeStyle Font-Bold="True" ForeColor="#507CD1" />
        </asp:SiteMapPath>
            <br />
            <br />
            <br />
            <asp:Menu ID="Menu1" runat="server" DataSourceID="SiteMapDataSource1">
            </asp:Menu>
            <asp:SiteMapDataSource ID="SiteMapDataSource1" runat="server" />
            <br /><br />
            <asp:TextBox ID="TextBox1" runat="server" OnTextChanged="TextBox1_TextChanged"></asp:TextBox>
            <br />
            <br />

            <asp:FileUpload ID="FileUpload1" runat="server" />
            <br />
            <br />
            <asp:Button ID="Button1" runat="server" OnClick="Button1_Click" Text="Button" />
            <asp:Label ID="Label1" runat="server"></asp:Label>
            <br />
        </div>
    </form>
</body>
</html>
