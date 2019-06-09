<%@ Control Language="C#" AutoEventWireup="true" CodeFile="CartList.ascx.cs" Inherits="controls_CartList" %>
<asp:Repeater ID="Repeater1" runat="server">
    <HeaderTemplate><table cellspacing="0" cellpadding="0" border="0" style="width:100%;border-collapse:collapse;">
        <tr align="left">
            <th scope="col">书名</th><th scope="col">数量</th>
        </tr></HeaderTemplate>
    <ItemTemplate><tr valign="top">
            <td><%# Eval("Name") %></td>
            <td><%# Eval("Quantity") %></td>
        </tr></ItemTemplate>
    <FooterTemplate></table></FooterTemplate>
</asp:Repeater>
