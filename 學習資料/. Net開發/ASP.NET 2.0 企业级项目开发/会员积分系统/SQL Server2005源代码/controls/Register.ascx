<%@ Control Language="C#" AutoEventWireup="true" CodeFile="Register.ascx.cs" Inherits="controls_Register" %>
<asp:CreateUserWizard ID="CreateUserWizard1" runat="server"
    OnContinueButtonClick="CreateUserWizard1_ContinueButtonClick" OnCreatedUser="CreateUserWizard1_CreatedUser" ContinueButtonText="完成" ContinueDestinationPageUrl="~/loginPage.aspx">
    <WizardSteps>
        <asp:CreateUserWizardStep runat="server">
            <ContentTemplate>
                <table border="0">
                    <tr>
                        <td align="center" colspan="2">
                            注册新帐户</td>
                    </tr>
                    <tr>
                        <td align="right">
                            <asp:Label ID="UserNameLabel" runat="server" AssociatedControlID="UserName">用户名:</asp:Label></td>
                        <td>
                            <asp:TextBox ID="UserName" runat="server"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="UserNameRequired" runat="server" ControlToValidate="UserName"
                                ErrorMessage="必须填写“用户名”。" ToolTip="必须填写“用户名”。" ValidationGroup="CreateUserWizard1">*</asp:RequiredFieldValidator>
                        </td>
                    </tr>
                    <tr>
                        <td align="right">
                            <asp:Label ID="PasswordLabel" runat="server" AssociatedControlID="Password">密码:</asp:Label></td>
                        <td>
                            <asp:TextBox ID="Password" runat="server" TextMode="Password"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="PasswordRequired" runat="server" ControlToValidate="Password"
                                ErrorMessage="必须填写“密码”。" ToolTip="必须填写“密码”。" ValidationGroup="CreateUserWizard1">*</asp:RequiredFieldValidator>
                        </td>
                    </tr>
                    <tr>
                        <td align="right">
                            <asp:Label ID="ConfirmPasswordLabel" runat="server" AssociatedControlID="ConfirmPassword">确认密码:</asp:Label></td>
                        <td>
                            <asp:TextBox ID="ConfirmPassword" runat="server" TextMode="Password"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="ConfirmPasswordRequired" runat="server" ControlToValidate="ConfirmPassword"
                                ErrorMessage="必须填写“确认密码”。" ToolTip="必须填写“确认密码”。" ValidationGroup="CreateUserWizard1">*</asp:RequiredFieldValidator>
                        </td>
                    </tr>
                    <tr>
                        <td align="right" style="height: 26px">
                            <asp:Label ID="EmailLabel" runat="server" AssociatedControlID="Email">电子邮件:</asp:Label></td>
                        <td style="height: 26px">
                            <asp:TextBox ID="Email" runat="server"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="EmailRequired" runat="server" ControlToValidate="Email"
                                ErrorMessage="必须填写“电子邮件”。" ToolTip="必须填写“电子邮件”。" ValidationGroup="CreateUserWizard1">*</asp:RequiredFieldValidator>
                        </td>
                    </tr>
                    <tr>
                        <td align="right">
                            <asp:Label ID="QuestionLabel" runat="server" AssociatedControlID="Question">安全提示问题:</asp:Label></td>
                        <td>
                            <asp:TextBox ID="Question" runat="server"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="QuestionRequired" runat="server" ControlToValidate="Question"
                                ErrorMessage="必须填写“安全提示问题”。" ToolTip="必须填写“安全提示问题”。" ValidationGroup="CreateUserWizard1">*</asp:RequiredFieldValidator>
                        </td>
                    </tr>
                    <tr>
                        <td align="right">
                            <asp:Label ID="AnswerLabel" runat="server" AssociatedControlID="Answer">安全答案:</asp:Label></td>
                        <td>
                            <asp:TextBox ID="Answer" runat="server"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="AnswerRequired" runat="server" ControlToValidate="Answer"
                                ErrorMessage="必须填写“安全答案”。" ToolTip="必须填写“安全答案”。" ValidationGroup="CreateUserWizard1">*</asp:RequiredFieldValidator>
                        </td>
                    </tr>
                    <tr>
                        <td align="center" colspan="2">
                            <asp:CompareValidator ID="PasswordCompare" runat="server" ControlToCompare="Password"
                                ControlToValidate="ConfirmPassword" Display="Dynamic" ErrorMessage="“密码”和“确认密码”必须匹配。"
                                ValidationGroup="CreateUserWizard1"></asp:CompareValidator>
                        </td>
                    </tr>
                    <tr>
                        <td align="center" colspan="2" style="color: red">
                            <asp:Literal ID="ErrorMessage" runat="server" EnableViewState="False"></asp:Literal>
                        </td>
                    </tr>
                </table>
            </ContentTemplate>
        </asp:CreateUserWizardStep>
        <asp:CompleteWizardStep runat="server" EnableViewState="False">
        </asp:CompleteWizardStep>
    </WizardSteps>
    <FinishNavigationTemplate>
        <asp:Button ID="FinishPreviousButton" runat="server" CausesValidation="False" CommandName="MovePrevious"
            Text="上一步" />
        <asp:Button ID="FinishButton" runat="server" CommandName="MoveComplete" Text="完成" />
    </FinishNavigationTemplate>
</asp:CreateUserWizard>
