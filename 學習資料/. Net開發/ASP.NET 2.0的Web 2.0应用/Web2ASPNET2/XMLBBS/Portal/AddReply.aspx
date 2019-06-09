<%@ Page Language="C#" AutoEventWireup="true" CodeFile="AddReply.aspx.cs" Inherits="Portal_AddReply" StylesheetTheme="Web2ASPNET2" %>
<%@ Register Src="../UserControl/ModuleTitle.ascx" TagName="ModuleTitle" TagPrefix="ucTitle" %>
<html xmlns="http://www.w3.org/1999/xhtml" >
<head id="Head1" runat="server">
    <title>无标题页</title>    
</head>
<body style="margin:0;border:0" class="Body">
    <form id="form1" runat="server">    
    <table class="Table" cellpadding="2" cellspacing="0" border="1" bordercolor="#daeeee">
		<tr>
			<td colspan="2"><ucTitle:ModuleTitle ID="ModuleTitle1" runat="server" Title="回复帖子" /></td>
		</tr>		
		<tr>
			<td width="150" height="30" valign="middle" class="LeftTD" align="right">
				帖子名称:</td>
			<td valign="middle"><asp:TextBox ID="tbName" CssClass="TextBox" runat="server" SkinID="tbSkin" MaxLength="50" Width="300px" Enabled="False"></asp:TextBox>
			</td>
		</tr>
		<tr>
			<td width="150" height="30" valign="top" class="LeftTD" align="right">
				回复内容:</td>
			<td valign="middle"><asp:TextBox ID="tbBody" CssClass="TextBox" runat="server" SkinID="tbSkin" MaxLength="8000" Width="560px" Height="300px" TextMode="MultiLine"></asp:TextBox>
				<asp:RequiredFieldValidator ID="rfBody" runat="server" ControlToValidate="tbBody"
					Display="Dynamic" ErrorMessage="不能为空。"></asp:RequiredFieldValidator>
			</td>
		</tr>		
		<tr>
			<td width="150" height="30" valign="middle" class="LeftTD" align="right">
				<asp:Label ID="Label1" runat="server" Width="150px"></asp:Label></td>
			<td valign="middle" width="100%">
				<asp:Button ID="btnUpdateAndReturn" runat="server" CssClass="Button" Text="回复，并返回" OnClick="btnUpdateAndReturn_Click" SkinID="btnSkin" Enabled="False" />&nbsp;&nbsp;&nbsp;
				<asp:Button ID="btnReturn" runat="server" CssClass="Button" Text="返回" CausesValidation="False" OnClick="btnReturn_Click" SkinID="btnSkin" Width="80px" /></td>
		</tr>
    </table>    
    </form>
</body>
</html>

