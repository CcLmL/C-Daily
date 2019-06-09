<%@ Page Language="C#" AutoEventWireup="true" CodeFile="AddExam.aspx.cs" Inherits="AddExam" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
    <title>无标题页</title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
        <table style="width: 574px; height: 261px">
            <tr>
                <td colspan="2" style="text-align: center">
                    <strong><span style="font-size: 14pt">添加考题页面</span></strong></td>
            </tr>
            <tr>
                <td style="width: 193px">
                    考题内容：</td>
                <td>
                    <asp:TextBox ID="txttitle" runat="server" Width="352px"></asp:TextBox></td>
            </tr>
            <tr>
                <td style="width: 193px">
                    选择一：</td>
                <td>
                    <asp:TextBox ID="txtoption1" runat="server" Width="351px"></asp:TextBox></td>
            </tr>
            <tr>
                <td style="width: 193px">
                    选择二：</td>
                <td>
                    <asp:TextBox ID="txtoption2" runat="server" Width="351px"></asp:TextBox></td>
            </tr>
            <tr>
                <td style="width: 193px">
                    选择三：</td>
                <td>
                    <asp:TextBox ID="txtoption3" runat="server" Width="351px"></asp:TextBox></td>
            </tr>
            <tr>
                <td style="width: 193px; height: 26px">
                    答案：</td>
                <td style="height: 26px">
                    <asp:TextBox ID="txtresult" runat="server" Width="353px"></asp:TextBox></td>
            </tr>
            <tr>
                <td style="width: 193px">
                </td>
                <td>
                    <asp:Button ID="Button1" runat="server" Font-Bold="False" Font-Italic="False" OnClick="Button1_Click"
                        Text="添加考题" Width="116px" />
                </td>
            </tr>
            <tr>
                <td style="width: 193px">
                </td>
                <td>
                    <asp:Literal ID="Literal1" runat="server"></asp:Literal></td>
            </tr>
        </table>
    
    </div>
    </form>
</body>
</html>
