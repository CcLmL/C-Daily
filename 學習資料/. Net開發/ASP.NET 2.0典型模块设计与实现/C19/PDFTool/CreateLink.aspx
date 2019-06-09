<%@ Page Language="C#" AutoEventWireup="true" CodeFile="CreateLink.aspx.cs" Inherits="CreateLink" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
    <title>无标题页</title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
        <table style="width: 397px; height: 130px">
            <tr>
                <td>
                    输入链接前的文本内容</td>
                <td>
                    <asp:TextBox ID="TextBox1" runat="server"></asp:TextBox></td>
            </tr>
            <tr>
                <td>
                    输入链接到的地址</td>
                <td>
                    <asp:TextBox ID="TextBox2" runat="server"></asp:TextBox></td>
            </tr>
            <tr>
                <td>
                    目标文件的生成地址</td>
                <td>
                    <asp:TextBox ID="TextBox3" runat="server"></asp:TextBox></td>
            </tr>
            <tr>
                <td>
                    <asp:Button ID="Button1" runat="server" OnClick="Button1_Click" Text="生成" Width="110px" /></td>
                <td>
                    <asp:Label ID="Label1" runat="server"></asp:Label></td>
            </tr>
        </table>
    
    </div>
    </form>
</body>
</html>
