<%@ Page Language="C#" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<script runat="server">

</script>

<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
    <title>排序数据</title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
		<asp:GridView ID="gvUser" runat="server" AutoGenerateColumns="False" BackColor="White" BorderColor="#336666" BorderStyle="Double" BorderWidth="3px" CellPadding="4" GridLines="Horizontal" DataKeyNames="ID" DataSourceID="myDSUser" Font-Size="9pt" AllowSorting="True">
			<FooterStyle BackColor="White" ForeColor="#333333" />
			<RowStyle BackColor="White" ForeColor="#333333" />
			<SelectedRowStyle BackColor="#339966" Font-Bold="True" ForeColor="White" />
			<PagerStyle BackColor="#336666" ForeColor="White" HorizontalAlign="Center" />
			<HeaderStyle BackColor="#336666" Font-Bold="True" ForeColor="White" />
			<Columns>
				<asp:BoundField DataField="ID" HeaderText="ID" InsertVisible="False" ReadOnly="True" SortExpression="ID" />
				<asp:BoundField DataField="UserName" HeaderText="UserName" SortExpression="UserName" />
				<asp:BoundField DataField="Email" HeaderText="Email" SortExpression="Email" />
				<asp:BoundField DataField="CreateDate" HeaderText="CreateDate" SortExpression="CreateDate" ReadOnly="True" />
			</Columns>
		</asp:GridView>
		<asp:SqlDataSource ID="myDSUser" runat="server" ConnectionString="<%$ ConnectionStrings:WEB2ASPNET2DBConnectionString %>"
			SelectCommand="SELECT [ID], [UserName], [Email], [CreateDate] FROM [User]" DeleteCommand="DELETE [User] WHERE ID = @ID" InsertCommand="INSERT INTO [User](Username,Email,RoleID,CreateDate)VALUES(@Username,@Email,1,GetDate())" UpdateCommand="UPDATE [User] SET Username = @Username,Email = @Email,CreateDate = GetDate() WHERE ID = @ID">
			<DeleteParameters>
				<asp:Parameter Name="ID" />
			</DeleteParameters>
			<UpdateParameters>
				<asp:Parameter Name="Username" />
				<asp:Parameter Name="Email" />
				<asp:Parameter Name="ID" />
			</UpdateParameters>
			<InsertParameters>
				<asp:Parameter Name="Username" />
				<asp:Parameter Name="Email" />
			</InsertParameters>
		</asp:SqlDataSource>
    </div>
    </form>
</body>
</html>
