<%@ Page Language="C#" AutoEventWireup="true" CodeFile="BoardManage.aspx.cs" Inherits="Portal_BoardManage" StylesheetTheme="Web2ASPNET2" %>
<%@ Register Src="../UserControl/ModuleTitle.ascx" TagName="ModuleTitle" TagPrefix="ucTitle" %>
<html xmlns="http://www.w3.org/1999/xhtml" >
<head id="Head1" runat="server">
    <title>无标题页</title>    
</head>
<body style="margin:0;border:0" class="Body" bgcolor="#184073">
    <form id="form1" runat="server">    
    <table class="Table" cellpadding="2" cellspacing="0" border="1" bordercolor="#daeeee">
		<tr>
			<td colspan="2"><ucTitle:ModuleTitle ID="ModuleTitle1" runat="server" Title="版面管理" /></td>
		</tr>
		<tr>
			<td colspan="2">	
				<asp:TreeView ID="tvBoard" Width="100%" Height="100%" runat="server" ImageSet="Msdn" NodeIndent="10" EnableClientScript="False" PopulateNodesFromClient="False" SkinID="tvSkin"></asp:TreeView>			
			</td>
		</tr>		
		<tr>
			<td width="150" height="30" valign="middle" class="LeftTD" align="right">
				<asp:Label ID="Label1" runat="server" Width="150px"></asp:Label></td>
			<td valign="middle" width="100%">
				<asp:Button ID="btnAdd" runat="server" Text="添加新的版面" CssClass="Button" SkinID="btnSkin" CommandName="add" OnCommand="OperationBtn_Command" />&nbsp;&nbsp;&nbsp;
				<asp:Button ID="btnUp" runat="server" Text="上移" CausesValidation="False" CommandName="up" Width="80px" OnCommand="OperationBtn_Command" SkinID="btnSkin" />&nbsp;&nbsp;&nbsp;
				<asp:Button ID="btnDown" runat="server" Text="下移" CausesValidation="False" CommandName="down" Width="80px" OnCommand="OperationBtn_Command" SkinID="btnSkin" />&nbsp;&nbsp;&nbsp;
			    <asp:Button ID="btnUpdate" runat="server" Text="修改版面" CommandName="update" OnCommand="OperationBtn_Command" SkinID="btnSkin" />&nbsp;&nbsp;&nbsp;
			    <asp:Button ID="btnDelete" runat="server" Text="删除版面" CausesValidation="False" CommandName="delete" OnCommand="OperationBtn_Command" SkinID="btnSkin" />&nbsp;&nbsp;&nbsp;
			    <asp:Button ID="btnTitle" runat="server" Text="管理版面帖子" CausesValidation="False" CommandName="title" OnCommand="OperationBtn_Command" SkinID="btnSkin" />
			</td>				
		</tr>
    </table>    
    </form>
</body>
</html>
