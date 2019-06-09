<%@ Page Language="C#" AutoEventWireup="true" CodeFile="SearchLinkman.aspx.cs" Inherits="Portal_SearchLinkman" StylesheetTheme="Web2ASPNET2" %>
<%@ Register Src="../UserControl/ModuleTitle.ascx" TagName="ModuleTitle" TagPrefix="ucTitle" %>

<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
    <title>无标题页</title>
</head>
<body>
    <form id="form1" runat="server">
    <asp:ScriptManager ID="smForm" runat="server" />
    <asp:UpdatePanel ID="upForm" runat="server" UpdateMode="Always" RenderMode="Block">
		<ContentTemplate>
			 <table class="Table" cellpadding="2" cellspacing="0" border="1" bordercolor="#daeeee">
				<tr>			
					<td colspan="2"><ucTitle:ModuleTitle ID="ModuleTitle1" runat="server" Title="搜索联系人" /></td>
				</tr>
				<tr>
					<td width="150" height="30" valign="middle" class="LeftTD" align="right">
						关键字:</td>
					<td valign="middle"><asp:TextBox ID="tbKey" CssClass="TextBox" runat="server" SkinID="tbSkin" MaxLength="255" Width="300px"></asp:TextBox><asp:RequiredFieldValidator ID="rfKey" runat="server" ControlToValidate="tbKey" ErrorMessage="不能为空。" Display="Dynamic"></asp:RequiredFieldValidator><asp:Button ID="btnSearch" runat="server" Text="搜索" CssClass="Button" SkinID="btnSkin" Width="60px" OnClick="btnSearch_Click" />
					</td>
				</tr>
				<tr>
					<td colspan="2">
						<asp:GridView ID="gvUser" runat="server" AutoGenerateColumns="False" Font-Names="Tahoma" Width="100%" SkinID="gvSkin" DataKeyNames="ID">
							<HeaderStyle Font-Names="Tahoma" HorizontalAlign="Center" />
							<RowStyle BorderColor="#DAEEEE" BorderStyle="Ridge" BorderWidth="1px" HorizontalAlign="Center" />
							<EmptyDataTemplate>结果为空。</EmptyDataTemplate>
							<Columns>
								<asp:BoundField DataField="Name" HeaderText="用户名称" ReadOnly="True"/>
								<asp:BoundField DataField="Email" HeaderText="电子邮件" />
								<asp:BoundField DataField="GroupName" HeaderText="所属角色" />
							</Columns>
						</asp:GridView>
					</td>
				</tr>
			</table>    
		</ContentTemplate> 
    </asp:UpdatePanel>
    </form>
</body>
</html>
