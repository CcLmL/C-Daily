<%@ Page Language="C#" AutoEventWireup="true" CodeFile="MigrateAnonymous.aspx.cs" Inherits="MigrateAnonymous" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
    <title>无标题页</title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
        <asp:LoginView ID="LoginView1" runat="server">
            <LoggedInTemplate>
                欢迎您：<br />
                <asp:LoginName ID="LoginName1" runat="server" />
            </LoggedInTemplate>
            <AnonymousTemplate>
            <table>
            <tr>
            <td>
                 <asp:Login ID="Login1" runat="server" DestinationPageUrl="~/MigrateAnonymous.aspx" Height="162px" Width="257px">
                </asp:Login>
            </td>
            <td>
                 <asp:CreateUserWizard ID="CreateUserWizard1" runat="server" Width="262px">
                    <WizardSteps>
                        <asp:CreateUserWizardStep ID="CreateUserWizardStep1" runat="server">
                        </asp:CreateUserWizardStep>
                        <asp:CompleteWizardStep ID="CompleteWizardStep1" runat="server">
                        </asp:CompleteWizardStep>
                    </WizardSteps>
                </asp:CreateUserWizard>
            </td>
            </tr>
            </table>
            </AnonymousTemplate>
        </asp:LoginView>
        <asp:Panel ID="Panel1" runat="server" Height="50px" Width="125px">
                <table style="width: 349px">
            <tr>
                <td colspan="2">
                    我的复杂个性化设置</td>
            </tr>
            <tr>
                <td style="width: 174px">
                    我的文本框设置</td>
                <td>
                    <asp:DropDownList ID="ddlsize" runat="server" Width="134px">
                        <asp:ListItem>单行</asp:ListItem>
                        <asp:ListItem>多行</asp:ListItem>
                        <asp:ListItem>密码</asp:ListItem>
                    </asp:DropDownList></td>
            </tr>
            <tr>
                <td colspan="2">
                    我的银行设置</td>
            </tr>
            <tr>
                <td style="width: 174px">
                    银行名称：</td>
                <td>
                    <asp:TextBox ID="txtbankname" runat="server"></asp:TextBox></td>
            </tr>
            <tr>
                <td style="width: 174px">
                    银行密码：</td>
                <td>
                    <asp:TextBox ID="txtbankpass" runat="server" TextMode="Password"></asp:TextBox></td>
            </tr>
            <tr>
                <td style="width: 174px">
                    银行存款数：</td>
                <td>
                    <asp:TextBox ID="txtmoney" runat="server"></asp:TextBox></td>
            </tr>
        </table>
        </asp:Panel>
        <asp:Label ID="Label1" runat="server" Width="237px"></asp:Label></div>

    </form>
</body>
</html>
