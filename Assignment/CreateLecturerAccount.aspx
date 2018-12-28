<%@ Page Language="C#" MasterPageFile="~/LayoutPage.Master" AutoEventWireup="true" CodeBehind="CreateLecturerAccount.aspx.cs" Inherits="OnlineAssessementSite.CreateLecturerAccount" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <title>Register Lecturer Account</title>

    <!-- Font Icon -->
    <link rel="stylesheet" href="CSS/material-design-iconic-font.min.css">

    <!-- Main css -->
    <link rel="stylesheet" href="CSS/style.css">
    <style type="text/css">
        .auto-style1 {
            height: 119px;
        }
    </style>
</asp:Content>


<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <asp:CreateUserWizard ID="CreateUserWizard1" runat="server" OnCreatedUser="CreateUserWizard1_CreatedUser" ContinueDestinationPageUrl="PageLecturers/lecture.aspx">
        <WizardSteps>
            <asp:CreateUserWizardStep ID="RegisterLecturer1" runat="server">
                <ContentTemplate>
                    <div class="main">
                        <section class="signup">
                            <div class="container">
                                <div class="signup-content">
                                    <div class="signup-form">
                                        <h2 class="form-title">Sign up as Lecturer</h2>
                                        <div class="register-form" id="register-form">
                                            <div class="form-group">

                                                <asp:TextBox ID="UserName" runat="server" placeholder="User Name"></asp:TextBox>
                                                <asp:RequiredFieldValidator ID="UserNameRequired" runat="server" ControlToValidate="UserName" ErrorMessage="User Name is required." ToolTip="User Name is required." ValidationGroup="CreateUserWizard1">
                                                  *</asp:RequiredFieldValidator>

                                            </div>
                                            <div class="form-group">
                                                <asp:TextBox ID="LecturerName" runat="server" placeholder="Lecturer Name"></asp:TextBox>
                                                <asp:RequiredFieldValidator ID="LecturerNameRequired" runat="server" ControlToValidate="LecturerName" ErrorMessage="Lecturer Name is required." ToolTip="Lecturer Name is required." ValidationGroup="CreateUserWizard1">
                                                  *</asp:RequiredFieldValidator>

                                            </div>
                                            <div class="form-group">
                                                <asp:TextBox ID="Password" runat="server" TextMode="Password" placeholder="Password"></asp:TextBox>
                                                <asp:RequiredFieldValidator ID="PasswordRequired" runat="server" ControlToValidate="Password" ErrorMessage="Password is required." ToolTip="Password is required." ValidationGroup="CreateUserWizard1">
                                                  *</asp:RequiredFieldValidator>
                                                <asp:Literal ID="ErrorMessage" runat="server" EnableViewState="False"></asp:Literal>
                           <asp:RegularExpressionValidator ID="PasswordRegularExpression" runat="server" ForeColor="Red" ErrorMessage="Enter password with 8-10 digits with at least one numberic number" ControlToValidate="Password" 
                                            ValidationExpression="(?!^[0-9]*$)(?!^[a-zA-Z]*$)^([a-zA-Z0-9]{8,10})$" ></asp:RegularExpressionValidator> 
                                            </div>
                                            <div class="form-group">
                                                <asp:TextBox ID="ConfirmPassword" runat="server" TextMode="Password" placeholder="Confirm Password"></asp:TextBox>
                                                <asp:RequiredFieldValidator ID="ConfirmPasswordRequired" runat="server" ControlToValidate="ConfirmPassword" ErrorMessage="Repeat Password is required." ToolTip="Repeat is required." ValidationGroup="CreateUserWizard1">
                                                  *</asp:RequiredFieldValidator>
                                                <asp:CompareValidator ID="PasswordCompare" runat="server" ControlToCompare="Password" ControlToValidate="ConfirmPassword" Display="Dynamic" ErrorMessage="The Password and Confirmation Password must match." ValidationGroup="CreateUserWizard1"></asp:CompareValidator>

                                            </div>
                                            <div class="form-group">
                                                <asp:TextBox ID="HpNo" runat="server" placeholder="Handphone No"></asp:TextBox>
                                                <asp:RequiredFieldValidator ID="HpNoRequired" runat="server" ControlToValidate="HpNo" ErrorMessage="Handphone No is required." ToolTip="Handphone No is required." ValidationGroup="CreateUserWizard1">
                                                  *</asp:RequiredFieldValidator>
                                        <asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server" ErrorMessage="Enter valid Phone number" ControlToValidate="HpNo" 
                                            ValidationExpression="\d{10,11}" ></asp:RegularExpressionValidator> 
                                            </div>
                                            <div class="form-group">
                                                <asp:TextBox ID="Email" runat="server" placeholder="Email"></asp:TextBox>
                                                <asp:RequiredFieldValidator ID="LecEmailRequired" runat="server" ControlToValidate="Email" ErrorMessage="Lecture Email is required." ToolTip="Lecture Email is required." ValidationGroup="CreateUserWizard1">
                                                  *</asp:RequiredFieldValidator>
                                                <asp:RegularExpressionValidator ID="regexEmailValid" runat="server" ValidationExpression="\w+([-+.]\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"
                                                    ControlToValidate="Email" ErrorMessage="Invalid Email Format"></asp:RegularExpressionValidator>
                                            </div>
                           
                                            <div class="form-group form-button">
                                                <asp:Button ID="signup" runat="server" CssClass="form-submit" Text="Register" CommandName="MoveNext" />

                                            </div>
                                        </div>
                                    </div>
                                    <div class="signup-image">
                                        <figure>
                                            <img src="Image/signuplec.gif" alt="sing up image">
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
                    <table border="0" cellspacing="5" style="width: 100%; height: 100%;">
                        <tr align="right">
                        </tr>
                    </table>
                </CustomNavigationTemplate>
            </asp:CreateUserWizardStep>
            <asp:CompleteWizardStep ID="CompleteWizardStep1" runat="server">
                <ContentTemplate>
                    <table align="center" style="margin: 300px">
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
</asp:Content>
