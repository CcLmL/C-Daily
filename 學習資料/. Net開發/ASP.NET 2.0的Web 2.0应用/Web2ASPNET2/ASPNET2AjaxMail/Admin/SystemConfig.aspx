<%@ Page Language="C#" AutoEventWireup="true" CodeFile="SystemConfig.aspx.cs" Inherits="Admin_SystemConfig" StylesheetTheme="Web2ASPNET2" %>
<%@ Register Src="../UserControl/ModuleTitle.ascx" TagName="ModuleTitle" TagPrefix="ucTitle" %>
<html xmlns="http://www.w3.org/1999/xhtml" >
<head id="Head1" runat="server">
    <title>无标题页</title>    
</head>
<body style="margin:0;border:0" class="Body">
    <form id="form1" runat="server">    
    <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
		<ContentTemplate>
			 <table class="Table" cellpadding="2" cellspacing="0" border="1" bordercolor="#daeeee">
				<tr>			
					<td colspan="2"><ucTitle:ModuleTitle ID="ModuleTitle1" runat="server" Title="用户管理" /></td>
				</tr>
				<tr style="line-height:2;">
					<td style="width:150; height: 31px;" align="right">
						服务器IP地址:</td>
					<td style="height: 31px"><asp:textbox id="tbIP" runat="server" Width="300px" SkinID="tbSkin">210.77.16.3</asp:textbox>		
						<asp:RequiredFieldValidator ID="rfI" runat="server" ControlToValidate="tbIP"
							CssClass="GbText" Display="Dynamic" ErrorMessage="IP地址不能为空！"></asp:RequiredFieldValidator></td>
				</tr>	
				<tr style="line-height:2;">
					<td style="width:150" align="right">
						服务器端口:</td>
					<td><asp:textbox id="tbPort" runat="server" Width="300px" SkinID="tbSkin">25</asp:textbox>		
						<asp:RequiredFieldValidator ID="rfP" runat="server" ControlToValidate="tbPort"
							CssClass="GbText" Display="Dynamic" ErrorMessage="端口不能为空！"></asp:RequiredFieldValidator>
						<asp:RangeValidator ID="rvP" runat="server" ControlToValidate="tbPort" CssClass="GbText"
							Display="Dynamic" ErrorMessage="端口输入范围错误！" MaximumValue="65535" MinimumValue="1" Type="Integer"></asp:RangeValidator></td>
				</tr>		
				<tr>
					<td width="150" height="30" valign="middle" class="LeftTD" align="right">
						<asp:Label ID="Label1" runat="server" Width="150px"></asp:Label></td>
					<td valign="middle" width="100%">
						<asp:Button ID="btnStore" runat="server" Text="保   存" CssClass="Button" SkinID="btnSkin" Width="100px" OnClick="btnStore_Click" />
					</td>				
				</tr>
			</table>    
		</ContentTemplate>
    </asp:UpdatePanel>
    </form>
</body>
</html>
