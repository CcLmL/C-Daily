<%@ Page Language="C#" AutoEventWireup="true" CodeFile="SendMsg.aspx.cs" Inherits="SendMsg" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
    <title>无标题页</title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
        <table style="width: 534px; height: 257px">
            <tr>
                <td style="width: 154px">
                    帖子主题</td>
                <td>
                    <asp:TextBox ID="TextBox1" runat="server" Width="361px"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="TextBox1"
                        ErrorMessage="帖子主题必须填写"></asp:RequiredFieldValidator></td>
            </tr>
            <tr>
                <td style="width: 154px">
                    帖子内容</td>
                <td>
                    <asp:TextBox ID="TextBox2" runat="server" Rows="8" TextMode="MultiLine" Width="361px"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="TextBox2"
                        ErrorMessage="帖子内容必须填写"></asp:RequiredFieldValidator></td>
            </tr>
            <tr>
                <td style="width: 154px">
                </td>
                <td>
                    <asp:Button ID="Button1" runat="server" OnClick="Button1_Click" Text="发帖" Width="117px" /></td>
            </tr>
            <tr>
                <td style="width: 154px">
                </td>
                <td>
                    <asp:Literal ID="Literal1" runat="server"></asp:Literal></td>
            </tr>
        </table>
    
    </div>
    </form>
</body>
</html>
