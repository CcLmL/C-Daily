<%@ Page Language="C#" AutoEventWireup="true" CodeFile="ViewTag.aspx.cs" Inherits="Portal_ViewTag" StylesheetTheme="Web2ASPNET2" %>
<%@ Register Src="../UserControl/ModuleTitle.ascx" TagName="ModuleTitle" TagPrefix="ucModuleTitle" %>
<%@ Register Src="../UserControl/Header.ascx" TagName="Header" TagPrefix="ucHear" %>

<html xmlns="http://www.w3.org/1999/xhtml" >
<head id="Head1" runat="server">
    <title>无标题页</title>
</head>
<body style="margin:0;border:0" class="Body" >
    <form id="form2" runat="server">
     <table class="Text" align="center" cellpadding="2" width="780" cellspacing="0" border="0" bordercolor="#daeeee">
		<tr>
			<td colspan="2"><ucHear:Header ID="Header1" runat="server" /></td>
		</tr>
		<tr>
			<td valign="top"><ucModuleTitle:ModuleTitle ID="ModuleTitle1" runat="server" Title="查看标签的文章和链接" /></td>
		</tr>
		<tr>
			<td>
				<asp:DataList ID="dlTagData" runat="server" RepeatColumns="1" RepeatDirection="Horizontal" SkinID="dlSkin" HorizontalAlign="Left">
					<ItemTemplate>
						<asp:Image ID="bgImage" runat="server" ImageUrl="~/App_Themes/Web2ASPNET2/Images/titleindex.gif" />
						<a href='<%# (int)Eval("Flag") == 0 ? "ViewArticle.aspx?ArticleID=" + Eval("ID") : Eval("Url") %>' target="_blank"><%# Eval("Name") %>[<%# Eval("CreateDate") %>]</a>
					</ItemTemplate>
					<AlternatingItemTemplate>
						<asp:Image ID="bgImage" runat="server" ImageUrl="~/App_Themes/Web2ASPNET2/Images/titleindex.gif" />
						<a href='<%# (int)Eval("Flag") == 0 ? "ViewArticle.aspx?ArticleID=" + Eval("ID") : Eval("Url") %>' target="_blank"><%# Eval("Name") %>[<%# Eval("CreateDate") %>]</a>
					</AlternatingItemTemplate>
					<AlternatingItemStyle HorizontalAlign="Left" />
					<ItemStyle HorizontalAlign="Left" />
				</asp:DataList>
			</td>
		</tr>		
    </table>   
    </form>
</body>
</html>
