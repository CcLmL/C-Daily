<%@ Page Language="C#" AutoEventWireup="true" CodeFile="admSet.aspx.cs" Inherits="admSet" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
    <title>权限设置</title>
    <link href="css.css" rel="stylesheet" type="text/css" />
</head>
<body>
    <form id="form1" runat="server">
    <div>
        <table align="center" background="Images/xiaobei.gif" border="0"
            cellpadding="0" cellspacing="0" height="176" width="292">
            <tr>
                <td>
                    <table align="center" border="0" cellpadding="0" cellspacing="0" height="125" width="266">
                        <tr>
                            <td width="91">
                                <div align="right">
                                    管理员名称：</div>
                            </td>
                            <td colspan="2">
                                &nbsp;<asp:TextBox ID="txtUserName" runat="server" ReadOnly="True" Width="122px"></asp:TextBox></td>
                        </tr>
                        <tr>
                            <td rowspan="3">
                                <div align="right">
                                    管理权限：</div>
                            </td>
                            <td width="85">
                                &nbsp;<asp:CheckBox ID="cekboxSystemSet" runat="server" Text="系统设置" /></td>
                            <td width="90">
                                &nbsp;<asp:CheckBox ID="ceckboxBookBorrow" runat="server" Text="图书借还" /></td>
                        </tr>
                        <tr>
                            <td>
                                &nbsp;<asp:CheckBox ID="ceckboxReaderManage" runat="server" Text="读者管理" /></td>
                            <td>
                                &nbsp;<asp:CheckBox ID="ceckboxSystemSearch" runat="server" Text="系统查询" /></td>
                        </tr>
                        <tr>
                            <td>
                                &nbsp;<asp:CheckBox ID="ceckboxBookManage" runat="server" Text="图书管理" /></td>
                            <td>
                                &nbsp;</td>
                        </tr>
                        <tr>
                            <td colspan="3" style="text-align: center">
                                &nbsp;<asp:Button ID="btnSave" runat="server" Text="保　存" OnClick="btnSave_Click" />
                    <input id="btnClose" onclick="window.close()" type="button" value="关　闭" /></td>
                        </tr>
                    </table>
                </td>
            </tr>
        </table>
    
    </div>
    </form>
</body>
</html>
