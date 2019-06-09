<%@ Page Language="C#" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<script runat="server">

</script>

<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
    <title>GridView控件的域</title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
		<asp:GridView ID="gvUser" runat="server" AutoGenerateColumns="False" BackColor="White" BorderColor="#336666" BorderStyle="Double" BorderWidth="3px" CellPadding="4" GridLines="Horizontal" DataKeyNames="ID" DataSourceID="myDSUser">
			<FooterStyle BackColor="White" ForeColor="#333333" />
			<RowStyle BackColor="White" ForeColor="#333333" />
			<SelectedRowStyle BackColor="#339966" Font-Bold="True" ForeColor="White" />
			<PagerStyle BackColor="#336666" ForeColor="White" HorizontalAlign="Center" />
			<HeaderStyle BackColor="#336666" Font-Bold="True" ForeColor="White" />
			<Columns>
				<asp:CommandField ShowSelectButton="True" />
				<asp:HyperLinkField DataTextField="UserName" HeaderText="Username" DataNavigateUrlFields="ID" DataNavigateUrlFormatString="#{0}" />
				<asp:BoundField DataField="Email" HeaderText="Email" SortExpression="Email" />
				<asp:BoundField DataField="CreateDate" HeaderText="CreateDate" SortExpression="CreateDate" />
				<asp:ImageField DataImageUrlField="ID" HeaderText="标记" DataImageUrlFormatString="~/Images/xp.gif" ></asp:ImageField>				
				<asp:CheckBoxField Text="可见"/>				
				<asp:CommandField ShowEditButton="True" />
				<asp:CommandField ShowDeleteButton="True" />
				<asp:ButtonField Text="链接" ButtonType="Link" DataTextField="Username" />
			</Columns>
		</asp:GridView>
		<asp:SqlDataSource ID="myDSUser" runat="server" ConnectionString="<%$ ConnectionStrings:WEB2ASPNET2DBConnectionString %>"
			SelectCommand="SELECT [ID], [UserName], [Email], [CreateDate] FROM [User]"></asp:SqlDataSource>
    </div>
    </form>
</body>
</html>
