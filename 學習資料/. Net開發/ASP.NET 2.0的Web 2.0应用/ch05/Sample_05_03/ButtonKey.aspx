<%@ Page Language="C#" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<script runat="server">
	protected void dlUser_ItemDataBound(object sender,DataListItemEventArgs e)
	{
		if(e.Item.ItemType == ListItemType.Item || e.Item.ItemType == ListItemType.AlternatingItem)
		{
			Label lbIDValue = (Label)e.Item.FindControl("lbIDValue");
			if(lbIDValue != null)
			{   ///获取DataKeys属性中的值，并显示
				lbIDValue.Text = dlUser.DataKeys[e.Item.ItemIndex].ToString();
			}
		}		
	}

	protected void dlUser_ItemCommand(object source,DataListCommandEventArgs e)
	{
		if(e.CommandName.ToLower() == "show")
		{
			Response.Write(e.CommandArgument.ToString());
		}
	}
</script>

<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
    <title>应用DataKeyField属性</title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
		<asp:DataList ID="dlUser" runat="server" BackColor="White" BorderStyle="None" BorderWidth="1px" CellPadding="3" DataKeyField="ID" DataSourceID="myDSUser" GridLines="Both" Font-Size="9pt" OnItemDataBound="dlUser_ItemDataBound" RepeatDirection="Horizontal" OnItemCommand="dlUser_ItemCommand" BorderColor="#CCCCCC">
			<HeaderTemplate>
				<table border="1">
					<tr>
						<td>键值</td>						
						<td>用户名称</td>
						<td>电子邮件</td>
						<td>操作</td>
					</tr>
			</HeaderTemplate>
			<ItemTemplate>
					<tr>
						<td><asp:Label ID="lbIDValue" runat="server"></asp:Label></td>
						<td><%# Eval("UserName").ToString() %></td>
						<td><%# Eval("Email").ToString() %></td>
						<td><asp:Button ID="btnShow" runat="server" Text="显示ID" CommandName="show" CommandArgument='<%# Eval("ID") %>' /></td>
					</tr>
			</ItemTemplate>
			<AlternatingItemTemplate>
					<tr>
						<td><asp:Label ID="lbIDValue" runat="server"></asp:Label></td>
						<td><%# Eval("UserName").ToString() %></td>
						<td><%# Eval("Email").ToString() %></td>
						<td><asp:Button ID="btnShow" runat="server" Text="显示ID" CommandName="show" CommandArgument='<%# Eval("ID") %>' /></td>
					</tr>
			</AlternatingItemTemplate>
			<FooterTemplate>
				</table>
			</FooterTemplate>			
			<HeaderStyle BackColor="#006699" Font-Bold="True" ForeColor="White" />
			<FooterStyle BackColor="White" ForeColor="#000066" />
			<SelectedItemStyle BackColor="#669999" Font-Bold="True" ForeColor="White" />
			<ItemStyle ForeColor="#000066" />
		</asp:DataList>
		<asp:SqlDataSource ID="myDSUser" runat="server" ConnectionString="<%$ ConnectionStrings:WEB2ASPNET2DBConnectionString %>"
			SelectCommand="SELECT [ID], [UserName], [Email], [CreateDate] FROM [User]"></asp:SqlDataSource>
    </div>
    </form>
</body>
</html>
