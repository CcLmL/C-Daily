<%@ Page Language="C#" AutoEventWireup="true"  CodeFile="Default.aspx.cs" Inherits="_Default" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
    <title>无标题页</title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
        &nbsp;<table style="width: 441px; height: 135px">
            <tr>
                <td style="width: 160px">
                    验证码是：</td>
                <td>
                    <asp:Image ID="Image1" runat="server" Height="42px" Width="117px" ImageUrl="~/CreateImage.aspx" /></td>
            </tr>
            <tr>
                <td style="width: 160px">
                    请输入验证码</td>
                <td>
                    <asp:TextBox ID="TextBox1" runat="server"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="TextBox1"
                        ErrorMessage="必须输入验证码"></asp:RequiredFieldValidator></td>
            </tr>
            <tr>
                <td style="width: 160px">
                </td>
                <td>
                    <asp:Button ID="Button1" runat="server" Text="提交" Width="100px" OnClick="Button1_Click" /></td>
            </tr>
        </table>
    
    </div>
    </form>
</body>
</html>
