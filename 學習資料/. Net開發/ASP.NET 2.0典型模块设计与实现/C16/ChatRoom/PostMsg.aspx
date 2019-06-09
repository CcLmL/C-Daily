<%@ Page Language="C#" AutoEventWireup="true" CodeFile="PostMsg.aspx.cs" Inherits="PostMsg" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
    <title>无标题页</title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
        <table style="width: 475px">
            <tr>
                <td colspan="2">
                    对<asp:DropDownList ID="DropDownList1" runat="server" DataSourceID="ObjectDataSource1"
                        DataTextField="UserName" DataValueField="UserName" Width="124px">
                    </asp:DropDownList>
                    说：&nbsp;<asp:ObjectDataSource ID="ObjectDataSource1" runat="server" SelectMethod="GetUsers"
                        TypeName="GetOnline"></asp:ObjectDataSource>
                    &nbsp;</td>
            </tr>
            <tr>
                <td colspan="2">
                    <asp:TextBox ID="TextBox1" runat="server" Width="455px"></asp:TextBox></td>
            </tr>
            <tr>
                <td style="width: 267px">
                    <asp:CheckBox ID="CheckBox1" runat="server" Text="私聊" Width="96px" /></td>
                <td>
                    <asp:Button ID="Button1" runat="server" Text="发言" Width="86px" OnClick="Button1_Click" /></td>
            </tr>
        </table>
    
    </div>
    </form>
</body>
</html>
