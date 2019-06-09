<%@ Page Language="C#" AutoEventWireup="true" CodeFile="ComplexProfile.aspx.cs" Inherits="ComplexProfile" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
    <title>无标题页</title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
        <table style="width: 495px">
            <tr>
                <td colspan="2">
                    我的复杂个性化设置</td>
            </tr>
            <tr>
                <td style="width: 174px; height: 24px;">
                    我的文本框设置</td>
                <td style="height: 24px">
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
            <tr>
                <td style="width: 174px">
                </td>
                <td>
                    <asp:Button ID="Button1" runat="server" OnClick="Button1_Click" Text="保存我的设置" Width="121px" /></td>
            </tr>
            <tr>
                <td colspan="2">
                    如果您还没有登录请单击<asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl="~/MigrateAnonymous.aspx">登录</asp:HyperLink>来保存您的设置</td>
            </tr>
        </table>
    
    </div>
    </form>
</body>
</html>
