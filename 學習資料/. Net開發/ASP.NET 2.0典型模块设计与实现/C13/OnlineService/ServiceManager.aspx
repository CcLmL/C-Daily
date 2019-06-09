<%@ Page Language="C#" AutoEventWireup="true" CodeFile="ServiceManager.aspx.cs" Inherits="ServiceManager" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
    <title>无标题页</title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
        <table style="width: 472px">
            <tr>
                <td colspan="2">
                    添加客服人员</td>
            </tr>
            <tr>
                <td style="width: 115px">
                    <asp:TextBox ID="TextBox1" runat="server"></asp:TextBox></td>
                <td>
                    <asp:Button ID="Button1" runat="server" OnClick="Button1_Click" Text="添加" Width="76px" /></td>
            </tr>
            <tr>
                <td colspan="2" style="height: 15px">
                    <hr />
                    <asp:Literal ID="Literal1" runat="server"></asp:Literal></td>
            </tr>
            <tr>
                <td colspan="2">
                    删除客服人员</td>
            </tr>
            <tr>
                <td style="width: 115px">
                    <asp:ListBox ID="ListBox1" runat="server" DataSourceID="SqlDataSource1" DataTextField="ListQQ"
                        DataValueField="ListQQ" Width="151px"></asp:ListBox><asp:SqlDataSource ID="SqlDataSource1"
                            runat="server" ConnectionString="<%$ ConnectionStrings:QQConnectionString %>"
                            SelectCommand="SELECT [ListQQ] FROM [QQList]"></asp:SqlDataSource>
                </td>
                <td>
                    <asp:Button ID="Button2" runat="server" OnClick="Button2_Click" Text="删除" Width="83px" /></td>
            </tr>
        </table>
    
    </div>
    </form>
</body>
</html>
