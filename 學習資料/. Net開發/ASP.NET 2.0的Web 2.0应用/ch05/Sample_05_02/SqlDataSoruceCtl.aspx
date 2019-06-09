<%@ Page Language="C#" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<script runat="server">

</script>

<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
    <title>访问SQL数据——SqlDataSource</title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
		<asp:ListBox ID="lbUser" runat="server" Rows="10" Width="200px" DataSourceID="myDSUser" DataTextField="UserName" DataValueField="ID"></asp:ListBox><asp:SqlDataSource ID="myDSUser" runat="server" ConnectionString="<%$ ConnectionStrings:WEB2ASPNET2DBConnectionString %>"
			SelectCommand="SELECT [ID], [UserName], [Email], [CreateDate] FROM [User] WHERE ID > @ID">
			<SelectParameters>
				<asp:Parameter DefaultValue="10" Name="ID" />
			</SelectParameters>
		</asp:SqlDataSource>
    
    </div>
    </form>
</body>
</html>
