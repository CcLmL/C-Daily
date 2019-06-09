<%@ Page Language="C#" AutoEventWireup="true" CodeFile="ItemManager.aspx.cs" Inherits="ItemManager" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
    <title>无标题页</title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
        <table style="width: 437px">
            <tr>
                <td>
                    <asp:TextBox ID="TextBox1" runat="server"></asp:TextBox></td>
                <td>
                    <asp:Button ID="Button1" runat="server" Text="添加项目" OnClick="Button1_Click" /></td>
            </tr>
            <tr>
                <td>
                    <asp:DropDownList ID="DropDownList1" runat="server" DataSourceID="SqlDataSource1"
                        DataTextField="ItemName" DataValueField="ItemID" Width="154px">
                    </asp:DropDownList><asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:VoteConnectionString %>"
                        SelectCommand="SELECT [ItemName], [ItemID] FROM [VoteItem]"></asp:SqlDataSource>
                    &nbsp;
                </td>
                <td>
                    <asp:Button ID="Button2" runat="server" Text="删除项目" OnClick="Button2_Click" /></td>
            </tr>
            <tr>
                <td>
                    <asp:Label ID="Label1" runat="server"></asp:Label></td>
                <td>
                </td>
            </tr>
        </table>
    
    </div>
    </form>
</body>
</html>
