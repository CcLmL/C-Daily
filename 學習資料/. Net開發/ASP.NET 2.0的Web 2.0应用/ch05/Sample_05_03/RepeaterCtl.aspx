<%@ Page Language="C#" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<script runat="server">

	protected void rpUser_ItemDataBound(object sender,RepeaterItemEventArgs e)
	{
		if(e.Item.ItemType == ListItemType.Item || e.Item.ItemType == ListItemType.AlternatingItem)
		{   ///找到lbNumber控件，并设置它的编号
			Label lbNumber = (Label)e.Item.FindControl("lbNumber");
			if(lbNumber != null)
			{
				lbNumber.Text = (e.Item.ItemIndex + 1).ToString();
			}
		}
	}
</script>

<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
    <title>Repeater控件的模板列</title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
    <asp:Repeater ID="rpUser" runat="server" OnItemDataBound="rpUser_ItemDataBound" DataSourceID="myDSUser">
		<HeaderTemplate>
			<table border="1">
				<tr>
					<td>编号</td>
					<td>用户ID</td>
					<td>用户名称</td>
					<td>电子邮件</td>
				</tr>
		</HeaderTemplate>
		<ItemTemplate>
				<tr>
					<td><asp:Label ID="lbNumber" runat="server"></asp:Label></td>
					<td><%# Eval("ID")%></td>
					<td><%# Eval("UserName").ToString() %></td>
					<td><%# Eval("Email").ToString() %></td>
				</tr>
		</ItemTemplate>
		<FooterTemplate>
			</table>
		</FooterTemplate>
	</asp:Repeater>
		<asp:SqlDataSource ID="myDSUser" runat="server" ConnectionString="<%$ ConnectionStrings:WEB2ASPNET2DBConnectionString %>"
			SelectCommand="SELECT [ID], [UserName], [Email], [CreateDate] FROM [User]"></asp:SqlDataSource>
    </div>
    </form>
</body>
</html>
