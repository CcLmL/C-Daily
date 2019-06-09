<%@ Page Language="C#" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<script runat="server">

</script>

<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
    <title>访问对象数据源——ObjectDataSource</title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
    <asp:ListBox ID="lbUser" runat="server" DataSourceID="myObjectDS" DataTextField="Username"
			DataValueField="UserID" Rows="10" Width="200px"></asp:ListBox><asp:ObjectDataSource
				ID="myObjectDS" runat="server" DataObjectTypeName="UserInfo" DeleteMethod="DeleteUser"
				InsertMethod="AddUser" SelectMethod="GetUsers" TypeName="Users" UpdateMethod="UpdateUser">
				<UpdateParameters>
					<asp:Parameter Name="userID" Type="Int32" />
					<asp:Parameter Name="ui" Type="Object" />
				</UpdateParameters>
			</asp:ObjectDataSource>
    </div>
    </form>
</body>
</html>
