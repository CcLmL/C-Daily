<%@ Page Language="C#" AutoEventWireup="true" CodeFile="AddMessage.aspx.cs" Inherits="Portal_Message_AddMessage" StylesheetTheme="Web2ASPNET2" %>
<%@ Register Src="../../UserControl/ModuleTitle.ascx" TagName="ModuleTitle" TagPrefix="ucTitle" %>
<html xmlns="http://www.w3.org/1999/xhtml" >
<head id="Head1" runat="server">
    <title>无标题页</title>    
</head>
<body style="margin:0;border:0" class="Body">
    <form id="form1" runat="server">    
    <table class="Table" cellpadding="2" cellspacing="0" border="1" bordercolor="#daeeee">
		<tr>
			<td colspan="2"><ucTitle:ModuleTitle ID="ModuleTitle1" runat="server" Title="发送新消息" /></td>
		</tr>		
		<tr>
			<td width="150" height="30" valign="middle" class="LeftTD" align="right">
				发送给:</td>
			<td valign="middle"><asp:DropDownList ID="ddlUser" runat="server" SkinID="ddlSkin" Width="300px"></asp:DropDownList>
			</td>
		</tr>
		<tr>
			<td width="150" height="30" valign="top" class="LeftTD" align="right">
				消息主体:</td>
			<td valign="middle"><asp:TextBox ID="tbBody" CssClass="TextBox" runat="server" SkinID="tbSkin" MaxLength="1000" Width="560px" Height="100px" TextMode="MultiLine"></asp:TextBox>
			</td>
		</tr>	
		<tr>
			<td width="150" height="30" valign="middle" class="LeftTD" align="right">
				<asp:Label ID="Label1" runat="server" Width="150px"></asp:Label></td>
			<td valign="middle" width="100%">
				<asp:Button ID="btnAdd" runat="server" Text="发送，并再添加" CssClass="Button" OnClick="btnAdd_Click" SkinID="btnSkin" Enabled="False" />&nbsp;&nbsp;&nbsp;
				<asp:Button ID="btnAddAndReturn" runat="server" CssClass="Button" Text="发送，并返回管理页面" OnClick="btnAddAndReturn_Click" SkinID="btnSkin" Enabled="False" />&nbsp;&nbsp;&nbsp;
				<asp:Button ID="btnReturn" runat="server" CssClass="Button" Text="返回管理页面" CausesValidation="False" OnClick="btnReturn_Click" SkinID="btnSkin" /></td>
		</tr>
    </table>    
    </form>
</body>
</html>