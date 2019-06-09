<%@ Page Language="C#" AutoEventWireup="true" CodeFile="manage_issuanceBulletin.aspx.cs" Inherits="Manage_issuanceBulletin" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
    <title>无标题页</title>
</head>
<body style="text-align: left">
    <form id="form1" runat="server">
    <div>
        <div style="text-align: left">
            <table border="0" cellpadding="0" cellspacing="0" style="width: 509px; height: 281px">
                <tr>
                    <td style="width: 87px; text-align: center;">
                        <strong><span style="font-size: 16pt; color: #660099">
                            <div style="text-align: center">
                                <table border="0" cellpadding="0" cellspacing="0" style="width: 489px">
                                    <tr>
                                        <td style="width: 100px; text-align: center">
                                            发布公告</td>
                                    </tr>
                                </table>
                            </div>
                        </span></strong></td>
                    <td >
                    </td>
                </tr>
                <tr>
                    <td style="width: 87px; text-align: left" valign="top">
                        <table border="0" cellpadding="0" cellspacing="0" style="width: 502px; height: 247px;
                            background-color: #ffffe8">
                            <tr>
                                <td style="width: 100px; text-align: right">
                                    公告标题：</td>
                                <td style="width: 100px">
                                    <asp:TextBox ID="tebTitle" runat="server" Width="267px"></asp:TextBox></td>
                            </tr>
                            <tr>
                                <td style="width: 100px; text-align: right">
                                    公告内容：</td>
                                <td style="width: 100px">
                                    <asp:TextBox ID="tebContent" runat="server" Height="139px" TextMode="MultiLine" Width="273px"></asp:TextBox></td>
                            </tr>
                            <tr>
                                <td style="width: 100px; text-align: right">
                                    公告人：</td>
                                <td style="width: 100px">
                                    <asp:TextBox ID="tebName" runat="server"></asp:TextBox></td>
                            </tr>
                            <tr>
                                <td colspan="2" style="text-align: center">
                                    <asp:Button ID="btnFB" runat="server" OnClick="btnFB_Click" Text="发　布" />
                                    &nbsp; &nbsp; &nbsp;
                                    <input id="Reset1" type="reset" value="重 置" style="width: 53px" />
                                    &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&nbsp;
                                </td>
                            </tr>
                        </table>
                    </td>
                    <td style="width: 100px">
                    </td>
                </tr>
                <tr>
                    <td style="width: 87px">
                    </td>
                    <td style="width: 100px">
                    </td>
                </tr>
            </table>
        </div>
    
    </div>
    </form>
</body>
</html>
