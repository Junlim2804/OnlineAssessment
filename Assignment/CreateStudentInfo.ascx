<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="CreateStudentInfo.ascx.cs" Inherits="Assignment.CreateStudentInfo" %>

    <asp:CreateUserWizard ID="CreateUserWizard1" runat="server" ContinueDestinationPageUrl="~/PersonalInformation.aspx" FinishDestinationPageUrl="~/LoginPage.aspx" OnCreatedUser="CreateUserWizard1_CreatedUser" >
        <WizardSteps>
            <asp:CreateUserWizardStep ID="RegisterStudent1" runat="server">
                <ContentTemplate>
                    <div class="main" >
                        <section class="signup">
                            <div class="container">
                                <div class="signup-content">
                                    <div class="signup-form">
                                        <h2 class="form-title">Sign up as Student</h2>
                                        <div class="register-form" id="register-form">
                                            <div class="form-group">
                                                
                                                <asp:TextBox ID="UserName" runat="server" placeholder="User Name" ></asp:TextBox>
                                                <asp:RequiredFieldValidator ID="UserNameRequired" runat="server" ControlToValidate="UserName" ForeColor="Red" ErrorMessage="User Name is required." ToolTip="User Name is required." ValidationGroup="CreateUserWizard1">
                                                  *</asp:RequiredFieldValidator>
                                            
                                            </div>
                                            <div class="form-group">
                                                <asp:TextBox ID="StudentName" runat="server" placeholder="Student Name"></asp:TextBox>
                                                <asp:RequiredFieldValidator ID="StudentNameRequired" runat="server" ControlToValidate="StudentName" ForeColor="Red" ErrorMessage="Student Name is required." ToolTip="Student Name is required." ValidationGroup="CreateUserWizard1">
                                                  *</asp:RequiredFieldValidator>
                                              
                                            </div>
                                            <div class="form-group">
                                                <asp:TextBox ID="Password" runat="server" TextMode="Password" placeholder="Password"></asp:TextBox>
                                                <asp:RequiredFieldValidator ID="PasswordRequired" runat="server" ControlToValidate="Password" ForeColor="Red"  ErrorMessage="Password is required." ToolTip="Password is required." ValidationGroup="CreateUserWizard1">
                                                  *</asp:RequiredFieldValidator>
                                              <asp:RegularExpressionValidator ID="PasswordRegularExpression" runat="server" ForeColor="Red" ErrorMessage="Enter password with 8-10 alphanumeric(characters & number)!" ControlToValidate="Password" 
                                            ValidationExpression="(?!^[0-9]*$)(?!^[a-zA-Z]*$)^([a-zA-Z0-9]{8,10})$" ></asp:RegularExpressionValidator> 
                                                <asp:Literal ID="ErrorMessage" runat="server" EnableViewState="False"></asp:Literal>
                                             
                                            </div>
                                            <div class="form-group">
                                                <asp:TextBox ID="ConfirmPassword" runat="server" TextMode="Password" placeholder="Confirm Password"></asp:TextBox>
                                                <asp:RequiredFieldValidator ID="ConfirmPasswordRequired" runat="server" ControlToValidate="ConfirmPassword" ForeColor="Red" ErrorMessage="Repeat Password is required." ToolTip="Repeat is required." ValidationGroup="CreateUserWizard1">
                                                  *</asp:RequiredFieldValidator>
                                                <asp:CompareValidator ID="PasswordCompare" runat="server" ControlToCompare="Password" ForeColor="Red" ControlToValidate="ConfirmPassword" Display="Dynamic" ErrorMessage="The Password and Confirmation Password must match." ValidationGroup="CreateUserWizard1"></asp:CompareValidator>
                               
                                            </div>
                                            <div class="form-group">
                                                <asp:TextBox ID="HpNo" runat="server" placeholder="Handphone No"></asp:TextBox>
                                                <asp:RequiredFieldValidator ID="HpNoRequired" runat="server" ControlToValidate="HpNo" ErrorMessage="Handphone No is required." ToolTip="Handphone No is required." ForeColor="Red" ValidationGroup="CreateUserWizard1">
                                                  *</asp:RequiredFieldValidator>
                                              <asp:RegularExpressionValidator ID="HpNoRegularExpression" runat="server" ForeColor="Red" ErrorMessage="Enter phone number with 10 or 11 digits" ControlToValidate="HpNo" 
                                            ValidationExpression="\d{10,11}" ></asp:RegularExpressionValidator> 
                                            </div>
                                            <div class="form-group">
                                                <asp:TextBox ID="Email" runat="server" placeholder="Email"></asp:TextBox>
                                                <asp:RequiredFieldValidator ID="LecEmailRequired" runat="server" ControlToValidate="Email" ErrorMessage="Lecture Email is required." ForeColor="Red" ToolTip="Lecture Email is required." ValidationGroup="CreateUserWizard1">
                                                  *</asp:RequiredFieldValidator>
                                                <asp:RegularExpressionValidator ID="regexEmailValid" runat="server" ForeColor="Red" ValidationExpression="\w+([-+.]\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"
                                                    ControlToValidate="Email" ErrorMessage="Invalid Email Format"></asp:RegularExpressionValidator>
                                            </div>

                                              <div class="form-group">
                                                 Course:
                                                <asp:DropDownList ID="Course" runat="server" Width="414px">
                                                    <asp:ListItem>RSF</asp:ListItem>
                                                    <asp:ListItem>RDT</asp:ListItem>
                                                  
                                                </asp:DropDownList>
                                              </div>

                                            <div class="form-group form-button">
                                                <asp:Button ID="signup" runat="server" CssClass="form-submit" Text="Register" CommandName="MoveNext" />
                                                
                                            </div>
                                        </div>
                                    </div>
                                    <div class="signup-image">
                                        <figure>
                                            <img src="Image/signupstu.gif" alt="sing up image">
                                        </figure>
                                        <asp:LinkButton ID="LinkButton1" runat="server" CssClass="signup-image-link" OnClick="LinkButton1_Click">I am already member</asp:LinkButton>
                               
                                    </div>
                                </div>
                            </div>
                        </section>
                    </div>
                     

                    <!-- JS -->
                    <script src="vendor/jquery/jquery.min.js"></script>
                    <script src="js/main.js"></script>


                </ContentTemplate>
                <CustomNavigationTemplate>
                    <table border="0" cellspacing="5" style="width:100%;height:100%;">
                        <tr align="right">
                            
                        
                        </tr>
                    </table>
                </CustomNavigationTemplate>
            </asp:CreateUserWizardStep>
            <asp:CompleteWizardStep ID="CompleteWizardStep1" runat="server">
                <ContentTemplate>
                    <table align="center" style="margin:300px">
                        <tr>
                            <td align="center">Complete</td>
                        </tr>
                        <tr>
                            <td class="auto-style1">Your account has been successfully created.</td>
                        </tr>
                        <tr>
                            <td align="right">
                                <asp:Button ID="ContinueButton" runat="server" CausesValidation="False" CommandName="Continue" Text="Continue" ValidationGroup="CreateUserWizard1" BorderStyle="Ridge" />
                            </td>
                        </tr>
                    </table>
                </ContentTemplate>
            </asp:CompleteWizardStep>
        </WizardSteps>
        <FinishNavigationTemplate>
            <asp:Button ID="FinishPreviousButton" runat="server" CausesValidation="False" CommandName="MovePrevious" Text="Previous" />
            <asp:Button ID="FinishButton" runat="server" CommandName="MoveComplete" Text="Finish" />
        </FinishNavigationTemplate>
    </asp:CreateUserWizard>
