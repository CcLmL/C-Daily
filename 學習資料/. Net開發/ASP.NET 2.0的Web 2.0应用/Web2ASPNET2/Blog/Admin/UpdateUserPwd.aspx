<%@ Page Language="C#" AutoEventWireup="true" CodeFile="UpdateUserPwd.aspx.cs" Inherits="Admin_UpdateUserPwd" StylesheetTheme="Web2ASPNET2" %>
<%@ Register Src="../UserControl/ModuleTitle.ascx" TagName="ModuleTitle" TagPrefix="ucTitle" %>
<html xmlns="http://www.w3.org/1999/xhtml" >
<head id="Head1" runat="server">
    <title>无标题页</title>    
</head>
<body style="margin:0;border:0" class="Body">
    <form id="form1" runat="server">    
    <table class="Table" cellpadding="2" cellspacing="0" border="1" bordercolor="#daeeee">
		<tr>
			<td colspan="2"><ucTitle:ModuleTitle ID="TitleUC1" runat="server" Title="用户修改密码" /></td>
		</tr>
		<tr>
			<td width="150" height="30" valign="middle" class="LeftTD" align="right">
				用户名称:</td>
			<td valign="middle"><asp:TextBox ID="tbName" CssClass="TextBox" runat="server" SkinID="tbSkin" MaxLength="50" Width="200px" ReadOnly="True"></asp:TextBox></td>
		</tr>
		<tr>
			<td width="150" height="30" valign="middle" class="LeftTD" align="right">
				原始密码:</td>
			<td valign="middle"><asp:TextBox ID="tbPassword" CssClass="TextBox" runat="server" SkinID="tbSkin" MaxLength="255" Width="200px" TextMode="Password"></asp:TextBox><asp:RequiredFieldValidator
					ID="rfPassword" runat="server" ControlToValidate="tbPassword" Display="Dynamic" ErrorMessage="不能为空。"></asp:RequiredFieldValidator></td>
		</tr>
		<tr>
			<td width="150" height="30" valign="middle" class="LeftTD" align="right">
				新密码:</td>
			<td valign="middle"><asp:TextBox ID="tbPwdNew" CssClass="TextBox" runat="server" SkinID="tbSkin" MaxLength="255" Width="200px" TextMode="Password"></asp:TextBox><asp:RequiredFieldValidator
					ID="rfPwd" runat="server" ControlToValidate="tbPwdNew" Display="Dynamic" ErrorMessage="不能为空。"></asp:RequiredFieldValidator></td>
		</tr>		
		<tr>
			<td width="150" height="30" valign="middle" class="LeftTD" align="right">
				确认密码:</td>
			<td valign="middle"><asp:TextBox ID="tbPwdNewStr" CssClass="TextBox" runat="server" SkinID="tbSkin" MaxLength="255" Width="200px" TextMode="Password"></asp:TextBox><asp:CompareValidator
					ID="cvPwd" runat="server" ControlToCompare="tbPwdNew" ControlToValidate="tbPwdNewStr"
					ErrorMessage="两次输入的密码补相同。"></asp:CompareValidator></td>
		</tr>				
		<tr>
			<td width="150" height="30" valign="middle" class="LeftTD" align="right">
				<asp:Label ID="Label1" runat="server" Width="150px"></asp:Label></td>
			<td valign="middle" width="100%">
				<asp:Button ID="btnUpdatePwd" runat="server" BackColor="#DAEEEE" Font-Names="Tahoma"
					Font-Size="9pt" Text="修改密码" CssClass="Button" OnClick="btnUpdatePwd_Click" />&nbsp;&nbsp;&nbsp;
				<asp:Button ID="btnReturn" runat="server" CssClass="Button" Text="重置" CausesValidation="False" Width="80px" OnClick="btnReturn_Click" /></td>
		</tr>		
    </table>    
    </form>
</body>
</html>
