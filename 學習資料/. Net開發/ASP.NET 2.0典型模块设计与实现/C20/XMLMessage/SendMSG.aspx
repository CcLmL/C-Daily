<%@ Page Language="C#" AutoEventWireup="true" CodeFile="SendMSG.aspx.cs" Inherits="SendMSG" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
    <title>无标题页</title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
        <table style="width: 416px">
            <tr>
                <td colspan="2">
                    留言内容：</td>
            </tr>
            <tr>
                <td colspan="2">
                    <asp:TextBox ID="txtcontent" runat="server" Rows="8" TextMode="MultiLine" Width="394px"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="txtcontent"
                        ErrorMessage="内容必须填写"></asp:RequiredFieldValidator></td>
            </tr>
            <tr>
                <td colspan="2">
                    姓名：<asp:TextBox ID="txtname" runat="server" Width="148px"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="txtname"
                        ErrorMessage="姓名必须填写"></asp:RequiredFieldValidator></td>
            </tr>
            <tr>
                <td colspan="2">
                    邮箱：<asp:TextBox ID="txtmail" runat="server" Width="149px"></asp:TextBox>
                    <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ControlToValidate="txtmail"
                        ErrorMessage="E-Mail格式不正确" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"></asp:RegularExpressionValidator></td>
            </tr>
            <tr>
                <td colspan="2">
                    网址：<asp:TextBox ID="txturl" runat="server" Width="344px">http://</asp:TextBox></td>
            </tr>
            <tr>
                <td style="width: 230px">
                </td>
                <td style="width: 230px">
                </td>
            </tr>
            <tr>
                <td style="width: 230px">
                    <asp:Button ID="Button1" runat="server" OnClick="Button1_Click" Text="提交留言" Width="151px" /></td>
                <td style="width: 230px">
                    <input id="Reset1" style="width: 136px" type="reset" value="重置" /></td>
            </tr>
        </table>
    
    </div>
    </form>
</body>
</html>
