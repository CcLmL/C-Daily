<%@ Page Language="C#" AutoEventWireup="true" CodeFile="OperateTree.aspx.cs" Inherits="Portal_OperateTree" StylesheetTheme="Web2ASPNET2" %>
<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
    <title>Blog后台管理平台</title>
</head>
<body style="margin:0;" bgcolor="#184073" class="Body">
    <form id="form1" runat="server">
    <asp:TreeView ID="tvOperation" Width="100%" Height="100%" runat="server" ImageSet="Msdn" EnableClientScript="False" PopulateNodesFromClient="False">
			<ParentNodeStyle Font-Bold="False" ForeColor="White" />
			<HoverNodeStyle BackColor="#CCCCCC" BorderColor="#888888" BorderStyle="Solid" Font-Underline="True" ForeColor="White" />
			<SelectedNodeStyle BorderColor="#888888" BorderStyle="Solid" BorderWidth="1px"
				Font-Underline="False" HorizontalPadding="3px" VerticalPadding="1px" ForeColor="White" />
			<NodeStyle Font-Names="Verdana" Font-Size="8pt" ForeColor="White" HorizontalPadding="5px"
				NodeSpacing="1px" VerticalPadding="2px" />
			<RootNodeStyle ForeColor="White" Font-Bold="True" />
			<LeafNodeStyle ForeColor="White" />
			<Nodes>
				<asp:TreeNode Text="Blog后台管理平台" Value="-1" NavigateUrl="~/Portal/Desktop.aspx" Target="Desktop">
					<asp:TreeNode NavigateUrl="~/Portal/CatalogManage.aspx" Target="Desktop" Text="管理文章分类"
						Value="0" Expanded="False">
						<asp:TreeNode NavigateUrl="~/Portal/AddCatalog.aspx" Target="Desktop" Text="添加新文章分类"
							Value="1"></asp:TreeNode>
					</asp:TreeNode>
					<asp:TreeNode Text="管理文章" Value="2" NavigateUrl="~/Portal/ArticleManage.aspx" Target="Desktop" Expanded="False">
						<asp:TreeNode NavigateUrl="~/Portal/AddArticle.aspx" Target="Desktop" Text="添加文章"
							Value="3"></asp:TreeNode>
					</asp:TreeNode>
					<asp:TreeNode NavigateUrl="~/Portal/UrlManage.aspx" Target="Desktop" Text="管理链接"
						Value="4" Expanded="False">
						<asp:TreeNode NavigateUrl="~/Portal/AddUrl.aspx" Target="Desktop" Text="添加新链接" Value="5">
						</asp:TreeNode>
					</asp:TreeNode>
					<asp:TreeNode NavigateUrl="~/Admin/RoleManage.aspx" Target="Desktop" Text="管理角色"
						Value="8" Expanded="False">
						<asp:TreeNode NavigateUrl="~/Admin/AddRole.aspx" Target="Desktop" Text="添加新角色" Value="9">
						</asp:TreeNode>
					</asp:TreeNode>
					<asp:TreeNode Text="用户管理" Value="6" Target="Desktop" NavigateUrl="~/Admin/UserManage.aspx" Expanded="False">
						<asp:TreeNode NavigateUrl="~/Admin/AddUser.aspx" Target="Desktop" Text="添加用户"
							Value="7"></asp:TreeNode>
					</asp:TreeNode>
					<asp:TreeNode NavigateUrl="~/Admin/UpdateUserPwd.aspx" Target="Desktop" Text="修改密码"
						Value="10"></asp:TreeNode>
					<asp:TreeNode NavigateUrl="~/Portal/UserLogOff.aspx" Target="_top" Text="退出登录"
						Value="11"></asp:TreeNode>
				</asp:TreeNode>
			</Nodes>
		</asp:TreeView>
    </form>
</body>
</html>
