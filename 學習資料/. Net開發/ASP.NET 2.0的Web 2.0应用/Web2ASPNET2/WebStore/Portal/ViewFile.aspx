<%@ Page Language="C#" AutoEventWireup="true" CodeFile="ViewFile.aspx.cs" Inherits="Portal_ViewFile" StylesheetTheme="Web2ASPNET2" %>
<%@ Register Src="../UserControl/ModuleTitle.ascx" TagName="ModuleTitle" TagPrefix="ucTitle" %>
<html xmlns="http://www.w3.org/1999/xhtml" >
<head id="Head1" runat="server">
    <title>无标题页</title>    
</head>
<body style="margin:0;border:0" class="Body">
    <form id="form1" runat="server">    
    <table class="Table" cellpadding="2" cellspacing="0" border="1" bordercolor="#daeeee">
		<tr>
			<td colspan="2"><ucTitle:ModuleTitle ID="ModuleTitle1" runat="server" Title="查看文档的属性" /></td>
		</tr>		
		<tr>
			<td width="150" height="30" valign="middle" class="LeftTD" align="right">
				文档名称:</td>
			<td valign="middle"><asp:TextBox ID="tbName" CssClass="TextBox" runat="server" SkinID="tbSkin" MaxLength="20" Width="300px" ReadOnly="True"></asp:TextBox>
			</td>
		</tr>	
		<tr>
			<td width="150" height="30" valign="middle" class="LeftTD" align="right">上级目录:</td>
			<td valign="middle"><asp:DropDownList ID="ddlDirectory" runat="server" SkinID="ddlSkin" Enabled="False"></asp:DropDownList></td>
		</tr>	
		<tr>
			<td width="150" height="30" valign="middle" class="LeftTD" align="right">
				保存方式:</td>
			<td valign="middle"><asp:DropDownList ID="ddlStoreMethod" runat="server" SkinID="ddlSkin" Enabled="False">
				<asp:ListItem Selected="True" Value="0">保存在硬盘上</asp:ListItem>
				<asp:ListItem Value="1">保存在数据库中</asp:ListItem>
			</asp:DropDownList></td>
		</tr>	
		<tr>
			<td width="150" height="30" valign="middle" class="LeftTD" align="right">文档类型:</td>
			<td valign="middle"><asp:Label ID="lbType" runat="server" CssClass="Text"></asp:Label></td>
		</tr>	
			<tr>
			<td width="150" height="30" valign="middle" class="LeftTD" align="right">文档大小:</td>
			<td valign="middle"><asp:Label ID="lbSize" runat="server" CssClass="Text"></asp:Label></td>
		</tr>	
		<tr>
			<td width="150" height="30" valign="middle" class="LeftTD" align="right">上载时间:</td>
			<td valign="middle"><asp:Label ID="lbUploadDate" runat="server" CssClass="Text"></asp:Label></td>
		</tr>
		<tr>
			<td width="150" height="30" valign="middle" class="LeftTD" align="right">下载文档:</td>
			<td valign="middle"><a runat="server" id="aUrl" target="_blank">[下载文件]</a></td>
		</tr>		
		<tr>
			<td width="150" height="30" valign="middle" class="LeftTD" align="right">
				<asp:Label ID="Label1" runat="server" Width="150px"></asp:Label></td>
			<td valign="middle" width="100%">
				<asp:Button ID="btnReturn" runat="server" CssClass="Button" Text="返回管理页面" CausesValidation="False" OnClick="btnReturn_Click" SkinID="btnSkin" /></td>
		</tr>
    </table>    
    </form>
</body>
</html>