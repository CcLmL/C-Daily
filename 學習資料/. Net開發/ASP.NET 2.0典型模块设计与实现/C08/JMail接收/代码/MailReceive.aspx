<%@ Page Language="C#" AutoEventWireup="true" CodeFile="MailReceive.aspx.cs" Inherits="MailReceive" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
    <title>无标题页</title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
        <table style="width: 662px">
            <tr>
                <td>
                    邮件优先级</td>
                <td>
                    <asp:TextBox ID="txtPriority" runat="server" Width="173px"></asp:TextBox></td>
                <td>
                    发件人邮箱</td>
                <td>
                    <asp:TextBox ID="txtFrom" runat="server"></asp:TextBox></td>
            </tr>
            <tr>
                <td>
                    发件人姓名</td>
                <td>
                    <asp:TextBox ID="txtFromname" runat="server" Width="170px"></asp:TextBox></td>
                <td>
                    邮件主题</td>
                <td>
                    <asp:TextBox ID="txtSubject" runat="server"></asp:TextBox></td>
            </tr>
            <tr>
                <td>
                    邮件大小</td>
                <td>
                    <asp:TextBox ID="txtSize" runat="server" Width="171px"></asp:TextBox></td>
                <td colspan="2">
                </td>
            </tr>
            <tr>
                <td style="height: 104px">
                    邮件内容</td>
                <td style="height: 104px">
                    <asp:TextBox ID="txtContent" runat="server" Rows="5" TextMode="MultiLine"></asp:TextBox></td>
                <td colspan="2" style="height: 104px">
                    <asp:Button ID="Button1" runat="server" Text="接收" Width="128px" OnClick="Button1_Click" /></td>
            </tr>
        </table>
    
    </div>
    </form>
</body>
</html>
