<%@ Page Language="C#" AutoEventWireup="true" CodeFile="SimpleProfile.aspx.cs" Inherits="SimpleProfile" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
    <title>无标题页</title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
        <table style="width: 427px">
            <tr>
                <td colspan="2">
                    简单个性化设置</td>
            </tr>
            <tr>
                <td>
                    我的姓名</td>
                <td>
                    <asp:TextBox ID="txtname" runat="server"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="txtname"
                        ErrorMessage="*"></asp:RequiredFieldValidator></td>
            </tr>
            <tr>
                <td>
                    姓名的提示信息</td>
                <td>
                    <asp:TextBox ID="txtTooltip" runat="server"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="txtTooltip"
                        ErrorMessage="*"></asp:RequiredFieldValidator></td>
            </tr>
            <tr>
                <td >
                    显示应用个性化设置的姓名</td>
                <td >
                    &nbsp;<asp:Label ID="Label1" runat="server"></asp:Label></td>
            </tr>
            <tr>
                <td>
                </td>
                <td>
                    <asp:Button ID="Button1" runat="server" OnClick="Button1_Click" Text="保存我的设置" /></td>
            </tr>
        </table>
    
    </div>
    </form>
</body>
</html>
