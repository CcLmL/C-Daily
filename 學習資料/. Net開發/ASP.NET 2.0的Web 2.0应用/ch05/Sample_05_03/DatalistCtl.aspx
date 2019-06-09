<%@ Page Language="C#" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<script runat="server">

</script>

<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
    <title>DataList控件的模板列</title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
		<asp:DataList ID="dlUser" runat="server" BackColor="White" BorderColor="#336666" BorderStyle="Double" BorderWidth="3px" CellPadding="4" DataKeyField="ID" DataSourceID="myDSUser" GridLines="Horizontal" Font-Size="9pt" RepeatColumns="5">
			<FooterStyle BackColor="White" ForeColor="#333333" />
			<SelectedItemStyle BackColor="#339966" Font-Bold="True" ForeColor="White" />
			<AlternatingItemTemplate>
				ID:
				<asp:Label ID="IDLabel" runat="server" Text='<%# Eval("ID") %>'></asp:Label><br />
				UserName:
				<asp:Label ID="UserNameLabel" runat="server" Text='<%# Eval("UserName") %>'></asp:Label><br />
				Email:
				<asp:Label ID="EmailLabel" runat="server" Text='<%# Eval("Email") %>'></asp:Label><br />
				CreateDate:
				<asp:Label ID="CreateDateLabel" runat="server" Text='<%# Eval("CreateDate") %>'>
				</asp:Label><br />
				<br />
			</AlternatingItemTemplate>
			<ItemTemplate>
				ID:
				<asp:Label ID="IDLabel" runat="server" Text='<%# Eval("ID") %>'></asp:Label><br />
				UserName:
				<asp:Label ID="UserNameLabel" runat="server" Text='<%# Eval("UserName") %>'></asp:Label><br />
				Email:
				<asp:Label ID="EmailLabel" runat="server" Text='<%# Eval("Email") %>'></asp:Label><br />
				CreateDate:
				<asp:Label ID="CreateDateLabel" runat="server" Text='<%# Eval("CreateDate") %>'>
				</asp:Label><br />
				<br />
			</ItemTemplate>
			<ItemStyle BackColor="White" ForeColor="#333333" />
			<HeaderStyle BackColor="#336666" Font-Bold="True" ForeColor="White" />
			<AlternatingItemStyle BackColor="LightGray" />
		</asp:DataList><asp:SqlDataSource ID="myDSUser" runat="server" ConnectionString="<%$ ConnectionStrings:WEB2ASPNET2DBConnectionString %>"
			SelectCommand="SELECT [ID], [UserName], [Email], [CreateDate] FROM [User]"></asp:SqlDataSource>
    </div>
    </form>
</body>
</html>
