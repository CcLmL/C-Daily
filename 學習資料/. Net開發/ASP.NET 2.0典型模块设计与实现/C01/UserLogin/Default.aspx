<%@ Page Language="C#" AutoEventWireup="true"  CodeFile="Default.aspx.cs" Inherits="_Default" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
    <title>无标题页</title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
        <table style="width: 379px">
            <tr>
                <td>
                </td>
                <td>
                </td>
                <td style="width: 236px">
                    <asp:LoginName ID="LoginName1" runat="server" />
                    <asp:LoginStatus ID="LoginStatus1" runat="server" />
                    <asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl="~/ChangePass.aspx">修改密码</asp:HyperLink></td>
            </tr>
            <tr>
                <td>
                    &nbsp;&nbsp;
                </td>
                <td>
                    欢迎光临本网站</td>
                <td style="width: 236px">
                    <asp:LoginView ID="LoginView1" runat="server">
                    </asp:LoginView>
                </td>
            </tr>
            <tr>
                <td>
                </td>
                <td>
                </td>
                <td style="width: 236px">
                </td>
            </tr>
        </table>
    
    </div>
        <asp:Button ID="Button1" runat="server" OnClick="Button1_Click" Text="Button" />
    </form>
</body>
</html>
