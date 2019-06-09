<%@ Page Language="C#" AutoEventWireup="true" CodeFile="ArticleSourceManage.aspx.cs" Inherits="Portal_ArticleSourceManage" StylesheetTheme="Web2ASPNET2" %>
<%@ Register Src="../UserControl/ModuleTitle.ascx" TagName="ModuleTitle" TagPrefix="ucTitle" %>
<html xmlns="http://www.w3.org/1999/xhtml" >
<head id="Head1" runat="server">
    <title>无标题页</title>    
</head>
<body style="margin:0;border:0" class="Body">
    <form id="form1" runat="server">    
    <table class="Table" cellpadding="2" cellspacing="0" border="1" bordercolor="#daeeee">
		<tr>
			<td colspan="2"><ucTitle:ModuleTitle ID="ModuleTitle1" runat="server" Title="管理文章访问来源" /></td>
		</tr>
		<tr>
			<td colspan="2">
				<asp:GridView ID="gvSource" runat="server" AutoGenerateColumns="False" Font-Names="Tahoma" Width="100%" SkinID="gvSkin" DataKeyNames="ID" OnRowCommand="gvSource_RowCommand" OnRowDataBound="gvSource_RowDataBound">
					<HeaderStyle Font-Names="Tahoma" HorizontalAlign="Center" />
					<RowStyle BorderColor="#DAEEEE" BorderStyle="Ridge" BorderWidth="1px" HorizontalAlign="Center" />
					<Columns>
						<asp:TemplateField ItemStyle-Width="34%" ItemStyle-HorizontalAlign="left" HeaderStyle-HorizontalAlign="left" HeaderText="URL">
							<ItemTemplate>
								<a href='<%# Eval("Url") %>' target="_blank"><%# Eval("Url") %></a>								
							</ItemTemplate>
						</asp:TemplateField>
						<asp:BoundField DataField="IPAddress"  ItemStyle-Width="16%" HeaderText="IP地址"/>
						<asp:BoundField DataField="CreateDate"  ItemStyle-Width="16%" DataFormatString="{0:d}" HeaderText="创建时间" HtmlEncode="false"/>
						<asp:TemplateField ItemStyle-Width="34%" ItemStyle-HorizontalAlign="left" HeaderStyle-HorizontalAlign="left" HeaderText="文章标题">
							<ItemTemplate>
								<a href='../ViewArticle.aspx?ArticleID=<%# Eval("ArticleID") %>' target="_blank"><%# Eval("ArticleName") %></a>								
							</ItemTemplate>
						</asp:TemplateField>
						<asp:TemplateField HeaderText="操作" ItemStyle-Width="8%">
							<ItemTemplate>
								<asp:ImageButton ID="ibtDelete" runat="server" CommandName="del" ImageUrl="../App_Themes/Web2ASPNET2/Images/delete.gif" AlternateText="删除该来源" CommandArgument='<%# Eval("ID") %>' />
							</ItemTemplate>
						</asp:TemplateField>						
					</Columns>
				</asp:GridView>
			</td>
		</tr>
    </table>    
    </form>
</body>
</html>