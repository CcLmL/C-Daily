<%@ Page Language="C#" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<script runat="server">

</script>

<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
    <title>访问Access数据源——AccessDataSource</title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
    <asp:ListBox ID="lbUser" runat="server" DataSourceID="myAccessDS" DataTextField="ProductName"
			DataValueField="ProductID" Rows="10" Width="200px"></asp:ListBox>
			<asp:AccessDataSource ID="myAccessDS" runat="server" DataFile="~/database/Northwind.mdb" SelectCommand="SELECT [ProductID], [ProductName], [QuantityPerUnit], [Discontinued], [ReorderLevel], [UnitsOnOrder], [UnitPrice], [UnitsInStock] FROM [Products]">
			</asp:AccessDataSource>
    </div>
    </form>
</body>
</html>
