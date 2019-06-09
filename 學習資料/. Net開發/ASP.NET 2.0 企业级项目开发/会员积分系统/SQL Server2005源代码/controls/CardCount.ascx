<%@ Control Language="C#" AutoEventWireup="true" CodeFile="CardCount.ascx.cs" Inherits="controls_CardCount" %>
<table style="width: 383px; height: 122px">
    <tr>
        <td style="width: 171px; height: 61px">
            <asp:Label ID="Label1" runat="server" Text="请输入卡号：" Width="168px"></asp:Label></td>
        <td style="height: 61px">
            <asp:TextBox ID="txtcardnum" runat="server"></asp:TextBox></td>
        <td style="height: 61px">
            <asp:Button ID="Button1" runat="server" OnClick="Button1_Click" Text="查询" /></td>
    </tr>
    <tr>
        <td style="width: 171px; height: 64px">
            <asp:Label ID="Label2" runat="server" Text="您卡上的积分是：" Width="183px"></asp:Label></td>
        <td style="height: 64px">
            <asp:Label ID="Label3" runat="server" Width="153px"></asp:Label></td>
        <td style="height: 64px">
        </td>
    </tr>
    <tr>
        <td style="width: 171px; height: 64px">
            <asp:HyperLink ID="HyperLink1" runat="server"  >浏览积分历史记录</asp:HyperLink></td>
        <td style="height: 64px">
        </td>
        <td style="height: 64px">
        </td>
    </tr>
</table>
