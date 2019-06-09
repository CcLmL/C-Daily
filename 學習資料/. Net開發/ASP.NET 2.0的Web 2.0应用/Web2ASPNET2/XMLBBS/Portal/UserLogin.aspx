<%@ Page Language="C#" AutoEventWireup="true" CodeFile="UserLogin.aspx.cs" Inherits="Portal_UserLogin" StylesheetTheme="Web2ASPNET2" %>
<%@ Register Src="../UserControl/ModuleTitle.ascx" TagName="ModuleTitle" TagPrefix="ucTitle" %>
<html xmlns="http://www.w3.org/1999/xhtml" >
<head id="Head1" runat="server">
    <title>用户登录</title>    
</head>
<body style="margin:0;border:0" class="Body">
    <form id="form1" runat="server">    
    <table class="Table" cellpadding="2" cellspacing="0" border="1" bordercolor="#daeeee">
		<tr>
			<td colspan="2"><ucTitle:ModuleTitle ID="ModuleTitle1" runat="server" Title="用户登录" /></td>
		</tr>
		<tr>
			<td width="150" height="30" valign="middle" class="LeftTD" align="right">
				用户名称:</td>
			<td valign="middle"><asp:TextBox ID="tbName" CssClass="TextBox" runat="server" SkinID="tbSkin" MaxLength="50" Width="200px"></asp:TextBox><asp:RequiredFieldValidator ID="rfName" runat="server" ControlToValidate="tbName"
					ErrorMessage="不能为空。"></asp:RequiredFieldValidator></td>
		</tr>
		<tr>
			<td width="150" height="30" valign="middle" class="LeftTD" align="right">
				用户密码:</td>
			<td valign="middle"><asp:TextBox ID="tbPassword" CssClass="TextBox" runat="server" SkinID="tbSkin" MaxLength="255" Width="200px" TextMode="Password"></asp:TextBox><asp:RequiredFieldValidator
					ID="rfPassword" runat="server" ControlToValidate="tbPassword" Display="Dynamic" ErrorMessage="不能为空。"></asp:RequiredFieldValidator></td>
		</tr>		
		<tr>
			<td width="150" height="30" valign="middle" class="LeftTD" align="right">
				<asp:Label ID="Label1" runat="server" Width="150px"></asp:Label></td>
			<td valign="middle" width="100%">
				<asp:Button ID="btnLogin" runat="server" BackColor="#DAEEEE" Font-Names="Tahoma"
					Font-Size="9pt" Text="用户登录" CssClass="Button" OnClick="btnLogin_Click" />&nbsp;&nbsp;&nbsp;
				<asp:Button ID="btnReturn" runat="server" CssClass="Button" Text="重置" CausesValidation="False" Width="80px" OnClick="btnReturn_Click" />&nbsp;&nbsp;&nbsp;
				<asp:Button ID="btnGuestLogin" runat="server" BackColor="#DAEEEE" Font-Names="Tahoma"
					Font-Size="9pt" Text="游客登录" CssClass="Button" OnClick="btnGuestLogin_Click" CausesValidation="False" /></td>
		</tr>		
    </table>    
    </form>
</body>
</html>
