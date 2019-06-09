<%@ Page Language="C#" AutoEventWireup="true" CodeFile="UpdateUrl.aspx.cs" Inherits="Portal_UpdateUrl" StylesheetTheme="Web2ASPNET2" %>
<%@ Register Src="../UserControl/ModuleTitle.ascx" TagName="ModuleTitle" TagPrefix="ucTitle" %>
<html xmlns="http://www.w3.org/1999/xhtml" >
<head id="Head1" runat="server">
    <title>无标题页</title>    
</head>
<body style="margin:0;border:0" class="Body">
    <form id="form1" runat="server">    
    <table class="Table" cellpadding="2" cellspacing="0" border="1" bordercolor="#daeeee">
		<tr>
			<td colspan="2"><ucTitle:ModuleTitle ID="ModuleTitle1" runat="server" Title="修改RSS源" /></td>
		</tr>		
		<tr>
			<td width="150" height="30" valign="middle" class="LeftTD" align="right">名称:</td>
			<td valign="middle"><asp:TextBox ID="tbName" CssClass="TextBox" runat="server" SkinID="tbSkin" MaxLength="200" Width="300px"></asp:TextBox><asp:RequiredFieldValidator ID="rfName" runat="server" ControlToValidate="tbName"	ErrorMessage="不能为空。" Display="Dynamic"></asp:RequiredFieldValidator>
			</td>
		</tr>	
		<tr>
			<td width="150" height="30" valign="middle" class="LeftTD" align="right">URL:</td>
			<td valign="middle"><asp:TextBox ID="tbUrl" CssClass="TextBox" runat="server" SkinID="tbSkin" MaxLength="255" Width="100%"></asp:TextBox><asp:RequiredFieldValidator ID="rfUrl" runat="server" ControlToValidate="tbUrl" ErrorMessage="不能为空。" Display="Dynamic"></asp:RequiredFieldValidator>
				<asp:RegularExpressionValidator ID="reUrl" runat="server" ControlToValidate="tbUrl"
					ErrorMessage="URL的格式不正确。" ValidationExpression="http(s)?://([\w-]+\.)+[\w-]+(/[\w- ./?%&=]*)?"></asp:RegularExpressionValidator></td>
		</tr>	
		<tr>
			<td width="150" height="30" valign="middle" class="LeftTD" align="right">
				<asp:Label ID="Label1" runat="server" Width="150px"></asp:Label></td>
			<td valign="middle" width="100%">
				<asp:Button ID="btnUpdate" runat="server" Text="保存" CssClass="Button" SkinID="btnSkin" Width="60px" OnClick="btnUpdate_Click" />
				<asp:Button ID="btnReturn" runat="server" CssClass="Button" Text="返回" CausesValidation="False" OnClick="btnReturn_Click" SkinID="btnSkin" Width="60px" /></td>
		</tr>
    </table>    
    </form>
</body>
</html>

