<%@ Page Language="C#" AutoEventWireup="true" CodeFile="newPass.aspx.cs" Inherits="newPass" %>

<%@ Register Src="header.ascx" TagName="header" TagPrefix="uc1" %>
<%@ Register Src="bottom.ascx" TagName="bottom" TagPrefix="uc2" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
    <title>无标题页</title>
     <link href="css.css" rel="stylesheet" type="text/css" />
</head>
<body style="text-align: center">
    <form id="form1" runat="server">
        <table border="0" cellpadding="0" cellspacing="0" style="border-right: #669900 1px solid;
            border-top: #669900 1px solid; border-left: #669900 1px solid; width: 696px;
            border-bottom: #669900 1px solid; background-color: #ffffff">
            <tr>
                <td style="height: 15px">
                    <uc1:header ID="Header1" runat="server" />
                    &nbsp;</td>
            </tr>
            <tr>
                <td style="text-align: left">
                    &nbsp;<span style="color: #cc0000">当前位置： 更改口令</span></td>
            </tr>
            <tr>
                <td>
                    &nbsp;<img src="Images/genggaikouling.GIF" width="815" /></td>
            </tr>
            <tr>
                <td>
                    <table border="0" cellpadding="0" cellspacing="0" style="width: 330px; height: 135px">
                        <tr>
                            <td style="width: 100px">
                                管理员名称：</td>
                            <td style="width: 100px">
                                <asp:TextBox ID="txtUserName" runat="server" ReadOnly="True" Width="138px"></asp:TextBox></td>
                            <td style="width: 100px">
                            </td>
                        </tr>
                        <tr>
                            <td style="width: 100px">
                                旧密码：</td>
                            <td style="width: 100px">
                                <asp:TextBox ID="txtOldPass" runat="server" TextMode="Password"></asp:TextBox></td>
                            <td style="width: 100px">
                            </td>
                        </tr>
                        <tr>
                            <td style="width: 100px">
                                新密码：</td>
                            <td style="width: 100px">
                                <asp:TextBox ID="txtNewPass" runat="server" TextMode="Password"></asp:TextBox></td>
                            <td style="width: 100px">
                            </td>
                        </tr>
                        <tr>
                            <td style="width: 100px">
                                确认新密码：</td>
                            <td style="width: 100px">
                                <asp:TextBox ID="txtQNewPass" runat="server" TextMode="Password"></asp:TextBox></td>
                            <td style="width: 100px">
                            </td>
                        </tr>
                        <tr>
                            <td colspan="3">
                                <asp:Button ID="btnSave" runat="server" OnClick="btnSave_Click" Text="保　存" /></td>
                        </tr>
                    </table>
                    &nbsp;
                </td>
            </tr>
            <tr>
                <td>
                    &nbsp;
                    <uc2:bottom ID="Bottom1" runat="server" />
                </td>
            </tr>
        </table>
    </form>
</body>
</html>
