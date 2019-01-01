<%@ Page Language="C#" MasterPageFile="~/LayoutPage.Master" AutoEventWireup="true" CodeBehind="ShowSetList.aspx.cs" Inherits="Assignment.ShowSetList" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
        <link rel="stylesheet" type="text/css" href="../CSS/Student.css"/>

<style type="text/css">
    #outer{
            margin-top:5%;
            margin-left:auto;
            margin-right:auto;
            width:60%;
            text-align:center;
        }
        .auto-style1 th{
            background-color:#1A237E;
            color: white;
        }
        th, td {
            text-align: left;
            padding: 8px;
        }
        table {
            border-collapse: collapse;
            width:60%;
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
        #edit{
            text-align:center;
            margin-left:auto;
            margin-right:auto;
            width:60%;
        }
        #middle{
            text-align:center;
            margin-left:auto;
            margin-right:auto;
            width:60%;
        }


        #below{
            text-align:center;
            width:60%;
            margin-left:auto;
            margin-right:auto;
            margin-bottom:5%;
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
      
    <span class="w3-jumbo w3-animate-top">Assessment</span><br> </div>

</div> 
 </header>

    <section>
  <nav>
    <div class="sidenav">
        <ul>
     

          <asp:HyperLink ID="hpSet" runat="server" NavigateUrl="~/PageLecturers/ShowSetList.aspx">Create Examination Set</asp:HyperLink>
          <asp:HyperLink ID="hpPersonalInfo" runat="server" NavigateUrl="~/PageLecturers/lecture.aspx">Personal Information</asp:HyperLink>
            <asp:HyperLink ID="markPaper" runat="server" NavigateUrl="~/PageLecturers/markPaper.aspx">Mark Paper</asp:HyperLink>

        
    </ul>

    </div>
  </nav>

   
     <div class="infobox">
          <h2><b>Assessment Set</b></h2>
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
                 available:
                 <asp:Label ID="availableLabel" runat="server" Text='<%# Eval("available") %>' />
                 <br />
                 <asp:Button ID="viewSetBtn" runat="server" Text="View Set" OnClick="viewSetBtn_Click"/>
                 <br />
             </ItemTemplate>
             <SelectedItemStyle BackColor="#009999" Font-Bold="True" ForeColor="#CCFF99" />
         </asp:DataList>

           
            <!----<table id="outer" class="auto-style1">
                <tr>
                    <td class="auto-style2">
                     <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataKeyNames="setID" DataSourceID="SqlDataSource1" AllowPaging="True" Width="940px">
                            <Columns>
                                <asp:BoundField DataField="setID" HeaderText="setID" ReadOnly="True" SortExpression="setID" InsertVisible="False" />
                                <asp:BoundField DataField="mode" HeaderText="mode" SortExpression="mode" />
                                <asp:BoundField DataField="duration" HeaderText="duration" SortExpression="duration" />
                                <asp:BoundField DataField="subjectID" HeaderText="subjectID" SortExpression="subjectID" />
                                <asp:BoundField DataField="type" HeaderText="type" SortExpression="type" />
                                <asp:CheckBoxField DataField="available" HeaderText="available" SortExpression="available" />
                            </Columns>
                        </asp:GridView>
                    </td>
                    </tr>
                </table>--->
              
    <br />
             
    <div  id="edit">
                        <asp:FormView ID="fv_set" runat="server" CssClass="auto-style3" DataSourceID="SqlDataSource2" OnPageIndexChanging="fv_set_PageIndexChanging">
                            <EditItemTemplate>
                                  <table class="auto-style1">
                                    <tr>
                                        <th>SetID</th>
                                        <td>
                                            <asp:TextBox ID="tbSetID" Text='<%# Eval("setID")%>' runat="server" Enabled="false"></asp:TextBox>
                                        </td>
                                    </tr>
                                    <tr>
                                        <th>Duration</th>
                                        <td>
                                            <asp:TextBox ID="tbDuration" Text='<%# Eval("duration") %>' runat="server"></asp:TextBox>
                                        </td>
                                    </tr>
                                    <tr>
                                        <th>SubjectID</th>
                                        <td>
                                            <asp:DropDownList ID="ddlSubject" runat="server" AppendDataBoundItems="True" DataTextField="subjectName" DataValueField="subjectID" DataSourceID="SqlDataSource3"></asp:DropDownList>
                                        </td>
                                    </tr>
                                    <tr>
                                        <th>Type</th>
                                        <td>
                                            <asp:RadioButtonList ID="rblType" runat="server">
                                                 <asp:ListItem Value="obj" Selected="True" >Objective</asp:ListItem>

                                                    <asp:ListItem Value="sub" >Subjective</asp:ListItem>
                                               
                                            </asp:RadioButtonList>
                                        </td>
                                    </tr>
                                      <tr>
                                          <th>ExpiredDate</th>
                                          <td>
                                              <asp:Calendar SelectedDate='<%# Eval("expiredDate") %>' ID="CalExp" runat="server"></asp:Calendar>
                                          </td>
                                      </tr>
                                      <tr>
                                          <td>
                                              <asp:Button CssClass="button" ID="btnConfirm" runat="server" OnClick="btnConfirm_Click" Text="Confirm" />
                                          </td>
                                          <td>
                                              <asp:Button CssClass="button" ID="btnCancel" runat="server" Text="Cancel" OnClick="btnCancel_Click" />
                                          </td>
                                      </tr>
                                </table>
                           
                                </EditItemTemplate>
                            <InsertItemTemplate>
                                     <table class="auto-style1">
                                    <tr>
                                        <td></td>
                                        <td class="auto-style6">
                                           
                                        </td>
                                        <td></td>
                                    </tr>
                                    <tr>
                                        <th>Mode</th>
                                        <td class="auto-style6">
                                            <asp:RadioButtonList ID="rblMode" runat="server" AutoPostBack="True" OnSelectedIndexChanged="rblMode_SelectedIndexChanged">
                                                 <asp:ListItem Selected="True">Public</asp:ListItem>

                                                    <asp:ListItem>Private</asp:ListItem>
                                               
                                            </asp:RadioButtonList>
                                            
                                        </td>
                                        <td>
                                            <asp:Label ID="lblStudentID" runat="server" Text="StudentID" Visible="False"></asp:Label>
                                            <asp:TextBox ID="tbStudID" runat="server" Visible="False"></asp:TextBox>
                                            <asp:Literal ID="FailureText" runat="server" EnableViewState="False"></asp:Literal>
                                            <asp:Button ID="btnAddStud" runat="server" OnClick="btnAddStud_Click" Text="ADD" Visible="False" />
                                        </td>
                                    </tr>
                                    <tr>
                                        <th>Duration</th>
                                        <td class="auto-style6">
                                            <asp:TextBox ID="tbDuration" Text='<%# Eval("duration") %>' runat="server"></asp:TextBox>
                                        </td>
                                        <td rowspan="4">
                                            <asp:ListBox ID="blStudent" runat="server" AutoPostBack="True" OnSelectedIndexChanged="blStudent_SelectedIndexChanged" Visible="False" Height="126px" Width="213px"></asp:ListBox>
                                        </td>
                                    </tr>
                                    <tr>
                                        <th>SubjectID</th>
                                        <td class="auto-style6">
                                            <asp:DropDownList ID="ddlSubject" runat="server" AppendDataBoundItems="True" DataTextField="subjectName" DataValueField="subjectID" DataSourceID="SqlDataSource3"></asp:DropDownList>
                                        </td>
                                    </tr>
                                    <tr>
                                        <th>Type</th>
                                        <td class="auto-style6">
                                            <asp:RadioButtonList ID="rblType" runat="server">
                                                 <asp:ListItem Value="obj" Selected="True" >Objective</asp:ListItem>

                                                    <asp:ListItem Value="sub" >Subjective</asp:ListItem>
                                               
                                            </asp:RadioButtonList>
                                        </td>
                                    </tr>
                                         <tr>
                                             <th>ExpiredDate</th>
                                             <td class="auto-style6">
                                                 <asp:Calendar ID="CalExp" runat="server"></asp:Calendar>
                                             </td>
                                         </tr>
                                      <tr>
                                          <td>
                                              <asp:Button CssClass="button" ID="btnInsert" runat="server" OnClick="btnInsertClick" Text="Confirm" />
                                          </td>
                                          <td class="auto-style6">
                                              <asp:Button CssClass="button" ID="btnCancel" runat="server" Text="Cancel" OnClick="btnCancel_Click" />
                                          </td>
                                          <td>&nbsp;</td>
                                      </tr>
                                </table>
                           
                            </InsertItemTemplate>
                            <ItemTemplate>
                                <table class="auto-style1">
                                    <tr>
                                        <th>SetID:</th>
                                        <td>
                                            <asp:Label ID="lbSetID" Text='<%# Eval("setID")%>' runat="server"></asp:Label>
                                        </td>
                                    </tr>
                                    <tr>
                                        <th>Mode:</th>
                                        <td>
                                            <asp:Label ID="lbMode" Text='<%# Eval("mode")%>' runat="server"></asp:Label>
                                        </td>
                                    </tr>
                                    <tr>
                                        <th>Duration:</th>
                                        <td>
                                            <asp:Label ID="lbDuration" Text='<%# Eval("duration")%>' runat="server"></asp:Label>
                                        </td>
                                    </tr>
                                    <tr>
                                        <th>SubjectID:</th>
                                        <td>
                                            <asp:Label ID="lbSubjectID" Text='<%# Eval("subjectID")%>' runat="server"></asp:Label>
                                        </td>
                                    </tr>
                                    <tr>
                                        <th class="auto-style4">Type:</th>
                                        <td class="auto-style4">
                                            <asp:Label ID="lbType" Text='<%# Eval("type")%>' runat="server"></asp:Label>
                                        </td>
                                    </tr>
                                    <tr>
                                        <th>ExpiredDate</th>
                                        <td>
                                            <asp:Label ID="lblExp" Text='<%# Eval("expiredDate", "{0:d}")%>' runat="server"></asp:Label>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>
                                            <asp:Button CssClass="button" ID="BtnEdit" runat="server" OnClick="BtnEdit_Click" Text="Edit" />
                                            <asp:Button CssClass="button" ID="BtnEditQuestion" runat="server" Text="EditQuestion" OnClick="BtnEditQuestion_Click" />
                                        </td>
                                        <td>
                                            <asp:Button CssClass="button" ID="btnPublish" runat="server" Text="Publish" OnClick="btnPublish_Click" />
                                            <asp:Button CssClass="button" ID="btnTerminate" runat="server" Text="Terminate" OnClick="btnTerminate_Click" />
                                        </td>
                                        <td>&nbsp;</td>
                                    </tr>
                                </table>
                            </ItemTemplate>
                        </asp:FormView>
