<%@ Page Language="C#" AutoEventWireup="true" CodeFile="GuestOperateTree.aspx.cs" Inherits="Portal_GuestOperateTree" StylesheetTheme="Web2ASPNET2" %>
<html xmlns="http://www.w3.org/1999/xhtml" >
<head id="Head1" runat="server">
    <title>无标题页</title>
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
				<asp:TreeNode Text="XMLBBS平台" Value="-1" NavigateUrl="~/Portal/Desktop.aspx" Target="Desktop">
					<asp:TreeNode NavigateUrl="~/Portal/ViewBoard.aspx?BoardID=0" Target="Desktop" Text="根版面" Value="0" Expanded="True"></asp:TreeNode>		
				</asp:TreeNode>
			</Nodes>
		</asp:TreeView>
    </form>
</body>
</html>

