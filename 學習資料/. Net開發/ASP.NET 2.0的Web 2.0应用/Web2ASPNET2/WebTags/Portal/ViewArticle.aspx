<%@ Page Language="C#" AutoEventWireup="true" CodeFile="ViewArticle.aspx.cs" Inherits="Portal_ViewArticle" StylesheetTheme="Web2ASPNET2" %>
<%@ Register Src="../UserControl/ModuleTitle.ascx" TagName="ModuleTitle" TagPrefix="ucModuleTitle" %>
<%@ Register Src="../UserControl/Header.ascx" TagName="Header" TagPrefix="ucHear" %>

<html xmlns="http://www.w3.org/1999/xhtml" >
<head id="Head2" runat="server">
    <title>无标题页</title>
</head>
<body style="margin:0;border:0" class="Body" >
    <form id="form2" runat="server">
     <table class="Text" align="center" cellpadding="2" width="780" cellspacing="0" border="0" bordercolor="#daeeee">
		<tr>
			<td><ucHear:Header ID="Header1" runat="server" /></td>
		</tr>
		<tr>
			<td valign="top"><ucModuleTitle:ModuleTitle ID="Title" runat="server" /></td>
		</tr>
		<tr>
			<td>
				<%= Body %>
			</td>
		</tr>	
		<tr>
			<td valign="middle" width="100%" align="center">
				<asp:Button ID="btnReturn" runat="server" CssClass="Button" Text="关闭页面" CausesValidation="False" OnClick="btnReturn_Click" SkinID="btnSkin" /></td>
		</tr>	
    </table>   
    </form>
</body>
</html>

