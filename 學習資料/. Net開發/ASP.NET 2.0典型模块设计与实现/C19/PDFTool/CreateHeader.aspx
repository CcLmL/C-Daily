<%@ Page Language="C#" AutoEventWireup="true" CodeFile="CreateHeader.aspx.cs" Inherits="CreateHeader" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
    <title>无标题页</title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
        <table style="width: 518px; height: 173px">
            <tr>
                <td style="width: 119px; height: 21px">
                    页眉内容</td>
                <td style="width: 50px; height: 21px">
                    <asp:TextBox ID="TextBox1" runat="server" Width="233px"></asp:TextBox></td>
            </tr>
            <tr>
                <td style="width: 119px">
                    页脚内容</td>
                <td style="width: 50px">
                    <asp:TextBox ID="TextBox2" runat="server" Width="229px"></asp:TextBox></td>
            </tr>
            <tr>
                <td style="width: 119px">
                    生成文件地址</td>
                <td style="width: 50px">
                    <asp:TextBox ID="TextBox3" runat="server" Width="231px"></asp:TextBox></td>
            </tr>
            <tr>
                <td style="width: 119px">
                </td>
                <td style="width: 50px">
                    <asp:Button ID="Button1" runat="server" OnClick="Button1_Click" Text="生成" Width="117px" /></td>
            </tr>
        </table>
    
    </div>
    </form>
</body>
</html>
