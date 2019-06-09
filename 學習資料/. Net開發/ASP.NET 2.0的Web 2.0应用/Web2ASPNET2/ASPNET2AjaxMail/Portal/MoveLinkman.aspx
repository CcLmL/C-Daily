<%@ Page Language="C#" AutoEventWireup="true" CodeFile="MoveLinkman.aspx.cs" Inherits="Portal_MoveLinkman" StylesheetTheme="Web2ASPNET2" %>
<%@ Register Src="../UserControl/ModuleTitle.ascx" TagName="ModuleTitle" TagPrefix="ucTitle" %>
<html xmlns="http://www.w3.org/1999/xhtml" >
<head id="Head1" runat="server">
    <title>无标题页</title>    
</head>
<body style="margin:0;border:0" class="Body" width="100%">
    <form id="form1" runat="server" width="100%">    
    <asp:ScriptManager ID="scForm" runat="server"></asp:ScriptManager>
    <asp:UpdatePanel ID="upForm" runat="server" RenderMode="Inline">
		<ContentTemplate>
			<table class="Table" cellpadding="2" cellspacing="0" border="1" bordercolor="#daeeee">
				<tr>
					<td colspan="2"><ucTitle:ModuleTitle ID="ModuleTitle1" runat="server" Title="移动联系人" /></td>
				</tr>		
				<tr>
					<td width="150" height="30" valign="middle" class="LeftTD" align="right">
						名称:</td>
					<td valign="middle"><asp:TextBox ID="tbName" CssClass="TextBox" runat="server" SkinID="tbSkin" MaxLength="50" Width="300px" Enabled="False"></asp:TextBox><asp:RequiredFieldValidator ID="rfName" runat="server" ControlToValidate="tbName"	ErrorMessage="不能为空。" Display="Dynamic"></asp:RequiredFieldValidator>
					</td>
				</tr>
				<tr>
					<td width="150" height="30" valign="middle" class="LeftTD" align="right">
						电子邮件:</td>
					<td valign="middle"><asp:TextBox ID="tbEmail" CssClass="TextBox" runat="server" SkinID="tbSkin" MaxLength="255" Width="300px" Enabled="False"></asp:TextBox><asp:RequiredFieldValidator ID="rfEmail" runat="server" ControlToValidate="tbEmail"
							ErrorMessage="不能为空。" Display="Dynamic"></asp:RequiredFieldValidator>
						<asp:RegularExpressionValidator ID="reEmail" runat="server" ControlToValidate="tbEmail"
							ErrorMessage="电子邮件格式不正确。" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*" Display="Dynamic"></asp:RegularExpressionValidator></td>
				</tr>
				<tr>
					<td width="150" height="30" valign="middle" class="LeftTD" align="right">
						所属组:</td>
					<td valign="middle"><asp:DropDownList ID="ddlGroup" runat="server" SkinID="ddlSkin" Width="300px"></asp:DropDownList>
					</td>
				</tr>		
				<tr>
					<td width="150" height="30" valign="middle" class="LeftTD" align="right">
						<asp:Label ID="Label1" runat="server" Width="150px"></asp:Label></td>
					<td valign="middle" width="100%">
						<asp:Button ID="btnUpdateAndReturn" runat="server" CssClass="Button" Text="保存，并返回管理页面" Enabled="False" OnClick="btnUpdateAndReturn_Click" SkinID="btnSkin" />&nbsp;&nbsp;&nbsp;
						<asp:Button ID="btnReturn" runat="server" CssClass="Button" Text="返回管理页面" CausesValidation="False" OnClick="btnReturn_Click" SkinID="btnSkin" /></td>
				</tr>
			</table>
		</ContentTemplate>
    </asp:UpdatePanel>
    </form>
</body>
</html>
