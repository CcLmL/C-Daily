<%@ Control Language="C#" AutoEventWireup="true" CodeFile="SearchTag.ascx.cs" Inherits="UserControl_SearchTag" %>
<table class="Text" cellpadding="2" width="200" cellspacing="0" border="0" bordercolor="#daeeee">
	<tr>
		<td>关键字:<asp:TextBox ID="tbKey" runat="server" SkinID="tbSkin" Width="120px" MaxLength="20"></asp:TextBox><asp:Button ID="btnSearch" runat="server" CssClass="Button" Text="搜索" SkinID="btnSkin" OnClick="btnSearch_Click" />
		</td>
	</tr>	
	<tr>
		<td>
			<asp:DataList ID="dlTag" runat="server" Width="100%" RepeatColumns="1" SkinID="dlSkin">
				<ItemTemplate>
					<a href='Portal/ViewTag.aspx?TagID=<%# Eval("ID") %>'><%# Eval("Name") %>(<%# Eval("ViewCount") %>)</a>
				</ItemTemplate>
				<AlternatingItemTemplate>
					<a href='Portal/ViewTag.aspx?TagID=<%# Eval("ID") %>'><%# Eval("Name") %>(<%# Eval("ViewCount") %>)</a>
				</AlternatingItemTemplate>				
			</asp:DataList>
		</td>
	</tr>
</table> 