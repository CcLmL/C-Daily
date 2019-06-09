<%@ Control Language="C#" AutoEventWireup="true" CodeFile="ShoppingCartControl.ascx.cs" Inherits="controls_ShoppingCartControl" %>
<asp:Panel ID="panFocus" runat="server" DefaultButton="btnTotal" Width="739px">

        <div align="left" class="cartHeader">您购物篮中的图书有</div>
<asp:Label runat="server" ID="lblMsg" EnableViewState="false"  CssClass="label" />

<asp:Repeater ID="repShoppingCart" runat="server">
    <HeaderTemplate>
        <table cellspacing="0" cellpadding="3" rules="all" border="0" class="cart"  >
            <tr class="labelLists">
				<th scope="col">&nbsp;</th>
				<th scope="col">书名</th>
				<th scope="col">数量</th>
				<th align="right" scope="col">价格</th>
				<th scope="col">&nbsp;</th>
			</tr>
    </HeaderTemplate>
    <ItemTemplate>
            <tr class="listItem">
				<td>
                    <asp:ImageButton ID="btnDelete" runat="server" BorderStyle="None" CausesValidation="false"
                    CommandArgument='<%# Eval("ItemId") %>' OnCommand="CartItem_Command" CommandName="Del"  ImageUrl="~/images/button-delete.gif"   ToolTip="Delete" />
                </td>
				<td >
                    <a id="A1" runat="server" href='<%# string.Format("~/Cart/Items.aspx?itemId={0}&productId={1}&supplierId={2}", Eval("ItemId"), Eval("ProductId"), Eval("SupplierId")) %>'><%# string.Format("{0}", Eval("Name")) %></a>
                </td>
				<td>
				    <asp:TextBox ID="txtQuantity" runat="server" Columns="3" Text='<%# Eval("Quantity") %>' Width="20px"></asp:TextBox>
                </td>
				<td align="right"><%# Eval("Price", "{0:c}")%></td><td>
                </td>
			</tr>
    </ItemTemplate>
    <FooterTemplate>
        </table>
    </FooterTemplate>
</asp:Repeater>  
<asp:PlaceHolder ID="plhTotal" runat="server" EnableViewState="false">
    <table border="0" cellpadding="0" cellspacing="0" width="387">
        <tr>
            <td class="dottedLineCentered" colspan="4">&nbsp;</td>
        </tr>
        <tr>
            <td class="total" >总计 </td><td>
                <asp:ImageButton ID="btnTotal" runat="server"　OnClick="BtnTotal_Click" AlternateText="计算总价值" CausesValidation="false"
                     EnableViewState="false" ImageUrl ="~/images/button-calculate.gif" /></td>
            <td align="right" class="total">
                <asp:Literal ID="ltlTotal" runat="server" EnableViewState="false"></asp:Literal></td><td width="30">&nbsp;</td>
        </tr>
    </table>
</asp:PlaceHolder>
    <table border="0" cellpadding="0" cellspacing="0" width="387">
        <tr>
            <td class="" colspan="4">&nbsp;</td>
        </tr>
        <tr>
            <td colspan="4" align="right" > <a href="../CheckOut.aspx">下订单</a></td>
        </tr>
    </table>
</asp:Panel>