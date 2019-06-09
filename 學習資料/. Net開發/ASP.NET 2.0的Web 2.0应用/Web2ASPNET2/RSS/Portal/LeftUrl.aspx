<%@ Page Language="C#" AutoEventWireup="true" CodeFile="LeftUrl.aspx.cs" Inherits="Portal_LeftUrl" StylesheetTheme="Web2ASPNET2" %>
<%@ Register Src="../UserControl/ModuleTitle.ascx" TagName="ModuleTitle" TagPrefix="ucTitle" %>
<html xmlns="http://www.w3.org/1999/xhtml" >
<head id="Head1" runat="server">
    <title>无标题页</title>    
</head>
<body style="margin:0;border:0" bgcolor="#184073" class="Body">
    <form id="form1" runat="server">    
    <table class="Table" height="100%" cellpadding="2" cellspacing="0" border="1" bordercolor="#daeeee">
		<tr>
			<td><ucTitle:ModuleTitle ID="ModuleTitle1" runat="server" Title="RSS列表" /></td>
		</tr>		
		<tr height="100%" valign="top">
			<td height="100%" valign="top">
				<asp:DataList ID="dlLink" runat="server" RepeatColumns="1" RepeatDirection="horizontal" SkinID="dlSkin">
					<ItemTemplate>
						<a href='ViewRSS.aspx?UrlID=<%# Eval("ID") %>' target="Desktop"><%# Eval("Name") %></a>
					</ItemTemplate>
					<AlternatingItemTemplate>
						<a href='ViewRSS.aspx?UrlID=<%# Eval("ID") %>' target="Desktop"><%# Eval("Name") %></a>
					</AlternatingItemTemplate>
				</asp:DataList>
			</td>
		</tr>
		<tr>
			<td align="center"><a href="UrlManage.aspx" target="Desktop">RSS源管理</a></td>
		</tr>	
    </table>    
    </form>
</body>
</html>