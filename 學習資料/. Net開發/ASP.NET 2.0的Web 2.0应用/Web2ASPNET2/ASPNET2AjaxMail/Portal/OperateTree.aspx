<%@ Page Language="C#" AutoEventWireup="true" CodeFile="OperateTree.aspx.cs" Inherits="Portal_OperateTree" StylesheetTheme="Web2ASPNET2" %>
<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
    <title>基于ASP.NET Ajax技术的邮件系统</title>
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
				<asp:TreeNode Text="Ajax邮件系统" Value="-1" NavigateUrl="~/Mail/ViewMail.aspx" Target="Desktop">
					<asp:TreeNode NavigateUrl="~/Mail/SenderMail.aspx" Target="Desktop" Text="发送邮件"
						Value="1"></asp:TreeNode>
					<asp:TreeNode NavigateUrl="~/Mail/ViewMail.aspx" Target="Desktop" Text="发件箱"
						Value="2"></asp:TreeNode>
					<asp:TreeNode NavigateUrl="~/Mail/ViewMail.aspx?FolderID=3" Target="Desktop" Text="垃圾箱"
						Value="3"></asp:TreeNode>
					<asp:TreeNode Text="标签管理" Value="5" NavigateUrl="~/Portal/TagManage.aspx" Target="Desktop" Expanded="False">
						<asp:TreeNode NavigateUrl="~/Portal/AddTag.aspx" Target="Desktop" Text="添加标签"
							Value="6"></asp:TreeNode>
					</asp:TreeNode>
					<asp:TreeNode Text="组管理" Value="7" Target="Desktop" NavigateUrl="~/Portal/GroupManage.aspx" Expanded="False">
						<asp:TreeNode NavigateUrl="~/Portal/AddGroup.aspx" Target="Desktop" Text="添加组"
							Value="8"></asp:TreeNode>
						<asp:TreeNode NavigateUrl="~/Portal/AddLinkman.aspx" Target="Desktop" Text="添加联系人"
							Value="9"></asp:TreeNode>
						<asp:TreeNode NavigateUrl="~/Portal/SearchLinkman.aspx" Target="Desktop" Text="搜索联系人"
							Value="10"></asp:TreeNode>
					</asp:TreeNode>
					<asp:TreeNode NavigateUrl="~/Filter/FilterManage.aspx" Target="Desktop" Text="过滤器"
						Value="11"></asp:TreeNode>
					<asp:TreeNode NavigateUrl="~/Admin/UserManage.aspx" Target="Desktop" Text="用户管理" Value="12" Expanded="False" />
					<asp:TreeNode NavigateUrl="~/Admin/SystemConfig.aspx" Target="Desktop" Text="系统配置"
						Value="13"></asp:TreeNode>
					<asp:TreeNode NavigateUrl="~/Admin/UpdateUserPwd.aspx" Target="Desktop" Text="修改密码"
						Value="14"></asp:TreeNode>
					<asp:TreeNode NavigateUrl="~/Portal/UserLogOff.aspx" Target="_top" Text="退出登录"
						Value="15"></asp:TreeNode>
				</asp:TreeNode>
			</Nodes>
		</asp:TreeView>
    </form>
</body>
</html>
