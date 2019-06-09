<%@ Page Language="C#" AutoEventWireup="true"  CodeFile="Default.aspx.cs" Inherits="_Default" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
    <title>无标题页</title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
        <table style="width: 782px; height: 231px">
            <tr>
                <td style="width: 332px">
                    发送人邮箱</td>
                <td>
                    <asp:TextBox ID="txtsendmail" runat="server"></asp:TextBox></td>
                <td style="width: 181px">
                    发送人姓名</td>
                <td>
                    <asp:TextBox ID="txtsendname" runat="server"></asp:TextBox></td>
            </tr>
            <tr>
                <td style="width: 332px">
                    收件人邮箱</td>
                <td>
                    <asp:TextBox ID="txtreceive" runat="server"></asp:TextBox></td>
                <td style="width: 181px">
                    邮件服务器</td>
                <td>
                    <asp:TextBox ID="smtp" runat="server"></asp:TextBox></td>
            </tr>
            <tr>
                <td style="width: 332px">
                    </td>
                <td>
                    </td>
                <td colspan="2">
                </td>
            </tr>
            <tr>
                <td style="width: 332px">
                    验证用户名</td>
                <td>
                    <asp:TextBox ID="txtValidatename" runat="server"></asp:TextBox></td>
                <td style="width: 181px">
                    验证密码</td>
                <td>
                    <asp:TextBox ID="txtValidatepass" runat="server" TextMode="Password"></asp:TextBox></td>
            </tr>
            <tr>
                <td style="width: 332px">
                    主题</td>
                <td>
                    <asp:TextBox ID="subject" runat="server"></asp:TextBox></td>
                <td style="width: 181px">
                    附件</td>
                <td>
                    <asp:FileUpload ID="FileUpload1" runat="server" /></td>
            </tr>
            <tr>
                <td style="width: 332px">
                    内容</td>
                <td>
                    <asp:TextBox ID="txtcontent" runat="server" Rows="5" TextMode="MultiLine"></asp:TextBox></td>
                <td colspan="2">
                    <asp:Button ID="Button1" runat="server" OnClick="Button1_Click" Text="发送" Width="166px" /></td>
            </tr>
        </table>
    
    </div>
    </form>
</body>
</html>