</div>
    <br /><br />
    <div id="middle">

                        <asp:Button CssClass="button" ID="btnAdd" runat="server" OnClick="btnAdd_Click" Text="Add New Exam Set" />

        </div>
    <br />
        
    <!---<h2><b>Available Set</b></h2>
    
        
        <table  class="auto-style1">
                <tr>
                    <td class="auto-style2">
                        <asp:GridView ID="GridView2" runat="server" AllowPaging="True" AutoGenerateColumns="False" DataKeyNames="setID" DataSourceID="SqlDataSource4" OnSelectedIndexChanged="GridView2_SelectedIndexChanged" Width="950px">
                         
                            <Columns>
                                <asp:CommandField ShowSelectButton="True" SelectText="Terminate" />
                                <asp:BoundField DataField="setID" HeaderText="Set ID" InsertVisible="False" ReadOnly="True" SortExpression="setID" />
                                <asp:BoundField DataField="mode" HeaderText="Mode" SortExpression="mode" />
                                <asp:BoundField DataField="duration" HeaderText="Duration" SortExpression="duration" />
                                <asp:BoundField DataField="subjectID" HeaderText="Subject ID" SortExpression="subjectID" />
                                <asp:BoundField DataField="type" HeaderText="Type" SortExpression="type" />
                                <asp:CheckBoxField DataField="available" HeaderText="Available" SortExpression="available" />
                                <asp:BoundField DataField="expiredDate" HeaderText="Expired Date" SortExpression="expiredDate" />
                            </Columns>
                        </asp:GridView>
                    </td>
                </tr>
            </table>---->
        </div>
        </section>

            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT p.setID, p.mode, p.duration, p.subjectID, p.type, p.available FROM paperset AS p INNER JOIN subject AS s ON p.subjectID = s.subjectID WHERE (s.CourseCode = 'RSF')"></asp:SqlDataSource>

            <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT * FROM [paperset] WHERE ([setID] = @setID)" DeleteCommand="DELETE FROM [paperset] WHERE [setID] = @setID"
                InsertCommand="INSERT INTO [paperset] ( [mode], [duration], [subjectID], [type],expiredDate) VALUES ( @mode, @duration, @subjectID, @type,@ExpiredDate)"
                UpdateCommand="UPDATE [paperset] SET [duration] = @duration, [subjectID]=@subjectID,[type]=@type,expiredDate=@expiredDate WHERE [setID] = @setID" OnUpdating="SqlDataSource2_Updating" OnUpdated="SqlDataSource2_Updated" OnInserting="SqlDataSource2_Inserting" OnInserted="SqlDataSource2_Inserted">
                <DeleteParameters>
                    <asp:Parameter Name="setID" Type="String" />
                </DeleteParameters>
                <InsertParameters>
                    
                    <asp:Parameter Name="mode" Type="String" />
                    <asp:Parameter Name="duration" Type="Int32" />
                    <asp:Parameter Name="subjectID" Type="String" />
                    <asp:Parameter Name="type" Type="String" />

                    <asp:Parameter Name="ExpiredDate" />

                </InsertParameters>
                <SelectParameters>
                    <asp:ControlParameter ControlID="GridView1" Name="setID" PropertyName="SelectedValue" Type="String" />
                </SelectParameters>
                <UpdateParameters>
                    <asp:Parameter Name="duration" Type="Int32" />
                    <asp:Parameter Name="subjectID" Type="String" />
                    <asp:Parameter Name="type" />
                    <asp:Parameter Name="expiredDate"   />
                    <asp:Parameter Name="setID" Type="String" />
                </UpdateParameters>
            </asp:SqlDataSource>

             <asp:SqlDataSource ID="SqlDataSource4" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT * FROM [paperset]
where available=1" OnUpdating="SqlDataSource4_Updating" UpdateCommand="UPDATE PAPERSET
SET available=1
where setid=@setid
">
                 <UpdateParameters>
                     <asp:Parameter Name="setid" />
                 </UpdateParameters>
            </asp:SqlDataSource>

             <asp:SqlDataSource ID="SqlDataSource3" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT * FROM [subject]" OnUpdating="SqlDataSource3_Updating" UpdateCommand="UPDATE PAPERSET
SET available=0
where setid=@setid
" OnUpdated="SqlDataSource3_Updated">
                 <UpdateParameters>
                     <asp:Parameter Name="setid" />
                 </UpdateParameters>
            </asp:SqlDataSource>


        
</asp:Content>
