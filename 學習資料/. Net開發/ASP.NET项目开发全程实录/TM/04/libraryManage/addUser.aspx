<%@ Page Language="C#" AutoEventWireup="true" CodeFile="addUser.aspx.cs" Inherits="addUser" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
    <title>添加管理员</title>
    <link href="css.css" rel="stylesheet" type="text/css" />
</head>
<body>
    <form id="form1" runat="server">
    <div>
        <table align="center" background="file:///E|/.net图书管理/www/images/xiaobei.gif" border="0"
            cellpadding="0" cellspacing="0" height="176" width="292">
            <tr>
                <td>
                    <table align="center" border="0" cellpadding="0" cellspacing="0" height="125" width="266">
                        <tr>
                            <td style="width: 173px; text-align: right">
                                登录名称：</td>
                            <td width="105">
                    <asp:TextBox ID="txtUserName" runat="server" Width="87px"></asp:TextBox></td>
                            <td width="90">
                                &nbsp;<asp:RequiredFieldValidator ID="RequiredFieldValidatorName" runat="server" ControlToValidate="txtUserName"
                        ErrorMessage="名称不能为空"></asp:RequiredFieldValidator></td>
                        </tr>
                        <tr>
                            <td style="width: 173px; text-align: right">
                                登录密码：</td>
                            <td>
                    <asp:TextBox ID="txtPass" runat="server" Width="87px" TextMode="Password"></asp:TextBox></td>
                            <td>
                                &nbsp;<asp:RequiredFieldValidator ID="RequiredFieldValidatorPass" runat="server" ControlToValidate="txtPass"
                        ErrorMessage="密码不能为空"></asp:RequiredFieldValidator></td>
                        </tr>
                        <tr>
                            <td style="width: 173px; text-align: right">
                                确认密码：</td>
                            <td>
                    <asp:TextBox ID="txtQpass" runat="server" Width="87px" TextMode="Password"></asp:TextBox></td>
                            <td>
                                &nbsp;<asp:CompareValidator ID="CompareValidator1" runat="server" ControlToCompare="txtPass"
                        ControlToValidate="txtQpass" ErrorMessage="密码不一致" Width="70px"></asp:CompareValidator></td>
                        </tr>
                        <tr>
                            <td colspan="3" style="text-align: center">
                                &nbsp;<asp:Button ID="btnAdd" runat="server" Text="添 加" OnClick="btnAdd_Click" />
                    <input id="Button2" onclick="window.close()" type="button" value="关　闭" /></td>
                        </tr>
                    </table>
                </td>
            </tr>
        </table>
    
    </div>
    </form>
</body>
</html>
