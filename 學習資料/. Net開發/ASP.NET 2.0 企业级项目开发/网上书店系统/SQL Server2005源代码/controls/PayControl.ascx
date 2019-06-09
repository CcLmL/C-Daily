<%@ Control Language="C#" AutoEventWireup="true" CodeFile="PayControl.ascx.cs" Inherits="controls_PayControl" %>
<table style="width: 429px; height: 129px;">
    <tr>
        <td style="width: 174px">
            姓名</td>
        <td>
            <asp:TextBox ID="txtname" runat="server" Width="241px"></asp:TextBox></td>
    </tr>
    <tr>
        <td style="width: 174px; height: 21px">
            卡类型</td>
        <td style="height: 21px">
            <asp:DropDownList ID="ddltype" runat="server" Width="238px">
                <asp:ListItem>龙卡</asp:ListItem>
                <asp:ListItem>灵通卡</asp:ListItem>
                <asp:ListItem>牡丹卡</asp:ListItem>
                <asp:ListItem>金葵花卡</asp:ListItem>
            </asp:DropDownList></td>
    </tr>
    <tr>
        <td style="width: 174px">
            卡号</td>
        <td>
            <asp:TextBox ID="txtcardnum" runat="server" Width="238px"></asp:TextBox></td>
    </tr>
</table>
