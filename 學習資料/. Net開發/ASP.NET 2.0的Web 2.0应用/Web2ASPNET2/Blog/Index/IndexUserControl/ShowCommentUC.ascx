<%@ Control Language="C#" AutoEventWireup="true" CodeFile="ShowCommentUC.ascx.cs" Inherits="Index_IndexUserControl_ShowCommentUC" %>
<%@ Register Src="../../UserControl/ModuleTitle.ascx" TagName="ModuleTitle" TagPrefix="ucTitle" %>
<ucTitle:ModuleTitle ID="ModuleTitle1" runat="server" Title="评论" />
<asp:GridView ID="gvComment" runat="server" AutoGenerateColumns="False" Font-Names="Tahoma" Width="100%" SkinID="gvSkin" DataKeyNames="ID" ShowHeader="False">
	<HeaderStyle Font-Names="Tahoma" HorizontalAlign="Center" />
	<EmptyDataTemplate>
		暂无评论。
	</EmptyDataTemplate>					
	<EmptyDataRowStyle ForeColor="Blue" />
	<Columns>
		<asp:TemplateField ItemStyle-Width="100%">
			<ItemTemplate>
				<table class="Text" cellpadding="2" cellspacing="0" border="0" bordercolor="#daeeee">
					<tr>
						<td colspan="2" align="left"><%# Eval("UserName") %>&nbsp;发表于：<%# Eval("CreateDate").ToString() %> </td>
					</tr>
					<tr>
						<td colspan="2" align="left">　　<%# Eval("Body").ToString().Replace("\n","<br>") %><br /></td>
					</tr>
				</table>
			</ItemTemplate>
		</asp:TemplateField>
	</Columns>
</asp:GridView>