<%@ Control Language="C#" AutoEventWireup="true" CodeFile="ShowTags.ascx.cs" Inherits="UserControl_ShowTags" %>
<%@ Register Src="ModuleTitle.ascx" TagName="ModuleTitle" TagPrefix="ucTitle" %>
<table class="Text" cellpadding="2" width="200" cellspacing="0" border="0" bordercolor="#daeeee">
	<tr>
		<td><ucTitle:ModuleTitle ID="ModuleTitle1" runat="server" Title="热门标签" />
		</td>
	</tr>	
	<tr>
		<td>
			<asp:DataList ID="dlTag" runat="server" RepeatColumns="1" SkinID="dlSkin">
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