<%@ Page Language="C#" AutoEventWireup="true" CodeFile="ShieldMessage.aspx.cs" Inherits="Portal_Message_ShieldMessage" StylesheetTheme="Web2ASPNET2" %>
<%@ Register Src="../../UserControl/ModuleTitle.ascx" TagName="ModuleTitle" TagPrefix="ucTitle" %>
<html xmlns="http://www.w3.org/1999/xhtml" >
<head id="Head1" runat="server">
    <title>无标题页</title>    
</head>
<body style="margin:0;border:0" class="Body">
    <form id="form1" runat="server">    
    <table class="Table" cellpadding="2" cellspacing="0" border="1" bordercolor="#daeeee">
		<tr>
			<td colspan="3"><ucTitle:ModuleTitle ID="ModuleTitle1" runat="server" Title="屏蔽用户列表" /></td>
		</tr>	
		<tr>
			<td width="200" valign="top">
				所有用户列表:</td>			
			<td valign="top"></td>
			<td width="60%" valign="top">
				被屏蔽的用户列表:</td>
		</tr>		
		<tr>
			<td width="200" valign="top"><asp:ListBox ID="lbUser" Width="300px" CssClass="ListBox" runat="server" Rows="23"></asp:ListBox></td>			
			<td valign="top">
				<table class="Table" border="0" cellpadding="0" cellspacing="0">
					<tr height="80" align="center">
						<td><asp:Button ID="ibtAddOne" Font-Bold="true" runat="server" CssClass="Button" SkinID="ButtonSkin" Text="›" Width="30px" Font-Size="20pt" CommandName="addone" OnCommand="ibtOperate_Command" /></td>
					</tr>
					<tr height="80" align="center">
						<td><asp:Button ID="ibtAddAll" Font-Bold="True" runat="server" CssClass="Button" SkinID="ButtonSkin" Text="»" Width="30px" Font-Size="20pt" CommandName="addall" OnCommand="ibtOperate_Command" /></td>
					</tr>
					<tr height="80" align="center">
						<td><asp:Button ID="ibtDeleteOne" Font-Bold="true" runat="server" CssClass="Button" SkinID="ButtonSkin" Text="‹" Width="30px" Font-Size="20pt" CommandName="deleteone" OnCommand="ibtOperate_Command" /></td>
					</tr>
					<tr height="80" align="center">
						<td><asp:Button ID="ibtDeleteAdd" Font-Bold="True" runat="server" CssClass="Button" SkinID="ButtonSkin" Text="«" Width="30px" Font-Size="20pt" CommandName="deleteall" OnCommand="ibtOperate_Command" /></td>
					</tr>
				</table>
			</td>
			<td width="60%" valign="top"><asp:ListBox ID="lbShieldUser" Width="300px" CssClass="ListBox" runat="server" Rows="23"></asp:ListBox></td>
		</tr>		
		<tr>
			<td height="25" width="646" colspan="3" valign="middle" align="center"><asp:Button ID="btnStore" runat="server" Text="保存修改" CssClass="Button" SkinID="ButtonSkin" Width="300" OnClick="btnStroe_Click" /></td>			
		</tr>
    </table>    
    </form>
</body>
</html>
