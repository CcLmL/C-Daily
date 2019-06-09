<%@ Page Language="C#" AutoEventWireup="true"  CodeFile="Default.aspx.cs" Inherits="_Default" %>

<%@ Register Assembly="FreeTextBox" Namespace="FreeTextBoxControls" TagPrefix="FTB" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
    <title>无标题页</title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
    <table>
    <tr>
    <td style="width: 491px">帖子主题：  
        <asp:TextBox ID="TextBox1" runat="server" Width="334px"></asp:TextBox></td></tr>
    <tr>
    <td style="width: 491px">内容：
        <FTB:FreeTextBox ID="FreeTextBox1" runat="server" BackColor="WhiteSmoke">
        </FTB:FreeTextBox>
    </td></tr>
    <tr><td style="width: 491px">
        <asp:Button ID="Button1" runat="server" OnClick="Button1_Click" Text="发帖" Width="143px" /></td></tr>
    <tr><td style="width: 491px">预览效果：<asp:Literal ID="View" runat="server"></asp:Literal></td>
    </tr>
    </table>
    </div>
    </form>
</body>
</html>
