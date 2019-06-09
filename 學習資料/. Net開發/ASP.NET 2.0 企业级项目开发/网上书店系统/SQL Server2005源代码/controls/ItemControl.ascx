<%@ Control Language="C#" AutoEventWireup="true" CodeFile="ItemControl.ascx.cs" Inherits="controls_ItemControl" %>
<div  align="center">
    <asp:Repeater ID="Repeater1" runat="server">
            <HeaderTemplate>
            <table cellspacing="0" cellpadding="0" border="0" width="387">
        </HeaderTemplate>
        <ItemTemplate>
            <tr align="left" valign="top">
                <td valign="top" width="148">
                    <img id="imgItem" alt='<%# Eval("Name") %>' src='<%# Eval("Image") %>' style="border-width: 0px;" runat="server" /></td>
                <td width="33">&nbsp;</td>
                <td valign="top" width="206">
                <table cellspacing="0" cellpadding="0" border="0">
		            <tr>
			            <td class="itemText">书名:</td>
			            <td class="itemName"><%# string.Format("{0} ", Eval("Name")) %></td>
		            </tr>
		            <tr class="itemText">
			            <td>数量:</td>
			            <td><%# Eval("Quantity") %></td>
		            </tr>
		            <tr class="itemText">
			            <td>价格:</td>
			            <td><%# Eval("Price", "{0:c}") %></td>
		            </tr>
		            <tr class="itemText">
			            <td colspan="2">
			            <asp:HyperLink Text="添加到购物篮" runat=server NavigateUrl='<%# string.Format("~/Cart/ShoppingCart.aspx?addItem={0}", Eval("Id")) %>'>
			            </asp:HyperLink></td>
		            </tr>
		            <tr class="itemText">
			            <td colspan="2"></td>
		            </tr>
	            </table>            
	            </td>
            </tr>            
        </ItemTemplate>
        <SeparatorTemplate>
            <tr>
                <td height="50" colspan="3">&nbsp;</td>
            </tr>
        </SeparatorTemplate>
        <FooterTemplate>
            </table></FooterTemplate>
    </asp:Repeater>
</div>