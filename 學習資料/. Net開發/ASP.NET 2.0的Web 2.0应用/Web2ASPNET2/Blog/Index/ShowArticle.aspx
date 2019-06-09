<%@ Page Language="C#" AutoEventWireup="true" CodeFile="ShowArticle.aspx.cs" Inherits="Index_ShowArticle" StylesheetTheme="Web2ASPNET2" %>
<%@ Register Src="../UserControl/Header.ascx" TagName="Header" TagPrefix="ucHear" %>
<html xmlns="http://www.w3.org/1999/xhtml" >
<head id="Head1" runat="server">
    <title>Web 2.0 + ASP.NET 2.0 ====>>  Blog</title>
</head>
<body style="margin:0;border:0" class="Body" >
    <form id="form1" runat="server">
     <table class="Text" align="center" cellpadding="2" width="1000" cellspacing="0" border="0" bordercolor="#daeeee">
		<tr>
			<td colspan="2"><ucHear:Header ID="Header1" runat="server" /></td>
		</tr>
		<tr valign="top">
			<td valign="top" runat="server" id="LeftPanel">				
			</td>
			<td valign="top" runat="server" id="RightPanel" ></td>
		</tr>
		<tr>
			<td>				
			</td>
		</tr>
    </table>   
    </form>
</body>
</html>
