<%@ Page Language="C#" AutoEventWireup="true" CodeFile="entry.aspx.cs" Inherits="entry" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
    <title>无标题页</title>
    <link href="css.css" rel="stylesheet" type="text/css" />
</head>
<body bgcolor="#e5e5e5">
    <form id="form1" runat="server">
    <div>
        <br />
        <br />
        <br />
        <br />
        <br />
        <br />
        <br />
        &nbsp;</div>
        <table align="center" background="Images/login.jpg"
            border="0" cellpadding="0" cellspacing="0" height="256" width="778">
            <tr>
                <td height="256">
                    <p>
                        &nbsp;</p>
                    <p>
                        &nbsp;</p>
                    <table align="right" border="0" cellpadding="0" cellspacing="0" height="118" width="526">
                        <tr>
                            <td width="199">
                                <div align="right">
                                    管理员名称：</div>
                            </td>
                            <td width="327">
                                            <asp:TextBox ID="txtName" runat="server" Width="127px"></asp:TextBox></td>
                        </tr>
                        <tr>
                            <td>
                                <div align="right">
                                    管理员密码：</div>
                            </td>
                            <td>
                                            <asp:TextBox ID="txtPwd" runat="server" TextMode="Password" Width="129px"></asp:TextBox></td>
                        </tr>
                        <tr>
                            <td>
                                &nbsp;</td>
                            <td>
                                &nbsp;<asp:Button ID="btnEntry" runat="server"  Text="确定" Width="46px" OnClick="btnEntry_Click" />
                                            <input id="Button2" class="btn_grey" name="Submit2" onclick="window.close();" type="button"
                                                value="关闭" /></td>
                        </tr>
                    </table>
                </td>
            </tr>
        </table>
    </form>
</body>
</html>
