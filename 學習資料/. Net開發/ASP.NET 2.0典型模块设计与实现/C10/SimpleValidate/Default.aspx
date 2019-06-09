<%@ Page Language="C#" AutoEventWireup="true"  CodeFile="Default.aspx.cs" Inherits="_Default" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
    <title>无标题页</title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
        <table style="width: 502px; height: 205px">
            <tr>
                <td>
        &nbsp;<asp:Label ID="Label1" runat="server" BackColor="#E0E0E0" Width="242px"></asp:Label></td>
            </tr>
            <tr>
                <td>
                    请输入验证码：</td>
            </tr>
            <tr>
                <td>
                    <asp:TextBox ID="TextBox1" runat="server"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="TextBox1"
                        ErrorMessage="必须输入验证码"></asp:RequiredFieldValidator></td>
            </tr>
            <tr>
                <td style="height: 33px">
                    <asp:Button ID="Button1" runat="server" OnClick="Button1_Click" Text="提交" Width="116px" /></td>
            </tr>
        </table>
    
    </div>
    </form>
</body>
</html>
