<%@ Page Language="C#" AutoEventWireup="true" CodeFile="FollowMessage.aspx.cs" Inherits="Portal_Message_FollowMessage" StylesheetTheme="Web2ASPNET2" %>
<%@ Register Src="../../UserControl/ModuleTitle.ascx" TagName="ModuleTitle" TagPrefix="ucTitle" %>
<html xmlns="http://www.w3.org/1999/xhtml" >
<head id="Head1" runat="server">
    <title>无标题页</title>    
</head>
<body style="margin:0;border:0" class="Body">
    <form id="form1" runat="server">    
    <table class="Table" cellpadding="2" cellspacing="0" border="1" bordercolor="#daeeee">
		<tr>
			<td colspan="2"><ucTitle:ModuleTitle ID="ModuleTitle1" runat="server" Title="查看短信息" /></td>
		</tr>	
		<tr>
			<td width="150" height="30" valign="middle" class="LeftTD" align="right">
				接收者:</td>
			<td valign="middle"><asp:DropDownList ID="ddlUser" runat="server" SkinID="ddlSkin" Width="300px" Enabled="False"></asp:DropDownList>
			</td>
		</tr>		
		<tr>
			<td width="150" height="30" valign="middle" class="LeftTD" align="right">
				发送时间:</td>
			<td valign="middle"><asp:TextBox ID="tbCreateDate" CssClass="TextBox" runat="server" SkinID="tbSkin" MaxLength="50" Width="300px" Enabled="False"></asp:TextBox>
			</td>
		</tr>
		<tr>
			<td width="150" height="30" valign="middle" class="LeftTD" align="right">
				消息状态:</td>
			<td valign="middle"><asp:DropDownList ID="ddlStatus" runat="server" SkinID="ddlSkin" Width="300px" Enabled="False">
				<asp:ListItem Value="0">未读</asp:ListItem>
				<asp:ListItem Value="1">已读</asp:ListItem>
				<asp:ListItem Value="2">已被删除</asp:ListItem>
			</asp:DropDownList>
			</td>
		</tr>
		<tr>
			<td width="150" height="30" valign="top" class="LeftTD" align="right">
				消息主体:</td>
			<td valign="middle" align="left">　　<%= Body.Replace("\n","<br>") %>
			</td>
		</tr>			
    </table>    
    </form>
</body>
</html>

