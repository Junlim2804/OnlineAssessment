<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="testimage.aspx.cs" Inherits="Assignment.testimage" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            
            <asp:Image ID="Image1" runat="server" />
            <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataKeyNames="Id" DataSourceID="SqlDataSource1" Width="382px">
                <Columns>
                    <asp:BoundField DataField="Id" HeaderText="Id" ReadOnly="True" SortExpression="Id" />
                    
                    
                    
                    <asp:TemplateField HeaderText="Image">
                        <ItemTemplate>
                            <asp:Image ID="Image1" runat="server" height="1000px" width="300px" 
                                ImageUrl='<%#"data:Image/jpg;base64,"+Convert.ToBase64String((byte[])Eval("Image")) %>'/>



                            </ItemTemplate>

                    </asp:TemplateField>
                    
                    
                    
                </Columns>
            </asp:GridView>

            <br />
            <pre class="lang-cs prettyprint prettyprinted" style="margin: 0px 0px 1em; padding: 5px; border: 0px; font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal; font-variant-numeric: inherit; font-variant-east-asian: inherit; font-weight: 400; font-stretch: inherit; line-height: inherit; font-family: Consolas, Menlo, Monaco, &quot;Lucida Console&quot;, &quot;Liberation Mono&quot;, &quot;DejaVu Sans Mono&quot;, &quot;Bitstream Vera Sans Mono&quot;, &quot;Courier New&quot;, monospace, sans-serif; font-size: 13px; vertical-align: baseline; box-sizing: inherit; width: auto; max-height: 600px; overflow: auto; background-color: rgb(239, 240, 241); display: block; color: rgb(57, 51, 24); overflow-wrap: normal; letter-spacing: normal; orphans: 2; text-align: left; text-indent: 0px; text-transform: none; widows: 2; word-spacing: 0px; -webkit-text-stroke-width: 0px; text-decoration-style: initial; text-decoration-color: initial;">&nbsp;</pre>
        </div>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString2 %>" SelectCommand="SELECT * FROM [test]"></asp:SqlDataSource>
    </form>
</body>
</html>
