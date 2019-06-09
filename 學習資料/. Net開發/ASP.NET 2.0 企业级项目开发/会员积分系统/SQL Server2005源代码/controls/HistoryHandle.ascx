<%@ Control Language="C#" AutoEventWireup="true" CodeFile="HistoryHandle.ascx.cs" Inherits="HistoryHandle" %>
<table style="width: 423px; height: 105px">
    <tr>
        <td>
            <asp:Label ID="Label1" runat="server" Text="请选择操作类型" Width="247px"></asp:Label></td>
        <td>
            <asp:DropDownList ID="ddltype" runat="server" Width="116px">
                <asp:ListItem Selected="True" Value="0">销售</asp:ListItem>
                <asp:ListItem Value="1">退货</asp:ListItem>
                <asp:ListItem Value="2">反馈</asp:ListItem>
            </asp:DropDownList></td>
    </tr>
    <tr>
        <td>
            <asp:Label ID="Label2" runat="server" Text="请输入会员卡号" Width="245px"></asp:Label></td>
        <td>
            <asp:TextBox ID="txtcardnum" runat="server"></asp:TextBox></td>
    </tr>
    <tr>
        <td style="height: 21px">
            <asp:Label ID="Label3" runat="server" Text="请输入消费金额" Width="246px"></asp:Label></td>
        <td style="height: 21px">
            <asp:TextBox ID="txtmoney" runat="server"></asp:TextBox></td>
    </tr>
    <tr>
        <td style="height: 21px">
            <asp:Button ID="Button1" runat="server" OnClick="Button1_Click" Text="确定" Width="95px" /></td>
        <td style="height: 21px">
            <asp:Label ID="Label4" runat="server" Width="105px"></asp:Label></td>
    </tr>
</table>
