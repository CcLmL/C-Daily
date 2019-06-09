<%@ Page Language="C#" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<script runat="server">

	protected void gvUser_DataBinding(object sender,EventArgs e)
	{	///显示事件的名称
		Response.Write("gvUser_DataBinding()事件正在执行……<br />");
	}

	protected void gvUser_DataBound(object sender,EventArgs e)
	{	///显示事件的名称
		Response.Write("gvUser_DataBound()事件正在执行……<br />");
	}

	protected void gvUser_RowDataBound(object sender,GridViewRowEventArgs e)
	{	///显示事件的名称
		Response.Write("第" + (e.Row.RowIndex + 1).ToString() + "正在执行gvUser_RowDataBound()事件……<br />");
	}

	protected void gvUser_RowCreated(object sender,GridViewRowEventArgs e)
	{	///显示事件的名称
		Response.Write("第" + (e.Row.RowIndex + 1).ToString() + "正在执行gvUser_RowCreated()事件……<br />");
	}

	protected void gvUser_Init(object sender,EventArgs e)
	{	///显示事件的名称
		Response.Write("gvUser_Init()事件正在执行……<br />");
	}

	protected void gvUser_Load(object sender,EventArgs e)
	{	///显示事件的名称
		Response.Write("gvUser_Load()事件正在执行……<br />");
	}

	protected void gvUser_PreRender(object sender,EventArgs e)
	{	///显示事件的名称
		Response.Write("gvUser_PreRender()事件正在执行……<br />");
	}
</script>

<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
    <title>GridView控件的事件</title>
</head>
<body>
    <form id="form1" runat="server">
     <div>
		<asp:GridView ID="gvUser" runat="server" AutoGenerateColumns="False" BackColor="White" BorderColor="#336666" BorderStyle="Double" BorderWidth="3px" CellPadding="4" GridLines="Horizontal" DataKeyNames="ID" DataSourceID="myDSUser" Font-Size="9pt" OnDataBinding="gvUser_DataBinding" OnDataBound="gvUser_DataBound" OnRowDataBound="gvUser_RowDataBound" OnRowCreated="gvUser_RowCreated" OnInit="gvUser_Init" OnLoad="gvUser_Load" OnPreRender="gvUser_PreRender">
			<FooterStyle BackColor="White" ForeColor="#333333" />
			<RowStyle BackColor="White" ForeColor="#333333" />
			<SelectedRowStyle BackColor="#339966" Font-Bold="True" ForeColor="White" />
			<PagerStyle BackColor="#336666" ForeColor="White" HorizontalAlign="Center" />
			<HeaderStyle BackColor="#336666" Font-Bold="True" ForeColor="White" />
			<Columns>
				<asp:BoundField DataField="ID" HeaderText="ID" InsertVisible="False" ReadOnly="True"
					SortExpression="ID" />
				<asp:BoundField DataField="UserName" HeaderText="UserName" SortExpression="UserName" />
				<asp:BoundField DataField="Email" HeaderText="Email" SortExpression="Email" />
				<asp:BoundField DataField="CreateDate" HeaderText="CreateDate" SortExpression="CreateDate" />
			</Columns>
		</asp:GridView>
		<asp:SqlDataSource ID="myDSUser" runat="server" ConnectionString="<%$ ConnectionStrings:WEB2ASPNET2DBConnectionString %>"
			SelectCommand="SELECT [ID], [UserName], [Email], [CreateDate] FROM [User]"></asp:SqlDataSource>
    </div>
    </form>
</body>
</html>
