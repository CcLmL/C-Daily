<%@ Page Language="C#" AutoEventWireup="true" CodeFile="AddTitle.aspx.cs" Inherits="Portal_AddTitle" StylesheetTheme="Web2ASPNET2" %>
<%@ Register Src="../UserControl/ModuleTitle.ascx" TagName="ModuleTitle" TagPrefix="ucTitle" %>
<html xmlns="http://www.w3.org/1999/xhtml" >
<head id="Head1" runat="server">
    <title>无标题页</title>    
</head>
<body style="margin:0;border:0" class="Body">
    <form id="form1" runat="server">    
    <table class="Table" cellpadding="2" cellspacing="0" border="1" bordercolor="#daeeee">
		<tr>
			<td colspan="2"><ucTitle:ModuleTitle ID="ModuleTitle1" runat="server" Title="发布新帖子" /></td>
		</tr>		
		<tr>
			<td width="150" height="30" valign="middle" class="LeftTD" align="right">
				帖子名称:</td>
			<td valign="middle"><asp:TextBox ID="tbName" CssClass="TextBox" runat="server" SkinID="tbSkin" MaxLength="50" Width="300px"></asp:TextBox><asp:RequiredFieldValidator ID="rfName" runat="server" ControlToValidate="tbName"	ErrorMessage="不能为空。" Display="Dynamic"></asp:RequiredFieldValidator>
			</td>
		</tr>	
		<tr>
			<td width="150" height="30" valign="middle" class="LeftTD" align="right">
				上级版面:</td>
			<td valign="middle"><asp:DropDownList ID="ddlBoard" runat="server" SkinID="ddlSkin"></asp:DropDownList>
			</td>
		</tr>	
		<tr>
			<td width="150" height="30" valign="middle" class="LeftTD" align="right">
				帖子状态:</td>
			<td valign="middle"><asp:DropDownList ID="ddlState" runat="server" SkinID="ddlSkin" Width="300px">
				<asp:ListItem Selected="True" Value="0">公开</asp:ListItem>
				<asp:ListItem Value="1">禁止回复</asp:ListItem>
			</asp:DropDownList>
			</td>
		</tr>	
		<tr>
			<td width="150" height="30" valign="top" class="LeftTD" align="right">
				帖子主体内容:</td>
			<td valign="middle"><asp:TextBox ID="tbBody" CssClass="TextBox" runat="server" SkinID="tbSkin" MaxLength="8000" Width="560px" Height="100px" TextMode="MultiLine"></asp:TextBox>
				<asp:RequiredFieldValidator ID="rfBody" runat="server" ControlToValidate="tbBody"
					Display="Dynamic" ErrorMessage="不能为空。"></asp:RequiredFieldValidator>
			</td>
		</tr>	
		<tr>
			<td width="150" height="30" valign="middle" class="LeftTD" align="right">附件:</td>
			<td valign="middle"><asp:FileUpload ID="fuAttachment" runat="server" CssClass="Button" Width="400px" /></td>
		</tr>	
		<tr>
			<td width="150" height="30" valign="middle" class="LeftTD" align="right">
				<asp:Label ID="Label1" runat="server" Width="150px"></asp:Label></td>
			<td valign="middle" width="100%">
				<asp:Button ID="btnAdd" runat="server" Text="保存，并再添加" CssClass="Button" OnClick="btnAdd_Click" SkinID="btnSkin" Enabled="False" />&nbsp;&nbsp;&nbsp;
				<asp:Button ID="btnAddAndReturn" runat="server" CssClass="Button" Text="保存，并返回管理页面" OnClick="btnAddAndReturn_Click" SkinID="btnSkin" Enabled="False" />&nbsp;&nbsp;&nbsp;
				<asp:Button ID="btnReturn" runat="server" CssClass="Button" Text="返回管理页面" CausesValidation="False" OnClick="btnReturn_Click" SkinID="btnSkin" /></td>
		</tr>
    </table>    
    </form>
</body>
</html>
