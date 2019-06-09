<%@ Page Language="C#" AutoEventWireup="true"  CodeFile="Default.aspx.cs" Inherits="_Default" StylesheetTheme="Web2ASPNET2" %>

<%@ Register Src="UserControl/SearchTag.ascx" TagName="SearchTag" TagPrefix="ucSearch" %>
<%@ Register Src="UserControl/ModuleTitle.ascx" TagName="ModuleTitle" TagPrefix="ucModuleTitle" %>
<%@ Register Src="UserControl/Header.ascx" TagName="Header" TagPrefix="ucHear" %>
<%@ Register Src="UserControl/ShowTags.ascx" TagName="ShowTags" TagPrefix="ucTag" %>
<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
    <title>Web 2.0 + ASP.NET 2.0 ====>>  社会标签</title>
</head>
<body style="margin:0;border:0" class="Body" >
    <form id="form1" runat="server">
     <table class="Text" align="center" cellpadding="2" width="780" cellspacing="0" border="0" bordercolor="#daeeee">
		<tr>
			<td colspan="2"><ucHear:Header ID="Header1" runat="server" /></td>
		</tr>
		<tr valign="top">
			<td width="580" height="480" bgcolor="#3366ff" align="center" valign="top">
				<table class="Text" align="center" valign="top" cellpadding="2" width="580" cellspacing="0" border="0">
					<tr>
						<td valign="top"><ucModuleTitle:ModuleTitle ID="ModuleTitle1" runat="server" Title="所有标签" /></td>
					</tr>
					<tr>
						<td>
							<asp:DataList ID="dlTag" runat="server" RepeatColumns="6" RepeatDirection="Horizontal" SkinID="dlSkin">
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
			</td>
			<td width="200" bgcolor="LightSteelBlue" valign="top"><ucTag:ShowTags ID="ShowTags1" runat="server" /><br /><ucSearch:SearchTag ID="ucSearchTag" runat="server" />
			</td>
		</tr>
		<tr>
			<td>				
			</td>
		</tr>
    </table>   
    </form>
</body>
</html>
