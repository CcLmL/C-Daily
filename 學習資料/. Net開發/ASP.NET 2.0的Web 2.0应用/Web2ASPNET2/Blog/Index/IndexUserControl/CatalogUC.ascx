<%@ Control Language="C#" AutoEventWireup="true" CodeFile="CatalogUC.ascx.cs" Inherits="Index_IndexUserControl_CatalogUC" %>
<%@ Register Src="../../UserControl/ModuleTitle.ascx" TagName="ModuleTitle" TagPrefix="ucTitle" %>
<table class="Table" cellpadding="2" cellspacing="0" border="1" bordercolor="#daeeee">
	<tr>
		<td colspan="2"><ucTitle:ModuleTitle ID="ModuleTitle1" runat="server" Title='文章分类' /></td>
	</tr>
	<tr>
		<td colspan="2">
			<asp:GridView ID="gvCatalog" runat="server" AutoGenerateColumns="False" Font-Names="Tahoma" Width="100%" SkinID="gvSkin" DataKeyNames="ID" ShowHeader="False">
				<HeaderStyle Font-Names="Tahoma" HorizontalAlign="Center" />
				<EmptyDataTemplate>
					文章分类列表为空。
				</EmptyDataTemplate>					
				<EmptyDataRowStyle ForeColor="Blue" />
				<RowStyle BorderColor="#DAEEEE" BorderStyle="Ridge" BorderWidth="0px" HorizontalAlign="Left" />
				<Columns>
					<asp:TemplateField>
						<ItemTemplate>
							<a href='Index.aspx?CatalogID=<%# Eval("ID") %>'><%# Eval("Name")%>(<%# Eval("ArticleCount")%>)</a>
						</ItemTemplate>
					</asp:TemplateField>									
				</Columns>
			</asp:GridView>
		</td>
	</tr>		
</table>