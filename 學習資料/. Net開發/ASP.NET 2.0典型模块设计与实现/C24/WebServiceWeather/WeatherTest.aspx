<%@ Page Language="C#" AutoEventWireup="true" CodeFile="WeatherTest.aspx.cs" Inherits="WeatherTest" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
    <title>无标题页</title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
        <table style="width: 599px; height: 213px">
            <tr>
                <td colspan="2" style="text-align: center">
                    <strong>天气预报模块</strong></td>
            </tr>
            <tr>
                <td style="width: 186px">
                    要搜索的城市：</td>
                <td>
                    <asp:TextBox ID="TextBox1" runat="server" Width="387px"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="TextBox1"
                        ErrorMessage="城市名称必须填写"></asp:RequiredFieldValidator></td>
            </tr>
            <tr>
                <td style="width: 186px">
                </td>
                <td>
                    <asp:Button ID="Button1" runat="server" OnClick="Button1_Click" Text="搜索" Width="129px" /></td>
            </tr>
            <tr>
                <td colspan="2" style="height: 21px">
                    <asp:Label ID="Label1" runat="server" Width="583px"></asp:Label></td>
            </tr>
        </table>
    
    </div>
    </form>
</body>
</html>
