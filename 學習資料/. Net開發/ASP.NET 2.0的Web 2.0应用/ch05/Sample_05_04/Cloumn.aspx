<%@ Page Language="C#" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<script runat="server">
	protected void Page_Load(object sender,EventArgs e)
	{
		///
	}	
	protected void btnEmpty_Click(object sender,EventArgs e)
	{
		gvUser.DataSourceID = "";
		gvUser.DataSource = null;
		gvUser.DataBind();
	}
</script>

<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
    <title>GridView控件的模板列</title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
		<asp:GridView ID="gvUser" runat="server" AutoGenerateColumns="False" BackColor="White" BorderColor="#336666" BorderStyle="Double" BorderWidth="3px" CellPadding="4" GridLines="Horizontal" AllowPaging="True" DataKeyNames="ID" DataSourceID="myDSUser">
			<EmptyDataTemplate>
				当数据为空时，显示该模板列的内容。
			</EmptyDataTemplate>			
			<FooterStyle BackColor="White" ForeColor="#333333" />
			<PagerTemplate>
				<asp:LinkButton ID="lbFirst" runat="server">首页</asp:LinkButton>
				<asp:LinkButton ID="lbPrev" runat="server">上一页</asp:LinkButton>
				<asp:LinkButton ID="lbNext" runat="server">下一页</asp:LinkButton>
				<asp:LinkButton ID="lbLast" runat="server">末页</asp:LinkButton>
			</PagerTemplate>
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
		<asp:Button ID="btnEmpty" runat="server" OnClick="btnEmpty_Click" Text="设置数据源为空" />
		<asp:SqlDataSource ID="myDSUser" runat="server" ConnectionString="<%$ ConnectionStrings:WEB2ASPNET2DBConnectionString %>"
			SelectCommand="SELECT [ID], [UserName], [Email], [CreateDate] FROM [User]"></asp:SqlDataSource>
    </div>
    </form>
</body>
</html>
