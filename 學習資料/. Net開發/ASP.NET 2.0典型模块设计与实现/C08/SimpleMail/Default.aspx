<%@ Page Language="C#" AutoEventWireup="true"  CodeFile="Default.aspx.cs" Inherits="_Default" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
    <title>无标题页</title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
        <table style="width: 605px">
            <tr>
                <td colspan="2">
                    SMTP配置：</td>
            </tr>
            <tr>
                <td>
                    邮箱全名</td>
                <td>
                    <asp:TextBox ID="MailName" runat="server" Width="253px"></asp:TextBox></td>
            </tr>
            <tr>
                <td>
                    SMTP服务器</td>
                <td>
                    <asp:TextBox ID="Smtp" runat="server" Width="251px">smtp.263.net</asp:TextBox></td>
            </tr>
            <tr>
                <td>
                    端口</td>
                <td>
                    <asp:TextBox ID="Port" runat="server" Width="252px">25</asp:TextBox></td>
            </tr>
        </table>
    
    </div>
        <hr style="width: 808px" />
        <table style="width: 605px">
            <tr>
                <td colspan="2">
                    邮件信息：</td>
            </tr>
            <tr>
                <td style="width: 165px">
                    收件人</td>
                <td style="width: 454px">
                    <asp:TextBox ID="Receive" runat="server" Width="259px"></asp:TextBox></td>
            </tr>
            <tr>
                <td style="width: 165px">
                    抄送至</td>
                <td style="width: 454px">
                    <asp:TextBox ID="txtcc" runat="server" Width="258px"></asp:TextBox></td>
            </tr>
            <tr>
                <td style="width: 165px">
                    主题</td>
                <td style="width: 454px">
                    <asp:TextBox ID="Subject" runat="server" Width="258px"></asp:TextBox></td>
            </tr>
            <tr>
                <td style="width: 165px">
                    内容</td>
                <td style="width: 454px">
                    <asp:TextBox ID="Body" runat="server" Rows="5" TextMode="MultiLine" Width="257px"></asp:TextBox></td>
            </tr>
            <tr>
                <td style="width: 165px">
                    附件</td>
                <td style="width: 454px">
                    <asp:FileUpload ID="FileUpload1" runat="server" /></td>
            </tr>
            <tr>
                <td style="width: 165px">
                    <asp:Button ID="Button1" runat="server" OnClick="Button1_Click" Text="发送" /></td>
                <td style="width: 454px">
                    <asp:Label ID="Label1" runat="server"></asp:Label></td>
            </tr>
        </table>
    </form>
</body>
</html>
