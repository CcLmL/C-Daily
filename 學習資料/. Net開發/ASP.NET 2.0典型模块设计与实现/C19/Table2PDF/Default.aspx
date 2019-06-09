<%@ Page Language="C#" AutoEventWireup="true"  CodeFile="Default.aspx.cs" Inherits="_Default" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
    <title>无标题页</title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
        &nbsp;<table style="width: 509px">
            <tr>
                <td style="width: 81px">
                    姓名：</td>
                <td style="width: 175px">
                    <asp:TextBox ID="txtname" runat="server"></asp:TextBox></td>
                <td style="width: 95px">
                    年龄：</td>
                <td>
                    <asp:TextBox ID="txtage" runat="server"></asp:TextBox></td>
            </tr>
            <tr>
                <td style="width: 81px">
                    性别：</td>
                <td style="width: 175px">
                    <asp:TextBox ID="txtsex" runat="server"></asp:TextBox></td>
                <td style="width: 95px">
                    地址：</td>
                <td>
                    <asp:TextBox ID="txtaddress" runat="server"></asp:TextBox></td>
            </tr>
            <tr>
                <td style="width: 81px">
                </td>
                <td style="width: 175px">
                    <asp:Button ID="Button2" runat="server" OnClick="Button2_Click" Text="添加到表" Width="97px" /></td>
                <td style="width: 95px">
                </td>
                <td>
                    <asp:Button ID="Button3" runat="server" Text="预览表" Width="98px" OnClick="Button3_Click" /></td>
            </tr>
            <tr>
                <td colspan="4">
                    <asp:DataList ID="DataList1" runat="server">
                    <HeaderTemplate>
                    <table>
                    </HeaderTemplate>
                    <ItemTemplate>
                    <tr><td> <b>姓名：</b><%# Eval("Name") %></td><td><b>性别：</b><%#Eval("Sex") %></td></tr>
                   <tr><td> <b>年龄：<%# Eval("Age") %></b></td></tr>
                   <tr><td> <b>地址：</b><%# Eval("Address") %></td> </tr>
                    </ItemTemplate>
                    <FooterTemplate>
                    </table>
                    </FooterTemplate>
                    </asp:DataList></td>
            </tr>
            <tr>
                <td style="width: 81px">
                </td>
                <td style="width: 175px">
                    <asp:Button ID="Button1" runat="server" OnClick="Button1_Click" Text="转换为PDF" /></td>
                <td style="width: 95px">
                </td>
                <td>
                    <asp:Button ID="Button4" runat="server" OnClick="Button4_Click" Text="显示在浏览器中" /></td>
            </tr>
        </table>
    
    </div>
    </form>
</body>
</html>
