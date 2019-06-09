<%@ Page Language="C#" AutoEventWireup="true" CodeFile="RoleManage.aspx.cs" Inherits="Admin_RoleManage" StylesheetTheme="Web2ASPNET2" %>
<%@ Register Src="../UserControl/ModuleTitle.ascx" TagName="ModuleTitle" TagPrefix="ucTitle" %>
<html xmlns="http://www.w3.org/1999/xhtml" >
<head id="Head1" runat="server">
    <title>无标题页</title>    
</head>
<body style="margin:0;border:0" class="Body">
    <form id="form1" runat="server">    
    <table class="Table" cellpadding="2" cellspacing="0" border="1" bordercolor="#daeeee">
		<tr>
			<td colspan="2"><ucTitle:ModuleTitle ID="ModuleTitle1" runat="server" Title="角色管理" /></td>
		</tr>
		<tr>
			<td colspan="2">
				<asp:GridView ID="gvRole" runat="server" AutoGenerateColumns="False" Font-Names="Tahoma" Width="100%" SkinID="gvSkin" EmptyDataText="数据为空，你可以添加新的数据。" DataKeyNames="ID" OnRowCommand="gvRole_RowCommand" OnRowDataBound="gvRole_RowDataBound">
					<HeaderStyle Font-Names="Tahoma" HorizontalAlign="Center" />
					<EmptyDataTemplate>
						角色列表为空，你可用添加新的角色。
					</EmptyDataTemplate>					
					<EmptyDataRowStyle ForeColor="Blue" />
					<RowStyle BorderColor="#DAEEEE" BorderStyle="Ridge" BorderWidth="1px" HorizontalAlign="Center" />
					<Columns>
						<asp:BoundField ItemStyle-Width="80%" DataField="RoleName" HeaderText="角色名称" ReadOnly="True"/>
						<asp:TemplateField HeaderText="操作"  ItemStyle-Width="20%">
							<ItemTemplate>
								<asp:ImageButton ID="ibtUpdate" runat="server" CommandName="update" ImageUrl="../App_Themes/Web2ASPNET2/Images/update.gif" AlternateText="编辑该角色属性" CommandArgument='<%# Eval("ID") %>' />
								<asp:ImageButton ID="ibtDelete" runat="server" CommandName="del" ImageUrl="../App_Themes/Web2ASPNET2/Images/delete.gif" AlternateText="删除该角色" CommandArgument='<%# Eval("ID") %>' />
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
				<asp:Button ID="btnAdd" runat="server" Text="注册新角色" CssClass="Button" OnClick="btnAdd_Click" SkinID="btnSkin" Width="150px" UseSubmitBehavior="False" />&nbsp;&nbsp;&nbsp;
			</td>				
		</tr>
    </table>    
    </form>
</body>
</html>
