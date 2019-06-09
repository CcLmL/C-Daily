<%@ Page Language="C#" AutoEventWireup="true" CodeFile="GroupLinkmanManage.aspx.cs" Inherits="Portal_GroupLinkmanManage" StylesheetTheme="Web2ASPNET2" %>
<%@ Register Src="../UserControl/ModuleTitle.ascx" TagName="ModuleTitle" TagPrefix="ucTitle" %>
<html xmlns="http://www.w3.org/1999/xhtml" >
<head id="Head1" runat="server">
    <title>无标题页</title>    
</head>
<body style="margin:0;border:0" class="Body" width="100%">
    <form id="form1" runat="server" width="100%">
    <asp:ScriptManager ID="scForm" runat="server"></asp:ScriptManager>
    <asp:UpdatePanel ID="upForm" runat="server" RenderMode="Block">
		<ContentTemplate>
			<table class="Table" cellpadding="2" cellspacing="0" border="1" bordercolor="#daeeee">
				<tr>
					<td colspan="2"><ucTitle:ModuleTitle ID="ModuleTitle1" runat="server" Title="组内联系人管理" /></td>
				</tr>
				<tr>
					<td colspan="2">
						<asp:GridView ID="gvLinkman" runat="server" AutoGenerateColumns="False" Font-Names="Tahoma" Width="100%" SkinID="gvSkin" DataKeyNames="ID" OnRowCommand="gvLinkman_RowCommand" OnRowDataBound="gvLinkman_RowDataBound">
							<HeaderStyle Font-Names="Tahoma" HorizontalAlign="Center" />
							<EmptyDataTemplate>
								联系人列表为空，您可用添加新的联系人。
							</EmptyDataTemplate>					
							<EmptyDataRowStyle ForeColor="Blue" />
							<RowStyle BorderColor="#DAEEEE" BorderStyle="Ridge" BorderWidth="1px" HorizontalAlign="Center" />
							<Columns>
								<asp:TemplateField ItemStyle-Width="30%" ItemStyle-HorizontalAlign="Left" HeaderText="名称">
									<ItemTemplate>
										<%# Eval("Name")%>
									</ItemTemplate>
								</asp:TemplateField>
								<asp:TemplateField ItemStyle-Width="40%" ItemStyle-HorizontalAlign="Left" HeaderText="电子邮件">
									<ItemTemplate>
										<%# Eval("Email")%>
									</ItemTemplate>
								</asp:TemplateField>
								<asp:TemplateField ItemStyle-Width="20%" ItemStyle-HorizontalAlign="Left" HeaderText="所属组">
									<ItemTemplate>
										<%# Eval("GroupName")%>
									</ItemTemplate>
								</asp:TemplateField>
								<asp:TemplateField HeaderText="操作" ItemStyle-Width="10%">
									<ItemTemplate>
										<asp:ImageButton ID="ibtMove" runat="server" CommandName="move" ImageUrl="../App_Themes/Web2ASPNET2/Images/url.gif" AlternateText="移动该联系人" CommandArgument='<%# Eval("ID") %>' />&nbsp;&nbsp;
										<asp:ImageButton ID="ibtUpdate" runat="server" CommandName="update" ImageUrl="../App_Themes/Web2ASPNET2/Images/update.gif" AlternateText="编辑该联系人" CommandArgument='<%# Eval("ID") %>' />&nbsp;&nbsp;
										<asp:ImageButton ID="ibtDelete" runat="server" CommandName="del" ImageUrl="../App_Themes/Web2ASPNET2/Images/delete.gif" AlternateText="删除该联系人" CommandArgument='<%# Eval("ID") %>' />
									</ItemTemplate>
								</asp:TemplateField>						
							</Columns>
						</asp:GridView>
					</td>
				</tr>		
				<tr>
					<td width="150" height="30" valign="middle" class="LeftTD" align="right">
						<asp:Label ID="Label1" runat="server" Width="150px"></asp:Label></td>
					<td valign="middle" width="100%">
						<asp:Button ID="btnAdd" runat="server" Text="添加新的联系人" CssClass="Button" OnClick="btnAdd_Click" SkinID="btnSkin" Width="150px" />&nbsp;&nbsp;&nbsp;
					</td>				
				</tr>
			</table>
		</ContentTemplate>
    </asp:UpdatePanel>
    </form>
</body>
</html>