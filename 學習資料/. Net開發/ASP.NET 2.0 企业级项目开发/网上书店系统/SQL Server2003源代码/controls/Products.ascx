<%@ Control Language="C#" AutoEventWireup="true" CodeFile="Products.ascx.cs" Inherits="controls_Products" %>
<asp:Repeater ID="Repeater1" runat="server">
        <ItemTemplate>
            <table cellpadding="0" cellspacing="0">
                <tr>
                    <td valign="top" width="91"><a href='../Cart/Items.aspx?productId=<%# Eval("Id") %>&categoryId=<%# Eval("categoryId") %>'><img id="imgProduct" alt='<%# Eval("Name") %>' src='<%# Eval("Image") %>' style="border-width: 0px;" runat="server" /></a></td>
                    <td width="26">&nbsp;</td>
                    <td valign="top" width="120"><a href='../Cart/Items.aspx?productId=<%# Eval("Id") %>&categoryId=<%# Eval("categoryId") %>'><div class="productName"><%# Eval("Name") %></div></a><div class="productDescription"><%# Eval("Description") %></div></td>                    
                </tr>               
            </table>            
        </ItemTemplate>
</asp:Repeater>
