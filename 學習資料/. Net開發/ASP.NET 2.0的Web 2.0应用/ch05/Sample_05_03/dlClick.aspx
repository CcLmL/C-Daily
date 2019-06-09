<%@ Page Language="C#" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<script runat="server">

	protected void dlUser_ItemCreated(object sender,DataListItemEventArgs e)
	{	///显示事件的名称
		Response.Write("第" + (e.Item.ItemIndex + 1).ToString() + "正在执行dlUser_ItemCreated()事件……<br />");
	}

	protected void dlUser_ItemDataBound(object sender,DataListItemEventArgs e)
	{	///显示事件的名称
		Response.Write("第" + (e.Item.ItemIndex + 1).ToString() + "正在执行dlUser_ItemDataBound()事件……<br />");
	}

	protected void dlUser_Init(object sender,EventArgs e)
	{	///显示事件的名称
		Response.Write("dlUser_Init()事件正在执行……<br />");
	}

	protected void dlUser_Load(object sender,EventArgs e)
	{	///显示事件的名称
		Response.Write("dlUser_Load()事件正在执行……<br />");
	}
	protected void dlUser_PreRender(object sender,EventArgs e)
	{	///显示事件的名称
		Response.Write("dlUser_PreRender()事件正在执行……<br />");
	}

	protected void dlUser_DataBinding(object sender,EventArgs e)
	{	///显示事件的名称
		Response.Write("dlUser_DataBinding()事件正在执行……<br />");
	}
</script>

<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
    <title>DataList控件的事件</title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
		<asp:DataList ID="dlUser" runat="server" BackColor="White" BorderStyle="None" BorderWidth="1px" CellPadding="3" DataKeyField="ID" DataSourceID="myDSUser" GridLines="Both" Font-Size="9pt" OnItemDataBound="dlUser_ItemDataBound" RepeatDirection="Horizontal" BorderColor="#CCCCCC" OnItemCreated="dlUser_ItemCreated" OnInit="dlUser_Init" OnLoad="dlUser_Load" OnPreRender="dlUser_PreRender" OnDataBinding="dlUser_DataBinding">
			<HeaderTemplate>
				用户名称
			</HeaderTemplate>
			<ItemTemplate>
					<%# Eval("UserName").ToString() %>
			</ItemTemplate>
			<AlternatingItemTemplate>
					<%# Eval("UserName").ToString() %>
			</AlternatingItemTemplate>					
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
