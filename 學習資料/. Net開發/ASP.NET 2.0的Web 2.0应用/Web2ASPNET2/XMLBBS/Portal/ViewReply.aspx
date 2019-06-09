<%@ Page Language="C#" AutoEventWireup="true" CodeFile="ViewReply.aspx.cs" Inherits="Portal_ViewReply" StylesheetTheme="Web2ASPNET2" %>
<%@ Register Src="../UserControl/ModuleTitle.ascx" TagName="ModuleTitle" TagPrefix="ucTitle" %>
<html xmlns="http://www.w3.org/1999/xhtml" >
<head id="Head1" runat="server">
    <title>无标题页</title>    
</head>
<body style="margin:0;border:0" class="Body">
    <form id="form1" runat="server">    
    <table class="Table" cellpadding="2" cellspacing="0" border="1" bordercolor="#daeeee">
		<tr>
			<td colspan="2"><ucTitle:ModuleTitle ID="ModuleTitle1" runat="server" Title="查看回复" /></td>
		</tr>		
		<tr>
			<td valign="middle" align="left">　　<%= Body.Replace("\n","<br>") %>
			</td>
		</tr>		
    </table>    
    </form>
</body>
</html>