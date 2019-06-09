<%@ Page Language="C#" AutoEventWireup="true" CodeFile="UpdateFilter.aspx.cs" Inherits="Filter_UpdateFilter" StylesheetTheme="Web2ASPNET2" %>
<%@ Register Src="../UserControl/ModuleTitle.ascx" TagName="ModuleTitle" TagPrefix="ucTitle" %>

<html xmlns="http://www.w3.org/1999/xhtml" >
<head id="Head1" runat="server">
    <title>无标题页</title>
</head>
<body>
    <form id="form1" runat="server">
    <asp:ScriptManager ID="smForm" runat="server" />
    <asp:UpdatePanel ID="upForm" runat="server" UpdateMode="Always" RenderMode="Block">
		<ContentTemplate>
			<table class="Table" cellpadding="2" cellspacing="0" border="1" bordercolor="#daeeee">
				<tr>
					<td colspan="2"><ucTitle:ModuleTitle ID="ModuleTitle1" runat="server" Title="修改过滤器" /></td>
				</tr>		
				<tr>
					<td width="150" height="30" valign="middle" class="LeftTD" align="right">关键字:</td>
					<td valign="middle"><asp:TextBox ID="tbKey" CssClass="TextBox" runat="server" SkinID="tbSkin" MaxLength="255" Width="300px"></asp:TextBox><asp:RequiredFieldValidator ID="rfKey" runat="server" ControlToValidate="tbKey" ErrorMessage="不能为空。" Display="Dynamic"></asp:RequiredFieldValidator>
					</td>
				</tr>
				<tr>
					<td width="150" height="30" valign="middle" class="LeftTD" align="right">
						<asp:Label ID="Label1" runat="server" Width="150px"></asp:Label></td>
					<td valign="middle" width="100%">
						<asp:Button ID="btnUpdate" runat="server" Text="保   存" CssClass="Button" OnClick="btnUpdate_Click" SkinID="btnSkin" />&nbsp;&nbsp;&nbsp;
						<asp:Button ID="btnReturn" runat="server" CssClass="Button" Text="返    回" CausesValidation="False" OnClick="btnReturn_Click" SkinID="btnSkin" /></td>
				</tr>
			</table>
		</ContentTemplate> 
    </asp:UpdatePanel>
    </form>
</body>
</html>