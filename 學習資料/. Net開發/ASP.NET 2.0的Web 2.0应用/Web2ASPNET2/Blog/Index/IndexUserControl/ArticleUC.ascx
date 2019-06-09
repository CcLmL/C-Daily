<%@ Control Language="C#" AutoEventWireup="true" CodeFile="ArticleUC.ascx.cs" Inherits="Index_IndexUserControl_ArticleUC" %>
<%@ Register Src="../../UserControl/ModuleTitle.ascx" TagName="ModuleTitle" TagPrefix="ucTitle" %>
<table class="Table" cellpadding="2" cellspacing="0" border="1" bordercolor="#daeeee">
	<tr>
		<td colspan="2"><ucTitle:ModuleTitle ID="ModuleHeader" runat="server" /></td>
	</tr>
	<tr>
		<td colspan="2">
			<asp:GridView ID="gvArticle" runat="server" AutoGenerateColumns="False" Font-Names="Tahoma" Width="100%" SkinID="gvSkin" DataKeyNames="ID" ShowHeader="False">
				<HeaderStyle Font-Names="Tahoma" HorizontalAlign="Center" />
				<EmptyDataTemplate>
					文章列表为空。
				</EmptyDataTemplate>					
				<EmptyDataRowStyle ForeColor="Blue" />
				<Columns>
					<asp:TemplateField ItemStyle-Width="100%">
						<ItemTemplate>
							<table class="Text" cellpadding="2" cellspacing="0" border="0" bordercolor="#daeeee">
								<tr>
									<td colspan="2" align="left"><a href='ShowArticle.aspx?ArticleID=<%# Eval("ID") %>' target="_self"><%# Eval("Name")%></a></td>
								</tr>
								<tr>
									<td align="left"><br>&nbsp;&nbsp;&nbsp;&nbsp;摘要：<%# Eval("Body").ToString().Length > 100 ? Eval("Body").ToString().Substring(0,100) : Eval("Body") %>&bnsp;&bnsp;&bnsp;全文共(<%# Eval("Body").ToString().Length %>个字)－－点击<a href='ShowArticle.aspx?ArticleID=<%# Eval("ID") %>' target="_self">此处</a>阅读。</td>
								</tr>
								<tr>
									<td colspan="2" align="left">发表于：<%# Eval("CreateDate") %> | <a href='ShowArticle.aspx?ArticleID=<%# Eval("ID") %>' target="_self">评论(<%# Eval("CommentCount") %>)</a></td>
								</tr>
							</table>
						</ItemTemplate>
					</asp:TemplateField>
				</Columns>
			</asp:GridView>
		</td>
	</tr>		
</table>